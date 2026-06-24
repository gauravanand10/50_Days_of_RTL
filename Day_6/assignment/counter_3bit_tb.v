`timescale 1ns/1ps

module counter_3bit_tb;

    reg clk;
    reg rst;

    counter_3bit dut (
        .clk(clk),
        .rst(rst)
        );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;

        #20;
        rst = 0;
        #100;

        $finish;
    end

    initial begin
        $monitor("Time=%0t rst=%b clk=%b counter=%0d",
                  $time, rst, clk, dut.counter);

        $dumpfile("wave.vcd");
        $dumpvars(0, counter_3bit_tb);

end
endmodule
