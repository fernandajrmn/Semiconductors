`timescale 1ns/1ps

module Factorial_tb;
	logic [4:0]Number;
	logic [31:0]Result;

  Factorial dut(.*);

  initial
    begin
    $dumpfile("dump.vcd");
    $dumpvars(0, Factorial_tb);
    end


  initial
    begin
      $monitor("Tiempo = %0t ns | Number = %d | Result = %d", $time,Number,Result);
			

			Number = 5'd0; #10;
			Number = 5'd1; #10;
			Number = 5'd5; #10;
			Number = 5'd10; #10;
			Number = 5'd12; #10;
			Number = 5'd0; #10;

			$finish; //este para la ejecucion de la simulacion
    end
endmodule
			
