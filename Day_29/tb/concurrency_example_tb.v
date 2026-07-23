`timescale 1ns/1ps

module concurrency_example_tb;

    reg clk;
    reg [7:0] in1;
    reg [7:0] in2;

    wire [15:0] add_out;
    wire [15:0] mul_out;

    concurrency_example uut(

        .clk(clk),
        .in1(in1),
        .in2(in2),
        .add_out(add_out),
        .mul_out(mul_out)

    );

    initial
        clk = 0;

    always #5 clk = ~clk;

    initial begin

        in1 = 0;
        in2 = 0;

        #10;

        in1 = 8'd5;
        in2 = 8'd3;

        #10;

        in1 = 8'd8;
        in2 = 8'd4;

        #10;

        in1 = 8'd10;
        in2 = 8'd6;

        #10;

        in1 = 8'd15;
        in2 = 8'd2;

        #20;

        $finish;

    end

    initial begin

        $monitor("Time=%0t | clk=%b | in1=%0d | in2=%0d | add_out=%0d | mul_out=%0d",
                 $time,
                 clk,
                 in1,
                 in2,
                 add_out,
                 mul_out);

    end

    initial begin

        $dumpfile("wave.vcd");
        $dumpvars(0, concurrency_example_tb);

    end

endmodule
