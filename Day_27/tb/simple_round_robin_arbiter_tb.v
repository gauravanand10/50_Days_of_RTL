`timescale 1ns/1ps

module simple_round_robin_arbiter_tb;

    reg clk;
    reg reset;
    reg [1:0] req;

    wire [1:0] grant;

    simple_round_robin_arbiter uut(

        .clk(clk),
        .reset(reset),
        .req(req),
        .grant(grant)

    );

    initial
        clk = 0;

    always #5
        clk = ~clk;

    initial begin

        reset = 1;
        req = 2'b00;

        #10;

        reset = 0;

        #10 req = 2'b01;

        #10 req = 2'b10;

        #10 req = 2'b11;

        #10 req = 2'b01;

        #10 req = 2'b00;

        #10 req = 2'b10;

        #50;

        $finish;

    end

    initial begin

        $monitor("Time=%0t clk=%b req=%b grant=%b",
                  $time, clk, req, grant);

        $dumpfile("wave.vcd");
        $dumpvars(0, simple_round_robin_arbiter_tb);

    end

endmodule
