//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
//Date        : Wed Jun 17 02:28:37 2026
//Host        : DESKTOP-K1QLFKS running 64-bit major release  (build 9200)
//Command     : generate_target ila.bd
//Design      : ila
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "ila,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ila,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "ila.hwdef" *) 
module ila
   (clk_0,
    probe0_0,
    probe1_0,
    probe2_0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_0, CLK_DOMAIN ila_clk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk_0;
  input [3:0]probe0_0;
  input [3:0]probe1_0;
  input [3:0]probe2_0;

  wire clk_0;
  wire [3:0]probe0_0;
  wire [3:0]probe1_0;
  wire [3:0]probe2_0;

  ila_ila_0_0 ila_0
       (.clk(clk_0),
        .probe0(probe0_0),
        .probe1(probe1_0),
        .probe2(probe2_0));
endmodule
