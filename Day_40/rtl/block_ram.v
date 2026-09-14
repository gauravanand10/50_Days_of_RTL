module block_ram(
    input wire clk,
    input wire we,
    input wire [7:0] addr,
    input wire [7:0] din,
    output reg [7:0] dout
);

reg [7:0] mem [0:255];

always @(posedge clk)
begin
    if(we)
        mem[addr] <= din;
    else
        dout <= mem[addr];
end

endmodule
