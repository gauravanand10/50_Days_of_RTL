`timescale 1ns/1ps

module counter (
	input clk,
	input rst
);
	integer counter;
	
	always@ (posedge clk or posedge rst)
	begin	
	   if (rst)
		 counter <= 0;

	   else if (counter<255)
		 counter <= counter + 1;

	   else 
		 counter <= 0;

end 
endmodule
