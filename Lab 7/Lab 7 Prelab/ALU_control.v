`timescale 1ns / 1ns

module ALU_control(
	 input [5:0] instruction,
	 input [3:0] ALUOp,
	 output reg [3:0] func,
	 output reg JR,
	 output reg J
    );

 always @(*) begin
	if (ALUOp == 4'b0000) begin
		if (instruction == 6'h20) begin
            func = 4'd0;
            JR = 1'b0;
            J = 1'b0;
		end else if (instruction == 6'h22) begin
            func = 4'd1;
            JR = 1'b0;
            J = 1'b0;
		end else if (instruction == 6'h24) begin
            func = 4'd2;
            JR = 1'b0;
            J = 1'b0;
		end else if (instruction == 6'h25) begin
            func = 4'd3;
            JR = 1'b0;
            J = 1'b0;
		end else if (instruction == 6'h27) begin
            func = 4'd4;
            JR = 1'b0;
            J = 1'b0;
	    end else if (instruction == 6'h2a) begin
            func = 4'd5;
            JR = 1'b0;
            J = 1'b0;
	    end else if (instruction == 6'h08) begin
            func = 4'd6;
            JR = 1'b1;
            J = 1'b0;
	    end else begin
            func = 4'd7;
            JR = 1'b0;
            J = 1'b0;
	end end else if (ALUOp == 4'b0001) begin   // branch/sub/subi
		func = 4'd1;
		JR = 1'b0;
        J = 1'b0;
	end else if (ALUOp == 4'b0010) begin   // mov/addi
		func = 4'd0;
		JR = 1'b0;
        J = 1'b0;
    end else if (ALUOp == 4'b0011) begin    // ori
        func = 4'd3;
		JR = 1'b0;
        J = 1'b0;
    end else if (ALUOp == 4'b0100) begin    // slti
        func = 4'd5;
		JR = 1'b0;
        J = 1'b0;
    end else if (ALUOp == 4'b0101) begin    // andi
        func = 4'd2;
		JR = 1'b0;
        J = 1'b0;
    end else if (ALUOp == 4'b0110) begin    // j
        func = 4'd6;
		JR = 1'b0;
        J = 1'b1;
    end else if (ALUOp == 4'b0111) begin    // bne
        func = 4'd7;
		JR = 1'b0;
        J = 1'b0;
    end else if (ALUOp == 4'b1000) begin    // lui
        func = 4'd8;
		JR = 1'b0;
        J = 1'b0;
    end else if (ALUOp == 4'b1001) begin    // not
        func = 4'd4;
		JR = 1'b0;
        J = 1'b0;
	end else begin
		func = 4'd9;
		JR = 1'b0;
        J = 1'b0;
	end
   end


endmodule
