`timescale 1ns/1ps

module top_ram_tb;

reg clk;
reg wr;
reg oe;
reg [7:0] addr;
reg [15:0] din;

wire [15:0] dout;

top_ram uut(
    .clk(clk),
    .wr(wr),
    .oe(oe),
    .addr(addr),
    .din(din),
    .dout(dout)
);

always #5 clk = ~clk;

initial
begin
    $dumpfile("wave.vcd");
    $dumpvars(0,top_ram_tb);
end

initial
begin

    clk = 0;
    wr  = 0;
    oe  = 0;
    addr = 0;
    din  = 0;

    #10;

    wr = 1;
    oe = 0;

    addr = 8'd0;
    din  = 16'h1111;
    #10;

    addr = 8'd1;
    din  = 16'h2222;
    #10;

    addr = 8'd2;
    din  = 16'h3333;
    #10;

    addr = 8'd3;
    din  = 16'h4444;
    #10;

    wr = 0;
    oe = 1;

    addr = 8'd0;
    #10;

    addr = 8'd1;
    #10;

    addr = 8'd2;
    #10;

    addr = 8'd3;
    #10;

    oe = 0;

    #20;

    $finish;

end

endmodule
