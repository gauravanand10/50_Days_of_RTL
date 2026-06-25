module parameter_localparam
#(
    parameter WIDTH = 4
);

    localparam MAX_VALUE = 15;

    initial begin
        $display("WIDTH     = %0d", WIDTH);
        $display("MAX_VALUE = %0d", MAX_VALUE);
    end

endmodule
