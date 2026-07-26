module clock_divider_400khz(
    input wire clk_in,
    input wire reset,
    output reg clk_out
);

reg [5:0] counter;

always @(posedge clk_in or posedge reset)
begin
    if(reset)
    begin
        counter <= 6'd0;
        clk_out <= 1'b0;
    end
    else
    begin
        if(counter == 6'd62)
        begin
            counter <= 6'd0;
            clk_out <= ~clk_out;
        end
        else
        begin
            counter <= counter + 1;
        end
    end
end

endmodule
