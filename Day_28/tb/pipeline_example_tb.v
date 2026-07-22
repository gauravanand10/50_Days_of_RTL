`timescale 1ns/1ps

module pipeline_example_tb;

    reg clk;
    reg reset;

    reg [15:0] a;
    reg [15:0] b;

    wire [15:0] result;

    pipeline_example uut (

        .clk(clk),
        .reset(reset),
        .a(a),
        .b(b),
        .result(result)

    );

    initial
        clk = 0;

    always #5 clk = ~clk;

    initial begin

        reset = 1;
        a = 0;
        b = 0;

        #10 reset = 0;

        repeat(10) begin

            a = $urandom_range(1,5);
            b = $urandom_range(1,5);

            #10;

        end

        #100 $finish;

    end

    initial begin

        $monitor("Time=%0t | clk=%b | reset=%b | a=%0d | b=%0d | stage1=%0d | stage2=%0d | stage3=%0d | result=%0d",
                 $time,
                 clk,
                 reset,
                 a,
                 b,
                 uut.stage1_reg,
                 uut.stage2_reg,
                 uut.stage3_reg,
                 result);

    end

    initial begin

        $dumpfile("wave.vcd");
        $dumpvars(0, pipeline_example_tb);

    end

endmodule
