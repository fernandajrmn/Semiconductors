`timescale 1ns/1ps

	module pipeline_tb;

	logic clk;
	logic rst_n;


	pipeline_if bus(.*);

	pipeline dut(bus);

	initial clk = 0;
	always #5 clk = ~clk;

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars(0, pipeline_tb);
	end

	initial begin

		$monitor(
			"Tiempo = %0t ps | clk = %b | Reset = %b | valid_i = %b | pixel_i = %d | Stage1_valid = %b | Stage1_data = %d | Stage2_valid %b | Stage2_data = %d | valid_o = %b | pixel_o = %d",
			$time, clk, rst_n, bus.valid_i, bus.pixel_i, dut.stage1_valid, dut.stage1_data, dut.stage2_valid, dut.stage2_data, bus.valid_o, bus.pixel_o,
		);

			//Reset system

			rst_n = 0; bus.valid_i = 0; bus.pixel_i = '0; #10;
			
			//Start
			@(negedge clk); 
			rst_n = 1;
			bus.pixel_i = 8'd10;
			bus.valid_i = 1;
			
		
			@(negedge clk);
			bus.pixel_i = 8'd20;

			
			// Pixel 30
			@(negedge clk);
			bus.pixel_i = 8'd30;

			// Pixel 200: prueba de saturación
			@(negedge clk);
			bus.pixel_i = 8'd200;

			// Terminamos de enviar píxeles
			@(negedge clk);
			bus.valid_i = 0;
			bus.pixel_i = '0;

			// Dejamos terminar los datos pendientes
			// y esperamos a que valid_o regrese a 0
			repeat (3) @(posedge clk);
			#1;

			$finish;


	

	end


	endmodule
