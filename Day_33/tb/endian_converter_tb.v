`timescale 1ns/1ps

module endian_converter_tb;

reg [31:0] data_in;
reg convert;
wire [31:0] data_out;

endian_converter uut
(
    .data_in(data_in),
    .convert(convert),
    .data_out(data_out)
);

initial
begin
    $dumpfile("wave.vcd");
    $dumpvars(0,endian_converter_tb);
end

initial
begin
    $display("Time\tConvert\tInput\t\tOutput");
    $monitor("%0t\t%b\t%h\t%h",
             $time,
             convert,
             data_in,
             data_out);

    data_in = 32'h12345678;
    convert = 0;
    #10;

    convert = 1;
    #10;

    data_in = 32'hAABBCCDD;
    convert = 0;
    #10;

    convert = 1;
    #10;

    data_in = 32'hDEADBEEF;
    convert = 0;
    #10;

    convert = 1;
    #10;

    $finish;
end

endmodule
