`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2021 11:01:45 PM
// Design Name: 
// Module Name: S3_Register
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


module S3_Register(
	input clk,
	input rst,
	input [4:0] S2_WriteSelect,
	input S2_WriteEnable,
	input [31:0] ALU_out,
	output reg [4:0] S3_WriteSelect,
	output reg S3_WriteEnable,
	output reg [31:0] S3_ALU_out
   );

	always@(posedge clk)
		begin
		if (rst)
			begin
                S3_WriteSelect <= 5'd0;
                S3_WriteEnable <= 1'b0;
                S3_ALU_out     <= 32'd0;
			end
		else
			begin
                S3_WriteSelect <= S2_WriteSelect;
                S3_WriteEnable <= S2_WriteEnable;
                S3_ALU_out     <= ALU_out;
			end
		end

endmodule

