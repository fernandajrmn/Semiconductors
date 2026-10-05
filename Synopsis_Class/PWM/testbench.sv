`timescale 1ns/1ps

module PWM_tb;

    parameter int size = 10;

    logic clk;
    logic enable;
    logic reset;

    logic [7:0] duty_cycle;

    logic [size-1:0] PSC;
    logic [size-1:0] ARR;

    logic pwm;


    PWM #(.size(size)) dut (.*);


    //100 MHz
    initial clk = 0;
    always #5 clk = ~clk;


    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, PWM_tb);
    end


    initial begin

        $monitor(
            "Tiempo = %0t | reset = %b | enable = %b | duty = %0d %% | pwm = %b",
            $time,
            reset,
            enable,
            duty_cycle,
            pwm
        );



        reset = 1; enable = 0; PSC = 99; ARR = 999; duty_cycle = 0; #20;
        reset = 0;

        @(negedge clk); enable = 1;


        // 25% duty cycle
        duty_cycle = 25;

        #2_000_000;


        // Apagar y reiniciar
        @(negedge clk); enable = 0; #20;


        // 50% duty cycle
        @(negedge clk); duty_cycle = 50; enable = 1;

        #2_000_000;


        @(negedge clk); enable = 0;

        #20;

        // 75% duty cycle
        @(negedge clk); duty_cycle = 75; enable = 1;

        #2_000_000;


        @(negedge clk); enable = 0;

        #20;


        $finish;

    end

endmodule