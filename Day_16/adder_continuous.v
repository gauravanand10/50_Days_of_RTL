module adder_continuous(

    input wire [3:0] a,
    input wire [3:0] b,

    output wire [4:0] sum

);

    // Continuous assignment for addition
    assign sum = a + b;

endmodule


module adder_blocking(

    input wire [3:0] a,
    input wire [3:0] b,

    output reg [4:0] sum

);

    always @(*) begin
        sum = a + b;    // Blocking assignment (Combinational Logic)
    end

endmodule


module adder_non_blocking(

    input wire clk,

    input wire [3:0] a,
    input wire [3:0] b,

    output reg [4:0] sum

);

    always @(posedge clk) begin
        sum <= a + b;   // Non-Blocking assignment (Sequential Logic)
    end

endmodule
