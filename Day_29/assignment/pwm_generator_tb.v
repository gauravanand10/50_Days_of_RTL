`timescale 1ns/1ps

module pwm_generator_tb;

    reg clk;
    reg reset;

    reg [7:0] duty_cycle;
    reg [7:0] period;

    wire pwm_out;

    pwm_generator uut(

        .clk(clk),
        .reset(reset),
        .duty_cycle(duty_cycle),
        .period(period),
        .pwm_out(pwm_out)

    );

    initial
        clk = 0;

    always #5 clk = ~clk;

    initial begin

        reset = 1;
        duty_cycle = 0;
        period = 10;

        #10 reset = 0;

        duty_cycle = 3;
        #100;

        duty_cycle = 5;
        #100;

        duty_cycle = 8;
        #100;

        period = 20;
        duty_cycle = 10;
        #200;

        $finish;

    end

    initial begin

        $monitor("Time=%0t | Counter=%0d | Period=%0d | Duty=%0d | PWM=%b",
                 $time,
                 uut.counter,
                 period,
                 duty_cycle,
                 pwm_out);

    end

    initial begin

        $dumpfile("wave.vcd");
        $dumpvars(0,pwm_generator_tb);

    end

endmodule
