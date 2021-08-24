`timescale 1ns / 1ns


module tb_cpu;

	// Inputs
	reg rst;
	reg clk;
	reg initialize;
	reg [31:0] instruction_initialize_data;
	reg [31:0] instruction_initialize_address;

	// Instantiate the Unit Under Test (UUT)
	cpu uut (
		.rst(rst), 
		.clk(clk), 
		.initialize(initialize), 
		.instruction_initialize_data(instruction_initialize_data), 
		.instruction_initialize_address(instruction_initialize_address)
	);

	initial begin
		// Initialize Inputs
		rst = 1;
		clk = 0;
		initialize = 1;
		instruction_initialize_data = 0;
		instruction_initialize_address = 0;

		#100
     
      
  
		instruction_initialize_address = 0;
		instruction_initialize_data = 32'b000000_00000_00010_00001_00000_10_0000;      // ADD R1, R0, R2
		#20
		instruction_initialize_address = 4;
		instruction_initialize_data = 32'b000000_00100_00100_01000_00000_10_0010;      // SUB R8, R4, R4
		#20
		instruction_initialize_address = 8;
		instruction_initialize_data = 32'b000000_00101_00110_00111_00000_10_0101;      // OR R7, R5, R6
		#20
		instruction_initialize_address = 12;
		instruction_initialize_data = 32'b101011_00000_01001_00000_00000_00_1100;      // SW R9, 12(R0)
		#20
		instruction_initialize_address = 16;
		instruction_initialize_data = 32'b100011_00000_01100_00000_00000_00_1100;      // LW R12, 12(R0)
		#20	
        instruction_initialize_address = 20;
		instruction_initialize_data = 32'b000100_00000_00001_00000_00000_00_0001;      // BEQ R0, R1, 1
		#20
		instruction_initialize_address = 24;
		instruction_initialize_data = 32'b000000_00101_00110_00111_00000_10_0101;      // OR R8, R4, R7
		#20
		instruction_initialize_address = 28;
		instruction_initialize_data = 32'b001000_00011_00001_00000_00000_01_0100;      // ADDI R1, R3, 20
		#20
		instruction_initialize_address = 32;
		instruction_initialize_data = 32'b001001_00001_00010_00000_00000_00_1010;      // SUBI R2, R1, 10
		#20
		instruction_initialize_address = 36;
		instruction_initialize_data = 32'b001101_00101_00101_00000_00000_00_0000;      // ORI R5, R5, 0
		#20
		instruction_initialize_address = 40;
		instruction_initialize_data = 32'b001100_00110_00110_11111_11111_11_1111;      // ANDI R6, R6, 16'b1111111111111111
		#20
		instruction_initialize_address = 44;
		instruction_initialize_data = 32'b100000_00110_00101_00000_00000_00_0000;      // MOV R5, R6
		#20
		instruction_initialize_address = 48;
		instruction_initialize_data = 32'b000000_00001_00001_00110_00000_10_0111;      // NOT R6, R1, R1
		#20
		instruction_initialize_address = 52;
		instruction_initialize_data = 32'b000000_00011_00010_01000_00000_10_1010;      // SLT R8, R3, R2
		#20	
        instruction_initialize_address = 56;
		instruction_initialize_data = 32'b000101_10001_10001_11111_11111_11_1111;      // BNE R17, R17, -1
		#20	
        instruction_initialize_address = 60;
		instruction_initialize_data = 32'b001010_00100_01000_00000_00000_11_0010;      // SLTI R8, R4, 50
		#20	
        instruction_initialize_address = 64;
		instruction_initialize_data = 32'b001111_00000_00010_11111_00000_00_0000;      // LUI R2, 63488
		#20	
        instruction_initialize_address = 68;
		instruction_initialize_data = 32'b000000_00100_00000_00000_00000_00_1000;      // JR R4
		#20	
        instruction_initialize_address = 72;
		instruction_initialize_data = 32'b000010_00000_00000_00000_00000_11_1100;      // J 60


        #50

		
		initialize = 0;
		rst = 0;
		
	end
      
always
#5 clk = ~clk;
endmodule

