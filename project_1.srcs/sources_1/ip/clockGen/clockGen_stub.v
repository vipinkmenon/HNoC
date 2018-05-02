// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.3 (lin64) Build 2018833 Wed Oct  4 19:58:07 MDT 2017
// Date        : Mon Apr 30 13:36:50 2018
// Host        : vipin-ESPRIMO-P756 running 64-bit Ubuntu 16.04.4 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/vipin/workspace/Research/HNoC/project_1.srcs/sources_1/ip/clockGen/clockGen_stub.v
// Design      : clockGen
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1761-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clockGen(clk_out1, clk_out2, clk_out3, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,clk_out2,clk_out3,clk_in1" */;
  output clk_out1;
  output clk_out2;
  output clk_out3;
  input clk_in1;
endmodule
