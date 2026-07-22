`timescale 1ns/1ps

module pipeline_assignment_tb;

    reg clk;
    reg reset;

    reg [15:0] a;
    reg [15:0] b;
    reg [15:0] c;
    reg [15:0] d;

    wire [15:0] result;

    pipeline_assignment uut(

        .clk(clk),
        .reset(reset),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .result(result)

    );

    initial
        clk = 0;

    always #5 clk = ~clk;

    initial begin

        reset = 1;
        a = 0;
        b = 0;
        c = 0;
        d = 0;

        #10 reset = 0;

        a = 5; b = 3; c = 2; d = 4;
        #10;

        a = 6; b = 2; c = 3; d = 5;
        #10;

        a = 4; b = 1; c = 4; d = 2;
        #10;

        a = 7; b = 5; c = 2; d = 6;
        #10;

        #50;

        $finish;

    end

    initial begin

        $monitor("Time=%0t | a=%0d b=%0d c=%0d d=%0d | stage1=%0d | stage2=%0d | stage3=%0d | result=%0d",
                 $time,
                 a,
                 b,
                 c,
                 d,
                 uut.stage1_reg,
                 uut.stage2_reg,
                 uut.stage3_reg,
                 result);

    end

    initial begin

        $dumpfile("wave.vcd");
        $dumpvars(0,pipeline_assignment_tb);

    end

endmodule
