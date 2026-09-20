module SISO(
	input logic clk,
	input logic load,
	input logic [7:0]leds,
	input logic [7:0]datain,
	output logic [7:0]dataout
);

logic [6:0]shifted_data;

always_ff(@posedge clk)
	begin
		dataout = {[]
	
		

	end


endmodule
