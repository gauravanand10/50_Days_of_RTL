`timescale 1ns/1ps

module tb_slicer_32bit;

    reg clk;
    reg [31:0] data_in;
    wire [3:0] data_out;

    slicer_32bit uut (
        .clk(clk),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock Generation (10 ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin

        // GTKWave dump
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_slicer_32bit);

        $display("--------------------------------------------");
        $display("      Data In             Data Out");
        $display("--------------------------------------------");

        data_in = 32'hA5A5_FF0A;
        #10;
        $display("%h\t %h", data_in, data_out);

        data_in = 32'h1234_5678;
        #10;
        $display("%h\t %h", data_in, data_out);

        data_in = 32'hFFFF_FFFF;
        #10;
        $display("%h\t %h", data_in, data_out);

        data_in = 32'h0000_0005;
        #10;
        $display("%h\t %h", data_in, data_out);

        data_in = 32'h8765_4321;
        #10;
        $display("%h\t %h", data_in, data_out);

        $display("--------------------------------------------");

        $finish;
    end

endmodule
