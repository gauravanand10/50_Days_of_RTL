`timescale 1ns/1ps

module half_adder_tb;


reg a_in;
reg b_in;

wire sum_out;
wire carry_out;

half_adder dut(
	.a_in(a_in),
	.b_in(b_in),
	.sum_out(sum_out),
	.carry_out(carry_out)
);

initial begin
 
	$dumpfile("wave.vcd");
        $dumpvars(0, half_adder_tb);	
		
	a_in = 0; b_in = 0;
	#10;

	a_in = 0; b_in = 1;
        #10;

	a_in = 1; b_in = 0;
        #10;

	a_in = 1; b_in = 1;
        #10;

	$finish;
end 
endmodule
