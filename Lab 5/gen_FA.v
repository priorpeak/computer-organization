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


module gen_FA(c_out, sum, a, b);

    parameter               size = 0;		
    
    input [size-1:0]		a, b, sum;
    output	                c_out; //declare outputs c_out and sum, 1 bit each
    
    wire [size-1:0]          c; // wire for c_in/out
    wire [size-1:0]        d; // wire for sum
        
    genvar i;
    generate
    for (i=0; i<size; i=i+1) begin: FA_gen
        FA_str addyWaddy(c[i+1], d[i], a[i], b[i], c[i]);
        end
    endgenerate
    
    assign sum = d;
    assign c_out = c[size-1];
    assign c[0] = 0;

endmodule
