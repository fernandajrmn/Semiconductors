`timescale 1ns/1ps

module ram_tb;

    logic clk;
    logic rst_n;

    ram_if mem_if (
        .clk(clk),
        .rst_n(rst_n)
    );

    ram_256x16 dut (
        .bus(mem_if)
    );

    // Reloj de 10 ns
    initial clk = 0;
    always #5 clk = ~clk;

    // Guardar waveforms, incluido el arreglo mem[0:255].
    initial begin
        $fsdbDumpfile("inter.fsdb");
        $fsdbDumpvars(0, ram_tb, "+mda");
    end

    initial begin
        $timeformat(-9, 0, " ns", 8);
        $monitor(
            "T=%0t | clk=%b | rst_n=%b | we1=%b | we2=%b | WR1=%d | WR2=%d | DIN1=%d | DIN2=%d | RD1=%d | RD2=%d | DOUT1=%d | DOUT2=%d | ERROR=%b",
            $time, clk, rst_n,
            mem_if.we1, mem_if.we2,
            mem_if.addr_wr1, mem_if.addr_wr2,
            mem_if.data_in1, mem_if.data_in2,
            mem_if.addr_rd1, mem_if.addr_rd2,
            mem_if.data_out1, mem_if.data_out2,
            mem_if.error_wr
        );

        // Valores iniciales
        rst_n = 0;
        mem_if.we1 = 0;
        mem_if.we2 = 0;
        mem_if.addr_wr1 = 0;
        mem_if.addr_wr2 = 0;
        mem_if.data_in1 = 0;
        mem_if.data_in2 = 0;
        mem_if.addr_rd1 = 0;
        mem_if.addr_rd2 = 0;

        repeat (2) @(negedge clk);
        rst_n = 1;

        // TEST 1: dos escrituras a direcciones diferentes
        @(negedge clk);
        $display("\n--- TEST 1: escritura normal ---");
        mem_if.we1 = 1;
        mem_if.we2 = 1;
        mem_if.addr_wr1 = 8'd3;
        mem_if.addr_wr2 = 8'd7;
        mem_if.data_in1 = 16'd123;
        mem_if.data_in2 = 16'd456;
        mem_if.addr_rd1 = 8'd3;
        mem_if.addr_rd2 = 8'd7;

        @(negedge clk);
        mem_if.we1 = 0;
        mem_if.we2 = 0;

        @(posedge clk);
        #1;
        if (mem_if.data_out1 !== 16'd123 ||
            mem_if.data_out2 !== 16'd456 ||
            mem_if.error_wr !== 1'b0)
            $error("TEST 1 fallo");
        else
            $display("TEST 1 OK: mem[3]=123 y mem[7]=456");

        // TEST 2: ambos puertos intentan escribir en la misma direccion
        @(negedge clk);
        $display("\n--- TEST 2: colision ---");
        mem_if.we1 = 1;
        mem_if.we2 = 1;
        mem_if.addr_wr1 = 8'd5;
        mem_if.addr_wr2 = 8'd5;
        mem_if.data_in1 = 16'd111;
        mem_if.data_in2 = 16'd222;

        @(posedge clk);
        #1;
        if (mem_if.error_wr !== 1'b1)
            $error("TEST 2 fallo: no se detecto colision");
        else
            $display("TEST 2 OK: error_wr=1");

        @(negedge clk);
        mem_if.we1 = 0;
        mem_if.we2 = 0;

        @(posedge clk);
        #1;
        if (mem_if.error_wr !== 1'b0)
            $error("TEST 2 fallo: error_wr no regreso a cero");

        // TEST 3: direcciones iguales, pero solo un enable activo
        @(negedge clk);
        $display("\n--- TEST 3: un solo puerto ---");
        mem_if.we1 = 1;
        mem_if.we2 = 0;
        mem_if.addr_wr1 = 8'd9;
        mem_if.addr_wr2 = 8'd9;
        mem_if.data_in1 = 16'd999;
        mem_if.addr_rd1 = 8'd9;

        @(negedge clk);
        mem_if.we1 = 0;

        @(posedge clk);
        #1;
        if (mem_if.data_out1 !== 16'd999 ||
            mem_if.error_wr !== 1'b0)
            $error("TEST 3 fallo");
        else
            $display("TEST 3 OK: mem[9]=999 y error_wr=0");

        #20;
        $finish;
    end

endmodule
