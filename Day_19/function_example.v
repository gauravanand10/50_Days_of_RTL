`timescale 1ns/1ps

module function_example;

    reg  [7:0] data;
    reg        parity;

    function even_parity;

        input [7:0] num;

        begin
            even_parity = ^num;
        end

    endfunction

    initial begin

        data = 8'b10110010;

        parity = even_parity(data);

        $display("Data   = %b", data);
        $display("Parity = %b", parity);

    end

endmodule
