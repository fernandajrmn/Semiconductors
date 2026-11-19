`timescale 1ns/1ps

module memory_bank_tb;

logic clk;
logic rst_n;

// Escritura
logic wr_en;
logic [3:0] addr_wr;
logic [15:0] data_in;

// Lectura
logic [3:0] rd_en;

logic [3:0] addr_rd0;
logic [3:0] addr_rd1;
logic [3:0] addr_rd2;
logic [3:0] addr_rd3;

logic [15:0] data_out0;
logic [15:0] data_out1;
logic [15:0] data_out2;
logic [15:0] data_out3;

// Arbitraje
logic [3:0] grant;
logic conflict;

// Instancia
memory_bank dut (.*);

// Clock
initial clk = 0;
always #5 clk = ~clk;

// Verdi
initial begin
    $fsdbDumpfile("inter.fsdb");
    $fsdbDumpvars(0, memory_bank_tb);
end

initial begin

    $timeformat(-9, 0, " ns", 8);

    $monitor(
        "T=%0t | WR=%b | WR_ADDR=%0d | DIN=%0d | RD_EN=%b | ADDR=[%0d,%0d,%0d,%0d] | DOUT=[%0d,%0d,%0d,%0d] | GRANT=%b | CONFLICT=%b",
        $time, wr_en, addr_wr, data_in, rd_en,
        addr_rd0, addr_rd1, addr_rd2, addr_rd3,
        data_out0, data_out1, data_out2, data_out3,
        grant, conflict
    );

    // Reset
    rst_n = 0;
    wr_en = 0;
    addr_wr = 0;
    data_in = 0;
    rd_en = 0;

    addr_rd0 = 0;
    addr_rd1 = 0;
    addr_rd2 = 0;
    addr_rd3 = 0;

    repeat (2) @(negedge clk);
    rst_n = 1;


    // ===================================
    // TEST 1: Escritura de toda la memoria
    // ===================================
    $display("\n===== TEST 1: ESCRITURA =====");

    for (int i = 0; i < 16; i++) begin
        @(negedge clk);
        wr_en = 1;
        addr_wr = i;
        data_in = 100 + i;
    end

    @(negedge clk);
    wr_en = 0;


    // ===================================
    // TEST 2: Lectura sin conflictos
    // ===================================
    $display("\n===== TEST 2: SIN CONFLICTOS =====");

    rd_en = 4'b1111;
    addr_rd0 = 0;
    addr_rd1 = 5;
    addr_rd2 = 10;
    addr_rd3 = 15;

    @(negedge clk);


    // ===================================
    // TEST 3: Un conflicto
    // ===================================
    $display("\n===== TEST 3: UN CONFLICTO =====");

    rd_en = 4'b1111;
    addr_rd0 = 0;
    addr_rd1 = 4;
    addr_rd2 = 2;
    addr_rd3 = 3;

    @(negedge clk);


    // ===================================
    // TEST 4: Dos conflictos
    // ===================================
    $display("\n===== TEST 4: DOS CONFLICTOS =====");

    rd_en = 4'b1111;
    addr_rd0 = 2;
    addr_rd1 = 5;
    addr_rd2 = 10;
    addr_rd3 = 13;

    @(negedge clk);


    // ===================================
    // TEST 5: Todos al mismo banco
    // ===================================
    $display("\n===== TEST 5: MISMO BANCO =====");

    rd_en = 4'b1111;
    addr_rd0 = 0;
    addr_rd1 = 4;
    addr_rd2 = 8;
    addr_rd3 = 12;

    @(negedge clk);


    // ===================================
    // TEST 6: Puerto 0 deshabilitado
    // ===================================
    $display("\n===== TEST 6: P0 DESHABILITADO =====");

    rd_en = 4'b1110;

    @(negedge clk);


    // ===================================
    // TEST 7: Sin solicitudes
    // ===================================
    $display("\n===== TEST 7: SIN SOLICITUDES =====");

    rd_en = 4'b0000;

    #20;
    $finish;

end

endmodule