`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:16:02 09/28/2013 
// Design Name: 
// Module Name:    HA_str 
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
`define	D		0	// definition of the delay

module HA_str(c_out, sum, a, b);

input		a, b;
output	c_out, sum;
wire		not_a, not_b, a_notb, b_nota;

and	#`D	and1		(c_out, a, b);		// for c_our

not	    	not1		(not_a, a);					//
not	   	not2		(not_b, b);					//
														//	for sum
and	#`D	and2		(a_notb, a, not_b);		//
and	#`D	and3		(b_nota, b ,not_a);		//
or		#`D	or1		(sum, a_notb, b_nota);	//

endmodule
