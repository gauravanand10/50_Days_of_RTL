module if_else_example(

    input wire [1:0] control,
    output reg data

);

    always @(*) begin

        if (control == 2'b00) begin
            data = 1'b0;
        end

        else if (control == 2'b01) begin
            data = 1'b1;
        end

        else begin
            data = 1'b0;
        end

    end

endmodule
