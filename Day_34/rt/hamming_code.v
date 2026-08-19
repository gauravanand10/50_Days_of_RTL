module hamming_code(
    input  [3:0] data_in,
    input  [6:0] received_code,

    output [6:0] encoded_data,
    output [3:0] decoded_data,
    output        error
);

wire p1,p2,p3;
wire [2:0] syndrome;
reg [6:0] corrected;

// Encoder
assign p1 = data_in[0] ^ data_in[1] ^ data_in[3];
assign p2 = data_in[0] ^ data_in[2] ^ data_in[3];
assign p3 = data_in[1] ^ data_in[2] ^ data_in[3];

assign encoded_data = {data_in[3],data_in[2],data_in[1],p3,data_in[0],p2,p1};

// Decoder
assign syndrome[0] = received_code[0] ^ received_code[2] ^ received_code[4] ^ received_code[6];
assign syndrome[1] = received_code[1] ^ received_code[2] ^ received_code[5] ^ received_code[6];
assign syndrome[2] = received_code[3] ^ received_code[4] ^ received_code[5] ^ received_code[6];

always @(*)
begin
    corrected = received_code;

    if(syndrome != 3'b000)
        corrected[syndrome-1] = ~received_code[syndrome-1];
end

assign error = |syndrome;

assign decoded_data = {corrected[6],corrected[5],corrected[4],corrected[2]};

endmodule
