`timescale 1ns/1ps

module register_tb;

    reg clk;
    reg [3:0] data_in;

    wire [3:0] data_out;

    register uut(

        .clk(clk),
        .data_in(data_in),
        .data_out(data_out)

    );

    always #5 clk = ~clk;

    initial begin

        clk = 0;

        data_in = 4'b0001; #10;
        data_in = 4'b0010; #10;
        data_in = 4'b0100; #10;
        data_in = 4'b1000; #10;

        #10;

        $finish;

    end

    initial begin

        $monitor("Time=%0t Data_In=%b Data_Out=%b",

                 $time,

                 data_in,

                 data_out);

        $dumpfile("wave.vcd");

        $dumpvars(0, register_tb);

    end

endmodule
