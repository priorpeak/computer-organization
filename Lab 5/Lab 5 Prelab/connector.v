`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2021 06:14:46 PM
// Design Name: 
// Module Name: connector
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


module connector(out, a, b, c_in, clk, selector);
    parameter width = 1;
    
    // Inputs
    input [width-1:0]       a, b;
    input                   c_in, clk, selector;
    
    // Outputs
    output [width-1:0]      out;
    
    wire [width-1:0]        c_out, dff_out, bitwise_not_out, sum_out;               // Wire for c_out, dff, bitwise-not, fa
        
    gen_dff #(width) flippyfloppy(dff_out, sum_out, clk);       // parameterized dff
    gen_FA #(width) addywaddy(c_out, sum_out, a, b, c_in);      // parameterized full adder
    bitwise_not #(width) nottywotty(b, bitwise_not_out);                       // parameterized bit-wise not
    
    assign out = selector ? sum_out : bitwise_not_out;
endmodule
