`timescale 1ns/1ps

module fsm_case_tb;

	reg clk;
	reg reset;
	reg [1:0] state;

	wire [1:0] next_state;

	fsm_case uut(
		.clk(clk),
		.reset(reset),
		.state(state),
		.next_state(next_state)
	);

	always #5 clk = ~clk;
	
	initial begin

        clk = 0;
        reset = 1;
        state = 2'b00;

        #10;
        reset = 0;
    
        state = 2'b00; #10;   // IDLE -> RUN
        state = 2'b01; #10;   // RUN -> WAIT
        state = 2'b10; #10;   // WAIT -> DONE
        state = 2'b11; #10;   // DONE -> IDLE

        state = 2'b00; #10;
        state = 2'b01; #10;
        state = 2'b10; #10;
        state = 2'b11; #10;

        $finish;

    end

    initial begin

        $monitor("Time=%0t Reset=%b State=%b Next_State=%b",
                  $time, reset, state, next_state);

        $dumpfile("wave.vcd");
        $dumpvars(0, fsm_case_tb);

    end

endmodule
