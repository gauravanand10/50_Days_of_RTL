module sync_reset_dff(

    input clk,
    input rst,
    output reg q

);

    reg d;

    initial
        d = 0;

    always #10
        d = ~d;

    always @(posedge clk) begin

        if(rst)
            q <= 0;
        else
            q <= d;

    end

endmodule
