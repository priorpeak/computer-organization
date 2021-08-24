`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:12:43 10/16/2015 
// Design Name: 
// Module Name:    S2_Register 
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
module S2_Register(
	input clk,
	input rst,
	input [31:0] Reg_ReadData1,
	input [31:0] Reg_ReadData2,
	input [4:0] S1_WriteSelect,
	input S1_WriteEnable,
	input [31:0] immediate,
	input dataSource,
	input [2:0] ALUOP,
	output reg [31:0] S2_ReadData1,
	output reg [31:0] S2_ReadData2,
	output reg [4:0] S2_WriteSelect,
	output reg S2_WriteEnable,
	output reg [31:0] immediate_out,
	output reg dataSource_out,
	output reg [2:0] ALUOP_out
   );

	always@(posedge clk)
		begin
		if (rst)
			begin
                S2_ReadData1	<= 32'd0;
                S2_ReadData2	<= 32'd0;
                S2_WriteSelect  <= 5'd0;
                S2_WriteEnable  <= 1'b0;
                immediate_out   <= 32'b0;
                dataSource_out  <= 1'b0;
                ALUOP_out       <= 3'b0;
			end
		else
			begin
                S2_ReadData1	<= Reg_ReadData1;
                S2_ReadData2	<= Reg_ReadData2;
                S2_WriteSelect  <= S1_WriteSelect;
                S2_WriteEnable  <= S1_WriteEnable;
                immediate_out   <= immediate;
                dataSource_out  <= dataSource;
                ALUOP_out       <= ALUOP;
			end
		end

endmodule

