`include "pipeline_if.sv"


module pipeline ( 
    pipeline_if.processor bus
);


//Etapa 1
logic [8:0] stage1_data;
logic stage1_valid;


//Etapa 2
logic [9:0] stage2_data;
logic stage2_valid;


//Etapa 3
logic [7:0] stage3_data;
logic stage3_valid;

always_ff @(posedge bus.clk or negedge bus.rst_n) begin
	if (!bus.rst_n) begin
		stage1_data <= '0;
		stage2_data <= '0;
		stage3_data <= '0;
		
		stage1_valid <= 1'b0;
		stage2_valid <= 1'b0;
		stage3_valid <= 1'b0;
	end 
	else begin
		//Etapa 1: Multiplicacion x2
		stage1_data <= {bus.pixel_i, 1'b0};
		stage1_valid <= bus.valid_i;

		//Etapa 2: Suma +10
		stage2_data <= {1'b0, stage1_data} + 10'd10;;
		stage2_valid <= stage1_valid;

		//Etapa 3: Saturacion
		if (stage2_data > 10'd255)
				stage3_data <= 8'd255;
		else
			stage3_data <= stage2_data[7:0];
		
		stage3_valid <= stage2_valid;
	end
end

//Salidas
assign bus.pixel_o = stage3_data;
assign bus.valid_o = stage3_valid;

endmodule
