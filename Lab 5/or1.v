`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2021 10:24:31 PM
// Design Name: 
// Module Name: or1
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


module or1(out, in1, in2);
    // Input
    input  in1, in2;
    
    // Output
    output out;
    
    or or1(out, in1, in2);
endmodule
