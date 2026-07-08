`timescale 1ns/1ps

module task_example_tb;

    task_example uut();

    initial begin

        $dumpfile("wave.vcd");
        $dumpvars(0, task_example_tb);

        #10;
        $finish;

    end

endmodule
