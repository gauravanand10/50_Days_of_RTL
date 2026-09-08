module top_ram(
    input clk,
    input wr,
    input oe,
    input [7:0] addr,
    input [15:0] din,
    output [15:0] dout
);

reg [15:0] mem [255:0];
reg [15:0] temp;

always @(posedge clk)
begin
    if(wr)
        mem[addr] <= din;
    else
        temp <= mem[addr];
end

assign dout = (oe) ? temp : 16'h0000;

endmodule
