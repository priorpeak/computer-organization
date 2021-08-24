`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:46:47 09/28/2013
// Design Name:   FA_str
// Module Name:   D:/2013 Projects/EC413/Discussion/Week 5/demo/adder/FA_str_test.v
// Project Name:  adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FA_str
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FA_str_test;

	// Inputs
	reg a;
	reg b;
	reg c_in;

	// Outputs
	wire c_out;
	wire sum;

	// Instantiate the Unit Under Test (UUT)
	FA_str uut (
		.c_out(c_out), 
		.sum(sum), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		c_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		
		a = 0;
		b = 0;
		c_in = 0;
		
		#20;
		
		a = 0;
		b = 0;
		c_in = 1;
		
		#20;
		
		a = 0;
		b = 1;
		c_in = 0;
		
		#20;
		
		a = 1;
		b = 1;
		c_in = 0;
		
		#20;
		
		a = 0;
		b = 1;
		c_in = 1;
		
		#20;
		
		
		
		a = 1;
		b = 0;
		c_in = 0;
		
		#20;
		
		a = 1;
		b = 0;
		c_in = 1;
		
		#20;
		
		
		
		a = 1;
		b = 1;
		c_in = 1;
		
		#20;
		
		a = 0;
		b = 0;
		c_in = 0;
		
		
		#100;
		  
		
        
		// Add stimulus here

	end
      
endmodule

