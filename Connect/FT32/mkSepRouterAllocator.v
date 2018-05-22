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


//
// Generated by Bluespec Compiler, version 2012.01.A (build 26572, 2012-01-17)
//
// On Tue May 15 18:01:18 EDT 2018
//
// Method conflict info:
// Method: allocate
// Sequenced before: next
// Sequenced before (restricted): allocate
//
// Method: next
// Sequenced after: allocate
// Conflicts: next
//
//
// Ports:
// Name                         I/O  size props
// allocate                       O    16
// pipeline                       I     1
// CLK                            I     1 clock
// RST_N                          I     1 reset
// allocate_alloc_input           I    16
// EN_next                        I     1
// EN_allocate                    I     1
//
// Combinational paths from inputs to outputs:
//   (allocate_alloc_input, pipeline) -> allocate
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkSepRouterAllocator(pipeline,
			    CLK,
			    RST_N,

			    allocate_alloc_input,
			    EN_allocate,
			    allocate,

			    EN_next);
  input  pipeline;
  input  CLK;
  input  RST_N;

  // actionvalue method allocate
  input  [15 : 0] allocate_alloc_input;
  input  EN_allocate;
  output [15 : 0] allocate;

  // action method next
  input  EN_next;

  // signals for module outputs
  wire [15 : 0] allocate;

  // register as_inputArbGrants_reg_0
  reg as_inputArbGrants_reg_0;
  wire as_inputArbGrants_reg_0$D_IN, as_inputArbGrants_reg_0$EN;

  // register as_inputArbGrants_reg_0_1
  reg as_inputArbGrants_reg_0_1;
  wire as_inputArbGrants_reg_0_1$D_IN, as_inputArbGrants_reg_0_1$EN;

  // register as_inputArbGrants_reg_0_2
  reg as_inputArbGrants_reg_0_2;
  wire as_inputArbGrants_reg_0_2$D_IN, as_inputArbGrants_reg_0_2$EN;

  // register as_inputArbGrants_reg_0_3
  reg as_inputArbGrants_reg_0_3;
  wire as_inputArbGrants_reg_0_3$D_IN, as_inputArbGrants_reg_0_3$EN;

  // register as_inputArbGrants_reg_1
  reg as_inputArbGrants_reg_1;
  wire as_inputArbGrants_reg_1$D_IN, as_inputArbGrants_reg_1$EN;

  // register as_inputArbGrants_reg_1_1
  reg as_inputArbGrants_reg_1_1;
  wire as_inputArbGrants_reg_1_1$D_IN, as_inputArbGrants_reg_1_1$EN;

  // register as_inputArbGrants_reg_1_2
  reg as_inputArbGrants_reg_1_2;
  wire as_inputArbGrants_reg_1_2$D_IN, as_inputArbGrants_reg_1_2$EN;

  // register as_inputArbGrants_reg_1_3
  reg as_inputArbGrants_reg_1_3;
  wire as_inputArbGrants_reg_1_3$D_IN, as_inputArbGrants_reg_1_3$EN;

  // register as_inputArbGrants_reg_2
  reg as_inputArbGrants_reg_2;
  wire as_inputArbGrants_reg_2$D_IN, as_inputArbGrants_reg_2$EN;

  // register as_inputArbGrants_reg_2_1
  reg as_inputArbGrants_reg_2_1;
  wire as_inputArbGrants_reg_2_1$D_IN, as_inputArbGrants_reg_2_1$EN;

  // register as_inputArbGrants_reg_2_2
  reg as_inputArbGrants_reg_2_2;
  wire as_inputArbGrants_reg_2_2$D_IN, as_inputArbGrants_reg_2_2$EN;

  // register as_inputArbGrants_reg_2_3
  reg as_inputArbGrants_reg_2_3;
  wire as_inputArbGrants_reg_2_3$D_IN, as_inputArbGrants_reg_2_3$EN;

  // register as_inputArbGrants_reg_3
  reg as_inputArbGrants_reg_3;
  wire as_inputArbGrants_reg_3$D_IN, as_inputArbGrants_reg_3$EN;

  // register as_inputArbGrants_reg_3_1
  reg as_inputArbGrants_reg_3_1;
  wire as_inputArbGrants_reg_3_1$D_IN, as_inputArbGrants_reg_3_1$EN;

  // register as_inputArbGrants_reg_3_2
  reg as_inputArbGrants_reg_3_2;
  wire as_inputArbGrants_reg_3_2$D_IN, as_inputArbGrants_reg_3_2$EN;

  // register as_inputArbGrants_reg_3_3
  reg as_inputArbGrants_reg_3_3;
  wire as_inputArbGrants_reg_3_3$D_IN, as_inputArbGrants_reg_3_3$EN;

  // ports of submodule inputArbs
  wire [3 : 0] inputArbs$input_arbs_0_select,
	       inputArbs$input_arbs_0_select_requests,
	       inputArbs$input_arbs_1_select,
	       inputArbs$input_arbs_1_select_requests,
	       inputArbs$input_arbs_2_select,
	       inputArbs$input_arbs_2_select_requests,
	       inputArbs$input_arbs_3_select,
	       inputArbs$input_arbs_3_select_requests;
  wire inputArbs$EN_input_arbs_0_next,
       inputArbs$EN_input_arbs_1_next,
       inputArbs$EN_input_arbs_2_next,
       inputArbs$EN_input_arbs_3_next;

  // ports of submodule outputArbs
  wire [3 : 0] outputArbs$output_arbs_0_select,
	       outputArbs$output_arbs_0_select_requests,
	       outputArbs$output_arbs_1_select,
	       outputArbs$output_arbs_1_select_requests,
	       outputArbs$output_arbs_2_select,
	       outputArbs$output_arbs_2_select_requests,
	       outputArbs$output_arbs_3_select,
	       outputArbs$output_arbs_3_select_requests;
  wire outputArbs$EN_output_arbs_0_next,
       outputArbs$EN_output_arbs_1_next,
       outputArbs$EN_output_arbs_2_next,
       outputArbs$EN_output_arbs_3_next;

  // actionvalue method allocate
  assign allocate =
	     { outputArbs$output_arbs_3_select[3],
	       outputArbs$output_arbs_2_select[3],
	       outputArbs$output_arbs_1_select[3],
	       outputArbs$output_arbs_0_select[3],
	       outputArbs$output_arbs_3_select[2],
	       outputArbs$output_arbs_2_select[2],
	       outputArbs$output_arbs_1_select[2],
	       outputArbs$output_arbs_0_select[2],
	       outputArbs$output_arbs_3_select[1],
	       outputArbs$output_arbs_2_select[1],
	       outputArbs$output_arbs_1_select[1],
	       outputArbs$output_arbs_0_select[1],
	       outputArbs$output_arbs_3_select[0],
	       outputArbs$output_arbs_2_select[0],
	       outputArbs$output_arbs_1_select[0],
	       outputArbs$output_arbs_0_select[0] } ;

  // submodule inputArbs
  mkRouterInputArbitersRoundRobin inputArbs(.CLK(CLK),
					    .RST_N(RST_N),
					    .input_arbs_0_select_requests(inputArbs$input_arbs_0_select_requests),
					    .input_arbs_1_select_requests(inputArbs$input_arbs_1_select_requests),
					    .input_arbs_2_select_requests(inputArbs$input_arbs_2_select_requests),
					    .input_arbs_3_select_requests(inputArbs$input_arbs_3_select_requests),
					    .EN_input_arbs_0_next(inputArbs$EN_input_arbs_0_next),
					    .EN_input_arbs_1_next(inputArbs$EN_input_arbs_1_next),
					    .EN_input_arbs_2_next(inputArbs$EN_input_arbs_2_next),
					    .EN_input_arbs_3_next(inputArbs$EN_input_arbs_3_next),
					    .input_arbs_0_select(inputArbs$input_arbs_0_select),
					    .input_arbs_1_select(inputArbs$input_arbs_1_select),
					    .input_arbs_2_select(inputArbs$input_arbs_2_select),
					    .input_arbs_3_select(inputArbs$input_arbs_3_select));

  // submodule outputArbs
  mkRouterOutputArbitersRoundRobin outputArbs(.CLK(CLK),
					      .RST_N(RST_N),
					      .output_arbs_0_select_requests(outputArbs$output_arbs_0_select_requests),
					      .output_arbs_1_select_requests(outputArbs$output_arbs_1_select_requests),
					      .output_arbs_2_select_requests(outputArbs$output_arbs_2_select_requests),
					      .output_arbs_3_select_requests(outputArbs$output_arbs_3_select_requests),
					      .EN_output_arbs_0_next(outputArbs$EN_output_arbs_0_next),
					      .EN_output_arbs_1_next(outputArbs$EN_output_arbs_1_next),
					      .EN_output_arbs_2_next(outputArbs$EN_output_arbs_2_next),
					      .EN_output_arbs_3_next(outputArbs$EN_output_arbs_3_next),
					      .output_arbs_0_select(outputArbs$output_arbs_0_select),
					      .output_arbs_1_select(outputArbs$output_arbs_1_select),
					      .output_arbs_2_select(outputArbs$output_arbs_2_select),
					      .output_arbs_3_select(outputArbs$output_arbs_3_select));

  // register as_inputArbGrants_reg_0
  assign as_inputArbGrants_reg_0$D_IN = inputArbs$input_arbs_0_select[0] ;
  assign as_inputArbGrants_reg_0$EN = EN_allocate && pipeline ;

  // register as_inputArbGrants_reg_0_1
  assign as_inputArbGrants_reg_0_1$D_IN = inputArbs$input_arbs_0_select[1] ;
  assign as_inputArbGrants_reg_0_1$EN = EN_allocate && pipeline ;

  // register as_inputArbGrants_reg_0_2
  assign as_inputArbGrants_reg_0_2$D_IN = inputArbs$input_arbs_0_select[2] ;
  assign as_inputArbGrants_reg_0_2$EN = EN_allocate && pipeline ;

  // register as_inputArbGrants_reg_0_3
  assign as_inputArbGrants_reg_0_3$D_IN = inputArbs$input_arbs_0_select[3] ;
  assign as_inputArbGrants_reg_0_3$EN = EN_allocate && pipeline ;

  // register as_inputArbGrants_reg_1
  assign as_inputArbGrants_reg_1$D_IN = inputArbs$input_arbs_1_select[0] ;
  assign as_inputArbGrants_reg_1$EN = EN_allocate && pipeline ;

  // register as_inputArbGrants_reg_1_1
  assign as_inputArbGrants_reg_1_1$D_IN = inputArbs$input_arbs_1_select[1] ;
  assign as_inputArbGrants_reg_1_1$EN = EN_allocate && pipeline ;

  // register as_inputArbGrants_reg_1_2
  assign as_inputArbGrants_reg_1_2$D_IN = inputArbs$input_arbs_1_select[2] ;
  assign as_inputArbGrants_reg_1_2$EN = EN_allocate && pipeline ;

  // register as_inputArbGrants_reg_1_3
  assign as_inputArbGrants_reg_1_3$D_IN = inputArbs$input_arbs_1_select[3] ;
  assign as_inputArbGrants_reg_1_3$EN = EN_allocate && pipeline ;

  // register as_inputArbGrants_reg_2
  assign as_inputArbGrants_reg_2$D_IN = inputArbs$input_arbs_2_select[0] ;
  assign as_inputArbGrants_reg_2$EN = EN_allocate && pipeline ;

  // register as_inputArbGrants_reg_2_1
  assign as_inputArbGrants_reg_2_1$D_IN = inputArbs$input_arbs_2_select[1] ;
  assign as_inputArbGrants_reg_2_1$EN = EN_allocate && pipeline ;

  // register as_inputArbGrants_reg_2_2
  assign as_inputArbGrants_reg_2_2$D_IN = inputArbs$input_arbs_2_select[2] ;
  assign as_inputArbGrants_reg_2_2$EN = EN_allocate && pipeline ;

  // register as_inputArbGrants_reg_2_3
  assign as_inputArbGrants_reg_2_3$D_IN = inputArbs$input_arbs_2_select[3] ;
  assign as_inputArbGrants_reg_2_3$EN = EN_allocate && pipeline ;

  // register as_inputArbGrants_reg_3
  assign as_inputArbGrants_reg_3$D_IN = inputArbs$input_arbs_3_select[0] ;
  assign as_inputArbGrants_reg_3$EN = EN_allocate && pipeline ;

  // register as_inputArbGrants_reg_3_1
  assign as_inputArbGrants_reg_3_1$D_IN = inputArbs$input_arbs_3_select[1] ;
  assign as_inputArbGrants_reg_3_1$EN = EN_allocate && pipeline ;

  // register as_inputArbGrants_reg_3_2
  assign as_inputArbGrants_reg_3_2$D_IN = inputArbs$input_arbs_3_select[2] ;
  assign as_inputArbGrants_reg_3_2$EN = EN_allocate && pipeline ;

  // register as_inputArbGrants_reg_3_3
  assign as_inputArbGrants_reg_3_3$D_IN = inputArbs$input_arbs_3_select[3] ;
  assign as_inputArbGrants_reg_3_3$EN = EN_allocate && pipeline ;

  // submodule inputArbs
  assign inputArbs$input_arbs_0_select_requests = allocate_alloc_input[3:0] ;
  assign inputArbs$input_arbs_1_select_requests = allocate_alloc_input[7:4] ;
  assign inputArbs$input_arbs_2_select_requests = allocate_alloc_input[11:8] ;
  assign inputArbs$input_arbs_3_select_requests =
	     allocate_alloc_input[15:12] ;
  assign inputArbs$EN_input_arbs_0_next = EN_next ;
  assign inputArbs$EN_input_arbs_1_next = EN_next ;
  assign inputArbs$EN_input_arbs_2_next = EN_next ;
  assign inputArbs$EN_input_arbs_3_next = EN_next ;

  // submodule outputArbs
  assign outputArbs$output_arbs_0_select_requests =
	     pipeline ?
	       { as_inputArbGrants_reg_3,
		 as_inputArbGrants_reg_2,
		 as_inputArbGrants_reg_1,
		 as_inputArbGrants_reg_0 } :
	       { inputArbs$input_arbs_3_select[0],
		 inputArbs$input_arbs_2_select[0],
		 inputArbs$input_arbs_1_select[0],
		 inputArbs$input_arbs_0_select[0] } ;
  assign outputArbs$output_arbs_1_select_requests =
	     pipeline ?
	       { as_inputArbGrants_reg_3_1,
		 as_inputArbGrants_reg_2_1,
		 as_inputArbGrants_reg_1_1,
		 as_inputArbGrants_reg_0_1 } :
	       { inputArbs$input_arbs_3_select[1],
		 inputArbs$input_arbs_2_select[1],
		 inputArbs$input_arbs_1_select[1],
		 inputArbs$input_arbs_0_select[1] } ;
  assign outputArbs$output_arbs_2_select_requests =
	     pipeline ?
	       { as_inputArbGrants_reg_3_2,
		 as_inputArbGrants_reg_2_2,
		 as_inputArbGrants_reg_1_2,
		 as_inputArbGrants_reg_0_2 } :
	       { inputArbs$input_arbs_3_select[2],
		 inputArbs$input_arbs_2_select[2],
		 inputArbs$input_arbs_1_select[2],
		 inputArbs$input_arbs_0_select[2] } ;
  assign outputArbs$output_arbs_3_select_requests =
	     pipeline ?
	       { as_inputArbGrants_reg_3_3,
		 as_inputArbGrants_reg_2_3,
		 as_inputArbGrants_reg_1_3,
		 as_inputArbGrants_reg_0_3 } :
	       { inputArbs$input_arbs_3_select[3],
		 inputArbs$input_arbs_2_select[3],
		 inputArbs$input_arbs_1_select[3],
		 inputArbs$input_arbs_0_select[3] } ;
  assign outputArbs$EN_output_arbs_0_next = EN_next ;
  assign outputArbs$EN_output_arbs_1_next = EN_next ;
  assign outputArbs$EN_output_arbs_2_next = EN_next ;
  assign outputArbs$EN_output_arbs_3_next = EN_next ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (!RST_N)
      begin
        as_inputArbGrants_reg_0 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	as_inputArbGrants_reg_0_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	as_inputArbGrants_reg_0_2 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	as_inputArbGrants_reg_0_3 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	as_inputArbGrants_reg_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	as_inputArbGrants_reg_1_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	as_inputArbGrants_reg_1_2 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	as_inputArbGrants_reg_1_3 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	as_inputArbGrants_reg_2 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	as_inputArbGrants_reg_2_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	as_inputArbGrants_reg_2_2 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	as_inputArbGrants_reg_2_3 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	as_inputArbGrants_reg_3 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	as_inputArbGrants_reg_3_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	as_inputArbGrants_reg_3_2 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	as_inputArbGrants_reg_3_3 <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (as_inputArbGrants_reg_0$EN)
	  as_inputArbGrants_reg_0 <= `BSV_ASSIGNMENT_DELAY
	      as_inputArbGrants_reg_0$D_IN;
	if (as_inputArbGrants_reg_0_1$EN)
	  as_inputArbGrants_reg_0_1 <= `BSV_ASSIGNMENT_DELAY
	      as_inputArbGrants_reg_0_1$D_IN;
	if (as_inputArbGrants_reg_0_2$EN)
	  as_inputArbGrants_reg_0_2 <= `BSV_ASSIGNMENT_DELAY
	      as_inputArbGrants_reg_0_2$D_IN;
	if (as_inputArbGrants_reg_0_3$EN)
	  as_inputArbGrants_reg_0_3 <= `BSV_ASSIGNMENT_DELAY
	      as_inputArbGrants_reg_0_3$D_IN;
	if (as_inputArbGrants_reg_1$EN)
	  as_inputArbGrants_reg_1 <= `BSV_ASSIGNMENT_DELAY
	      as_inputArbGrants_reg_1$D_IN;
	if (as_inputArbGrants_reg_1_1$EN)
	  as_inputArbGrants_reg_1_1 <= `BSV_ASSIGNMENT_DELAY
	      as_inputArbGrants_reg_1_1$D_IN;
	if (as_inputArbGrants_reg_1_2$EN)
	  as_inputArbGrants_reg_1_2 <= `BSV_ASSIGNMENT_DELAY
	      as_inputArbGrants_reg_1_2$D_IN;
	if (as_inputArbGrants_reg_1_3$EN)
	  as_inputArbGrants_reg_1_3 <= `BSV_ASSIGNMENT_DELAY
	      as_inputArbGrants_reg_1_3$D_IN;
	if (as_inputArbGrants_reg_2$EN)
	  as_inputArbGrants_reg_2 <= `BSV_ASSIGNMENT_DELAY
	      as_inputArbGrants_reg_2$D_IN;
	if (as_inputArbGrants_reg_2_1$EN)
	  as_inputArbGrants_reg_2_1 <= `BSV_ASSIGNMENT_DELAY
	      as_inputArbGrants_reg_2_1$D_IN;
	if (as_inputArbGrants_reg_2_2$EN)
	  as_inputArbGrants_reg_2_2 <= `BSV_ASSIGNMENT_DELAY
	      as_inputArbGrants_reg_2_2$D_IN;
	if (as_inputArbGrants_reg_2_3$EN)
	  as_inputArbGrants_reg_2_3 <= `BSV_ASSIGNMENT_DELAY
	      as_inputArbGrants_reg_2_3$D_IN;
	if (as_inputArbGrants_reg_3$EN)
	  as_inputArbGrants_reg_3 <= `BSV_ASSIGNMENT_DELAY
	      as_inputArbGrants_reg_3$D_IN;
	if (as_inputArbGrants_reg_3_1$EN)
	  as_inputArbGrants_reg_3_1 <= `BSV_ASSIGNMENT_DELAY
	      as_inputArbGrants_reg_3_1$D_IN;
	if (as_inputArbGrants_reg_3_2$EN)
	  as_inputArbGrants_reg_3_2 <= `BSV_ASSIGNMENT_DELAY
	      as_inputArbGrants_reg_3_2$D_IN;
	if (as_inputArbGrants_reg_3_3$EN)
	  as_inputArbGrants_reg_3_3 <= `BSV_ASSIGNMENT_DELAY
	      as_inputArbGrants_reg_3_3$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    as_inputArbGrants_reg_0 = 1'h0;
    as_inputArbGrants_reg_0_1 = 1'h0;
    as_inputArbGrants_reg_0_2 = 1'h0;
    as_inputArbGrants_reg_0_3 = 1'h0;
    as_inputArbGrants_reg_1 = 1'h0;
    as_inputArbGrants_reg_1_1 = 1'h0;
    as_inputArbGrants_reg_1_2 = 1'h0;
    as_inputArbGrants_reg_1_3 = 1'h0;
    as_inputArbGrants_reg_2 = 1'h0;
    as_inputArbGrants_reg_2_1 = 1'h0;
    as_inputArbGrants_reg_2_2 = 1'h0;
    as_inputArbGrants_reg_2_3 = 1'h0;
    as_inputArbGrants_reg_3 = 1'h0;
    as_inputArbGrants_reg_3_1 = 1'h0;
    as_inputArbGrants_reg_3_2 = 1'h0;
    as_inputArbGrants_reg_3_3 = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // mkSepRouterAllocator

