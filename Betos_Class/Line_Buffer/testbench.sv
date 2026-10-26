`timescale 1ns/1ps

module line_buffer_tb;

    logic clk;
    logic rst_n;


    // ========================================================
    // Interface
    // ========================================================

    line_buffer_if bus (
        .clk(clk),
        .rst_n(rst_n)
    );


    // ========================================================
    // DUT
    // Imagen pequeña de 4x4 para probar
    // ========================================================

    line_buffer_window_3x3 #(
        .IMG_WIDTH(4),
        .IMG_HEIGHT(4)
    ) dut (
        .bus(bus.line_buffer)
    );


    // ========================================================
    // Clock de 10 ns
    // ========================================================

    initial clk = 0;
    always #5 clk = ~clk;


    // ========================================================
    // Dump
    // ========================================================

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, line_buffer_tb);
    end


    // ========================================================
    // Task para mandar un píxel
    // ========================================================

    task send_pixel(input logic [7:0] pixel);

        // Preparamos el dato en negedge
        @(negedge clk);

        bus.in_valid = 1;
        bus.in_data  = pixel;


        // Si el Line Buffer está haciendo padding,
        // in_ready será 0.
        // Mantenemos el mismo píxel hasta que pueda recibirlo.
        while (!bus.in_ready) begin
            @(negedge clk);
        end

        // El dato será capturado en el siguiente posedge
        @(posedge clk);

    endtask


    // ========================================================
    // Monitor
    // ========================================================

    initial begin

        $monitor(
            "T=%0t | data=%0d | valid=%b | ready=%b | row=%0d | col=%0d | out_valid=%b | window=[%0d %0d %0d][%0d %0d %0d][%0d %0d %0d]",
            $time,

            bus.in_data,
            bus.in_valid,
            bus.in_ready,

            dut.row_count,
            dut.col_count,

            bus.out_valid,

            bus.p00, bus.p01, bus.p02,
            bus.p10, bus.p11, bus.p12,
            bus.p20, bus.p21, bus.p22
        );

    end


    // ========================================================
    // Estímulos
    // ========================================================

    initial begin

        // Valores iniciales
        rst_n         = 0;
        bus.in_valid  = 0;
        bus.in_data   = 0;

        // Sobel siempre listo al inicio
        bus.out_ready = 1;


        // Reset
        #10;
        rst_n = 1;


        // ====================================================
        // Imagen 4x4:
        //
        //  1   2   3   4
        //  5   6   7   8
        //  9  10  11  12
        // 13  14  15  16
        // ====================================================

        for (int i = 1; i <= 16; i++) begin
            send_pixel(i);
        end


        // Ya no enviamos más datos
        @(negedge clk);

        bus.in_valid = 0;
        bus.in_data  = 0;


        // Dejamos correr unos ciclos para que el
        // circuito termine el padding inferior
        repeat(10) @(posedge clk);


        $finish;

    end

endmodule