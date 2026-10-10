module multi_function_module (
    input wire clk,
    input wire reset,
    input wire enable,
    input wire [3:0] data_in,

    output reg [3:0] count,
    output reg [3:0] decoded,
    output reg [7:0] result
);

// Counter Logic
always @(posedge clk or posedge reset) begin
    if (reset)
        count <= 4'b0000;
    else if (enable)
        count <= count + 1;
end

// Decoder Logic
always @(*) begin
    case(data_in)
        4'b0001: decoded = 4'b0001;
        4'b0010: decoded = 4'b0010;
        4'b0100: decoded = 4'b0100;
        4'b1000: decoded = 4'b1000;
        default: decoded = 4'b0000;
    endcase
end

// Arithmetic Logic
always @(posedge clk) begin
    result <= count * data_in;
end

endmodule
