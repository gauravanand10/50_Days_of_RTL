module slicer_32bit (
    input              clk,
    input      [31:0]  data_in,
    output reg [3:0]   data_out
);

always @(posedge clk) begin
    data_out <= data_in[3:0];
end

endmodule
