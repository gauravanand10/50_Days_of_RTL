`timescale 1ns/1ps

module adder_tb;

    reg clk;
    reg [3:0] a;
    reg [3:0] b;

    wire [4:0] sum_continuous;
    wire [4:0] sum_blocking;
    wire [4:0] sum_non_blocking;

    // Continuous Adder
    adder_continuous uut1(
        .a(a),
        .b(b),
        .sum(sum_continuous)
    );

    // Blocking Adder
    adder_blocking uut2(
        .a(a),
        .b(b),
        .sum(sum_blocking)
    );

    // Non-Blocking Adder
    adder_non_blocking uut3(
        .clk(clk),
        .a(a),
        .b(b),
        .sum(sum_non_blocking)
    );

    // Clock Generation
    always #5 clk = ~clk;

    initial begin

        clk = 0;

        a = 4'd0;  b = 4'd0;  #10;
        a = 4'd2;  b = 4'd3;  #10;
        a = 4'd5;  b = 4'd4;  #10;
        a = 4'd7;  b = 4'd8;  #10;
        a = 4'd9;  b = 4'd6;  #10;
        a = 4'd15; b = 4'd15; #10;

        $finish;

    end

    initial begin

        $monitor("Time=%0t A=%d B=%d Continuous=%d Blocking=%d NonBlocking=%d",
                  $time, a, b,
                  sum_continuous,
                  sum_blocking,
                  sum_non_blocking);

        $dumpfile("wave.vcd");
        $dumpvars(0, adder_tb);

    end

endmodule
