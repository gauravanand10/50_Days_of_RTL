`timescale 1ns/1ps

module falling_edge_detector_tb;

    reg clk;
    reg signal_in;

    wire edge_detected;

    falling_edge_detector uut(

        .clk(clk),
        .signal_in(signal_in),
        .edge_detected(edge_detected)

    );

    initial
        clk = 0;

    always #5
        clk = ~clk;

    initial begin

        signal_in = 0;

        #12 signal_in = 1;

        #10 signal_in = 0;

        #10 signal_in = 1;

        #10 signal_in = 1;

        #10 signal_in = 0;

        #10 $finish;

    end

    initial begin

        $monitor("Time=%0t clk=%b signal_in=%b edge_detected=%b",
                 $time, clk, signal_in, edge_detected);

        $dumpfile("wave.vcd");
        $dumpvars(0, falling_edge_detector_tb);

    end

endmodule
