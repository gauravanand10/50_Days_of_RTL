`timescale 1ns/1ps

module clock_divider_400khz_tb;

reg clk_in;
reg reset;
wire clk_out;

clock_divider_400khz uut
(
    .clk_in(clk_in),
    .reset(reset),
    .clk_out(clk_out)
);

initial
begin
    clk_in = 0;
    forever #10 clk_in = ~clk_in;
end

initial
begin
    reset = 1;
    #40;
    reset = 0;

    #3000;

    $finish;
end

initial
begin
    $dumpfile("wave.vcd");
    $dumpvars(0, clock_divider_400khz_tb);
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
