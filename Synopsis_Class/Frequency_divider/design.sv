module Freq_divider #(parameter divisor= 2) (
    input logic enable,
    input logic reset,
    input logic F_in,
    output logic F_out
);
localparam int size = (divisor <= 2) ? 1 : $clog2(divisor/2);
logic [size-1:0]counter;

always_ff @(posedge F_in or posedge reset)
begin
    if (reset) begin
        F_out <= 0;
        counter <= '0;
    end
    else if (enable) begin

        if (counter == (divisor/2)-1) begin
            F_out <= ~F_out;
            counter <= '0;
        end
        else 
            counter <= counter + 1'b1;
    end 
end


endmodule
