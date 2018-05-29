/*
 * These source files contain a hardware description of a network
 * automatically generated by CONNECT (CONfigurable NEtwork Creation Tool).
 *
 * This product includes a hardware design developed by Carnegie Mellon
 * University.
 *
 * Copyright (c) 2012 by Michael K. Papamichael, Carnegie Mellon University
 *
 * For more information, see the CONNECT project website at:
 *   http://www.ece.cmu.edu/~mpapamic/connect
 *
 * This design is provided for internal, non-commercial research use only, 
 * cannot be used for, or in support of, goods or services, and is not for
 * redistribution, with or without modifications.
 * 
 * You may not use the name "Carnegie Mellon University" or derivations
 * thereof to endorse or promote products derived from this software.
 *
 * THE SOFTWARE IS PROVIDED "AS-IS" WITHOUT ANY WARRANTY OF ANY KIND, EITHER
 * EXPRESS, IMPLIED OR STATUTORY, INCLUDING BUT NOT LIMITED TO ANY WARRANTY
 * THAT THE SOFTWARE WILL CONFORM TO SPECIFICATIONS OR BE ERROR-FREE AND ANY
 * IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE,
 * TITLE, OR NON-INFRINGEMENT.  IN NO EVENT SHALL CARNEGIE MELLON UNIVERSITY
 * BE LIABLE FOR ANY DAMAGES, INCLUDING BUT NOT LIMITED TO DIRECT, INDIRECT,
 * SPECIAL OR CONSEQUENTIAL DAMAGES, ARISING OUT OF, RESULTING FROM, OR IN
 * ANY WAY CONNECTED WITH THIS SOFTWARE (WHETHER OR NOT BASED UPON WARRANTY,
 * CONTRACT, TORT OR OTHERWISE).
 *
 */


/* =========================================================================
 * 
 * Filename:            testbench_sample.v
 * Date created:        05-28-2012
 * Last modified:       11-30-2012
 * Authors:		Michael Papamichael <papamixATcs.cmu.edu>
 *
 * Description:
 * Minimal testbench sample for CONNECT networks with Peek flow control
 * 
 * =========================================================================
 */

`ifndef XST_SYNTH

`timescale 1ns / 1ps

`include "connect_parameters.v"
`define NUMPE 4
`define PktLmit 100
`define expectedPkts `NUMPE*`PktLmit

