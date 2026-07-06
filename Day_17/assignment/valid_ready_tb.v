`timescale 1ns/1ps

module valid_ready_tb;

    reg valid;
    reg ready;

    wire transfer;

    valid_ready uut(

        .valid(valid),
        .ready(ready),
        .transfer(transfer)

    );

    initial begin

        valid = 0; ready = 0; #10;
        valid = 0; ready = 1; #10;
        valid = 1; ready = 0; #10;
        valid = 1; ready = 1; #10;

        valid = 0; ready = 1; #10;
        valid = 1; ready = 0; #10;
        valid = 1; ready = 1; #10;

        $finish;

    end

    initial begin

        $monitor("Time=%0t Valid=%b Ready=%b Transfer=%b",
                  $time, valid, ready, transfer);

        $dumpfile("wave.vcd");
        $dumpvars(0, valid_ready_tb);

    end

endmodule
