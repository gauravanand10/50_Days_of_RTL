module integer_loop (
    input clk,
    input rst
);

    integer i;
    reg [7:0] mem [0:3];

    always @(posedge clk or posedge rst)
    begin
        if (rst)
        begin
            for(i = 0; i < 4; i = i + 1)
                mem[i] <= 8'd0;
        end
end
endmodule
