//Structure Definition for State

typedef enum logic [1:0]

{

  s0 = 2'b00,

  s1 = 2'b01,

  s2 = 2'b10,

  s3 = 2'b11

} state_struct;







//Module Tabaco Machine



module Tabaco_machine(coin,clock,reset,tabaco,cambio,present_state,next_state);

  //Input

  input logic[1:0] coin;

  input logic clock;

  input logic reset;

  

  

  //Outputs

  output logic tabaco;

  output logic[1:0] cambio;

  output state_struct present_state;

  output state_struct next_state;

	

  

  //Declaracion de estructuras de estado 

  state_struct next_state;

  

  

  //Bloque para evaluar los estados

  always_comb

  begin

    //Default value

    next_state = present_state;

    cambio = 2'b00;

    tabaco = 0;

    //Estado 0 = 0

    case(present_state)

      s0: if (coin == 2'b00) begin

        next_state = s0;

        tabaco = 0;

        cambio = 2'b00;

      end

      else if (coin == 2'b01) begin

        next_state = s1;

        tabaco = 0;

        cambio = 2'b00;

      end

      else if (coin == 2'b10) begin

        next_state = s2;

        tabaco = 0;

        cambio = 2'b00;

      end

      else if (coin == 2'b11) begin

        next_state = s0;

        tabaco = 1;

        cambio = 2'b00;

      end

      

     //Estado 1 = 25 

      s1: if (coin == 2'b00) begin

        next_state = s1;

        tabaco = 0;

        cambio = 2'b00;

      end

      else if (coin == 2'b01) begin

        next_state = s2;

        tabaco = 0;

        cambio = 2'b00;

      end

      else if (coin == 2'b10) begin

        next_state = s3;

        tabaco = 0;

        cambio = 2'b00;

      end

      else if (coin == 2'b11) begin

        next_state = s0;

        tabaco = 1;

        cambio = 2'b01;

      end

      //Estado 2 = 50

      s2: if (coin == 2'b00) begin

        next_state = s2;

        tabaco = 0;

        cambio = 2'b00;

      end

      else if (coin == 2'b01) begin

        next_state = s3;

        tabaco = 0;

        cambio = 2'b00;

      end

      else if (coin == 2'b10) begin

        next_state = s0;

        tabaco = 1;

        cambio = 2'b00;

      end

      else if (coin == 2'b11) begin

        next_state = s0;

        tabaco = 1;

        cambio = 2'b10;

      end

      //Estado 3 = 75

      s3: if (coin == 2'b00) begin

        next_state = s3;

        tabaco = 0;

        cambio = 2'b00;

      end

      else if (coin == 2'b01) begin

        next_state = s0;

        tabaco = 1;

        cambio = 2'b00;

      end

      else if (coin == 2'b10) begin

        next_state = s0;

        tabaco = 1;

        cambio = 2'b01;

      end

      else if (coin == 2'b11) begin

        next_state = s0;

        tabaco = 1;

        cambio = 2'b11;

      end

      //Default = S0 = 0

      default: next_state = s0;

    endcase

  end

  

  

  //Bloque para cambiar el estado

  always @(posedge clock) begin 

    if (reset) 

      present_state <= s0;

    else 

    present_state <= next_state;

    

  end

  

  

endmodule






