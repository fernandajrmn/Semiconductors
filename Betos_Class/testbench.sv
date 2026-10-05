`timescale 1ns/1ps

module Leds_tb;

logic clk;
logic reset;
logic [3:0] array;

Top dut (.*);

// Reloj de periodo 10 ns
initial clk = 0;
always #5 clk = ~clk;

initial begin

    $monitor(
        "Tiempo = %0t ns | reset = %b | code = %b | leds = %b",
        $time, reset, dut.leds_if.code, array
    );

    // Reset inicial
    reset = 1; #10;
    reset = 0;

    // Dejar correr simulación
    #100;

    $finish;

end

endmodule
