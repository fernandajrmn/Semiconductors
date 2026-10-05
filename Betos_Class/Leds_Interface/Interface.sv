interface Leds_if (
	input clk,
	input reset
);

logic [1:0]code;
logic [3:0]array;


modport master (
	input clk, reset,
	output code
);

modport slave (
	input code,
	output array
);

endinterface

module Leds_master (
	Leds_if.master controller
);

always_ff @(posedge controller.clk or posedge controller.reset)
	begin
		if (controller.reset || controller.code == 2'b11)
			controller.code <= '0;
		else
			begin
				controller.code <= controller.code + 1'b1;
			end
	end
endmodule



module Leds_slave (
	Leds_if.slave led_driver
);

always_comb
begin
	case (led_driver.code)
		2'b00: led_driver.array = 4'b0000;
		2'b01: led_driver.array = 4'b1111;
		2'b10: led_driver.array = 4'b1010;
		2'b11: led_driver.array = 4'b0101;
		default: led_driver.array = 4'b0000;
	endcase
end

endmodule


module Top (
    input clk,
    input reset,
    output [3:0] array
);

Leds_if leds_if (.*);

Leds_master master(
    .controller(leds_if.master)
);

Leds_slave slave(
    .led_driver(leds_if.slave)
);

assign array = leds_if.array;

endmodule