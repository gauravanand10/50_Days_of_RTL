module req_ack_system(

    input req,
    input ack,

    output out

);

    // Output becomes 1 only when both req and ack are 1
    assign out = req & ack;

endmodule
