//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
//Date        : Wed Jul 15 13:22:14 2026
//Host        : Gaurav running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (clk,
    clk_out,
    rst);
  input clk;
  output clk_out;
  input rst;

  wire clk;
  wire clk_out;
  wire rst;

  design_1 design_1_i
       (.clk(clk),
        .clk_out(clk_out),
        .rst(rst));
endmodule
