`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2021 08:47:18 PM
// Design Name: 
// Module Name: ALU_32bit
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


module ALU_32bit(c_out, result, a, b, select);
    parameter size = 32;
    
    // Inputs
    input [size-1:0]    a, b;
    input [2:0]         select;
    
    // Outputs
    output reg c_out;
    output reg [size-1:0]   result;
        
    // Wire for subtractor input
    wire [size-1:0]     not_b;
    
    // Wire for output
    wire [size-1:0]     ALU_c_out, sub_out, add_out, ALU_out;
    
    // Adder/subber c_outs
    wire [size:0]       add_c_out, sub_c_out;
    
    // Wire for register with 3 extra bits for overflow
//    wire [size-1:0]     reg_out;
    
    // Wires for overflow, zero, or carry out output from register
//    wire                overflow_flag, zero_flag, carryout_flag;
    
    // Instantiate adder
    gen_FA #(size)      addywaddy(add_c_out, add_out, a, b);
    
    // Instantiate subtractor
    assign not_b = ~b;
    sub1   #(size)      subbywubby(sub_c_out, sub_out, a, not_b);

    // Instantiate size-bit ALU
    genvar i;
    generate
    for (i=0; i<size; i=i+1) begin: ALU_gen
        ALU_1bit arithmetickywicky_logickywogicky_unit(ALU_c_out[i], ALU_out[i], a[i], b[i], select);
    end
    endgenerate
        
    always @ (*)
        case (select)
            6:     begin
                             result = a - b;
                             c_out = sub_c_out;
                        end
            5:     begin
                             result = a + b;
                             c_out = add_c_out;
                        end
            default:
                        begin
                            c_out = 1'b0;
                            result = ALU_out;
                        end
        endcase
endmodule
