import paquetito::*;

module ALU #(parameter int width=8) (
	input logic [(width-1):0]a,
	input logic [(width-1):0]b,
	input OP_Code opcode,
	output logic [(width*2)-1:0]result,
	output logic div_error,
	output logic zero
);




function automatic logic [((width*2)-1):0] suma(input logic [width-1:0]a, input logic [width-1:0]b);
	return {{(width){1'b0}},a}+{{(width){1'b0}},b};
endfunction

function automatic logic [((width*2)-1):0] resta(input logic [width-1:0]a, input logic [width-1:0]b);
	return {{(width){1'b0}},a}-{{(width){1'b0}},b};
endfunction


function automatic logic [(width*2)-1:0] multiplicacion(input logic [width-1:0]a, input logic [width-1:0]b);
	return {{(width){1'b0}},a}*{{(width){1'b0}},b};
endfunction

function automatic logic [(width*2)-1:0] div(input logic [width-1:0]a, input logic [width-1:0]b, output logic error);
	if (b == 0) 
		begin
			error = 1;
			return 1'bx;
		end
	else 
		begin
			error =0;
			return {{(width){1'b0}},(a/b)};
		end
endfunction


always_comb
	begin
		case(opcode)
			sum:
				begin 
					result = suma(a,b);
					div_error = 0;
				end
			substraction:
				begin
					result = resta(a,b);
					div_error = 0;
				end
			product:
				begin
					result = multiplicacion(a,b);
					div_error = 0;
				end
			division:
				begin
					result = div(a,b,div_error);
				end
			default:
				begin
					result = 16'b0000000000000000;
					div_error = 0;

				end


		endcase	
	end

assign zero = (result == 16'b0);

endmodule

