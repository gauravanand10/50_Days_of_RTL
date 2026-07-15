`timescale 1ns/1ps

module lfsr_tb;

    reg clk;
    reg reset;

    wire [3:0] lfsr_out;

    lfsr uut(

        .clk(clk),
        .reset(reset),
        .lfsr_out(lfsr_out)

    );

    initial
        clk = 0;

    always #5 clk = ~clk;

    initial begin

        reset = 1;
        #10;

        reset = 0;

        #150;

        $finish;

    end

    initial begin

        $monitor("Time=%0t clk=%b reset=%b lfsr_out=%b",
                  $time, clk, reset, lfsr_out);

    end

    initial begin

        $dumpfile("wave.vcd");
        $dumpvars(0, lfsr_tb);

    end

endmodule
