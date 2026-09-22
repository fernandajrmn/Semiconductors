module SIPO(
    input  logic clk,
    input  logic reset,
    input  logic datain,
    input  logic load,
    output logic [7:0] leds,
		output logic [2:0] counter	
);

logic [7:0] shifted_data;


always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        shifted_data <= 8'b0;
        counter <= 3'b0;
        leds <= 8'b0;
    end
    else
    begin
        shifted_data <= {shifted_data[6:0], datain};
        counter <= counter + 1'b1;

        if ((counter == 3'b111) && load)
        begin
            leds <= {shifted_data[6:0], datain};
            counter <= 3'b0;
        end
    end
end

endmodule
