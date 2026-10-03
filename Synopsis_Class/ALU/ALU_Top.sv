`include "Operations.sv"
`include "Mux.sv"
`include "Register.sv"

module ALU_Top (
    input  logic [15:0] A,
    input  logic [15:0] B,
    input  logic [1:0]  sel,
    input  logic        clk,
    input  logic        reset,
    input  logic        enable,

    output logic [15:0] result
);

    logic [15:0] and_result;
    logic [15:0] or_result;
    logic [15:0] shift_result;
    logic [15:0] div_result;

    logic [15:0] mux_result;


    operations ops (
        .A(A),
        .B(B),
        .and_out(and_result),
        .or_out(or_result),
        .shift_out(shift_result),
        .div_out(div_result)
    );


    mux4 mux (
        .in0(and_result),
        .in1(or_result),
        .in2(shift_result),
        .in3(div_result),
        .sel(sel),
        .out(mux_result)
    );


    register reg1 (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .d(mux_result),
        .q(result)
    );

endmodule
