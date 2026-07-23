module concurrency_example(

    input clk,
    input [7:0] in1,
    input [7:0] in2,

    output reg [15:0] add_out,
    output reg [15:0] mul_out

);

    always @(posedge clk) begin
        add_out <= in1 + in2;
    end

    always @(posedge clk) begin
        mul_out <= in1 * in2;
    end

endmodule
