`timescale 1ns / 1ns


module ALU(
    a,
    b,
	 func,
    out,
    zero_flag
    );


	 parameter size = 32;
	 
    input [size-1:0] a;
    input [size-1:0] b;
	 input [3:0] func;
    output reg [size-1:0] out;
    output reg zero_flag;
	 
	 	
	always @(*) begin
	case (out) 
	0: zero_flag = 1'b1;
	default: zero_flag = 1'b0;
	endcase
	end
	
	always @(*) begin
		if (func == 4'd0) 
		  out = a+b;                      // add/addi/mov
		else if (func == 4'd1)
		  out = a-b;                      // sub/subi
		else if (func == 4'd2)
		  out = a&b;                      // and/andi
		else if (func == 4'd3)
		  out = a|b;                      // or/ori
		else if (func == 4'd4)
		  out = ~(a|b);                   // nor/not
		else if (func == 4'd5)
		  out = (a < b) ? 1'b1 : 1'b0;    // slt/slti
		else if (func == 4'd6)
		  out = 0;                        // branch
		else if (func == 4'd7)
		  out = (a == b) ? 1'b1 : 1'b0;   // bne
		else if (func == 4'd8) begin
		  out[size-1:size-16] = b;        // lui
		  out[size-17:0] = 16'd0;
		end else
		  out = 0;
   end



endmodule
