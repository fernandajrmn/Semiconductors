
`timescale 1ns/1ps

module tb_cpu;

    import mcu_pkg::*;

    logic clk;
    logic rst_n;

    // CPU
    cpu_top dut (
        .clk(clk),
        .rst_n(rst_n)
    );



    initial clk = 0;
    always #5 clk = ~clk;



    initial begin

        // RESET

        rst_n = 1'b1;
        #1;
        rst_n = 1'b0;


        // ROM Y RAM con puros ceros

        for (int i = 0; i < 256; i++) begin

            dut.u_memory.rom[i] = 16'd0;
            dut.u_memory.ram[i] = 16'd0;

        end


        // Los input data

        // Punto 1: X=4, Y=3
        dut.u_memory.ram[100] = 16'd4;
        dut.u_memory.ram[101] = 16'd3;

        // Punto 2: X=2, Y=1
        dut.u_memory.ram[102] = 16'd2;
        dut.u_memory.ram[103] = 16'd1;


        // ROM: el programilla entero

        // LOOP_AFFINE = direccion 0

        // 1. Cargar coordenadas

        // LDR R1, [R14, #0]
        dut.u_memory.rom[0] =
            {OP_LDR, 4'd1, 4'd14, 4'd0};

        // LDR R2, [R14, #1]
        dut.u_memory.rom[1] =
            {OP_LDR, 4'd2, 4'd14, 4'd1};


        // 2. X' = a*x + b*y + c

        // MUL R5, R8, R1
        dut.u_memory.rom[2] =
            {OP_MUL, 4'd5, 4'd8, 4'd1};

        // MUL R6, R9, R2
        dut.u_memory.rom[3] =
            {OP_MUL, 4'd6, 4'd9, 4'd2};

        // ADD R3, R5, R6
        dut.u_memory.rom[4] =
            {OP_ADD, 4'd3, 4'd5, 4'd6};

        // ADD R3, R3, R10
        dut.u_memory.rom[5] =
            {OP_ADD, 4'd3, 4'd3, 4'd10};


        // 3. Y' = d*x + e*y + f

        // MUL R5, R11, R1
        dut.u_memory.rom[6] =
            {OP_MUL, 4'd5, 4'd11, 4'd1};

        // MUL R6, R12, R2
        dut.u_memory.rom[7] =
            {OP_MUL, 4'd6, 4'd12, 4'd2};

        // ADD R4, R5, R6
        dut.u_memory.rom[8] =
            {OP_ADD, 4'd4, 4'd5, 4'd6};

        // ADD R4, R4, R13
        dut.u_memory.rom[9] =
            {OP_ADD, 4'd4, 4'd4, 4'd13};


        // 4. Guardar coordenadas

        // STR R3, [R15, #0]
        dut.u_memory.rom[10] =
            {OP_STR, 4'd3, 4'd15, 4'd0};

        // STR R4, [R15, #1]
        dut.u_memory.rom[11] =
            {OP_STR, 4'd4, 4'd15, 4'd1};


        // 5. Actualizar punteros

        // ADD R14, R14, R7
        dut.u_memory.rom[12] =
            {OP_ADD, 4'd14, 4'd14, 4'd7};

        // ADD R15, R15, R7
        dut.u_memory.rom[13] =
            {OP_ADD, 4'd15, 4'd15, 4'd7};


        // 6. Contador y salto

        // SUBI R0, R0, #1
        dut.u_memory.rom[14] =
            {OP_SUBI, 4'd0, 4'd0, 4'd1};

        // BNE LOOP_AFFINE
        dut.u_memory.rom[15] =
            {OP_BNE, 4'd0, 4'd0, 4'd0};


        // INICIALIZAR BANCO DE REGISTROS

        // Dos flancos con reset
        repeat (2) @(posedge clk);
        @(negedge clk);

        // Coeficientes
        dut.u_register_file.registers[8]  = 16'd2; // a
        dut.u_register_file.registers[9]  = 16'd1; // b
        dut.u_register_file.registers[10] = 16'd5; // c
        dut.u_register_file.registers[11] = 16'd1; // d
        dut.u_register_file.registers[12] = 16'd2; // e
        dut.u_register_file.registers[13] = 16'd3; // f

        // Direcciones base
        dut.u_register_file.registers[14] = 16'd100;
        dut.u_register_file.registers[15] = 16'd120;

        // Incremento de punteros
        dut.u_register_file.registers[7] = 16'd2;

        // Numero de puntos
        dut.u_register_file.registers[0] = 16'd2;


        // COMENZAR SIMULACION

        rst_n = 1'b1;


        // Esperar que BNE termine el bucle
        wait (dut.bus.pc_out == 16'd16);
        #1;


        // RESULTADOS

        $display("\n================================");
        $display("   TRANSFORMACION AFIN");
        $display("================================");

        $display("Punto 1:");
        $display("X' = %0d | Esperado = 16",
                 dut.u_memory.ram[120]);

        $display("Y' = %0d | Esperado = 13",
                 dut.u_memory.ram[121]);


        $display("\nPunto 2:");
        $display("X' = %0d | Esperado = 10",
                 dut.u_memory.ram[122]);

        $display("Y' = %0d | Esperado = 7",
                 dut.u_memory.ram[123]);


        $display("\nR0 final = %0d",
                 dut.u_register_file.registers[0]);


        // ====================================
        // COMPROBACION AUTOMATICA
        // ====================================

        if (
            dut.u_memory.ram[120] === 16'd16 &&
            dut.u_memory.ram[121] === 16'd13 &&
            dut.u_memory.ram[122] === 16'd10 &&
            dut.u_memory.ram[123] === 16'd7 &&
            dut.u_register_file.registers[0] === 16'd0
        ) begin

            $display("\nTEST PASSED");

        end

        else begin

            $fatal(1, "\nTEST FAILED");

        end

        $finish;

    end


    // ========================================
    // MONITOR
    // ========================================

    always @(posedge clk) begin

        if (rst_n) begin

            $display(
                "T=%0t | PC=%0d | Instr=%h | ALU=%0d | Z=%b | R0=%0d | WEN=%b | MEM_WRITE=%b",
                $time,
                dut.bus.pc_out,
                dut.bus.instruction,
                dut.bus.result,
                dut.bus.zero_flag,
                dut.u_register_file.registers[0],
                dut.bus.wen,
                dut.bus.mem_write
            );

        end

    end


    // ========================================
    // TIMEOUT
    // ========================================

    initial begin
        #500;
        $fatal(1, "TIMEOUT: la CPU no termino");
    end

endmodule
