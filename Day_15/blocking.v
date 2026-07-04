module blocking;

    reg [3:0] a;
    reg [3:0] b;
    reg [3:0] c;

    initial begin

        a = 4'b0001;
        b = 4'b0010;
        c = 4'b0100;

        $display("Initial Values:");
        $display("A = %b, B = %b, C = %b", a, b, c);

        a = b;
        b = c;
        c = a;

        $display("After Blocking Assignments:");
        $display("A = %b, B = %b, C = %b", a, b, c);

    end

endmodule
