`timescale 1ns / 1ns

module control(
		input [5:0] instruction,
		output reg [3:0] ALUOp,
		output reg MemRead,
		output reg MemtoReg,
		output reg RegDst,
		output reg Branch, 
		output reg ALUSrc,
		output reg MemWrite,
		output reg RegWrite
		);


always @(*) begin
		if (instruction == 6'b00_0000) begin				//RType
            ALUOp = 4'b0000;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            RegDst = 1'b1;
            Branch = 1'b0;		
            ALUSrc = 1'b0;
            MemWrite = 1'b0;
            RegWrite = 1'b1;
		end else if (instruction == 6'b00_0100) begin   //branch
            ALUOp = 4'b0001;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            RegDst = 1'b0;
            Branch = 1'b1;		
            ALUSrc = 1'b0;
            MemWrite = 1'b0;
            RegWrite = 1'b0;
		end else if (instruction == 6'b10_1011) begin   // sw
            ALUOp = 4'b0010;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            RegDst = 1'b0;
            Branch = 1'b0;		
            ALUSrc = 1'b1;
            MemWrite = 1'b1;
            RegWrite = 1'b0;
		end else if (instruction == 6'b10_0011) begin   // lw
            ALUOp = 4'b0010;
            MemRead = 1'b1;
            MemtoReg = 1'b1;
            RegDst = 1'b0;
            Branch = 1'b0;		
            ALUSrc = 1'b1;
            MemWrite = 1'b0;
            RegWrite = 1'b1;
		end else if (instruction == 6'b00_1000) begin  // addi
		    ALUOp = 4'b0010;
		    MemRead = 1'b0;
		    MemtoReg = 1'b0;
		    RegDst = 1'b0;
		    Branch = 1'b0;
		    ALUSrc = 1'b1;
		    MemWrite = 1'b0;
		    RegWrite = 1'b1;
		end else if (instruction == 6'b00_1001) begin  // subi
		    ALUOp = 4'b0001;
		    MemRead = 1'b0;
		    MemtoReg = 1'b0;
		    RegDst = 1'b0;
		    Branch = 1'b0;
		    ALUSrc = 1'b1;
		    MemWrite = 1'b0;
		    RegWrite = 1'b1;
		end else if (instruction == 6'b00_1101) begin  // ori
		    ALUOp = 4'b0011;
		    MemRead = 1'b0;
		    MemtoReg = 1'b0;
		    RegDst = 1'b0;
		    Branch = 1'b0;
		    ALUSrc = 1'b1;
		    MemWrite = 1'b0;
		    RegWrite = 1'b1;
		end else if (instruction == 6'b00_1010) begin  // slti
		    ALUOp = 4'b0100;
		    MemRead = 1'b0;
		    MemtoReg = 1'b0;
		    RegDst = 1'b0;
		    Branch = 1'b0;
		    ALUSrc = 1'b1;
		    MemWrite = 1'b0;
		    RegWrite = 1'b1;
		end else if (instruction == 6'b00_1100) begin  // andi
		    ALUOp = 4'b0101;
		    MemRead = 1'b0;
		    MemtoReg = 1'b0;
		    RegDst = 1'b0;
		    Branch = 1'b0;
		    ALUSrc = 1'b1;
		    MemWrite = 1'b0;
		    RegWrite = 1'b1;
		end else if (instruction == 6'b00_0010) begin  // j
		    ALUOp = 4'b0110;
		    MemRead = 1'b0;
		    MemtoReg = 1'b0;
		    RegDst = 1'b0;
		    Branch = 1'b1;
		    ALUSrc = 1'b0;
		    MemWrite = 1'b0;
		    RegWrite = 1'b0;
//		end else if (instruction == 6'b00_1000) begin  // jr
//		    ALUOp = 4'b0110;
//		    MemRead = 1'b0;
//		    MemtoReg = 1'b0;
//		    RegDst = 1'b0;
//		    Branch = 1'b1;
//		    ALUSrc = 1'b0;
//		    MemWrite = 1'b0;
//		    RegWrite = 1'b0;
		end else if (instruction == 6'b00_0101) begin  // bne
		    ALUOp = 4'b0111;
		    MemRead = 1'b0;
		    MemtoReg = 1'b0;
		    RegDst = 1'b0;
		    Branch = 1'b1;
		    ALUSrc = 1'b0;
		    MemWrite = 1'b0;
		    RegWrite = 1'b0;
		end else if (instruction == 6'b00_1111) begin  // lui
		    ALUOp = 4'b1000;
		    MemRead = 1'b0;
		    MemtoReg = 1'b0;
		    RegDst = 1'b0;
		    Branch = 1'b0;
		    ALUSrc = 1'b1;
		    MemWrite = 1'b0;
		    RegWrite = 1'b1;
		end else if (instruction == 6'b10_0000) begin  // mov
		    ALUOp = 4'b0010;
		    MemRead = 1'b0;
		    MemtoReg = 1'b0;
		    RegDst = 1'b0;
		    Branch = 1'b0;
		    ALUSrc = 1'b1;
		    MemWrite = 1'b0;
		    RegWrite = 1'b1;
		end else begin
            ALUOp = 4'b0000;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            RegDst = 1'b0;
            Branch = 1'b0;		
            ALUSrc = 1'b0;
            MemWrite = 1'b0;
            RegWrite = 1'b0;
		end
	
	
end
endmodule
