`timescale 1ns/1ps

module parameter_localparam_tb_pass;

    parameter_localparam
    #(
        .WIDTH(8)
    )
    dut();

    initial begin

        $monitor("Time=%0t WIDTH=%0d DEPTH=%0d",
                  $time, dut.WIDTH, dut.DEPTH);

        $dumpfile("wave.vcd");
        $dumpvars(0, parameter_localparam_tb_pass);

        #10;
        $finish;

    end

endmodule
