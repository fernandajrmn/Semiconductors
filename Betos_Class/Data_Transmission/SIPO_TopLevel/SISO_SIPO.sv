`include "siso.sv"
`include "sipo.sv"


module SISO_SIPO (
    input  logic       clk,
    input  logic       reset,
    input  logic       datain,
    input  logic       load,
    output logic [7:0] leds
);
    logic conexion;
		logic [2:0] counter;
    SISO siso1 (
        .clk(clk),
        .reset(reset),
        .datain(datain),
        .dataout(conexion)
    );

    SIPO sipo1 (
        .clk(clk),
        .reset(reset),
        .datain(conexion),
        .load(load),
        .leds(leds),
				.counter(counter)
    );

endmodule
