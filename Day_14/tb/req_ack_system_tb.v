`timescale 1ns/1ps

module req_ack_system_tb;

    reg req;
    reg ack;

    wire out;

    req_ack_system uut(
        .req(req),
        .ack(ack),
        .out(out)
    );

    initial begin

        req = 0; ack = 0; #10;
        req = 0; ack = 1; #10;
        req = 1; ack = 0; #10;
        req = 1; ack = 1; #10;

        req = 0; ack = 1; #10;
        req = 1; ack = 0; #10;
        req = 0; ack = 0; #10;

        req = 1; ack = 1; #10;

        $finish;

    end

    initial begin

        $monitor("Time=%0t Req=%b Ack=%b Out=%b",
                 $time, req, ack, out);

        $dumpfile("wave.vcd");
        $dumpvars(0, req_ack_system_tb);

    end

endmodule
