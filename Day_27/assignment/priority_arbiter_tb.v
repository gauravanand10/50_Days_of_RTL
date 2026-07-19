`timescale 1ns/1ps

module priority_arbiter_tb;

    reg clk;
    reg reset;
    reg [1:0] request;

    wire [1:0] grant;

    priority_arbiter uut(

        .clk(clk),
        .reset(reset),
        .request(request),
        .grant(grant)

    );

    initial
        clk = 0;

    always #5 clk = ~clk;

    initial begin

        reset = 1;
        request = 2'b00;

        #10 reset = 0;

        #10 request = 2'b01;

        #10 request = 2'b10;

        #10 request = 2'b11;

        #10 request = 2'b01;

        #10 request = 2'b11;

        #20 $finish;

    end

    initial begin

        $monitor("Time=%0t Request=%b Grant=%b",
                  $time, request, grant);

        $dumpfile("wave.vcd");
        $dumpvars(0, priority_arbiter_tb);

    end

endmodule
