module Counter #(parameter int n=8) (
 input logic clk,
 input logic enable,
 input logic reset,
 input logic pause,
output logic [(n-1):0]result
);

always_ff @(posedge clk or posedge reset)
 begin
 if (reset)
  result <= '0;
 else if (enable && !pause)
  result <= result + 1'b1;
end

endmodule