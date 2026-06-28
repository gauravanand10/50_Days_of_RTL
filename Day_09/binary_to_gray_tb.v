`timescale 1ns/1ps

module binary_to_gray_tb;

	reg  [3:0] binary_in;
	wire [3:0] gray_out;

	binary_to_gray uut(
		.binary_in(binary_in),
		.gray_out(gray_out)
		);

	initial begin

        binary_in = 4'b0000; #10;
        binary_in = 4'b0001; #10;
        binary_in = 4'b0010; #10;
        binary_in = 4'b0011; #10;
        binary_in = 4'b0100; #10;
        binary_in = 4'b0101; #10;
        binary_in = 4'b0110; #10;
        binary_in = 4'b0111; #10;
        binary_in = 4'b1000; #10;
        binary_in = 4'b1001; #10;
        binary_in = 4'b1010; #10;
        binary_in = 4'b1011; #10;
        binary_in = 4'b1100; #10;
        binary_in = 4'b1101; #10;
        binary_in = 4'b1110; #10;
        binary_in = 4'b1111; #10;

        $finish;
    end
    
   initial begin
        $monitor("Time=%0t Binary=%b Gray=%b",
                  $time, binary_in, gray_out);

        $dumpfile("wave.vcd");
        $dumpvars(0, binary_to_gray_tb);
    end
    
endmodule
