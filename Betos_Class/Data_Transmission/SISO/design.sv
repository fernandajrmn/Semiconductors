module SISO(
	input logic clk,
	input logic datain,
	input logic reset,
	output logic dataout
);

logic [7:0]shifted_data;

always @(posedge clk or posedge reset)
	begin
		if (reset)
			shifted_data <= 8'b0;
		else
			shifted_data <= {datain, shifted_data[7:1]};
	end

assign dataout=shifted_data[0];

endmodule
