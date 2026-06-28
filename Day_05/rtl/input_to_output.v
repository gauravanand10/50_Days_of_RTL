`timescale 1ns/1ps

module input_to_output(
	input wire a_in,
	output reg b_out
);
  
  always@(*)
  begin

	b_out = a_in ;
end
endmodule
