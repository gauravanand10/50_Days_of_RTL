`timescale 1ns/1ps

module tb_parity_generator;

reg  [7:0] data_in;
wire parity;

parity_generator uut (
    .data_in(data_in),
    .parity(parity)
);

initial begin

    $dumpfile("wave.vcd");
    $dumpvars(0, tb_parity_generator);

    $display("---------------------------");
    $display(" Data In      Parity");
    $display("---------------------------");

    data_in = 8'b00000000; #10;
    $display("%b      %b", data_in, parity);

    data_in = 8'b00000001; #10;
    $display("%b      %b", data_in, parity);

    data_in = 8'b10101010; #10;
    $display("%b      %b", data_in, parity);

    data_in = 8'b11111111; #10;
    $display("%b      %b", data_in, parity);

    data_in = 8'b11001100; #10;
    $display("%b      %b", data_in, parity);

    $finish;

end

endmodule
