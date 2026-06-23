`timescale 1ns/1ps

module dff_tb ;

	reg clk;
	reg rst;
	reg d;
	
	wire q;

	dff dut(
	.clk(clk),
	.rst(rst),
	.d(d),
	.q(q)
);
      always #5 clk = ~clk
      ;initial begin
	
	    // Generate waveform file for GTKWave
    	$dumpfile("wave.vcd");
    	$dumpvars(0, dff_tb);

        // Monitor signals in terminal
      $monitor("Time=%0t clk=%b rst=%b d=%b q=%b",
         $time, clk, rst, d, q);

    	clk = 0;
    	rst = 1;
    	d   = 0;

    	#10 rst = 0;

    	d = 1; #10;
    	d = 0; #10;
    	d = 1; #10;

	

	$finish;
        
end
endmodule
