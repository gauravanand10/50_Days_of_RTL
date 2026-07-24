module clock_divider_by_4(
    input wire clk_in,
    input wire reset,
    output reg clk_out
);

reg [1:0] counter;

always @(posedge clk_in or posedge reset)
begin
    if(reset)
    begin
        counter <= 2'd0;
        clk_out <= 1'b0;
    end
    else
    begin
        if(counter == 2'd1)
        begin
            clk_out <= ~clk_out;
            counter <= counter + 1;
        end
        else if(counter == 2'd3)
        begin
            clk_out <= ~clk_out;
            counter <= 2'd0;
        end
        else
        begin
            counter <= counter + 1;
        end
    end
end

endmodule
