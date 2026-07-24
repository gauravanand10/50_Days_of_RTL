`timescale 1ns/1ps

module clock_divider_by_3_tb;

reg clk_in;
reg reset;
wire clk_out;

clock_divider_by_3 uut(
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

    #150;
    $finish;
end

initial
begin
    $dumpfile("wave.vcd");
    $dumpvars(0, clock_divider_by_3_tb);
end

initial
begin
    $display("Time\tReset\tCounter\tclk_in\tclk_out");
    $monitor("%0t\t%b\t%d\t%b\t%b",
             $time,
             reset,
             uut.counter,
             clk_in,
             clk_out);
end

endmodule
