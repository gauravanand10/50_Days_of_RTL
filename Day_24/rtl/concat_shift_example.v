module concat_shift_example(

    input [7:0] data_in,

    output [7:0] shifted_left,
    output [7:0] shifted_right

);

    assign shifted_left = {data_in[6:0],1'b0};

    assign shifted_right = {1'b0,data_in[7:1]};

endmodule
