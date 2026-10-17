module top_module(

    input clk,
    input reset,
    input enable,

    input [3:0] data,

    output [3:0] count,
    output [3:0] decoded,
    output [7:0] result

);

counter c1(

    .clk(clk),
    .reset(reset),
    .enable(enable),
    .count(count)

);

decoder d1(

    .data(data),
    .decoded(decoded)

);

arithmetic_unit a1(

    .a(count),
    .b(data),
    .result(result)

);

endmodule
