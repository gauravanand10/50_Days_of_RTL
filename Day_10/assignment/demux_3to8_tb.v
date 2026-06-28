`timescale 1ns/1ps

module demux_3to8_tb;

	reg data_in;
	reg [2:0] sel;

	wire [7:0] data_out;

	demux_3to8 uut(
		.data_in(data_in),
		.sel(sel),
		.data_out(data_out)
);

	initial begin
		data_in = 1'b1;

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
		$monitor("Time=%0t Inputs=%b Sel=%b Ouput=%b",
			$time, data_in, sel, data_out);

		$dumpfile("wave.vcd");
		$dumpvars(0, demux_3to8_tb);
end
endmodule
