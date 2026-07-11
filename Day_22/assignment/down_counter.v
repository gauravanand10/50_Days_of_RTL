module d_flip_flop(

    input clk,
    input reset,
    input d,

    output reg q

);

always @(posedge clk or posedge reset) begin

    if(reset)
        q <= 1'b1;
    else
        q <= d;

end

endmodule


module down_counter(

    input clk,
    input reset,

    output [3:0] count

);

wire q0;
wire q1;
wire q2;
wire q3;

wire d0;
wire d1;
wire d2;
wire d3;

assign d0 = ~q0;
assign d1 = q1 ^ (~q0);
assign d2 = q2 ^ ((~q1) & (~q0));
assign d3 = q3 ^ ((~q2) & (~q1) & (~q0));

d_flip_flop ff0(

    .clk(clk),
    .reset(reset),
    .d(d0),
    .q(q0)

);

d_flip_flop ff1(

    .clk(clk),
    .reset(reset),
    .d(d1),
    .q(q1)

);

d_flip_flop ff2(

    .clk(clk),
    .reset(reset),
    .d(d2),
    .q(q2)

);

d_flip_flop ff3(

    .clk(clk),
    .reset(reset),
    .d(d3),
    .q(q3)

);

assign count = {q3,q2,q1,q0};

endmodule
