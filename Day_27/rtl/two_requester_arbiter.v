module two_requester_arbiter(

    input wire clk,
    input wire reset,
    input wire [1:0] request,

    output reg [1:0] grant

);

    always @(posedge clk or posedge reset) begin

        if(reset)

            grant <= 2'b00;

        else begin

            if(request[0])

                grant <= 2'b10;

            else if(request[1])

                grant <= 2'b01;

            else

                grant <= 2'b00;

        end

    end

endmodule
