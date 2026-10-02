`include "Temp_if.sv"

module System_sensor (
	Temperature_if.sensor sensor
);


	always_ff @(posedge sensor.clk or negedge sensor.rst_n)
		begin
			if (!sensor.rst_n)
				sensor.rtemp <= '0;
			else
				sensor.rtemp <= sensor.rtemp + 5'd25;
		end
		endmodule


module System_control (
	Temperature_if.control control
);

always_comb 
	begin
		if(control.rtemp >= 8'd80)
			control.alert = 1;
		else
			control.alert = 0;
	end
endmodule

module Temp_top(
	input logic clk,
	input logic rst_n

);

Temperature_if Temp_inst(
	.clk(clk),
	.rst_n(rst_n)
);

System_control Control_m(
	.control(Temp_inst.control)
);


System_sensor Sensor_m(
	.sensor(Temp_inst.sensor)
);

endmodule
