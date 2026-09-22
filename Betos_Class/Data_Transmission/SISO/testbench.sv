`timescale 1ns/1ps


module SISO_tb;

	logic clk;
	logic datain;
	logic reset;
	logic dataout;

	logic [7:0]numerito;

SISO dut(.*);

initial clk =0;
always #5 clk = ~clk;

 initial
    begin
    $dumpfile("dump.vcd");
    $dumpvars(0, SISO_tb);
    end

  initial
    begin
      $monitor("Tiempo = %0t ps | clock = %b | reset = %b | datain -> %b | | Dataout -> %b", $time,clk,reset,datain,dataout);
		
		reset = 1; datain=0; #10;
		reset = 0;		

		numerito = 8'b11100111;
        for (int i = 0; i < 8; i++) 
					begin
						@(negedge clk);
            datain = numerito[i]; 
        	end

		
		@(negedge clk);
		datain = 0; #10;

			repeat(8) @(posedge clk);

		$finish;

	end
endmodule
