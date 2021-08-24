`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2021 10:15:54 PM
// Design Name: 
// Module Name: Verification_4bit
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


module Verification_4bit(
    input [3:0] a,
    input [3:0] b,
    input c_in,
    
    output [3:0] sum,
    output c_out
    );
    
    wire c_out1, c_out2, c_out3;
    Verification_1bit v1(c_out1, sum[0], a[0], b[0], c_in);
    Verification_1bit v2(c_out2, sum[1], a[1], b[1], c_out1);
    Verification_1bit v3(c_out3, sum[2], a[2], b[2], c_out2);
    Verification_1bit v4(c_out, sum[3], a[3], b[3], c_out3);

endmodule
