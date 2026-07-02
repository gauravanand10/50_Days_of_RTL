`timescale 1ns/1ps

module comb_seq_multiplier_tb;

    reg [1:0] a;
    reg [1:0] b;

    reg clk;
    reg rst;

    wire [3:0] comb_product;
    wire [3:0] seq_product;

    comb_seq_multiplier uut(

        .a(a),
        .b(b),
        .clk(clk),
        .rst(rst),
        .comb_product(comb_product),
        .seq_product(seq_product)

    );

    always #5 clk = ~clk;

    initial begin

        clk = 0;
        rst = 1;

        a = 2'b00;
        b = 2'b00;

        #10;
        rst = 0;

        a = 2'b01; b = 2'b10; #10;   // 1 × 2 = 2
        a = 2'b10; b = 2'b10; #10;   // 2 × 2 = 4
        a = 2'b11; b = 2'b01; #10;   // 3 × 1 = 3
        a = 2'b11; b = 2'b11; #10;   // 3 × 3 = 9

        $finish;

    end

    initial begin

        $monitor("Time=%0t A=%d B=%d Comb=%d Seq=%d",
                 $time, a, b, comb_product, seq_product);

        $dumpfile("wave.vcd");
        $dumpvars(0, comb_seq_multiplier_tb);

    end

endmodule
