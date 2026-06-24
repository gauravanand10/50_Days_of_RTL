`timescale 1ns/1ps

module integer_loop_tb;

    reg clk;
    reg rst;

    integer_loop dut (
        .clk(clk),
        .rst(rst)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;

        #20;
        rst = 0;

        #20;

        $finish;
    end

        // Monitor Counter Value
        initial begin
        $monitor("Time=%0t rst=%b clk=%b mem0=%0d mem1=%0d mem2=%0d mem3=%0d",
                  $time, rst, clk,
                  dut.mem[0], dut.mem[1], dut.mem[2], dut.mem[3]);
                  
	      // Generate waveform file for GTKWave
        $dumpfile("wave.vcd");
        $dumpvars(0, integer_loop_tb);

end
endmodule
