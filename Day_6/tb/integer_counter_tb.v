`timescale 1ns/1ps

module counter_tb;

	reg clk;
	reg rst;

	counter uut (
		.clk(clk),
		.rst(rst)
);

	always #5 clk = ~clk;
	
	initial begin 
		clk = 0; rst = 1;
		
		#20;
		rst = 0;
		
		#3000;
		
		$finish;
	end
	
        // Monitor Counter Value
        initial begin
        $monitor("Time=%0t rst=%b clk=%b counter=%0d",
                  $time, rst, clk, uut.counter);
                  
	// Generate waveform file for GTKWave
    	$dumpfile("wave.vcd");
    	$dumpvars(0, counter_tb);

end
endmodule
