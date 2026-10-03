`timescale 1ns/1ps

module ALU_top_tb;

    logic [15:0] A;
    logic [15:0] B;
    logic [1:0]  sel;

    logic clk;
    logic reset;
    logic enable;

    logic [15:0] result;


    // Instancia del módulo principal
    ALU_Top dut (.*);


    // Clock
    initial clk = 0;
    always #5 clk = ~clk;


    initial begin

        $monitor(
            "Tiempo=%0t | A=%d | B=%d | sel=%b | enable=%b | clock = %b | reset=%b | result=%d",
            $time, A, B, sel, enable, clk, reset, result
        );


        // Valores iniciales
        A = 0; B = 0; sel = 0; enable = 0; reset = 1; #10;

        // Quitar reset
        reset = 0;


        // AND
        A = 12;
        B = 10;
        sel = 2'b00;
        enable = 1;

        @(posedge clk);
        #1;


        // OR
        sel = 2'b01;

        @(posedge clk);
        #1;


        // SHIFT
        sel = 2'b10;

        @(posedge clk);
        #1;


        // DIV
        A = 12;
        B = 3;
        sel = 2'b11;

        @(posedge clk);
        #1;


        // Probar enable = 0
        enable = 0;
        A = 20;
        B = 5;
        sel = 2'b11;

        @(posedge clk);
        #1;


        // Probar reset asincrono
        reset = 1;
        #2;

        reset = 0;


        #10;
        $finish;

    end

endmodule
