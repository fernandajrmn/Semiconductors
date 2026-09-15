// Code your testbench here

// or browse Examples

`timescale 1ns/1ps





module Tabaco_machine_tb;

  

  logic [1:0]coin;

  logic clock;

  logic reset;

  logic tabaco;

  logic [1:0]cambio;

  logic [1:0]present_state;

  logic [1:0]next_state;

  

  //Instanciacion: Llamar al modulo que vamos a probar con el testbench

  Tabaco_machine dut(.*); 

  

  initial clock = 0;

  always #5 clock = ~clock;

  //(.*) -> al hacer esto las variables se cargan automaticamente porque se 

  //llaman igual/*

  

  //Generate waveform dump

  initial

    begin

    $dumpfile("dump.vcd");

    $dumpvars(0, Tabaco_machine_tb);

    end

    

  

  initial

    begin

      //Fcn que imprime cada que hay un cambio en las senales o parametros 

      $monitor("Tiempo = %0t ps | coin = %d, tabaco = %b | cambio = %d | clock = %b | reset = %b | State -> %d | | NextState -> %d", $time,coin,tabaco,cambio,clock,reset,present_state,next_state);

      

//       //S0 -> Chido

        coin = 2'b00; reset = 1; #10

        coin = 2'b01; reset = 0; #10;

        coin = 2'b01; reset = 0; #10;

        coin = 2'b01; reset = 0; #10;

        coin = 2'b01; reset = 0; #10;

      $finish; //este para la ejecucion de la simulacion

    

    end
endmodule

