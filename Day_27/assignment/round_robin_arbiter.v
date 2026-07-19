module round_robin_arbiter(

    input clk,
    input reset,
    input [1:0] req,

    output reg [1:0] grant

);

    reg last_grant;

    always @(posedge clk or posedge reset) begin

        if(reset) begin

            grant <= 2'b00;
            last_grant <= 0;

        end

        else begin

            case(last_grant)

                1'b0: begin

                    if(req[1]) begin
                        grant <= 2'b10;
                        last_grant <= 1;
                    end

                    else if(req[0]) begin
                        grant <= 2'b01;
                        last_grant <= 0;
                    end

                    else
                        grant <= 2'b00;

                end

                1'b1: begin

                    if(req[0]) begin
                        grant <= 2'b01;
                        last_grant <= 0;
                    end

                    else if(req[1]) begin
                        grant <= 2'b10;
                        last_grant <= 1;
                    end

                    else
                        grant <= 2'b00;

                end

            endcase

        end

    end

endmodule

