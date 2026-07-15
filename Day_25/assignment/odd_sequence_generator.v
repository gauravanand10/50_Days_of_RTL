module odd_sequence_generator(

    input clk,
    input rst,

    output reg [3:0] seq

);

always @(posedge clk or posedge rst) begin

    if(rst)
        seq <= 4'd0;

    else begin

        case(seq)

            4'd0  : seq <= 4'd1;
            4'd1  : seq <= 4'd3;
            4'd3  : seq <= 4'd5;
            4'd5  : seq <= 4'd7;
            4'd7  : seq <= 4'd9;
            4'd9  : seq <= 4'd11;
            4'd11 : seq <= 4'd13;
            4'd13 : seq <= 4'd15;
            4'd15 : seq <= 4'd0;

            default : seq <= 4'd0;

        endcase

    end

end

endmodule
