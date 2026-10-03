module operations (
    input  logic [15:0] A,
    input  logic [15:0] B,

    output logic [15:0] and_out,
    output logic [15:0] or_out,
    output logic [15:0] shift_out,
    output logic [15:0] div_out
);

    always_comb begin
        and_out   = A & B;
        or_out    = A | B;
        shift_out = A << 1;

        if (B != 0)
            div_out = A / B;
        else
            div_out = 0;
    end

endmodule