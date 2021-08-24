`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2021 07:30:41 PM
// Design Name: 
// Module Name: bitwise_not
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


module bitwise_not(in, out);
    parameter width = 1;
    
    // Input
    input [width-1:0]    in;
    
    // Output
    output [width-1:0]   out;
    
    assign out = ~in;
endmodule
