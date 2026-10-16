module decoder(

    input [3:0] data,

    output reg [3:0] decoded

);

always @(*) begin

    case(data)

        4'd0: decoded = 4'b0001;
        4'd1: decoded = 4'b0010;
        4'd2: decoded = 4'b0100;
        4'd3: decoded = 4'b1000;

        default: decoded = 4'b0000;

    endcase

end

endmodule
