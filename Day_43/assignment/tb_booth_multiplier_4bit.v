`timescale 1ns/1ps

module tb_booth_multiplier_4bit;

    reg signed [3:0] multiplicand;
    reg signed [3:0] multiplier;

    wire signed [7:0] product;

    booth_multiplier_4bit uut (
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product)
    );

    initial begin
        // GTKWave dump
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_booth_multiplier_4bit);

        $display("---------------------------------------------");
        $display(" Multiplicand  Multiplier   Product");
        $display("---------------------------------------------");

        multiplicand = 4'sd3;
        multiplier   = 4'sd2;
        #10;
        $display("%4d\t\t%4d\t\t%4d", multiplicand, multiplier, product);

        multiplicand = -4'sd3;
        multiplier   = 4'sd2;
        #10;
        $display("%4d\t\t%4d\t\t%4d", multiplicand, multiplier, product);

        multiplicand = 4'sd5;
        multiplier   = -4'sd2;
        #10;
        $display("%4d\t\t%4d\t\t%4d", multiplicand, multiplier, product);

        multiplicand = -4'sd4;
        multiplier   = -4'sd2;
        #10;
        $display("%4d\t\t%4d\t\t%4d", multiplicand, multiplier, product);

        multiplicand = 4'sd7;
        multiplier   = 4'sd7;
        #10;
        $display("%4d\t\t%4d\t\t%4d", multiplicand, multiplier, product);

        multiplicand = -4'sd8;
        multiplier   = 4'sd7;
        #10;
        $display("%4d\t\t%4d\t\t%4d", multiplicand, multiplier, product);

        multiplicand = -4'sd8;
        multiplier   = -4'sd8;
        #10;
        $display("%4d\t\t%4d\t\t%4d", multiplicand, multiplier, product);

        $display("---------------------------------------------");

        $finish;
    end

endmodule
