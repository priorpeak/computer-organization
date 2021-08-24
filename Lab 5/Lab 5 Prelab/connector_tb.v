`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2021 06:48:22 PM
// Design Name: 
// Module Name: connector_tb
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


module connector_tb();
    parameter width = 5;

    // Inputs
    reg [width-1:0]     a, b;
    reg                 c_in, clk, selector;
    
    // Outputs
    wire [width-1:0]    out, verify_sum_out;
    
    // Instantiate a connector
    connector #(width) connectywecty(out, a, b, c_in, clk, selector);
    
    // Instantiate verification
    verification_connector #(width) verifywerify(verify_sum_out, selector, a, b, c_in);
    
    initial begin
        // Initialize Inputs
        clk = 0;
        a = 0;
        b = 0;
        c_in = 0;
        selector = 0;
        #100;
    end
      
    always
    #10    {a,b,c_in} = {a,b,c_in}+1;
      
    always
    #5 clk = ~clk;
    
    always
    #10 selector = ~selector;
endmodule
