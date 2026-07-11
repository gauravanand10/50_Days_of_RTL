module d_flip_flop(

    input clk,
    input reset,
    input d,

    output reg q

);

always @(posedge clk or posedge reset) begin

    if(reset)
        q <= 0;
    else
        q <= d;

end

endmodule


module async_counter(

    input clk,
    input reset,

    output [1:0] count

);

wire q0, q1;

d_flip_flop ff0(

    .clk(clk),
    .reset(reset),
    .d(~q0),
    .q(q0)

);

d_flip_flop ff1(

    .clk(~q0),
    .reset(reset),
    .d(~q1),
    .q(q1)

);

assign count = {q1,q0};

endmodule
