module crc_generator(
    input        clk,
    input        reset,
    input        data_in,
    output [2:0] crc
);

reg [2:0] crc_reg;

always @(posedge clk or posedge reset)
begin
    if(reset)
        crc_reg <= 3'b000;
    else
    begin
        crc_reg[2] <= crc_reg[1];
        crc_reg[1] <= crc_reg[0] ^ crc_reg[2] ^ data_in;
        crc_reg[0] <= crc_reg[2] ^ data_in;
    end
end

assign crc = crc_reg;

endmodule
