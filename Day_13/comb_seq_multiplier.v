module comb_seq_multiplier(

    input  [1:0] a,
    input  [1:0] b,

    input clk,
    input rst,

    output [3:0] comb_product,
    output reg [3:0] seq_product

);

    assign comb_product = a * b;

    always @(posedge clk or posedge rst) begin

        if (rst)
            seq_product <= 4'b0000;

        else
            seq_product <= a * b;

    end

endmodule
