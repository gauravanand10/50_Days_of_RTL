module register(

    input clk,
    input [3:0] data_in,

    output reg [3:0] data_out

);

always @(posedge clk)

begin

    data_out <= data_in;

end

endmodule
