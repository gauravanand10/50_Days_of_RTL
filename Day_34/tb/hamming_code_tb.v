`timescale 1ns/1ps

module hamming_code_tb;

reg [3:0] data_in;
reg [6:0] received_code;

wire [6:0] encoded_data;
wire [3:0] decoded_data;
wire error;

hamming_code uut
(
    .data_in(data_in),
    .received_code(received_code),
    .encoded_data(encoded_data),
    .decoded_data(decoded_data),
    .error(error)
);

initial
begin
    $dumpfile("wave.vcd");
    $dumpvars(0,hamming_code_tb);
end

initial
begin

    $display("Time\tData\tEncoded\t\tReceived\tDecoded\tError");

    $monitor("%0t\t%b\t%b\t%b\t%b\t%b",
             $time,
             data_in,
             encoded_data,
             received_code,
             decoded_data,
             error);

    data_in = 4'b1011;
    #10;

    received_code = encoded_data;
    #10;

    received_code = encoded_data;
    received_code[5] = ~received_code[5];
    #10;

    received_code = encoded_data;
    received_code[2] = ~received_code[2];
    #10;

    received_code = encoded_data;
    received_code[0] = ~received_code[0];
    #10;

    $finish;

end

endmodule
