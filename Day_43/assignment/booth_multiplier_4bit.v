module booth_multiplier_4bit(
    input  signed [3:0] multiplicand,
    input  signed [3:0] multiplier,
    output reg signed [7:0] product
);

always @(*) begin
    product = multiplicand * multiplier;
end

endmodule
