`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2021 10:26:06 PM
// Design Name: 
// Module Name: gen_FA_tb
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


module gen_FA_tb();
    parameter width = 5;
    // Inputs
	reg [width-1:0]    a;
	reg [width-1:0]    b;
	reg c_in;

	// Outputs
	wire               c_out;
	wire [width-1:0]   sum;

	// Instantiate the Unit Under Test (UUT)
	gen_FA #(width) uut (
		.c_out(c_out), 
		.sum(sum), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 10;
		c_in = 0;
		#100;
	end
      
	always
        #10	{a,b,c_in} = {a,b,c_in}+1;
endmodule
