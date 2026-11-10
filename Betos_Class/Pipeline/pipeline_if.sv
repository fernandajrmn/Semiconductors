`timescale 1ns/1ps
interface pipeline_if (
	input clk,
	input rst_n
);


logic [7:0] pixel_i;
logic [7:0] pixel_o;
logic valid_i;
logic valid_o;

modport processor (
	input clk,rst_n,valid_i,pixel_i,
	output valid_o,pixel_o
);

modport source (
	input clk, rst_n,
	output valid_i, pixel_i
);

modport receptor (
	input clk, rst_n, valid_o, pixel_o
);

endinterface




