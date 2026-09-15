module Factorial(
	input logic [4:0]Number,
	output logic [31:0]Result
);

	task automatic calculate_factorial;
		input [4:0] n;
		output [31:0] fact;
	
		begin
			fact = 1;
			for (int i = 1; i <= n; i++)
			begin 
				fact = fact * i;
			end
		end
	endtask
	

	always_comb
		begin
			calculate_factorial(Number,Result);
		end

endmodule
