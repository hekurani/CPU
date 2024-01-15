`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2024 00:36:20
// Design Name: 
// Module Name: ALU1bit
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


module ALU1(
	input A,
	input B,
	input CIN,
      input BNegate,
	input Less,
	input [2:0] ALUOp,
	output Result,
	output CarryOut
	);
	
	wire JoB,JoA,mB,mA,dhe_teli,ose_teli,mb_teli,xOrteli,SRA,SLL,addI;

	
	assign JoB= ~B;
    assign JoA=~A;
 	mux2ne1 muxB(B,JoB,BNegate,mB);
    assign dhe_teli= A & mB;
	assign ose_teli= A | mB;
	xorGate xOR(A,B,xOrteli);
	Mbledhesi1bit m1(A,mB,CIN,CarryOut,mb_teli);
	mbledhesi1bitI m2(A,mB,CIN,CarryOut,addI);
	mux8ne1 MuxiKryesor(dhe_teli,ose_teli,mb_teli,addI,xOrteli,Less,ALUOp,Result);

endmodule
