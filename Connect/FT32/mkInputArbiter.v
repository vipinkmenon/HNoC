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
// Method: select
// Conflict-free: select
// Sequenced before: next
//
// Method: next
// Sequenced after: select
// Conflicts: next
//
//
// Ports:
// Name                         I/O  size props
// select                         O     4
// CLK                            I     1 clock
// RST_N                          I     1 reset
// select_requests                I     4
// EN_next                        I     1
//
// Combinational paths from inputs to outputs:
//   select_requests -> select
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkInputArbiter(CLK,
		      RST_N,

		      select_requests,
		      select,

		      EN_next);
  input  CLK;
  input  RST_N;

  // value method select
  input  [3 : 0] select_requests;
  output [3 : 0] select;

  // action method next
  input  EN_next;

  // signals for module outputs
  wire [3 : 0] select;

  // register arb_token
  reg [3 : 0] arb_token;
  wire [3 : 0] arb_token$D_IN;
  wire arb_token$EN;

  // remaining internal signals
  wire [1 : 0] ab__h1386,
	       ab__h1401,
	       ab__h1416,
	       ab__h1431,
	       ab__h2563,
	       ab__h2933,
	       ab__h3249,
	       ab__h3516;
  wire NOT_gen_grant_carry_2_BIT_1_1_6_AND_NOT_gen_gr_ETC___d51,
       NOT_gen_grant_carry_6_BIT_1_7_8_AND_NOT_gen_gr_ETC___d43,
       ab_BIT_0___h1907,
       ab_BIT_0___h2014,
       ab_BIT_0___h2121,
       ab_BIT_0___h2619,
       ab_BIT_0___h2721,
       ab_BIT_0___h3037,
       ab_BIT_0___h3304,
       arb_token_BIT_0___h1905,
       arb_token_BIT_1___h2012,
       arb_token_BIT_2___h2119,
       arb_token_BIT_3___h2226;

  // value method select
  assign select =
	     { ab__h1386[1] || ab__h2563[1],
	       !ab__h1386[1] && !ab__h2563[1] &&
	       (ab__h1401[1] || ab__h2933[1]),
	       NOT_gen_grant_carry_6_BIT_1_7_8_AND_NOT_gen_gr_ETC___d43,
	       !ab__h1386[1] && !ab__h2563[1] &&
	       NOT_gen_grant_carry_2_BIT_1_1_6_AND_NOT_gen_gr_ETC___d51 } ;

  // register arb_token
  assign arb_token$D_IN = { arb_token[0], arb_token[3:1] } ;
  assign arb_token$EN = EN_next ;

  // remaining internal signals
  module_gen_grant_carry instance_gen_grant_carry_7(.gen_grant_carry_c(1'd0),
						    .gen_grant_carry_r(select_requests[0]),
						    .gen_grant_carry_p(arb_token_BIT_0___h1905),
						    .gen_grant_carry(ab__h1431));
  module_gen_grant_carry instance_gen_grant_carry_1(.gen_grant_carry_c(ab_BIT_0___h1907),
						    .gen_grant_carry_r(select_requests[1]),
						    .gen_grant_carry_p(arb_token_BIT_1___h2012),
						    .gen_grant_carry(ab__h1416));
  module_gen_grant_carry instance_gen_grant_carry_0(.gen_grant_carry_c(ab_BIT_0___h2014),
						    .gen_grant_carry_r(select_requests[2]),
						    .gen_grant_carry_p(arb_token_BIT_2___h2119),
						    .gen_grant_carry(ab__h1401));
  module_gen_grant_carry instance_gen_grant_carry_2(.gen_grant_carry_c(ab_BIT_0___h2121),
						    .gen_grant_carry_r(select_requests[3]),
						    .gen_grant_carry_p(arb_token_BIT_3___h2226),
						    .gen_grant_carry(ab__h1386));
  module_gen_grant_carry instance_gen_grant_carry_3(.gen_grant_carry_c(ab_BIT_0___h2619),
						    .gen_grant_carry_r(select_requests[0]),
						    .gen_grant_carry_p(arb_token_BIT_0___h1905),
						    .gen_grant_carry(ab__h3516));
  module_gen_grant_carry instance_gen_grant_carry_4(.gen_grant_carry_c(ab_BIT_0___h3304),
						    .gen_grant_carry_r(select_requests[1]),
						    .gen_grant_carry_p(arb_token_BIT_1___h2012),
						    .gen_grant_carry(ab__h3249));
  module_gen_grant_carry instance_gen_grant_carry_5(.gen_grant_carry_c(ab_BIT_0___h3037),
						    .gen_grant_carry_r(select_requests[2]),
						    .gen_grant_carry_p(arb_token_BIT_2___h2119),
						    .gen_grant_carry(ab__h2933));
  module_gen_grant_carry instance_gen_grant_carry_6(.gen_grant_carry_c(ab_BIT_0___h2721),
						    .gen_grant_carry_r(select_requests[3]),
						    .gen_grant_carry_p(arb_token_BIT_3___h2226),
						    .gen_grant_carry(ab__h2563));
  assign NOT_gen_grant_carry_2_BIT_1_1_6_AND_NOT_gen_gr_ETC___d51 =
	     !ab__h1401[1] && !ab__h2933[1] && !ab__h1416[1] &&
	     !ab__h3249[1] &&
	     (ab__h1431[1] || ab__h3516[1]) ;
  assign NOT_gen_grant_carry_6_BIT_1_7_8_AND_NOT_gen_gr_ETC___d43 =
	     !ab__h1386[1] && !ab__h2563[1] && !ab__h1401[1] &&
	     !ab__h2933[1] &&
	     (ab__h1416[1] || ab__h3249[1]) ;
  assign ab_BIT_0___h1907 = ab__h1431[0] ;
  assign ab_BIT_0___h2014 = ab__h1416[0] ;
  assign ab_BIT_0___h2121 = ab__h1401[0] ;
  assign ab_BIT_0___h2619 = ab__h1386[0] ;
  assign ab_BIT_0___h2721 = ab__h2933[0] ;
  assign ab_BIT_0___h3037 = ab__h3249[0] ;
  assign ab_BIT_0___h3304 = ab__h3516[0] ;
  assign arb_token_BIT_0___h1905 = arb_token[0] ;
  assign arb_token_BIT_1___h2012 = arb_token[1] ;
  assign arb_token_BIT_2___h2119 = arb_token[2] ;
  assign arb_token_BIT_3___h2226 = arb_token[3] ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (!RST_N)
      begin
        arb_token <= `BSV_ASSIGNMENT_DELAY 4'd1;
      end
    else
      begin
        if (arb_token$EN) arb_token <= `BSV_ASSIGNMENT_DELAY arb_token$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    arb_token = 4'hA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // mkInputArbiter

