`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2021 04:25:26 PM
// Design Name: 
// Module Name: FA_4b_tb
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


module FA_4b_tb(

    );
    
    // inputs
    reg [3:0] a;
    reg [3:0] b;
    reg c_in;
    
    reg clk;
    
    // outputs
    wire c_out;
    wire [3:0] sum;
    wire c_out_verify;
	wire [3:0] sum_verify;
	wire error_flag;
    
    // instantiate 4 bit full adder
    FA_4b FA1(
        .c_out(c_out),
        .sum(sum),
        .a(a),
        .b(b),
        .c_in(c_in)
    );
    
    // Verification module
	Verification_4bit verificationfourbit(.a(a), .b(b), .c_in(c_in), .c_out(c_out_verify), .sum(sum_verify));
    
    // Assign Error_flag
	assign error_flag = (c_out != c_out_verify || sum != sum_verify);
	
	// Verification logic
	always@(posedge clk)
		begin
		if(error_flag)
			$display("Error occurs when a = %d, b = %d, c_in = %d\n", a, b, c_in);
		end
		
	// Derfine clk signal for Verfication purpose
	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		
		a = 4'b0000;
		b = 4'b0000;
		c_in = 0;
	end
	
	integer i;
	always @(a or b)
		begin
		for (i = 0; i < 16 * 16; i = i + 1) 
			#10 {a, b} = i; 
			
		#50 $stop;

	end
endmodule
