module memory_bank (
    input logic clk,
    input logic rst_n,

    // Puerto de escritura
    input logic wr_en,
    input logic [3:0] addr_wr,
    input logic [15:0] data_in,

    // Puertos de lectura
	input logic [3:0] rd_en,

    input logic [3:0] addr_rd0,
    input logic [3:0] addr_rd1,
    input logic [3:0] addr_rd2,
    input logic [3:0] addr_rd3,

    output logic [15:0] data_out0,
    output logic [15:0] data_out1,
    output logic [15:0] data_out2,
    output logic [15:0] data_out3,
	output logic [3:0] grant,
	output logic conflict

);

// Bancos de memoria
logic [15:0] bank0 [0:3];
logic [15:0] bank1 [0:3];
logic [15:0] bank2 [0:3];
logic [15:0] bank3 [0:3];


always_comb begin
    grant = '0;

    // Puerto 0
    grant[0] = rd_en[0];

    // Puerto 1
    if (rd_en[1] &&
        !(grant[0] && (addr_rd1[1:0] == addr_rd0[1:0])))
        grant[1] = 1'b1;

    // Puerto 2
    if (rd_en[2] &&
        !(grant[0] && (addr_rd2[1:0] == addr_rd0[1:0])) &&
        !(grant[1] && (addr_rd2[1:0] == addr_rd1[1:0])))
        grant[2] = 1'b1;

    // Puerto 3
    if (rd_en[3] &&
        !(grant[0] && (addr_rd3[1:0] == addr_rd0[1:0])) &&
        !(grant[1] && (addr_rd3[1:0] == addr_rd1[1:0])) &&
        !(grant[2] && (addr_rd3[1:0] == addr_rd2[1:0])))
        grant[3] = 1'b1;
end

assign conflict = (rd_en != grant);
// Escritura
always_ff @(posedge clk) begin
    if (wr_en) begin
        case (addr_wr[1:0])
            2'd0: bank0[addr_wr[3:2]] <= data_in;
            2'd1: bank1[addr_wr[3:2]] <= data_in;
            2'd2: bank2[addr_wr[3:2]] <= data_in;
            2'd3: bank3[addr_wr[3:2]] <= data_in;
        endcase
    end
end


// Lecturas sincronas
always_ff @(posedge clk) begin
    if (!rst_n) begin
        data_out0 <= '0;
        data_out1 <= '0;
        data_out2 <= '0;
        data_out3 <= '0;
    end else begin

        // Puerto 0
        if (grant[0]) begin
            case (addr_rd0[1:0])
                2'd0: data_out0 <= bank0[addr_rd0[3:2]];
                2'd1: data_out0 <= bank1[addr_rd0[3:2]];
                2'd2: data_out0 <= bank2[addr_rd0[3:2]];
                2'd3: data_out0 <= bank3[addr_rd0[3:2]];
            endcase
        end

        // Puerto 1
        if (grant[1]) begin
            case (addr_rd1[1:0])
                2'd0: data_out1 <= bank0[addr_rd1[3:2]];
                2'd1: data_out1 <= bank1[addr_rd1[3:2]];
                2'd2: data_out1 <= bank2[addr_rd1[3:2]];
                2'd3: data_out1 <= bank3[addr_rd1[3:2]];
            endcase
        end

        // Puerto 2
        if (grant[2]) begin
            case (addr_rd2[1:0])
                2'd0: data_out2 <= bank0[addr_rd2[3:2]];
                2'd1: data_out2 <= bank1[addr_rd2[3:2]];
                2'd2: data_out2 <= bank2[addr_rd2[3:2]];
                2'd3: data_out2 <= bank3[addr_rd2[3:2]];
            endcase
        end

        // Puerto 3
        if (grant[3]) begin
            case (addr_rd3[1:0])
                2'd0: data_out3 <= bank0[addr_rd3[3:2]];
                2'd1: data_out3 <= bank1[addr_rd3[3:2]];
                2'd2: data_out3 <= bank2[addr_rd3[3:2]];
                2'd3: data_out3 <= bank3[addr_rd3[3:2]];
            endcase
        end

    end
end
endmodule