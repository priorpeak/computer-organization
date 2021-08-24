`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2021 12:33:26 PM
// Design Name: 
// Module Name: Regfile_tb
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


module Regfile_tb;
parameter data_width = 32;
parameter select_width = 5; 

// Inputs
reg write_enable;
reg [data_width-1:0] write_data;
reg [4:0] read_sel_1;
reg [4:0] read_sel_2;
reg [4:0] write_select;
reg rst;
reg clk;

// Outputs
wire [31:0] read_data_1;
wire [31:0] read_data_2;

nbit_register_file Register_File(
    .write_data(write_data),
    .read_data_1(read_data_1),
    .read_data_2(read_data_2),
    .read_sel_1(read_sel_1),
    .read_sel_2(read_sel_2),
    .write_address(write_select),
    .RegWrite(write_enable),
    .rst(rst)
);

// Define clk
always #5 assign clk = ~clk;

initial begin
		// Initialize Inputs
		rst = 1;
		clk = 0;
        
        #10;
        rst = 0;
        read_sel_1 = 4'b0001;
        read_sel_2 = 4'b0010;
        write_data = 32'h0000000b;
        write_select = 4'b0011;
        write_enable = 1'b1;
        // R1 = 0, R2 = 0, R3 = a
        
        #10;
        rst = 0;
        read_sel_1 = 4'b0011;
        read_sel_2 = 4'b0010;
        write_data = 32'h0000000c;
        write_select = 4'b0100;
        write_enable = 1'b1;
        // R3 = a, R2 = 0, R4 = b
        

end

endmodule
