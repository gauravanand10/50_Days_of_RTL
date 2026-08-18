module handshake_glue_logic(
    input  [7:0] data_in,
    input        valid,
    input        ready,

    output [7:0] data_out,
    output       transfer
);

assign transfer = valid & ready;

assign data_out = transfer ? data_in : 8'b00000000;

endmodule
