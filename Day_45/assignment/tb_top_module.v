`timescale 1ns/1ps

module tb_top_module;

reg clk;
reg reset;
reg enable;
reg [3:0] data;

wire [3:0] count;
wire [3:0] decoded;
wire [7:0] result;

top_module uut(

    .clk(clk),
    .reset(reset),
    .enable(enable),
    .data(data),

    .count(count),
    .decoded(decoded),
    .result(result)

);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    $dumpfile("wave.vcd");
    $dumpvars(0,tb_top_module);

    reset = 1;
    enable = 0;
    data = 0;

    #10;

    reset = 0;
    enable = 1;

    data = 1; #10;
    data = 2; #10;
    data = 3; #10;
    data = 4; #10;
    data = 5; #10;
    data = 6; #10;

    enable = 0;

    #20;

    $finish;

end

initial
$monitor("Time=%0t Count=%d Data=%d Decoded=%b Result=%d",
          $time,count,data,decoded,result);

endmodule
