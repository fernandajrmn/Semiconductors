
`timescale 1ns/1ps

module fifo_tb;

logic clk;
logic rst_n;
logic wr_en;
logic rd_en;
logic [15:0] data_in;
logic [15:0] data_out;
logic full;
logic empty;

// Instancia
fifo dut (.*);

// Reloj de 10 ns
initial clk = 0;
always #5 clk = ~clk;

// Verdi
initial begin
    $fsdbDumpfile("inter.fsdb");
    $fsdbDumpvars(0, fifo_tb, "+all");
end

// Monitor
initial begin
    $monitor("T=%0t | WR=%b | RD=%b | DIN=%0d | DOUT=%0d | WP=%d | RP=%d | FULL=%b | EMPTY=%b",
        $time, wr_en, rd_en, data_in, data_out,
        dut.write_ptr[3:0], dut.read_ptr[3:0], full, empty);
end

initial begin
    rst_n = 0;
    wr_en = 0;
    rd_en = 0;
    data_in = '0;

    @(negedge clk);
    rst_n = 1;

    // TEST 1: Escribir varios datos
    $display("\n===== TEST 1: ESCRITURA =====");

    for (int i = 0; i < 4; i++) begin
        @(negedge clk);
        wr_en = 1;
        data_in = (i + 1) * 10;
    end

    @(negedge clk);
    wr_en = 0;

    // TEST 2: Leer en orden FIFO
    $display("\n===== TEST 2: LECTURA FIFO =====");

    for (int i = 0; i < 4; i++) begin
        @(negedge clk);
        rd_en = 1;

        @(posedge clk);
        #1;
        if (data_out !== (i + 1) * 10)
            $fatal(1, "Error en lectura FIFO");
    end

    @(negedge clk);
    rd_en = 0;

    if (!empty)
        $fatal(1, "La FIFO deberia estar vacia");

    // TEST 3: Llenar toda la memoria
    $display("\n===== TEST 3: MEMORIA LLENA =====");

    for (int i = 0; i < 16; i++) begin
        @(negedge clk);
        wr_en = 1;
        data_in = 100 + i;
    end

    @(negedge clk);
    wr_en = 0;

    if (!full)
        $fatal(1, "La FIFO deberia estar llena");

    // Intentar escribir cuando esta llena
    wr_en = 1;
    data_in = 999;

    @(negedge clk);
    wr_en = 0;

    if (dut.write_ptr !== 5'd20)
        $fatal(1, "El puntero avanzo estando llena");

    // TEST 4: Liberar espacio
    $display("\n===== TEST 4: LEER 4 DATOS =====");

    for (int i = 0; i < 4; i++) begin
        @(negedge clk);
        rd_en = 1;

        @(posedge clk);
        #1;
        if (data_out !== 100 + i)
            $fatal(1, "Error al liberar espacio");
    end

    @(negedge clk);
    rd_en = 0;

    // TEST 5: Escritura y lectura simultaneas
    $display("\n===== TEST 5: LECTURA Y ESCRITURA =====");

    for (int i = 0; i < 4; i++) begin
        @(negedge clk);
        wr_en = 1;
        rd_en = 1;
        data_in = 200 + i;

        @(posedge clk);
        #1;
        if (data_out !== 104 + i)
            $fatal(1, "Error en lectura simultanea");
    end

    @(negedge clk);
    wr_en = 0;
    rd_en = 0;

    // TEST 6: Leer el resto y comprobar vuelta
    $display("\n===== TEST 6: VUELTA DE PUNTEROS =====");

    for (int i = 0; i < 12; i++) begin
        @(negedge clk);
        rd_en = 1;

        @(posedge clk);
        #1;

        if (i < 8) begin
            if (data_out !== 108 + i)
                $fatal(1, "Error leyendo datos originales");
        end
        else begin
            if (data_out !== 200 + (i - 8))
                $fatal(1, "Error leyendo datos nuevos");
        end
    end

    @(negedge clk);
    rd_en = 0;

    if (!empty)
        $fatal(1, "La FIFO deberia terminar vacia");

    $display("\nTODAS LAS PRUEBAS PASARON");
    $finish;
end

endmodule
