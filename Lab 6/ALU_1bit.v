`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2021 08:05:11 PM
// Design Name: 
// Module Name: ALU_1bit
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


module ALU_1bit(c_out, result, a, b, select);
    // Inputs
    input               a, b;
    input [2:0]         select;
    
    // Outputs
    output reg          c_out;
    output reg          result;
    
    // Wire for subtractor input
    wire                not_b;
    
    // Wires for output
    wire                mov_out, not_out, and_out, or_out, slt_out;
    
    // Instantiations for operations
    
    // mov
    mov1  moovywoovy(mov_out, a);
    
    // not
    not1  nottywotty(not_out, a);
    
    // and
    and1  andywandy(and_out, a, b);
    
    // or
    or1   orywory(or_out, a, b);
    
    // slt
    slt1  slt(slt_out, a, b);
    
    always @ (*)
        case (select)
            3'b001:     begin
                            result = mov_out;
                            c_out = 1'b0;
                        end
            3'b000:     begin
                            result = not_out;
                            c_out = 1'b0;
                        end
            3'b100:     begin
                            result = and_out;
                            c_out = 1'b0;
                        end
            3'b011:     begin
                            result = or_out;
                            c_out = 1'b0;
                        end
            3'b111:     begin
                            result = slt_out;
                            c_out = 1'b0;
                        end
        endcase
endmodule
