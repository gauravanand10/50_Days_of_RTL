module top_module(

    input wire clk,
    input wire reset,
    input wire enable

);

wire [3:0] count;

counter u_counter(

    .clk(clk),
    .reset(reset),
    .enable(enable),
    .count(count)

);

monitor u_monitor(

    .count(count)

);

endmodule
