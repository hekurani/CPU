`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2024 11:02:38
// Design Name: 
// Module Name: ALu16bitTest
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

//module ALU16Test;
//reg [15:0] A;
//reg [15:0] B;
//reg [2:0] ALUOp;
//reg BInvert;
//reg[3:0] Shamt;
//wire Zero;
//wire Overflow;
//wire  CarryOut;
//wire [15:0] Result;
//initial 
//$monitor("A=%b,B=%b,ALUOp=%b,BInvert=%b,zero=%b,overflow=$b,carryout=%b,result=%b",
//A,B,ALUOp,BInvert,Zero,Overflow,CarryOut,Result);


//initial begin

////and
//#0 A=16'd10; B=16'd15;ALUOp=3'b000;
//BInvert=1'b0;Shamt=4'b0000;

////or
//#5 A=16'd11; B=16'd14;ALUOp=3'b010;
//BInvert=1'b0;Shamt=4'b0000;

////add
//#5 A=16'd12; B=16'd14;ALUOp=3'b100;
//BInvert=1'b0;Shamt=4'b0000;

////sub
//#5 A=16'd12; B=16'd14;ALUOp=3'b100;
//BInvert=1'b1;Shamt=4'b0000;

////addi
//#5 A=16'd12; B=16'd14;ALUOp=3'b101;
//BInvert=1'b0;Shamt=4'b0000;

////subi
//#5 A=16'd12; B=16'd14;ALUOp=3'b101;
//BInvert=1'b1;Shamt=4'b0000;

////xor
//#5 A=16'd12; B=16'd14;ALUOp=3'b011;
//BInvert=1'b0;Shamt=4'b0000;

////SRA
//#5 A=16'd12; B=16'd0;Shamt=4'b0001;ALUOp=3'b111;
//BInvert=1'b0;


////SLL
//#5 A=16'd12; B=16'd0;Shamt=4'b0001;ALUOp=3'b110;
//BInvert=1'b0;

////SLTI
//#5 A=16'd12; B=16'd0;ALUOp=3'b001;
//BInvert=1'b0;Shamt=4'b0000;

//#5 $stop;
//end

//Alu16bit test(A,B,BInvert,ALUOp,Shamt,
//Zero,Overflow,Result,CarryOut);
//endmodule

module ALU16Test;
  reg [15:0] A;
  reg [15:0] B;
  reg [2:0] ALUOp;
  reg BInvert;
  reg [3:0] Shamt;
  wire Zero;
  wire Overflow;
  wire CarryOut;
  wire [15:0] Result;

  initial
    $monitor("A=%b,B=%b,ALUOp=%b,BInvert=%b,zero=%b,overflow=$b,carryout=%b,result=%b",
             A, B, ALUOp, BInvert, Zero, Overflow, CarryOut, Result);

  initial begin
    // AND
    #10 A = 16'd10; B = 16'd15; ALUOp = 3'b000; BInvert = 1'b0; Shamt = 4'b0000;

    // OR
    #15 A = 16'd11; B = 16'd14; ALUOp = 3'b010; BInvert = 1'b0; Shamt = 4'b0000;

    // ADD
    #15 A = 16'd14; B = 16'd12; ALUOp = 3'b100; BInvert = 1'b0; Shamt = 4'b0000;

    // SUB
    #15 A = 16'd14; B = 16'd12; ALUOp = 3'b100; BInvert = 1'b1; Shamt = 4'b0000;

    // ADDI
    #15 A = 16'd12; B = 16'd14; ALUOp = 3'b101; BInvert = 1'b0; Shamt = 4'b0000;

    // SUBI
    #15 A = 16'd14; B = 16'd12; ALUOp = 3'b101; BInvert = 1'b1; Shamt = 4'b0000;

    // XOR
    #15 A = 16'd12; B = 16'd14; ALUOp = 3'b011; BInvert = 1'b0; Shamt = 4'b0000;

    // SRA
    #15 A = 16'd12; B = 16'd0; Shamt = 4'b0001; ALUOp = 3'b111; BInvert = 1'b0;

    // SLL
    #15 A = 16'd12; B = 16'd0; Shamt = 4'b0001; ALUOp = 3'b110; BInvert = 1'b0;

    // SLTI
    #15 A = 16'd0; B = 16'd1; ALUOp = 3'b001; BInvert = 1'b0; Shamt = 4'b0000;

    #15 $stop;
  end

  Alu16bit test(A, B, BInvert, ALUOp, Shamt, Zero, Overflow, Result, CarryOut);
endmodule

