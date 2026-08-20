module parity(
    input  [7:0] data,
    input        parity_bit,
    output       generated_parity,
    output       error
);

assign generated_parity = ^data;

assign error = ^{data, parity_bit};

endmodule
