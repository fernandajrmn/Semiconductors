`timescale 1ns/1ps

module Freq_divider_tb;

    parameter int divisor = 6;

    logic enable;
    logic reset;
    logic F_in;
    logic F_out;

    Freq_divider #(.divisor(divisor)) dut (.*);

    // Clock de entrada
    initial F_in = 0;
    always #5 F_in = ~F_in;


    // Waveform
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, Freq_divider_tb);
    end


    // Monitor
    initial begin
        $monitor(
            "Tiempo = %0t ps | F_in = %b | reset = %b | enable = %b | counter = %d | F_out = %b",
            $time, F_in, reset, enable, dut.counter, F_out
        );
    end


    initial begin

        // Reset
        reset = 1; enable = 0; #10;
        reset = 0;


        // Encender divisor
        @(negedge F_in); enable = 1;

        // Repetir
        repeat(15) @(posedge F_in);

        // Apagar
        @(negedge F_in); enable = 0;

        repeat(4) @(posedge F_in);

        $finish;

    end

endmodule