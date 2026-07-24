module fibonacci(

    input clk,
    input reset,
    input start,
    input [3:0] n,

    output reg [31:0] fib,
    output reg done

);

    reg [31:0] fib1;
    reg [31:0] fib2;
    reg [3:0] count;

    always @(posedge clk or posedge reset) begin

        if(reset) begin

            fib   <= 32'd0;
            fib1  <= 32'd0;
            fib2  <= 32'd1;
            count <= 4'd0;
            done  <= 1'b0;

        end

        else if(!start) begin

            fib   <= 32'd0;
            fib1  <= 32'd0;
            fib2  <= 32'd1;
            count <= 4'd0;
            done  <= 1'b0;

        end

        else if(start && !done) begin

            if(n == 0) begin

                fib  <= 32'd0;
                done <= 1'b1;

            end

            else if(n == 1) begin

                fib  <= 32'd1;
                done <= 1'b1;

            end

            else if(count < n - 1) begin

                fib   <= fib1 + fib2;
                fib1  <= fib2;
                fib2  <= fib1 + fib2;
                count <= count + 1;

            end

            else begin

                done <= 1'b1;

            end

        end

    end

endmodule

