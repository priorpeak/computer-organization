`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2021 08:14:39 PM
// Design Name: 
// Module Name: gen_dff
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


module gen_dff(q, d, clk);
    parameter width = 0;
    
    // Inputs
    input [width-1:0]   d;
    input               clk;
    
    // Output
    output [width-1:0]  q;
    
    wire [width-1:0]    a;
    
    genvar i;
    generate
    for (i=0; i<width; i=i+1) begin
        dff flippityflop(a[i], d[i], clk);
        end
    endgenerate
    
    assign q = a;
        
endmodule
