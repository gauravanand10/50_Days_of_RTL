`timescale 1ns/1ps

module blocking_tb;

    blocking uut();

    initial begin

        $dumpfile("wave.vcd");
        $dumpvars(0, blocking_tb);

        #10;
        $finish;

    end

endmodule
