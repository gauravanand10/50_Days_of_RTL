module memory_task(

    input wire clk,
    input wire rst,
    input wire write_en,
    input wire read_en,
    input wire [3:0] addr,
    input wire [7:0] data_in,

    output reg [7:0] data_out

);

    // 16 x 8-bit Memory
    reg [7:0] memory [0:15];

    // -------------------------
    // Task : Write to Memory
    // -------------------------
    task write_memory;

        input [3:0] address;
        input [7:0] data;

        begin
            memory[address] = data;
        end

    endtask

    // -------------------------
    // Task : Read from Memory
    // -------------------------
    task read_memory;

        input [3:0] address;
        output [7:0] data;

        begin
            data = memory[address];
        end

    endtask

    // -------------------------
    // Memory Operations
    // -------------------------
    always @(posedge clk or posedge rst) begin

        if (rst) begin

            data_out <= 8'b00000000;

        end

        else begin

            if (write_en)
                write_memory(addr, data_in);

            if (read_en)
                read_memory(addr, data_out);

        end

    end

endmodule
