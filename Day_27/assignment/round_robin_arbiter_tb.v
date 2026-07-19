`timescale 1ns/1ps

module round_robin_arbiter_tb;

    reg clk;
    reg reset;
    reg [1:0] req;

    wire [1:0] grant;

    round_robin_arbiter uut(

        .clk(clk),
        .reset(reset),
        .req(req),
        .grant(grant)

    );

    initial
        clk = 0;

    always #5 clk = ~clk;

    initial begin

        reset = 1;
        req = 2'b00;

        #10 reset = 0;

        #10 req = 2'b11;

        #10 req = 2'b11;

        #10 req = 2'b11;

        #10 req = 2'b11;

        #20 $finish;

    end

    initial begin

        $monitor("Time=%0t Request=%b Grant=%b",
                  $time, req, grant);

        $dumpfile("wave.vcd");
        $dumpvars(0, round_robin_arbiter_tb);

    end

endmodule
