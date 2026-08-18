`timescale 1ns/1ps

module handshake_glue_logic_tb;

reg [7:0] data_in;
reg valid;
reg ready;

wire [7:0] data_out;
wire transfer;

handshake_glue_logic uut(
    .data_in(data_in),
    .valid(valid),
    .ready(ready),
    .data_out(data_out),
    .transfer(transfer)
);

initial
begin
    $dumpfile("wave.vcd");
    $dumpvars(0,handshake_glue_logic_tb);

    $display("Time\tValid\tReady\tTransfer\tData_In\tData_Out");
    $monitor("%0t\t%b\t%b\t%b\t\t%h\t\t%h",
             $time,
             valid,
             ready,
             transfer,
             data_in,
             data_out);

    data_in = 8'hA5;
    valid = 0;
    ready = 0;
    #10;

    valid = 1;
    ready = 0;
    #10;

    valid = 0;
    ready = 1;
    #10;

    valid = 1;
    ready = 1;
    #10;

    data_in = 8'h3C;
    #10;

    valid = 0;
    ready = 0;
    #10;

    $finish;
end

endmodule
