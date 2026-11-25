package irq_pkg;
	parameter int NUM_IRQS = 9;
	parameter int IRQ_WIDTH = 3;
	parameter int FIFO_DEPTH = 8;


	//Estados del controlador
		typedef enum logic {
			IDLE, 
			WRITE_EVENT,
	} irq_state_t;
	
	//Codifica la interrupcion de mayor prioridad
	//El bit 7 tiene la priodad mas alta
	
	function automatic logic [3:0] priority_enconder (
		input logic [7:0] requests
	);
	
	logic [3:0] result;
	
	result = 4'b0000;
	
		for (int i = 0; i<8; i++) begin
			if (requests[i])
				result = {1'b1, i[2:0]};
		end
		return result;
	endfunction
endpackage
