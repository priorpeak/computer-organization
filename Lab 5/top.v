`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2021 07:35:02 PM
// Design Name: 
// Module Name: top
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


module top(reg_out, overflow_flag, carryout_flag, zero_flag, c_out, result, a, b, select, clk);
    parameter size32 = 32;
    parameter size16 = 16;
    parameter size5 = 5;
    parameter size3 = 3;
    parameter size1 = 1;
    
    // Inputs
    input [size32-1:0]      a, b;
    input [2:0]             select;
    input                   clk;
    
    // Outputs
    output                  c_out, zero_flag, overflow_flag, carryout_flag;
    output [size32-1:0]     result, reg_out;
    
    // Instantiate Stage 1 Registers
    gen_dff #(size5)        S1_RS1(reg_out, result, clk);
    gen_dff #(size5)        S1_RS2(
    
    // Instantiate 32-bit ALU
    ALU_32bit #(size32)     ALU(c_out, result, a, b, select);
    
    assign zero_flag = (result == 0);
    assign overflow_flag = ((a[size32-1] == b[size32-1] && result[size32-1] != a[size32-1] && (select == 3'b110)) || ((a[size32-1] != b[size32-1]) && (b[size32-1] == result[size32-1]) && (select == 3'b101)));
    assign carryout_flag = (c_out == 1);
    
endmodule
