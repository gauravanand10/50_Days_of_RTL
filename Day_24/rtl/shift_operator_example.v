module shift_operator_example(

    input [7:0] data_in,
    input [2:0] shift_amt,

    output [7:0] shifted_outl,
    output [7:0] shifted_outr

);

    assign shifted_outl = data_in << 1;

    assign shifted_outr = data_in >> 1;

endmodule
