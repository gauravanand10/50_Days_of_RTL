`timescale 1ns/1ps

module crc_generator_tb;

reg clk;
reg reset;
reg data_in;

wire [2:0] crc;

crc_generator uut(
    .clk(clk),
    .reset(reset),
    .data_in(data_in),
    .crc(crc)
);

always #5 clk = ~clk;

initial
begin
    $dumpfile("wave.vcd");
    $dumpvars(0, crc_generator_tb);
end

initial
begin
    clk = 0;
    reset = 1;
    data_in = 0;

    #10 reset = 0;

    data_in = 1; #10;
    data_in = 0; #10;
    data_in = 1; #10;
    data_in = 1; #10;
    data_in = 0; #10;
    data_in = 0; #10;
    data_in = 1; #10;
    data_in = 0; #10;

    #20;

    $finish;
end

endmodule