module CONNECT_testbench_sample_peek();
  parameter HalfClkPeriod = 5;
  localparam ClkPeriod = 2*HalfClkPeriod;

  // non-VC routers still reeserve 1 dummy bit for VC.
  localparam vc_bits = (`NUM_VCS > 1) ? $clog2(`NUM_VCS) : 1;
  localparam dest_bits = $clog2(`NUM_USER_RECV_PORTS);
  localparam flit_port_width = 2 /*valid and tail bits*/+ `FLIT_DATA_WIDTH + dest_bits + vc_bits;
  //localparam credit_port_width = 1 + vc_bits; // 1 valid bit
  localparam credit_port_width = `NUM_VCS; // 1 valid bit
  localparam test_cycles = 20;

  reg Clk;
  reg Rst_n;

  // input regs
  wire send_flit [0:`NUM_USER_SEND_PORTS-1]; // enable sending flits
  wire [flit_port_width-1:0] flit_in [0:`NUM_USER_SEND_PORTS-1]; // send port inputs

  reg send_credit [0:`NUM_USER_RECV_PORTS-1]; // enable sending credits
  reg [credit_port_width-1:0] credit_in [0:`NUM_USER_RECV_PORTS-1]; //recv port credits

  // output wires
  wire [credit_port_width-1:0] credit_out [0:`NUM_USER_SEND_PORTS-1];
  wire [flit_port_width-1:0] flit_out [0:`NUM_USER_RECV_PORTS-1];

  reg [31:0] cycle;
  integer i;

  // packet fields
  reg is_valid;
  reg is_tail;
  reg [dest_bits-1:0] dest;
  reg [vc_bits-1:0]   vc;
  reg [`FLIT_DATA_WIDTH-1:0] data;
  
  reg done = 0;
  reg [31:0] receivedPkts=0;
  integer receive_log_file;
  
  integer start,stop,delay;
  reg   [100*8:0]       receive_log_file_name = "receive_log.csv";

  // Generate Clock
  initial Clk = 0;
  always #(HalfClkPeriod) Clk = ~Clk;

  // Run simulation 
  initial begin 
    receive_log_file = $fopen(receive_log_file_name,"w");
    cycle = 0;
    $display("---- Performing Reset ----");
    Rst_n = 1; // perform reset (active low) 
    #(5*ClkPeriod+HalfClkPeriod); 
    Rst_n = 0; 
    wait(send_flit[0]);
    start = $time;
  end


  // Monitor arriving flits
  always @ (posedge Clk) begin
    cycle <= cycle + 1;
    for(i = 0; i < `NUM_USER_RECV_PORTS; i = i + 1) begin
      if(flit_out[i][flit_port_width-1]) begin // valid flit
        //$display("@%3d: Ejecting flit %x at receive port %0d", cycle, flit_out[i], i);
        receivedPkts = receivedPkts + 1;
      end

    // terminate simulation
        if(receivedPkts == `expectedPkts)
        begin
            done = 1;
            stop = $time;
            $display("Start time %d Stop time %d",start,stop);
            $display("Throughput : %f",`expectedPkts*1.0/((stop-start)/ClkPeriod));
            #1000;
            $stop;
        end
    end
  end

  // Add your code to handle flow control here (sending receiving credits)

  // Instantiate CONNECT network
  mkNetworkSimple dut
  (.CLK(Clk)
   ,.RST_N(!Rst_n)

   ,.send_ports_0_putFlit_flit_in(flit_in[0])
   ,.EN_send_ports_0_putFlit(send_flit[0])

   ,.EN_send_ports_0_getNonFullVCs(1'b1) // drain credits
   ,.send_ports_0_getNonFullVCs(credit_out[0])

   ,.send_ports_1_putFlit_flit_in(flit_in[1])
   ,.EN_send_ports_1_putFlit(send_flit[1])

   ,.EN_send_ports_1_getNonFullVCs(1'b1) // drain credits
   ,.send_ports_1_getNonFullVCs(credit_out[1])
   
   ,.send_ports_2_putFlit_flit_in(flit_in[2])
   ,.EN_send_ports_2_putFlit(send_flit[2])

   ,.EN_send_ports_2_getNonFullVCs(1'b1) // drain credits
   ,.send_ports_2_getNonFullVCs(credit_out[2])
   
   ,.send_ports_3_putFlit_flit_in(flit_in[3])
   ,.EN_send_ports_3_putFlit(send_flit[3])

   ,.EN_send_ports_3_getNonFullVCs(1'b1) // drain credits
   ,.send_ports_3_getNonFullVCs(credit_out[3])   
   
   ,.send_ports_4_putFlit_flit_in(flit_in[4])
   ,.EN_send_ports_4_putFlit(send_flit[4])

   ,.EN_send_ports_4_getNonFullVCs(1'b1) // drain credits
   ,.send_ports_4_getNonFullVCs(credit_out[4])

   ,.send_ports_5_putFlit_flit_in(flit_in[5])
   ,.EN_send_ports_5_putFlit(send_flit[5])

   ,.EN_send_ports_5_getNonFullVCs(1'b1) // drain credits
   ,.send_ports_5_getNonFullVCs(credit_out[5])
   
   ,.send_ports_6_putFlit_flit_in(flit_in[6])
   ,.EN_send_ports_6_putFlit(send_flit[6])

   ,.EN_send_ports_6_getNonFullVCs(1'b1) // drain credits
   ,.send_ports_6_getNonFullVCs(credit_out[6])   
   
   ,.send_ports_7_putFlit_flit_in(flit_in[7])
   ,.EN_send_ports_7_putFlit(send_flit[7])

   ,.EN_send_ports_7_getNonFullVCs(1'b1) // drain credits
   ,.send_ports_7_getNonFullVCs(credit_out[7])   
   
   
   // add rest of send ports here
   //

   ,.EN_recv_ports_0_getFlit(1'b1) // drain flits
   ,.recv_ports_0_getFlit(flit_out[0])

   ,.recv_ports_0_putNonFullVCs_nonFullVCs(2'b11)
   ,.EN_recv_ports_0_putNonFullVCs(1'b1)

   ,.EN_recv_ports_1_getFlit(1'b1) // drain flits
   ,.recv_ports_1_getFlit(flit_out[1])

   ,.recv_ports_1_putNonFullVCs_nonFullVCs(2'b11)
   ,.EN_recv_ports_1_putNonFullVCs(1'b1)

   // add rest of receive ports here
   // 
   ,.EN_recv_ports_2_getFlit(1'b1) // drain flits
   ,.recv_ports_2_getFlit(flit_out[2])

   ,.recv_ports_2_putNonFullVCs_nonFullVCs(2'b11)
   ,.EN_recv_ports_2_putNonFullVCs(1'b1)
   
   ,.EN_recv_ports_3_getFlit(1'b1) // drain flits
   ,.recv_ports_3_getFlit(flit_out[3])

   ,.recv_ports_3_putNonFullVCs_nonFullVCs(2'b11)
   ,.EN_recv_ports_3_putNonFullVCs(1'b1)
   
   ,.EN_recv_ports_4_getFlit(1'b1) // drain flits
   ,.recv_ports_4_getFlit(flit_out[4])

   ,.recv_ports_4_putNonFullVCs_nonFullVCs(2'b11)
   ,.EN_recv_ports_4_putNonFullVCs(1'b1)
   
   ,.EN_recv_ports_5_getFlit(1'b1) // drain flits
   ,.recv_ports_5_getFlit(flit_out[5])

   ,.recv_ports_5_putNonFullVCs_nonFullVCs(2'b11)
   ,.EN_recv_ports_5_putNonFullVCs(1'b1)
   
   ,.EN_recv_ports_6_getFlit(1'b1) // drain flits
   ,.recv_ports_6_getFlit(flit_out[6])

   ,.recv_ports_6_putNonFullVCs_nonFullVCs(2'b11)
   ,.EN_recv_ports_6_putNonFullVCs(1'b1)
   
   
   ,.EN_recv_ports_7_getFlit(1'b1) // drain flits
   ,.recv_ports_7_getFlit(flit_out[7])

   ,.recv_ports_7_putNonFullVCs_nonFullVCs(2'b11)
   ,.EN_recv_ports_7_putNonFullVCs(1'b1)
   );

   
   
   
pe #(.address(0),.PktLmit(`PktLmit))pe0(
    .clk(Clk),
    .rst(!Rst_n),
    .i_data(flit_out[0]),
    .i_data_valid(flit_out[0][37]),
    .o_data_ready(o_pe0_data_ready),
    .o_data(flit_in[0]),
    .o_data_valid(send_flit[0]),
    .i_data_ready(credit_out[0]),
    .done(done)
);

