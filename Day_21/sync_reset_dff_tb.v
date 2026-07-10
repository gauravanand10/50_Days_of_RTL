`timescale 1ns/1ps

module sync_reset_dff_tb;

    reg clk;
    reg rst;

    wire q;

    sync_reset_dff uut(

        .clk(clk),
        .rst(rst),
        .q(q)

    );

    initial
        clk = 0;

    always #5
        clk = ~clk;

    initial begin

        rst = 1;

        #15 rst = 0;

        #30 rst = 1;

        #10 rst = 0;

        #30 rst = 1;

        #10 rst = 0;

        #20 $finish;

    end

    initial begin

        $monitor("Time=%0t clk=%b rst=%b d=%b q=%b",
                 $time, clk, rst, uut.d, q);

        $dumpfile("wave.vcd");
        $dumpvars(0, sync_reset_dff_tb);

    end

endmodule
