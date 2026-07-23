module pwm_generator(

    input clk,
    input reset,

    input [7:0] duty_cycle,
    input [7:0] period,

    output reg pwm_out

);

    reg [7:0] counter;

    always @(posedge clk or posedge reset) begin

        if(reset) begin
            counter <= 0;
            pwm_out <= 0;
        end

        else begin

            if(counter >= period-1)
                counter <= 0;
            else
                counter <= counter + 1;

            if(counter < duty_cycle)
                pwm_out <= 1;
            else
                pwm_out <= 0;

        end

    end

endmodule
