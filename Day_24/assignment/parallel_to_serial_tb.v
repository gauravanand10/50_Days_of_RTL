`timescale 1ns/1ps

module parallel_to_serial_tb;

    reg clk;
    reg rst;
    reg load;
    reg [3:0] parallel_in;

    wire serial_out;

    parallel_to_serial uut(

        .clk(clk),
        .rst(rst),
        .load(load),
        .parallel_in(parallel_in),
        .serial_out(serial_out)

    );

    initial
        clk = 0;

    always #5 clk = ~clk;

    initial begin

        rst = 1;
        load = 0;
        parallel_in = 4'b0000;

        #10;
        rst = 0;

        load = 1;
        parallel_in = 4'b1011;

        #10;
        load = 0;

        #50;

        load = 1;
        parallel_in = 4'b1100;

        #10;
        load = 0;

        #50;

        $finish;

    end

    initial begin

        $monitor("Time=%0t clk=%b rst=%b load=%b parallel_in=%b shift_reg=%b serial_out=%b",

                 $time,
                 clk,
                 rst,
                 load,
                 parallel_in,
                 uut.shift_reg,
                 serial_out);

        $dumpfile("wave.vcd");
        $dumpvars(0, parallel_to_serial_tb);

    end

endmodule
