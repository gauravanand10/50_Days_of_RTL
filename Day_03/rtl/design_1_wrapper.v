//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
//Date        : Sat Jun 20 20:21:38 2026
//Host        : Gaurav running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (a_in,
    b_in,
    c_in,
    carry_out,
    sum_out);
  input a_in;
  input b_in;
  input c_in;
  output [0:0]carry_out;
  output sum_out;

  wire a_in;
  wire b_in;
  wire c_in;
  wire [0:0]carry_out;
  wire sum_out;

  design_1 design_1_i
       (.a_in(a_in),
        .b_in(b_in),
        .c_in(c_in),
        .carry_out(carry_out),
        .sum_out(sum_out));
endmodule
