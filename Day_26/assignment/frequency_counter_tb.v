`timescale 1ns/1ps

module frequency_counter_tb;

    reg fast_clk;
    reg slow_signal;
    reg rst;

    wire [7:0] pulse_count;

    frequency_counter uut(

        .fast_clk(fast_clk),
        .slow_signal(slow_signal),
        .rst(rst),
        .pulse_count(pulse_count)

    );

    initial
        fast_clk = 0;

    always #5 fast_clk = ~fast_clk;


    initial
        slow_signal = 0;

    always #16.67 slow_signal = ~slow_signal;


    initial begin

        rst = 1;

        #20 rst = 0;

        #250;

        $finish;

    end

    initial begin

        $monitor("Time=%0t fast_clk=%b slow_signal=%b pulse_count=%0d",
                 $time, fast_clk, slow_signal, pulse_count);

        $dumpfile("wave.vcd");
        $dumpvars(0, frequency_counter_tb);

    end

endmodule
