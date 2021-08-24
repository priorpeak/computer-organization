`timescale 1ns / 1ns

module tb_ALU;
    parameter size32 = 32;
    
    // Inputs
	reg [size32-1:0]     a;
	reg [size32-1:0]     b;
	reg [2:0]          select;
	reg clk;

	// Outputs
	wire c_out;
	wire [size32-1:0]    result, reg_out;
	wire               c_out_verify;
	wire [size32-1:0]    result_verify;
	wire               error_flag, overflow_flag, carryout_flag, zero_flag;

    // Instantiate 32-bit ALU
    ALU_32bit #(size32)     ALU(c_out, result, a, b, select);
    
    assign zero_flag = (result == 0);
    assign overflow_flag = ((a[size32-1] == b[size32-1] && result[size32-1] != a[size32-1] && (select == 3'b110)) || ((a[size32-1] != b[size32-1]) && (b[size32-1] == result[size32-1]) && (select == 3'b101)));
    assign carryout_flag = (c_out == 1);
	
	ALU_verification #(size32) Verification (
		.c_out(c_out_verify), 
		.result(result_verify), 
		.a(a), 
		.b(b), 
		.select(select)
	);
	
//	 Assign Error_flag
	assign error_flag = (c_out != c_out_verify || result != result_verify);
	
//	 Verification logic
	always @ (a, b, select)
	    begin
		if(error_flag)
			$display("Error occurs when a = %d, b = %d, c_in = %d\n", a, b, select);
		end
		

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		select = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		//Move
		#20;
		a = 343455;
		b = 10;
		select = 0;
		
		//NOT
		#20;
		a = 7;
		b = 0;
		select = 1;
		
		//ADD
		#20;
		a = 32'b11111111111111111111111111111110;
		b = 1;
		select = 6;
		
		#20;
		a = 32'b11111111111111111111111111111111;
		b = 1;
		select = 6;
		
		#20;
		a = 78;
		b = 3432;
		select = 6;

		#20;
		a = -6;
		b = 5;
		select = 6;
		
		//SUB
		#20;
		a = 10;
		b = 10;
		select = 5;
		
//		#20;
//		a = 7;
//		b = 10;
//		select = 5;
		
//		#20;
//		a = 52;
//		b = 3;
//		select = 5;

//		#20;
//		a = 8003434;
//		b = 452;
//		select = 5;
		
		//OR
		#20;
		a = 3423;
		b = 1000;
		select = 4;
		
		//AND
		#20;
		a = 4463;
		b = 2122;
		select = 3;
		
		//SLT
		#20;
		a = 1000;
		b = 2000;
		select = 7;
	end
	
      always
	#5 clk = ~clk;
	
endmodule

