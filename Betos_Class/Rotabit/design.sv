module Rotabit (
    input logic clk,
    input logic Enable,
    input logic Reset,
    output logic [3:0] Leds
);

logic [1:0] counter;
logic direction;

always @(posedge clk or posedge Reset)
begin
    if (Reset)
    begin
        direction <= 1;
        counter <= 2'b0;
        Leds <= 4'b1111;
    end
    else if (Enable)
    begin

        if (direction == 1) begin
            if (counter == 2'b11) begin
                direction <= 0;
                counter <= 2'b10;
            end
            else
                counter <= counter + 1'b1;
        end

        if (direction == 0) begin
            if (counter == 2'b0) begin
                direction <= 1;
                counter <= 2'b01;
            end
            else
                counter <= counter - 1'b1;
        end

        Leds <= ~(4'b0001 << counter);
    end
end

endmodule
