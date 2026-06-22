`timescale 1ns/1ps

module comparator_2bit_tb;

reg  [1:0] a_in;
reg  [1:0] b_in;

wire a_gt_b;
wire a_eq_b;
wire a_lt_b;


comparator_2bit dut (
    .a_in(a_in),
    .b_in(b_in),
    .a_gt_b(a_gt_b),
    .a_eq_b(a_eq_b),
    .a_lt_b(a_lt_b)
);

initial begin

       // Generate waveform file for GTKWave
        $dumpfile("wave.vcd");
        $dumpvars(0, comparator_2bit_tb);

        // Monitor signals in terminal
        $monitor("Time=%0t | a_in=%b | b_in=%b | GT=%b | EQ=%b | LT=%b",
        $time, a_in, b_in, a_gt_b, a_eq_b, a_lt_b);

    // Test cases
    a_in = 2'b00; b_in = 2'b00;
    #10;
    a_in = 2'b01; b_in = 2'b00;
    #10;
    a_in = 2'b00; b_in = 2'b01;
    #10;
    a_in = 2'b10; b_in = 2'b10;
    #10;
    a_in = 2'b11; b_in = 2'b01;
    #10;
    a_in = 2'b01; b_in = 2'b11;
    #10;

    $finish;
end
endmodule
