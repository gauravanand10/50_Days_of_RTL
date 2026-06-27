module binary_to_gray
#(
	parameter N = 4
)
(
	input  [N-1:0] binary_in,
	output [N-1:0] gray_out
);

	assign gray_out[3] = binary_in[3];
	assign gray_out[2] = binary_in[3] ^ binary_in[2];
        assign gray_out[1] = binary_in[2] ^ binary_in[1];
        assign gray_out[0] = binary_in[1] ^ binary_in[0];
        
endmodule
