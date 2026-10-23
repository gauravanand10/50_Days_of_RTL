module monitor(

    input wire [3:0] count

);

always @(*) begin

    $display("Current Count = %d",count);

end

endmodule
