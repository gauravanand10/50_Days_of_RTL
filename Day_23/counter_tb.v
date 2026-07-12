`timescale 1ns/1ps

module counter_tb;

    reg clk;
    reg rst;

    wire [3:0] binary_out;
    wire [3:0] ring_out;

    binary_counter binary(

        .clk(clk),
        .rst(rst),
        .count(binary_out)

    );

    ring_counter ring(

        .clk(clk),
        .rst(rst),
        .count(ring_out)

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

        $monitor("Time=%0t clk=%b rst=%b Binary=%b Ring=%b",
                  $time, clk, rst, binary_out, ring_out);

        $dumpfile("wave.vcd");
        $dumpvars(0, counter_tb);

    end

endmodule
