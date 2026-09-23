`timescale 1ns/1ps

module tb_multiplier_4bit;

    reg  [3:0] a;
    reg  [3:0] b;
    wire [7:0] product;

    multiplier_4bit uut (
        .a(a),
        .b(b),
        .product(product)
    );

    initial begin

        // Generate GTKWave file
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_multiplier_4bit);

        $display("--------------------------------");
        $display("   A    B    Product");
        $display("--------------------------------");

        a = 4'd2;  b = 4'd3;  #10;
        $display("%2d   %2d     %2d", a, b, product);

        a = 4'd5;  b = 4'd4;  #10;
        $display("%2d   %2d     %2d", a, b, product);

        a = 4'd7;  b = 4'd6;  #10;
        $display("%2d   %2d     %2d", a, b, product);

        a = 4'd10; b = 4'd5;  #10;
        $display("%2d   %2d     %2d", a, b, product);

        a = 4'd15; b = 4'd15; #10;
        $display("%2d   %2d     %3d", a, b, product);

        $display("--------------------------------");

        $finish;

    end

endmodule
