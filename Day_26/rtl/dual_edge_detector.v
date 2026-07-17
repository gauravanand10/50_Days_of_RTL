module dual_edge_detector(

    input clk,
    input signal_in,

    output reg edge_detected

);

    reg signal_prev;

    always @(posedge clk) begin

        edge_detected <= signal_prev ^ signal_in;

        signal_prev <= signal_in;

    end

endmodule
