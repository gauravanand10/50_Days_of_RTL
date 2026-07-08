`timescale 1ns/1ps

module function_example_tb;

    function_example uut();

    initial begin

        $dumpfile("wave.vcd");
        $dumpvars(0, function_example_tb);

        #20;
        $finish;

    end

endmodule
