`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:34:40 10/16/2015
// Design Name:   Pipeline
// Module Name:   C:/Users/Ethan/Desktop/Pre_Lab6/Pre_Lab6/Pipeline_tb.v
// Project Name:  Pre_Lab6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Pipeline
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Pipeline_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [31:0] InstrIn;

	// Outputs
	wire [31:0] Out;

	// Instantiate the Unit Under Test (UUT)
	Pipeline uut (
		.clk(clk), 
		.rst(rst), 
		.InstrIn(InstrIn), 
		.final_ALU_out(Out)
	);

	// Define clk
	always #5 assign clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		InstrIn = 0;

		// Wait 10 ns for global reset to finish
		#10;
		rst = 0;
		InstrIn = 32'b011101_00001_00001_0000000000001010;				// Read out R1 and R2, write result to R2
		
		#10;
		InstrIn = 32'b011011_00010_00010_0000000000000010;				// Read out R3 and R4, write result to R4
		
		#10;
        InstrIn = 32'b000001_00000_00000_0000000000000000;                // Read out R2 and R0, write result to R1
        
        #10;
        InstrIn = 32'b000001_00000_00000_0000000000000000;                // Read out R2 and R0, write result to R1
        
        #10;
        InstrIn = 32'b000001_00000_00000_0000000000000000;                // Read out R2 and R0, write result to R1
        
        #10;
        InstrIn = 32'b000001_00000_00000_0000000000000000;                // Read out R2 and R0, write result to R1
		
		#10;
		InstrIn = 32'b010101_00011_00001_00010_00000000000;				// Read out R5 and R6, write result to R6
        
		#10;
		InstrIn = 32'b010110_00100_00001_00010_00000000000;				// Do nothing

	end
      
endmodule

