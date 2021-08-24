`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2021 02:10:48 PM
// Design Name: 
// Module Name: nbit_mux
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


module nbit_mux(
    input [31:0]        S2_ReadData2_mux_in,
    input [31:0]        IMM_mux_in,
    input               dataSource,
    input               rst,
    output reg [31:0]   mux_out
    );
    
    always @ (*) begin
        if (rst) begin
            mux_out <= 32'b0;
        end
        else if (dataSource == 1) begin
            mux_out <= IMM_mux_in;
        end
        else begin
            mux_out <= S2_ReadData2_mux_in;
        end
    end
endmodule
