`timescale 1ns/1ps

module if_else_example_tb;

    reg [1:0] control;
    wire data;

    if_else_example uut(
        .control(control),
        .data(data)
    );

    initial begin

        control = 2'b00; #10;
        control = 2'b01; #10;
        control = 2'b10; #10;
        control = 2'b11; #10;

        $finish;

    end

    initial begin

        $monitor("Time=%0t Control=%b Data=%b",
                  $time, control, data);

        $dumpfile("wave.vcd");
        $dumpvars(0, if_else_example_tb);

    end

endmodule
