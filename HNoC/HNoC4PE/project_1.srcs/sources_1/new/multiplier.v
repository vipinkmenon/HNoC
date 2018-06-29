`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/01/2018 05:09:50 PM
// Design Name: 
// Module Name: multiplier
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multiplier(
input clk,
input [31:0] data1,
input [31:0] data2,
output [31:0] result
    );
    
reg [63:0] mult;

assign result = mult[63:32];

    always @(posedge clk)
        mult <= data1*data2;
endmodule
