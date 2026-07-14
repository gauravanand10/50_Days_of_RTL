`timescale 1ns/1ps

module concat_shift_example_tb;

    reg [7:0] data_in;

    wire [7:0] shifted_left;
    wire [7:0] shifted_right;

    concat_shift_example uut(

        .data_in(data_in),
        .shifted_left(shifted_left),
        .shifted_right(shifted_right)

    );

    initial begin

        data_in = 8'b10101010;
        #10;

        data_in = 8'b11001100;
        #10;

        data_in = 8'b11110000;
        #10;

        $finish;

    end

    initial begin

        $monitor("Time=%0t data_in=%b shifted_left=%b shifted_right=%b",
                 $time, data_in, shifted_left, shifted_right);

        $dumpfile("wave.vcd");
        $dumpvars(0, concat_shift_example_tb);

    end

endmodule
