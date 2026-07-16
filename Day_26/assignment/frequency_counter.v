module frequency_counter(

    input fast_clk,
    input slow_signal,
    input rst,

    output reg [7:0] pulse_count

);

    reg slow_prev;
    reg [7:0] counter;

    always @(posedge fast_clk or posedge rst) begin

        if(rst) begin

            counter     <= 0;
            pulse_count <= 0;
            slow_prev   <= 0;

        end

        else begin

            slow_prev <= slow_signal;

            if(~slow_prev && slow_signal) begin

                pulse_count <= counter;
                counter <= 0;

            end

            else begin

                counter <= counter + 1;

            end

        end

    end

endmodule