pe #(.address(1),.PktLmit(`PktLmit))pe1(
    .clk(Clk),
    .rst(!Rst_n),
    .i_data(flit_out[1]),
    .i_data_valid(flit_out[1][37]),
    .o_data_ready(o_pe1_data_ready),
    .o_data(flit_in[1]),
    .o_data_valid(send_flit[1]),
    .i_data_ready(credit_out[1]),
    .done(done)
);

pe #(.address(2),.PktLmit(`PktLmit))pe2(
    .clk(Clk),
    .rst(!Rst_n),
    .i_data(flit_out[2]),
    .i_data_valid(flit_out[2][37]),
    .o_data_ready(o_pe2_data_ready),
    .o_data(flit_in[2]),
    .o_data_valid(send_flit[2]),
    .i_data_ready(credit_out[2]),
    .done(done)
);

pe #(.address(3),.PktLmit(`PktLmit))pe3(
    .clk(Clk),
    .rst(!Rst_n),
    .i_data(flit_out[3]),
    .i_data_valid(flit_out[3][37]),
    .o_data_ready(o_pe3_data_ready),
    .o_data(flit_in[3]),
    .o_data_valid(send_flit[3]),
    .i_data_ready(credit_out[3]),
    .done(done)
);

pe #(.address(4),.PktLmit(`PktLmit))pe4(
    .clk(Clk),
    .rst(1'b0),
    .i_data(flit_out[4]),
    .i_data_valid(flit_out[4][37]),
    .o_data_ready(o_pe4_data_ready),
    .o_data(flit_in[4]),
    .o_data_valid(send_flit[4]),
    .i_data_ready(credit_out[4]),
    .done(done)
);

pe #(.address(5),.PktLmit(`PktLmit))pe5(
    .clk(Clk),
    .rst(1'b0),
    .i_data(flit_out[5]),
    .i_data_valid(flit_out[5][37]),
    .o_data_ready(o_pe5_data_ready),
    .o_data(flit_in[5]),
    .o_data_valid(send_flit[5]),
    .i_data_ready(credit_out[5]),
    .done(done)
);

pe #(.address(6),.PktLmit(`PktLmit))pe6(
    .clk(Clk),
    .rst(1'b0),
    .i_data(flit_out[6]),
    .i_data_valid(flit_out[6][37]),
    .o_data_ready(o_pe6_data_ready),
    .o_data(flit_in[6]),
    .o_data_valid(send_flit[6]),
    .i_data_ready(credit_out[6]),
    .done(done)
);

pe #(.address(7),.PktLmit(`PktLmit))pe7(
    .clk(Clk),
    .rst(1'b0),
    .i_data(flit_out[7]),
    .i_data_valid(flit_out[7][37]),
    .o_data_ready(o_pe7_data_ready),
    .o_data(flit_in[7]),
    .o_data_valid(send_flit[7]),
    .i_data_ready(credit_out[7]),
    .done(done)
);

endmodule

`endif
