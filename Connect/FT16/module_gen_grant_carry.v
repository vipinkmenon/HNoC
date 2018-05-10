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
// On Mon Apr 30 06:22:34 EDT 2018
//
// Method conflict info:
// Method: gen_grant_carry
// Conflict-free: gen_grant_carry
//
//
// Ports:
// Name                         I/O  size props
// gen_grant_carry                O     2
// gen_grant_carry_c              I     1
// gen_grant_carry_r              I     1
// gen_grant_carry_p              I     1
//
// Combinational paths from inputs to outputs:
//   (gen_grant_carry_c, gen_grant_carry_r, gen_grant_carry_p) -> gen_grant_carry
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module module_gen_grant_carry(gen_grant_carry_c,
			      gen_grant_carry_r,
			      gen_grant_carry_p,
			      gen_grant_carry);
  // value method gen_grant_carry
  input  gen_grant_carry_c;
  input  gen_grant_carry_r;
  input  gen_grant_carry_p;
  output [1 : 0] gen_grant_carry;

  // signals for module outputs
  wire [1 : 0] gen_grant_carry;

  // value method gen_grant_carry
  assign gen_grant_carry =
	     { gen_grant_carry_r && (gen_grant_carry_c || gen_grant_carry_p),
	       !gen_grant_carry_r &&
	       (gen_grant_carry_c || gen_grant_carry_p) } ;
endmodule  // module_gen_grant_carry

