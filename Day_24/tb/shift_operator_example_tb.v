`timescale 1ns/1ps

module shift_operator_example_tb;

    reg [7:0] data_in;
    reg [2:0] shift_amt;

    wire [7:0] shifted_outl;
    wire [7:0] shifted_outr;

    shift_operator_example uut(

        .data_in(data_in),
        .shift_amt(shift_amt),
        .shifted_outl(shifted_outl),
        .shifted_outr(shifted_outr)

    );

    initial begin

        data_in = 8'b10101010;
        shift_amt = 3;
        #10;

        data_in = 8'b11001100;
        shift_amt = 1;
        #10;

        data_in = 8'b11110000;
        shift_amt = 0;
        #10;

        $finish;

    end

    initial begin

        $monitor("Time=%0t data_in=%b shift_amt=%d shifted_left=%b shifted_right=%b",
                 $time, data_in, shift_amt, shifted_outl, shifted_outr);

        $dumpfile("wave.vcd");
        $dumpvars(0, shift_operator_example_tb);

    end

endmodule
