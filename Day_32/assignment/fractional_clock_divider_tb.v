`timescale 1ns/1ps

module fractional_clock_divider_tb;

reg clk_in;
reg reset;
wire clk_out;

fractional_clock_divider uut
(
    .clk_in(clk_in),
    .reset(reset),
    .clk_out(clk_out)
);

initial
begin
    clk_in = 0;
    forever #5 clk_in = ~clk_in;
end

initial
begin
    reset = 1;
    #20;
    reset = 0;

    #200;

    $finish;
end

initial
begin
    $dumpfile("wave.vcd");
    $dumpvars(0, fractional_clock_divider_tb);
end

initial
begin
    $display("Time\tReset\tCounter\tclk_out");
    $monitor("%0t\t%b\t%d\t%b",
             $time,
             reset,
             uut.counter,
             clk_out);
end

endmodule
