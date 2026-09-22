`timescale 1ns/1ps

module SISO_SIPO_tb;

    logic clk;
    logic reset;
    logic datain;
    logic load;
    logic [7:0] leds;

    logic [7:0] numerito;
		logic [7:0] numerito2;

    SISO_SIPO dut (
        .clk(clk),
        .reset(reset),
        .datain(datain),
        .load(load),
        .leds(leds)
    );


    initial clk = 0;
    always #5 clk = ~clk;


    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, SISO_SIPO_tb);
    end


    initial begin

        $monitor(
            "Tiempo = %0t ps | clk = %b | reset = %b | datain = %b | SISO_out = %b | load = %b | leds = %b | counter = %d",
            $time, clk, reset, datain, dut.conexion, load, leds, dut.counter
        );

        reset = 1; datain = 0; load = 0; #10;
        reset = 0;

        numerito = 8'b11100111;
        numerito2 = 8'b10011100;
		


        //numerito1
        for (int i = 7; i >= 0; i--)
        begin
            @(negedge clk);
            datain = numerito[i];
        end

        //numerito2
        for (int i = 7; i >= 0; i--)
        begin
            @(negedge clk);

            datain = numerito2[i];



        end

        #40;

        
        repeat (3) begin
            @(negedge clk);
            datain = 0;
            load = 1;
        end

        //00000
        for (int i = 0; i < 8; i++)
        begin
            @(negedge clk);

            datain = 0;

            //if (i == 0)
            //    load = 0;

            if (i == 7)
                load = 1;
        end
        

        @(negedge clk);
        load = 0; #10;
        $finish;

    end

endmodule
