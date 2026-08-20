`timescale 1ns/1ps

module parity_tb;

reg  [7:0] data;
reg        parity_bit;

wire generated_parity;
wire error;

parity uut(
    .data(data),
    .parity_bit(parity_bit),
    .generated_parity(generated_parity),
    .error(error)
);

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, parity_tb);
end

initial begin

    $display("Time\tData\t\tGen_Parity\tRx_Parity\tError");
    $monitor("%0t\t%b\t%b\t\t%b\t\t%b",
             $time,
             data,
             generated_parity,
             parity_bit,
             error);

    data = 8'b10110010;
    parity_bit = 0;
    #10;

    data = 8'b11110000;
    parity_bit = 0;
    #10;

    data = 8'b01010101;
    parity_bit = 0;
    #10;

    data = 8'b10110010;
    parity_bit = 1;
    #10;

    $finish;

end

endmodule
