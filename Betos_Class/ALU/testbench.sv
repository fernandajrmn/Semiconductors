`timescale 1ns/1ps

package paquetito;
typedef enum logic [1:0]
{
  sum = 2'b00,
  substraction = 2'b01,
  product = 2'b10,
  division = 2'b11
} OP_Code;

endpackage


import paquetito::*;
module ALU_tb;
  parameter int width = 8;
  logic [width-1:0] a;
  logic [width-1:0] b;
  OP_Code opcode;   // <-- aquí usas el tipo que creaste en el package
  logic [(width*2)-1:0] result;
  logic div_error;
  logic zero;

  ALU dut(.*);

  initial
    begin
    $dumpfile("dump.vcd");
    $dumpvars(0, ALU_tb);
    end


  initial
    begin
      $monitor("Tiempo = %0t ns | op =%s | a = %d | b = %d | result = %d | error = %b | zero = %b", $time,opcode,a,b,result,div_error,zero);

//      opcode =2'b00;
//			for(int i=0; i<4;i++)
//				begin
//					#10;
//					a = 2'b01; b = 2'b01;
//					opcode = opcode + 2'b01;
//				end 
//
//
			opcode = sum;  a = 8'd20; b= 8'd15; #10;
			opcode = substraction;  a = 8'd15; b= 8'd20; #10;
			opcode = product;  a = 8'd20; b= 8'd15; #10;
			opcode = division; a = 8'd20; b= 8'd15; #10;
			opcode = division;  a = 8'd20; b= 8'd0; #10;
			opcode = sum;          a = 255; b = 255; #10; 
			opcode = substraction; a = 255;  b = 250;  #10; 
			opcode = product;      a = 255; b = 255; #10; 
			opcode = division;     a = 0;   b = 20;  #10; 

      $finish; //este para la ejecucion de la simulacion
    end

endmodule

