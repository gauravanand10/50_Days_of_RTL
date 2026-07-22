module pipeline_example (

    input clk,
    input reset,
    input [15:0] a,
    input [15:0] b,

    output reg [15:0] result

);

    reg [15:0] stage1_reg;
    reg [15:0] stage2_reg;
    reg [15:0] stage3_reg;

    always @(posedge clk or posedge reset) begin

        if(reset) begin

            stage1_reg <= 16'd0;
            stage2_reg <= 16'd0;
            stage3_reg <= 16'd0;
            result     <= 16'd0;

        end

        else begin

            stage1_reg <= a + b;

            stage2_reg <= stage1_reg * 2;

            stage3_reg <= stage2_reg - 1;

            result <= stage3_reg;

        end

    end

endmodule
