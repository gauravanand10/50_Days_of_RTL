module factorial(

    input clk,
    input reset,
    input start,
    input [3:0] n,

    output reg [31:0] fact,
    output reg done

);

    reg [3:0] count;

    always @(posedge clk or posedge reset) begin

        if(reset) begin

            fact  <= 32'd1;
            count <= 4'd1;
            done  <= 1'b0;

        end

        else if(!start) begin

            fact  <= 32'd1;
            count <= 4'd1;
            done  <= 1'b0;

        end

        else if(start && !done) begin

            if(n == 0 || n == 1) begin

                fact <= 32'd1;
                done <= 1'b1;

            end

            else if(count <= n) begin

                fact  <= fact * count;
                count <= count + 1;

            end

            else begin

                done <= 1'b1;

            end

        end

    end

endmodule
