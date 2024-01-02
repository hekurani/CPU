module ALU1(
	input A,
	input B,
	input CIN,
      input BNegate
	input Less,
	input [1:0] ALUOp,
	output Result,
	output CarryOut
	);
	
	wire JoB,mB, dhe_teli,ose_teli,mb_teli;

	
	assign JoB= ~B;

 	mux2ne1 muxB(B,JoB,BNegate,mB);

	assign dhe_teli= A & mB;
	assign ose_teli= A | mB;

	Mbledhesi m1(A,mB,CIN,mb_teli,CarryOut);
	mux4ne1 MuxiKryesor(dhe_teli,ose_teli,mb_teli,Less,ALUOp,Result);

endmodule
