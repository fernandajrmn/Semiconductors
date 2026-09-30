`timescale 1ns/1ps

module Counter_tb;

    parameter int n = 4;

    logic clk;
    logic enable;
    logic reset;
    logic pause;
    logic [(n-1):0] result;

    Counter #(.n(n)) dut (.*);

    // Clock
    initial clk = 0;
    always #5 clk = ~clk;


    // Para waveform
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, Counter_tb);
    end


    // Monitor
    initial begin
        $monitor(
            "Tiempo = %0t ps | clk = %b | reset = %b | enable = %b | pause = %b | result = %d",
            $time, clk, reset, enable, pause, result
        );
    end


    // Pruebas
    initial begin

        // Reset
        reset  = 1; enable = 0; pause  = 0; #10; 
        reset = 0;


        // Empezar a contar
        @(negedge clk);
        enable = 1;

        repeat(5) @(posedge clk);


        // Pausa
        @(negedge clk); pause = 1;

        repeat(3) @(posedge clk);

        // sin pausa
        @(negedge clk); pause = 0;

        // Desborde
        repeat(12) @(posedge clk);


        // Sin contador
        @(negedge clk); enable = 0;

        repeat(3) @(posedge clk);

        $finish;

    end

endmodule