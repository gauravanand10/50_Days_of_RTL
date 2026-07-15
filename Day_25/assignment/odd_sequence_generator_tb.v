`timescale 1ns/1ps

module odd_sequence_generator_tb;

    reg clk;
    reg rst;

    wire [3:0] seq;

    odd_sequence_generator uut(

        .clk(clk),
        .rst(rst),
        .seq(seq)

    );

    initial
        clk = 0;

    always #5
        clk = ~clk;

    initial begin

        rst = 1;

        #10;
        rst = 0;

        #120;

        rst = 1;

        #10;
        rst = 0;

        #60;

        $finish;

    end

    initial begin

        $monitor("Time=%0t clk=%b rst=%b seq=%d (%b)",
                  $time, clk, rst, seq, seq);

        $dumpfile("wave.vcd");
        $dumpvars(0, odd_sequence_generator_tb);

    end

endmodule
