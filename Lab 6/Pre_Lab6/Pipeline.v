`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:19:01 10/16/2015 
// Design Name: 
// Module Name:    Pipeline 
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
module Pipeline(
	input clk,
	input rst,
	input [31:0] InstrIn,
	output reg [31:0] final_ALU_out
   );
   
   parameter size32 = 32;


	// The naming format for wire: Source_Destination_portname
	wire [31:0] ALUOut;
	wire ALU_c_out;
	wire [31:0] mux_out;

	// Stage 1 Wires
    wire [4:0] S1_Reg_ReadSelect1;
	wire [4:0] S1_Reg_ReadSelect2;
	
	// Stage 1 -> Stage 2 Direct Connection Wires
	wire [31:0] S1_S2_IMM;
	wire S1_S2_dataSource;
	wire [4:0] S1_S2_WriteSelect;
	wire S1_S2_WriteEnable;
	wire [2:0] S1_S2_ALUOP;
	
	// Register File Wires
	wire [31:0] Reg_S2_ReadData1;
	wire [31:0] Reg_S2_ReadData2;
	
	// Stage 2 Wires
    wire [31:0] S2_ReadData1;
    wire [31:0] S2_ReadData2;
	wire [31:0] S2_IMM;
	wire S2_dataSource;
	wire [2:0] S2_ALUOP;
	
	// Stage 2 -> Stage 3 Direct Connection Wires
	wire [4:0] S2_S3_Reg_WriteSelect;
	wire S2_S3_Reg_WriteEnable;
	
	// Stage 3 Wires
	wire [31:0] S3_ALU_out;
	wire S3_WriteEnable;
	wire [4:0] S3_Write_Select;

    // Instantiate Register S1
	S1_Register S1_Reg(
		.clk(clk),
		.rst(rst),
		.InstrIn(InstrIn),
		.S1_ReadSelect1(S1_Reg_ReadSelect1),
		.S1_ReadSelect2(S1_Reg_ReadSelect2),
		.S1_WriteSelect(S1_S2_WriteSelect),
		.S1_WriteEnable(S1_S2_WriteEnable),
		.immediate(S1_S2_IMM),
		.dataSource(S1_S2_dataSource),
		.ALUOP(S1_S2_ALUOP)
   );

    // Instantiate n-bit Register File
	nbit_register_file Register_File (
		.write_data(S3_ALU_out),								
		.read_data_1(Reg_S2_ReadData1),
		.read_data_2(Reg_S2_ReadData2),
		.read_sel_1(S1_Reg_ReadSelect1),
		.read_sel_2(S1_Reg_ReadSelect2),
		.write_address(S3_Write_Select),
		.RegWrite(S3_WriteEnable),
		.clk(clk),
		.rst(rst)
	);
		
	// Instantiate Register S2
	S2_Register S2_Reg(
		.clk(clk),
		.rst(rst),
		.Reg_ReadData1(Reg_S2_ReadData1),
		.Reg_ReadData2(Reg_S2_ReadData2),
		.S1_WriteSelect(S1_S2_WriteSelect),
		.S1_WriteEnable(S1_S2_WriteEnable),
		.immediate(S1_S2_IMM),
		.dataSource(S1_S2_dataSource),
		.ALUOP(S1_S2_ALUOP),
		.S2_ReadData1(S2_ReadData1),
		.S2_ReadData2(S2_ReadData2),
		.S2_WriteSelect(S2_S3_Reg_WriteSelect),
		.S2_WriteEnable(S2_S3_Reg_WriteEnable),
		.immediate_out(S2_IMM),
		.dataSource_out(S2_dataSource),
		.ALUOP_out(S2_ALUOP)
   );
   
    // Instantiate Register S3
	S3_Register S3_Reg(
		.clk(clk),
		.rst(rst),
		.S2_WriteSelect(S2_S3_Reg_WriteSelect),
		.S2_WriteEnable(S2_S3_Reg_WriteEnable),
		.ALU_out(ALUOut),
		.S3_WriteSelect(S3_Write_Select),
		.S3_WriteEnable(S3_WriteEnable),
		.S3_ALU_out(S3_ALU_out)
   );

    // Instantiate n-bit Mux
    nbit_mux mux(
        .S2_ReadData2_mux_in(S2_ReadData2),
        .IMM_mux_in(S2_IMM),
        .dataSource(S2_dataSource),
        .rst(rst),
        .mux_out(mux_out)
    );
	
	// Instantiate ALU
	ALU_32bit ALU(
	   .c_out(ALU_c_out),
	   .result(ALUOut),
	   .a(S2_ReadData1),
	   .b(mux_out),
	   .select(S2_ALUOP)
    );
    
    always @ (*) begin
        final_ALU_out = S3_ALU_out;
    end

endmodule
