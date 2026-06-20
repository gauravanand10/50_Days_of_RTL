`timescale 1ns/1ps

module tb_design_1_wrapper;

    // Testbench signals
    reg a_in;
    reg b_in;
    reg c_in;

    wire carry_out;
    wire sum_out;

    // Instantiate DUT
    design_1_wrapper dut (
        .a_in(a_in),
        .b_in(b_in),
        .c_in(c_in),
        .carry_out(carry_out),
        .sum_out(sum_out)
    );

    initial begin

        $display("A B Cin | Sum Carry");
        $display("------------------");

        // Apply all input combinations

        a_in = 0; b_in = 0; c_in = 0; #10;
        $display("%b %b  %b  |  %b    %b", a_in, b_in, c_in, sum_out, carry_out);

        a_in = 0; b_in = 0; c_in = 1; #10;
        $display("%b %b  %b  |  %b    %b", a_in, b_in, c_in, sum_out, carry_out);

        a_in = 0; b_in = 1; c_in = 0; #10;
        $display("%b %b  %b  |  %b    %b", a_in, b_in, c_in, sum_out, carry_out);

        a_in = 0; b_in = 1; c_in = 1; #10;
        $display("%b %b  %b  |  %b    %b", a_in, b_in, c_in, sum_out, carry_out);

        a_in = 1; b_in = 0; c_in = 0; #10;
        $display("%b %b  %b  |  %b    %b", a_in, b_in, c_in, sum_out, carry_out);

        a_in = 1; b_in = 0; c_in = 1; #10;
        $display("%b %b  %b  |  %b    %b", a_in, b_in, c_in, sum_out, carry_out);

        a_in = 1; b_in = 1; c_in = 0; #10;
        $display("%b %b  %b  |  %b    %b", a_in, b_in, c_in, sum_out, carry_out);

        a_in = 1; b_in = 1; c_in = 1; #10;
        $display("%b %b  %b  |  %b    %b", a_in, b_in, c_in, sum_out, carry_out);

        $display("Simulation Complete");
        $finish;

    end

endmodule
