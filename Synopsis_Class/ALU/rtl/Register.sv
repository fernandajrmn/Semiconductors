module register (
    input  logic        clk,
    input  logic        reset,
    input  logic        enable,
    input  logic [15:0] d,

    output logic [15:0] q
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            q <= 0;
        else if (enable)
            q <= d;
    end

endmodule