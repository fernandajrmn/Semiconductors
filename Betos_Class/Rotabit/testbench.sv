`timescale 1ns/1ps

module Rotabit_tb;

logic clk;
logic Enable;
logic Reset;
logic [3:0] Leds;

Rotabit dut(.*);

initial clk = 0;
always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, Rotabit_tb);
end

initial begin

    $monitor(
        "Tiempo = %0t ps | clk = %b | Reset = %b | Enable = %b | counter = %d | direction = %b | Leds = %b",
        $time, clk, Reset, Enable, dut.counter, dut.direction, Leds
    );

    Reset = 1; Enable = 0; #10;

    Reset = 0; Enable = 1;

    repeat(12) @(posedge clk);

    @(negedge clk); Enable = 0;

    #20;

    $finish;

end

endmodule