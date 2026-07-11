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


module sync_counter(

    input clk,
    input reset,

    output [1:0] count

);

wire q0, q1;
wire d1;

d_flip_flop ff0(

    .clk(clk),
    .reset(reset),
    .d(~q0),
    .q(q0)

);

assign d1 = q1 ^ q0;

d_flip_flop ff1(

    .clk(clk),
    .reset(reset),
    .d(d1),
    .q(q1)

);

assign count = {q1,q0};

endmodule
