`timescale 1ns/1ps

module SIPO_tb;

logic clk;
logic reset;
logic datain;
logic load;
logic [7:0] leds;

logic [7:0] numerito;

logic [7:0] numerito2;
SIPO dut(.*);

initial clk = 0;
always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, SIPO_tb);
end

initial begin

    $monitor("Tiempo = %0t ps | clk = %b | reset = %b | datain = %b | load = %b | leds = %b | counter = %d", $time, clk, reset, datain, load, leds, dut.counter);

    reset = 1; datain = 0; load = 0; #4;
    

    numerito = 8'b11100111;

    @(negedge clk);
    reset = 0;

    for (int i = 7; i >= 0; i--)
    begin
        datain = numerito[i];

        if (i == 0)
            load = 1;

        @(negedge clk);
    end

    load = 0; datain = 0; reset = 1; #4;
		
    numerito2 = 8'b10011100;

    @(negedge clk);
    reset = 0;

    for (int i = 7; i >= 0; i--)
    begin
        datain = numerito2[i];

        if (i == 0)
            load = 1;

        @(negedge clk);
    end

		load = 0; datain = 0; #10;

    $finish;

end

endmodule
