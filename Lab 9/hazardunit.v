module hazardunit(IFIDWrite,PCWrite,HazardMux, ReadReg1, ReadReg2, MemReadEx, RegDestMuxOut, HazardMux);

	output 	IFIDWrite, PCWrite, HazardMux;
	input [4:0] RegDestMuxOut, ReadReg1, ReadReg2;
	input MemReadEx;
	
//	wire oneAheadHazard, twoAheadHazard;
	
	// One-ahead hazard
//	assign oneAheadHazard = (EX_RegDst && ((RegDestMuxOut == ReadReg1) || (RegDestMuxOut == ReadReg2))) ? 1 : 0;
	
	// Two-ahead hazard
//	assign twoAheadHazard = (MEM_RegWrite && ((RegDestMuxOut != ReadReg1 && MemDest == ReadReg1) || (RegDestMuxOut != ReadReg2 && MemDest == ReadReg2))) ? 1 : 0;
		
    // Load-use hazard
   assign IFIDWrite = (MemReadEx && (RegDestMuxOut == ReadReg1 || RegDestMuxOut == ReadReg2)) ? 0 : 1;
   assign PCWrite = (MemReadEx && (RegDestMuxOut == ReadReg1 || RegDestMuxOut == ReadReg2)) ? 0 : 1;
   assign HazardMux = (MemReadEx && (RegDestMuxOut == ReadReg1 || RegDestMuxOut == ReadReg2)) ? 1 : 0;

endmodule
