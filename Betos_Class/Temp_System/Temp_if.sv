interface Temperature_if (
    input logic clk,
    input logic rst_n
);

    logic [7:0] rtemp;
    logic alert;

    modport sensor (
        input clk, rst_n,
        output rtemp
    );

    modport control (
        input rtemp,
        output alert
    );

endinterface
