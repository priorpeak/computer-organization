`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2021 07:01:46 PM
// Design Name: 
// Module Name: verification_connector
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


module verification_connector(out, selector, a, b, c_in);
    parameter width = 1;
    
    // Inputs
    input [width-1:0]       a, b;
    input                   c_in, selector;
    
    // Outputs
    output [width-1:0]      out;
    
    assign {out} = selector ? a + b + c_in : ~b;
endmodule
