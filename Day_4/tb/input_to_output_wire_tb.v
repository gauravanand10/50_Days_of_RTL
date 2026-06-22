`timescale 1ns/1ps

module input_to_output_wire_tb;

    reg a_in;
    wire b_out;

    input_to_output_wire dut(
        .a_in(a_in),
        .b_out(b_out)
    );

    initial begin

        // Generate waveform file for GTKWave
        $dumpfile("wave.vcd");
        $dumpvars(0, input_to_output_wire_tb);

        // Monitor signals in terminal
        $monitor("Time = %0t | a_in = %b | b_out = %b",
                 $time, a_in, b_out);

        // Test cases
        a_in = 1'b0; #10;
        a_in = 1'b1; #10;
        a_in = 1'b0; #10;
        a_in = 1'b1; #10;

        $finish;
end
endmodule
