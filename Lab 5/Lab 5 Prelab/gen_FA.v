`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2021 09:40:35 PM
// Design Name: 
// Module Name: gen_FA
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


module gen_FA(c_out, sum, a, b, c_in);

    parameter               width = 0;		
    
    input [width-1:0]		a, b, sum;
    input                   c_in; //declare inputs a, b and c_in, 1 bit each
    output	                c_out; //declare outputs c_out and sum, 1 bit each
    
    wire [width:0]          c; // wire for c_in/out
    wire [width-1:0]        d; // wire for sum
        
    genvar i;
    generate
    for (i=0; i<width; i=i+1) begin: FA_gen
        FA_str addyWaddy(c[i+1], d[i], a[i], b[i], c[i]);
        end
    endgenerate
    
    assign sum = d;
    assign c_out = c[width-1];
    assign c[0] = c_in;

endmodule
