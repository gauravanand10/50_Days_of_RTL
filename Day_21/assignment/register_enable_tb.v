`timescale 1ns/1ps

module register_enable_tb;

    reg clk;
    reg en;
    reg [7:0] d;

    wire [7:0] q;

    register_enable uut(

        .clk(clk),
        .en(en),
        .d(d),
        .q(q)

    );

    initial
        clk = 0;

    always #5
        clk = ~clk;

    initial begin

        en = 0;
        d = 8'h00;

        #10 d = 8'hAA;

        #10 en = 1;

        #10 d = 8'h55;

        #10 en = 0;

        #10 d = 8'hF0;

        #10 en = 1;

        #10 d = 8'h0F;

        #20 $finish;

    end

    initial begin

        $monitor("Time=%0t clk=%b en=%b d=%h q=%h",
                 $time, clk, en, d, q);

        $dumpfile("wave.vcd");
        $dumpvars(0, register_enable_tb);

    end

endmodule
