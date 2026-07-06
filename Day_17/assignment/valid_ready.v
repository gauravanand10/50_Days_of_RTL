module valid_ready(

    input valid,
    input ready,

    output reg transfer

);

    always @(*) begin

        if (valid) begin

            if (ready)
                transfer = 1'b1;
            else
                transfer = 1'b0;

        end

        else begin

            transfer = 1'b0;

        end

    end

endmodule
