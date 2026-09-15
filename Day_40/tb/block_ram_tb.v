`timescale 1ns/1ps

module block_ram_tb;

reg clk;
reg we;
reg [7:0] addr;
reg [7:0] din;

wire [7:0] dout;

block_ram uut(
    .clk(clk),
    .we(we),
    .addr(addr),
    .din(din),
    .dout(dout)
);

always #5 clk = ~clk;

initial
begin
    $dumpfile("wave.vcd");
    $dumpvars(0, block_ram_tb);
end

initial
begin

    clk = 0;
    we  = 0;
    addr = 0;
    din = 0;

    #10;

    we = 1;

    addr = 8'd0; din = 8'd10; #10;
    addr = 8'd1; din = 8'd20; #10;
    addr = 8'd2; din = 8'd30; #10;
    addr = 8'd3; din = 8'd40; #10;

    we = 0;

    addr = 8'd0; #10;
    addr = 8'd1; #10;
    addr = 8'd2; #10;
    addr = 8'd3; #10;

    #20;

    $finish;

end

endmodule
