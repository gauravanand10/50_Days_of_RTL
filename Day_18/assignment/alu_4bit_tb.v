`timescale 1ns/1ps

module alu_4bit_tb;

	reg [3:0] a;
	reg [3:0] b;
	reg [2:0] sel;

	wire [4:0] result;

	alu_4bit uut(
		.a(a),
		.b(b),
		.sel(sel),
		.result(result)
);

	initial begin

        a = 4'b1010;      // 10
        b = 4'b0011;      // 3

        sel = 3'b000; #10;   // Addition
        sel = 3'b001; #10;   // Subtraction
        sel = 3'b010; #10;   // AND
        sel = 3'b011; #10;   // OR
        sel = 3'b100; #10;   // XOR
        sel = 3'b101; #10;   // NOT
        sel = 3'b110; #10;   // Left Shift
        sel = 3'b111; #10;   // Right Shift

        // Change Inputs

        a = 4'b0110;      // 6
        b = 4'b0010;      // 2

        sel = 3'b000; #10;
        sel = 3'b001; #10;
        sel = 3'b010; #10;
        sel = 3'b011; #10;
        sel = 3'b100; #10;
        sel = 3'b101; #10;
        sel = 3'b110; #10;
        sel = 3'b111; #10;

        $finish;

    end

    initial begin

        $monitor("Time=%0t A=%b B=%b Sel=%b Result=%b",
                  $time, a, b, sel, result);

        $dumpfile("wave.vcd");
        $dumpvars(0, alu_4bit_tb);

    end

endmodule
