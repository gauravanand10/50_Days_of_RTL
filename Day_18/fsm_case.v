module fsm_case(
	input wire clk,
	input wire reset,
	input wire [1:0] state,

	output reg [1:0] next_state
);


	localparam IDLE = 2'b00;
	localparam RUN  = 2'b01;
	localparam WAIT = 2'b10;
	localparam DONE = 2'b11;

	always@ (posedge clk or posedge reset) begin
	
	if(reset)
		next_state <= IDLE;
	
	else begin

		case(state)

			IDLE : next_state <= RUN;
			RUN  : next_state <= WAIT;
			WAIT : next_state <= DONE;
			DONE : next_state <= IDLE;

			default : next_state <= IDLE;
			
		endcase
	end
end 
endmodule
