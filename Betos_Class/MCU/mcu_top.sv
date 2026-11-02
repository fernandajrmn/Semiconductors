
`timescale 1ns/1ps
`include "mcu_if.sv"


// ========================================
// ALU
// ========================================
module alu (
    cpu_if.alu alu_bus
);

    import mcu_pkg::*;

    always_comb begin

        case (alu_bus.alu_op)

            OP_ADD:
                alu_bus.result = alu_bus.operand_a + alu_bus.operand_b;

            OP_MUL:
                alu_bus.result = alu_bus.operand_a * alu_bus.operand_b;

            OP_SUBI:
                alu_bus.result = alu_bus.operand_a - alu_bus.operand_b;

            OP_STR:
                alu_bus.result = alu_bus.operand_a + alu_bus.operand_b;

            OP_LDR:
                alu_bus.result = alu_bus.operand_a + alu_bus.operand_b;
						OP_BNE: alu_bus.result = alu_bus.operand_a;	

            default:
                alu_bus.result = 16'h0000;

        endcase

        // Bandera Zero combinacional
        alu_bus.zero_flag = (alu_bus.result == 16'h0000);

    end

endmodule


// ========================================
// REGISTER FILE
// ========================================
module register_file (
    cpu_if.register_file reg_bus
);

    // Banco de 16 registros de 16 bits
    logic [15:0] registers [0:15];

    // Lecturas combinacionales
    assign reg_bus.rdata1 = registers[reg_bus.raddr1];
    assign reg_bus.rdata2 = registers[reg_bus.raddr2];

    // Escritura secuencial
    // Usamos always para permitir precarga desde TB
    always @(posedge reg_bus.clk or negedge reg_bus.rst_n) begin

        if (!reg_bus.rst_n) begin

            for (int i = 0; i < 16; i++)
                registers[i] <= 16'h0000;

        end

        else if (reg_bus.wen) begin
            registers[reg_bus.waddr] <= reg_bus.wdata;
        end

    end

endmodule


// ========================================
// PROGRAM COUNTER
// ========================================
module pc (
    cpu_if.pc pc_bus
);

    always_ff @(posedge pc_bus.clk or negedge pc_bus.rst_n) begin

        if (!pc_bus.rst_n)
            pc_bus.pc_out <= 16'h0000;

        else if (pc_bus.pc_src)
            pc_bus.pc_out <= pc_bus.target_pc;

        else
            pc_bus.pc_out <= pc_bus.pc_out + 1'b1;

    end

endmodule


// ========================================
// CONTROL UNIT
// ========================================
module control_unit (
    cpu_if.control_unit ctrl_bus
);

    import mcu_pkg::*;

    opcode_t opcode;

    // Extraer opcode
    assign opcode = opcode_t'(ctrl_bus.instruction[15:12]);

    // Direcciones del banco
    assign ctrl_bus.waddr = ctrl_bus.instruction[11:8];

    assign ctrl_bus.raddr1 = ctrl_bus.instruction[7:4];

    // En STR, raddr2 selecciona el registro fuente
    assign ctrl_bus.raddr2 = (opcode == OP_STR) ?
                             ctrl_bus.instruction[11:8] :
                             ctrl_bus.instruction[3:0];

    // Destino para JMP y BNE
    assign ctrl_bus.target_pc =
        {12'b0, ctrl_bus.instruction[3:0]};


    always_comb begin

        // Valores predeterminados
        ctrl_bus.wen       = 1'b0;
        ctrl_bus.use_imm   = 1'b0;
        ctrl_bus.mem_read  = 1'b0;
        ctrl_bus.mem_write = 1'b0;
        ctrl_bus.pc_src    = 1'b0;
        ctrl_bus.alu_op    = opcode;

        case (opcode)

            OP_ADD, OP_MUL: begin
                ctrl_bus.wen = 1'b1;
            end

            OP_SUBI: begin
                ctrl_bus.wen = 1'b1;
                ctrl_bus.use_imm = 1'b1;
            end

            OP_LDR: begin
                ctrl_bus.wen = 1'b1;
                ctrl_bus.mem_read = 1'b1;
                ctrl_bus.use_imm = 1'b1;
            end

            OP_STR: begin
                ctrl_bus.mem_write = 1'b1;
                ctrl_bus.use_imm = 1'b1;
            end

            OP_BNE: begin
    					if (ctrl_bus.zero_flag == 1'b0)
        				ctrl_bus.pc_src = 1'b1;
						end	
            OP_JMP: begin
                ctrl_bus.pc_src = 1'b1;
            end

            default: ;

        endcase

    end

endmodule


// ========================================
// MEMORY
// ========================================
module memory (
    cpu_if.memory mem_bus
);

    // ROM: instrucciones de 16 bits
    logic [15:0] rom [0:255];

    // RAM: datos de 16 bits
    logic [15:0] ram [0:255];


    // Lectura combinacional de instrucciones
    assign mem_bus.instruction =
        (mem_bus.instr_addr < 16'd256) ?
        rom[mem_bus.instr_addr[7:0]] :
        16'h0000;


    // Lectura combinacional de datos
    assign mem_bus.read_data =
        (mem_bus.mem_read &&
         mem_bus.data_addr < 16'd256) ?
        ram[mem_bus.data_addr[7:0]] :
        16'h0000;


    // Escritura secuencial en RAM
    // always permite la precarga desde el TB
    always @(posedge mem_bus.clk) begin

        if (mem_bus.mem_write &&
            mem_bus.data_addr < 16'd256) begin

            ram[mem_bus.data_addr[7:0]] <= mem_bus.write_data;

        end

    end

endmodule


// ========================================
// CPU TOP
// ========================================
module cpu_top (
    input logic clk,
    input logic rst_n
);

    import mcu_pkg::*;


    // ====================================
    // INTERFACE
    // ====================================
    cpu_if bus (
        .clk(clk),
        .rst_n(rst_n)
    );


    // ====================================
    // INSTANCIAS
    // ====================================

    pc u_pc (
        .pc_bus(bus)
    );

    memory u_memory (
        .mem_bus(bus)
    );

    control_unit u_control (
        .ctrl_bus(bus)
    );

    register_file u_register_file (
        .reg_bus(bus)
    );

    alu u_alu (
        .alu_bus(bus)
    );


    // ====================================
    // CONEXIONES
    // ====================================

    // PC -> ROM
    assign bus.instr_addr = bus.pc_out;


    // Banco -> ALU (Operando A)
    assign bus.operand_a = bus.rdata1;


    // MUX 1: Registro o inmediato
    assign bus.operand_b =
        bus.use_imm ?
        {12'b0, bus.instruction[3:0]} :
        bus.rdata2;


    // ALU -> Direccion de RAM
    assign bus.data_addr = bus.result;


    // MUX 2: RAM o ALU -> Banco
    assign bus.wdata =
        bus.mem_read ?
        bus.read_data :
        bus.result;


    // Banco -> RAM (STR)
    assign bus.write_data = bus.rdata2;

endmodule
