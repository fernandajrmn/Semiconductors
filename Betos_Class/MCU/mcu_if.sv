
package mcu_pkg;

    typedef enum logic [3:0] {
        OP_LDR  = 4'b0001,
        OP_STR  = 4'b0010,
        OP_ADD  = 4'b0011,
        OP_MUL  = 4'b0100,
        OP_SUBI = 4'b0101,
        OP_BNE  = 4'b0110,
        OP_JMP  = 4'b0111
    } opcode_t;

endpackage


interface cpu_if (
    input logic clk,
    input logic rst_n
);

    import mcu_pkg::*;


    // -------- ALU --------
    logic [15:0] operand_a;
    logic [15:0] operand_b;
    opcode_t alu_op;
    logic [15:0] result;
    logic zero_flag;



    // -------- REGISTER BANK --------
    logic wen;
    logic [3:0] waddr;
    logic [15:0] wdata;

    // Lectura 1
    logic [3:0] raddr1;
    logic [15:0] rdata1;

    // Lectura 2
    logic [3:0] raddr2;
    logic [15:0] rdata2;


    // -------- PC --------
    logic pc_src;
    logic [15:0] target_pc;
    logic [15:0] pc_out;


    // -------- CONTROL UNIT --------
    logic use_imm;


    // -------- MEMORY --------
    logic [15:0] instr_addr;
    logic [15:0] instruction;

    logic mem_read;
    logic mem_write;

    logic [15:0] data_addr;
    logic [15:0] write_data;
    logic [15:0] read_data;


    // ========================================
    // MODPORTS
    // ========================================

    modport alu (
        input operand_a, operand_b, alu_op,
        output result, zero_flag
    );

    modport register_file (
        input clk, rst_n, wen, waddr, wdata,
              raddr1, raddr2,
        output rdata1, rdata2
    );

    modport pc (
        input clk, rst_n, pc_src, target_pc,
        output pc_out
    );

    modport control_unit (
        input instruction, zero_flag,
        output raddr1, raddr2, waddr, wen,
               alu_op, use_imm, mem_read,
               mem_write, pc_src, target_pc
    );

    modport memory (
        input clk, rst_n, instr_addr,
              mem_read, mem_write,
              data_addr, write_data,
        output instruction, read_data
    );

endinterface
