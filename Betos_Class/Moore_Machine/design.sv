//Structure Definition for State

typedef enum logic [2:0]
{
  s0 = 3'b000,
  s1 = 3'b001,
  s2 = 3'b010,
  s3 = 3'b011,
  s4 = 3'b100
} state_struct;

//Module Dragon Battle
module Dragon_battle(adventure,courage,sword_sharpened,dragon,clock,quest_over,present_state);

  //Inputs
  input logic adventure;
  input logic courage;
  input logic sword_sharpened;
  input logic dragon;
  input logic clock;

  //Outputs
  output state_struct present_state;
  output logic quest_over;
  
  //Declaracion de estructuras de estado 
  state_struct next_state;

  //Bloque para evaluar los estados
  always_comb

  begin

    //Default value

    next_state = present_state;

    case(present_state)

      s0: if (adventure)

        next_state = s1;

      s1: if(sword_sharpened)

        next_state = s2;

      s2: if(courage)

        next_state = dragon ? s3 : s2;

      else

        next_state = s0;

      s3: if (dragon) next_state = s2;

      	else next_state = s4;

      s4: next_state = s4;

      default: next_state = s0;
    endcase
  end
 

  //Bloque para cambiar el estado
  always @(posedge clock) begin
    present_state <= next_state;
  end

  //Bloque para asignar la salida.
   always_comb
     begin
       if (present_state == s4) 
      quest_over = 1;
       else quest_over = 0;
     end 
endmodule
