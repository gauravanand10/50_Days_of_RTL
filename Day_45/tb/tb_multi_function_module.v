`timescale 1ns/1ps

module tb_multi_function_module;

reg clk;
reg reset;
reg enable;
reg [3:0] data_in;

wire [3:0] count;
wire [3:0] decoded;
wire [7:0] result;

multi_function_module uut(
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .data_in(data_in),
    .count(count),
    .decoded(decoded),
    .result(result)
);

// Clock Generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    // GTKWave
    $dumpfile("wave.vcd");
    $dumpvars(0, tb_multi_function_module);

    $display("-------------------------------------------------------------");
    $display(" Time  Count  Data_In  Decoded  Result");
    $display("-------------------------------------------------------------");

    reset  = 1;
    enable = 0;
    data_in = 4'b0001;

    #10;
    reset = 0;
    enable = 1;

    data_in = 4'b0001; #10;
    data_in = 4'b0010; #10;
    data_in = 4'b0100; #10;
    data_in = 4'b1000; #10;
    data_in = 4'b0110; #10;
    data_in = 4'b0001; #10;
    data_in = 4'b0010; #10;

    enable = 0;

    #20;

    $finish;

end

initial begin
    $monitor("%4t    %2d      %b     %b      %3d",
             $time, count, data_in, decoded, result);
end

endmodule
