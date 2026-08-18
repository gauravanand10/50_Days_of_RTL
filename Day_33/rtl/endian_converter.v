module endian_converter(
    input  [31:0] data_in,
    input         convert,
    output [31:0] data_out
);

assign data_out = convert ?
                  {data_in[7:0],
                   data_in[15:8],
                   data_in[23:16],
                   data_in[31:24]}
                  : data_in;

endmodule
