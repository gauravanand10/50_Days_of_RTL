`timescale 1ns/1ps

module fibonacci_tb;

    reg clk;
    reg reset;
    reg start;
    reg [3:0] n;

    wire [31:0] fib;
    wire done;

    fibonacci uut(

        .clk(clk),
        .reset(reset),
        .start(start),
        .n(n),
        .fib(fib),
        .done(done)

    );

    initial
        clk = 0;

    always #5 clk = ~clk;

    initial begin

        $monitor("Time=%0t | start=%b | n=%0d | fib=%0d | done=%b",
                  $time, start, n, fib, done);

    end

    initial begin

        reset = 1;
        start = 0;
        n = 0;

        #10;
        reset = 0;

        n = 5;
        start = 1;

        @(posedge done);

        #10;
        start = 0;

        #20;

        n = 7;
        start = 1;

        @(posedge done);

        #10;
        start = 0;

        #20;

        $finish;

    end

    initial begin

        $dumpfile("wave.vcd");
        $dumpvars(0, fibonacci_tb);

    end

endmodule
