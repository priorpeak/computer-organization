`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2021 02:56:20 PM
// Design Name: 
// Module Name: FA_4b
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


module FA_4b(c_out, sum, a, b, c_in);

input [3:0]     a, b;
input           c_in;

output          c_out;
output [3:0]    sum;

wire            c_in1, c_in2, c_in3;

FA_str FA1(c_in1, sum[0], a[0], b[0], c_in);
FA_str FA2(c_in2, sum[1], a[1], b[1], c_in1);
FA_str FA3(c_in3, sum[2], a[2], b[2], c_in2);
FA_str FA4(c_out, sum[3], a[3], b[3], c_in3);


endmodule
