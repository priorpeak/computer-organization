`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2021 08:53:40 PM
// Design Name: 
// Module Name: gen_dff_tb
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


module gen_dff_tb();
    parameter width = 10;
    // Inputs
    reg [width-1:0]     d;
    reg                 clk;
    
    // Output
    wire [width-1:0]    q;
    
    // Instantiate generator module
    gen_dff #(width) uut(.q(q), .d(d), .clk(clk));
    
    initial begin
		// Initialize Inputs
		d = 0;
		clk = 0;
		#100;
		d = 1;
        #10;
		d= 0;
		#50;
		d=1;
		#150;
		d=0;
	end
      
always
#5 clk = ~clk;
endmodule
