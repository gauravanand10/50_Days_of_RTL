`timescale 1ns/1ps

module two_requester_arbiter_tb;

    reg clk;
    reg reset;
    reg [1:0] request;

    wire [1:0] grant;

    two_requester_arbiter uut(

        .clk(clk),
        .reset(reset),
        .request(request),
        .grant(grant)

    );

    initial
        clk = 0;

    always #5
        clk = ~clk;

    initial begin

        reset = 1;
        request = 2'b00;

        #10;

        reset = 0;
        request = 2'b01;

        #10;

        request = 2'b10;

        #10;

        request = 2'b11;

        #10;

        request = 2'b00;

        #10;

        $finish;

    end

    initial begin

        $monitor("Time=%0t clk=%b reset=%b request=%b grant=%b",
                  $time, clk, reset, request, grant);

        $dumpfile("wave.vcd");
        $dumpvars(0, two_requester_arbiter_tb);

    end

endmodule

