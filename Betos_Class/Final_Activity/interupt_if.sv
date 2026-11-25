interface interrupt_if (input logic clk);
	logic [7:0] irq;
	logic mask_we;
	logic [7:0] mask_wdata;
	
	logic event_valid;
	logic [2:0] event_id;
	logic event_ack;

//Lado del controlador
modport controller (
	input clk, irq, mask_we, mask_wdata, event_ack,
	output event_valid, event_id
);

//Lado del procesador
modport processor (
	input clk, event_valid, event_id,
	output irq, mask_we, mask_wdata, event_ack, event_valid
);

endinterface

