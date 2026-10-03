
`timescale 1ns/1ps
module AND_gate_tb;

    logic A;
    logic B;
    logic C;

    // Instantiate the AND_gate module
    AND_gate dut(.*);


    initial 
    begin
        $dumpfile("AND_gate_tb.vcd");
        $dumpvars(0, AND_gate_tb);
    end


    initial 
    begin

        $monitor("Time=%0t: A=%b, B=%b, C=%b", $time, A, B, C);
        // Test case 1: A=0, B=0
        A = 0; B = 0; #10;

        // Test case 2: A=0, B=1
        A = 0; B = 1; #10;

        // Test case 3: A=1, B=0
        A = 1; B = 0; #10;

        // Test case 4: A=1, B=1
        A = 1; B = 1; #10;
        
        $finish;
    end
endmodule