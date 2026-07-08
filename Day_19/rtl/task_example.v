module task_example;

    reg [7:0] a;
    reg [7:0] b;
    reg [7:0] c;

    task add_numbers;

        input  [7:0] num1;
        input  [7:0] num2;
        output [7:0] sum;

        begin
            sum = num1 + num2;
        end

    endtask

    initial begin

        a = 8'd15;
        b = 8'd25;

        add_numbers(a, b, c);

        $display("A   = %0d", a);
        $display("B   = %0d", b);
        $display("Sum = %0d", c);

    end

endmodule
