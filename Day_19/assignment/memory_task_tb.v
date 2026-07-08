`timescale 1ns/1ps

module memory_task_tb;

    reg clk;
    reg rst;
    reg write_en;
    reg read_en;
    reg [3:0] addr;
    reg [7:0] data_in;

    wire [7:0] data_out;

    memory_task uut(

        .clk(clk),
        .rst(rst),
        .write_en(write_en),
        .read_en(read_en),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)

    );

    // Clock Generation
    always #5 clk = ~clk;

    initial begin

        clk = 0;
        rst = 1;

        write_en = 0;
        read_en  = 0;

        addr = 0;
        data_in = 0;

        #10;
        rst = 0;

        // -----------------
        // Write AA to Address 3
        // -----------------
        write_en = 1;
        addr = 4'd3;
        data_in = 8'hAA;

        #10;
        write_en = 0;

        // -----------------
        // Read Address 3
        // -----------------
        read_en = 1;
        addr = 4'd3;

        #10;
        read_en = 0;

        // -----------------
        // Write 55 to Address 5
        // -----------------
        write_en = 1;
        addr = 4'd5;
        data_in = 8'h55;

        #10;
        write_en = 0;

        // -----------------
        // Read Address 5
        // -----------------
        read_en = 1;
        addr = 4'd5;

        #10;
        read_en = 0;

        // -----------------
        // Write F0 to Address 10
        // -----------------
        write_en = 1;
        addr = 4'd10;
        data_in = 8'hF0;

        #10;
        write_en = 0;

        // -----------------
        // Read Address 10
        // -----------------
        read_en = 1;
        addr = 4'd10;

        #10;
        read_en = 0;

        #20;

        $finish;

    end

    initial begin

        $monitor("Time=%0t  WE=%b  RE=%b  Addr=%d  Data_in=%h  Data_out=%h",
                  $time, write_en, read_en, addr, data_in, data_out);

        $dumpfile("wave.vcd");
        $dumpvars(0, memory_task_tb);

    end

endmodule
