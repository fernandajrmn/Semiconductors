module fifo (
    input logic clk,
    input logic rst_n,
    input logic wr_en,
    input logic rd_en,
    input logic [15:0] data_in,
    output logic [15:0] data_out,
    output logic full,
    output logic empty
);

logic [15:0] mem [15:0];

logic [4:0] write_ptr;
logic [4:0] read_ptr;

// Flags
assign empty = (write_ptr == read_ptr);

assign full = (write_ptr[3:0] == read_ptr[3:0]) &&
              (write_ptr[4] != read_ptr[4]);

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        data_out <= '0;
        write_ptr <= '0;
        read_ptr <= '0;
    end
    else begin
        // Lectura
        if (rd_en && !empty) begin
            data_out <= mem[read_ptr[3:0]];
            read_ptr <= read_ptr + 1'b1;
        end

        // Escritura
        if (wr_en && !full) begin
            mem[write_ptr[3:0]] <= data_in;
            write_ptr <= write_ptr + 1'b1;
        end
    end
end

endmodule
