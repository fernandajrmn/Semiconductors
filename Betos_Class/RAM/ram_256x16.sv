module ram_256x16 (
    ram_if.ram bus
);

    // 256 palabras de 16 bits
    logic [15:0] mem [0:255];

    // Lectura y escritura sincronas en el flanco positivo.
    // El reset limpia las salidas, pero NO inicializa el arreglo mem.
    always_ff @(posedge bus.clk) begin
        if (!bus.rst_n) begin
            bus.data_out1 <= '0;
            bus.data_out2 <= '0;
            bus.error_wr  <= 1'b0;
        end
        else begin
            // Bandera de error: pulso de un ciclo en caso de colision.
            bus.error_wr <= 1'b0;

            if (bus.we1 && bus.we2 &&
                (bus.addr_wr1 == bus.addr_wr2)) begin
                bus.error_wr <= 1'b1;
                // No se escribe en caso de colision.
            end
            else begin
                if (bus.we1)
                    mem[bus.addr_wr1] <= bus.data_in1;
                if (bus.we2)
                    mem[bus.addr_wr2] <= bus.data_in2;
            end

            // Lectura registrada (read-first en la simulacion).
            bus.data_out1 <= mem[bus.addr_rd1];
            bus.data_out2 <= mem[bus.addr_rd2];
        end
    end

endmodule
