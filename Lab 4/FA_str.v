`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:39:18 09/28/2013 
// Design Name: 
// Module Name:    FA_str 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`define D	0		// define the delay

module FA_str(c_out, sum, a, b, c_in);

input	 a, b, c_in;
output c_out, sum;
wire	 ha1_sum, ha1_cout, ha2_cout; 

HA_str	M1		(ha1_cout, ha1_sum, a, b);
HA_str	M2		(ha2_cout, sum, ha1_sum, c_in);

or		#`D		or1	(c_out, ha1_cout, ha2_cout);

endmodule
