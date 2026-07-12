`timescale 1ns/1ps

module johnson_counter_tb;

    reg clk;
    reg rst;

    wire [3:0] count;

    johnson_counter uut(

        .clk(clk),
        .rst(rst),
        .count(count)

    );

    initial
        clk = 0;

    always #5
        clk = ~clk;

    initial begin

        rst = 1;

        #10 rst = 0;

        #100;

        $finish;

    end

    initial begin

        $monitor("Time=%0t clk=%b rst=%b count=%b",
                  $time, clk, rst, count);

        $dumpfile("wave.vcd");
        $dumpvars(0, johnson_counter_tb);

    end

endmodule
