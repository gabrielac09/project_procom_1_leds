//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
//Date        : Wed Jun 17 02:28:37 2026
//Host        : DESKTOP-K1QLFKS running 64-bit major release  (build 9200)
//Command     : generate_target ila_wrapper.bd
//Design      : ila_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ila_wrapper
   (clk_0,
    probe0_0,
    probe1_0,
    probe2_0);
  input clk_0;
  input [3:0]probe0_0;
  input [3:0]probe1_0;
  input [3:0]probe2_0;

  wire clk_0;
  wire [3:0]probe0_0;
  wire [3:0]probe1_0;
  wire [3:0]probe2_0;

  ila ila_i
       (.clk_0(clk_0),
        .probe0_0(probe0_0),
        .probe1_0(probe1_0),
        .probe2_0(probe2_0));
endmodule
