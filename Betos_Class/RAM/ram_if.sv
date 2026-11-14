interface ram_if (
    input logic clk,
    input logic rst_n
);

    logic we1;
    logic we2;
    logic error_wr;

    logic [7:0]  addr_wr1;
    logic [7:0]  addr_wr2;
    logic [15:0] data_in1;
    logic [15:0] data_in2;

    logic [7:0]  addr_rd1;
    logic [7:0]  addr_rd2;
    logic [15:0] data_out1;
    logic [15:0] data_out2;

    modport ram (
        input  clk, rst_n, we1, we2,
               addr_wr1, addr_wr2, data_in1, data_in2,
               addr_rd1, addr_rd2,
        output data_out1, data_out2, error_wr
    );

    modport writer (
        input  clk, rst_n,
        output we1, we2, addr_wr1, addr_wr2, data_in1, data_in2
    );

    modport reader (
        input  clk, rst_n, data_out1, data_out2,
        output addr_rd1, addr_rd2
    );

endinterface
