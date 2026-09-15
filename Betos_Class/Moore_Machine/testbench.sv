// Code your testbench here

// or browse Examples

`timescale 1ns/1ps

module Dragon_battle_tb;

  

  logic adventure;

  logic courage;

  logic sword_sharpened;

  logic dragon;

  logic clock;

  logic quest_over;

  logic [2:0]present_state;

  

  //Instanciacion: Llamar al modulo que vamos a probar con el testbench

  Dragon_battle dut(.*); 

  

  initial clock = 0;

  always #5 clock = ~clock;

  //(.*) -> al hacer esto las variables se cargan automaticamente porque se 

  //llaman igual/*

  

  //Generate waveform dump

  initial

    begin

    $dumpfile("dump.vcd");

    $dumpvars(0, Dragon_battle_tb);

    end
 

  initial

    begin

      //Fcn que imprime cada que hay un cambio en las senales o parametros 

      $monitor("Tiempo = %0t ns | adventure = %b, courage = %b | sword_sharpened = %b | dragon = %b | | clock = %b | quest_over = %b, | State -> %b", $time,adventure,courage,sword_sharpened,dragon,clock,quest_over,present_state);

      

      //Tabla de verdad de la OR_Gate

      adventure=0; courage=0; sword_sharpened=0; dragon=0; #10; //# -> Sirve para indicar tiempo 

      adventure=1; courage=0; sword_sharpened=0; dragon=0; #10; //S1

      adventure=1; courage=0; sword_sharpened=1; dragon=0; #10; //S2

      adventure=1; courage=1; sword_sharpened=1; dragon=0; #10; //S2

      adventure=1; courage=0; sword_sharpened=1; dragon=0; #10; //S0

      adventure=1; courage=1; sword_sharpened=1; dragon=1; #10;//S3

      adventure=1; courage=1; sword_sharpened=1; dragon=0; #15;//S4

      $finish; //este para la ejecucion de la simulacion
    end
endmodule

