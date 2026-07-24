module clock_divider_by_3(
    input wire clk_in,
    input wire reset,
    output reg clk_out
);

reg [1:0] counter = 0;

always @(posedge clk_in or posedge reset)
begin
    if(reset)
    begin
        counter <= 0;
        clk_out <= 0;
    end
    else
    begin
        if(counter == 0)
        begin
            clk_out <= ~clk_out;
            counter <= counter + 1;
        end
        else if(counter == 2)
        begin
            clk_out <= ~clk_out;
            counter <= 0;
        end
        else
        begin
            counter <= counter + 1;
        end
    end
end

endmodule
