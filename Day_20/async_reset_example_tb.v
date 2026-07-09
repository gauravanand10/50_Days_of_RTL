`timescale 1ns/1ps

module async_reset_example_tb;

    reg clk;
    reg reset;
    reg [7:0] d;

    wire [7:0] q;

    async_reset_example uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    initial
        clk = 0;

    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t clk=%b reset=%b d=%h q=%h",
                  $time, clk, reset, d, q);
    end

    initial begin

        reset = 1;
        d = 8'h00;

        #15 reset = 0;

        #10 d = 8'hAA;

        #10 d = 8'h55;

        #3 reset = 1;

        #7 reset = 0;

        #10 d = 8'hF0;

        #20 $finish;

    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, async_reset_example_tb);
    end

endmodule
