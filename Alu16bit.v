`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2024 11:04:23
// Design Name: 
// Module Name: Alu16bit
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




module Alu16bit(
    input [15:0] A,
    input [15:0] B,
    input BNegate,
    input [2:0] ALUCtrl,
    input [3:0] Shamt,
    output Zero,
    output  Overflow,
    output reg [15:0] REZ,
    output   CarryOut
);

    wire [14:0] COUT;
    wire[15:0] SLLW;
     wire[15:0] SRAW;
      wire[15:0] SLTIW;
      wire[15:0] AluRez;
            ALU1 ALU0 (A[0], B[0], BNegate, BNegate, REZ[15], ALUCtrl, AluRez[0], COUT[0]);
            ALU1 ALU1 (A[1], B[1], COUT[0], BNegate, 1'b0, ALUCtrl, AluRez[1], COUT[1]);
            ALU1 ALU2 (A[2], B[2], COUT[1], BNegate, 1'b0, ALUCtrl, AluRez[2], COUT[2]);
            ALU1 ALU3 (A[3], B[3], COUT[2], BNegate, 1'b0, ALUCtrl, AluRez[3], COUT[3]);
            ALU1 ALU4 (A[4], B[4], COUT[3], BNegate, 1'b0, ALUCtrl, AluRez[4], COUT[4]);
            ALU1 ALU5 (A[5], B[5], COUT[4], BNegate, 1'b0, ALUCtrl, AluRez[5], COUT[5]);
            ALU1 ALU6 (A[6], B[6], COUT[5], BNegate, 1'b0, ALUCtrl, AluRez[6], COUT[6]);
            ALU1 ALU7 (A[7], B[7], COUT[6], BNegate, 1'b0, ALUCtrl, AluRez[7], COUT[7]);
            ALU1 ALU8 (A[8], B[8], COUT[7], BNegate, 1'b0, ALUCtrl, AluRez[8], COUT[8]);
            ALU1 ALU9 (A[9], B[9], COUT[8], BNegate, 1'b0, ALUCtrl, AluRez[9], COUT[9]);
            ALU1 ALU10 (A[10], B[10], COUT[9], BNegate, 1'b0, ALUCtrl, AluRez[10], COUT[10]);
            ALU1 ALU11 (A[11], B[11], COUT[10], BNegate, 1'b0, ALUCtrl, AluRez[11], COUT[11]);
            ALU1 ALU12 (A[12], B[12], COUT[11], BNegate, 1'b0, ALUCtrl, AluRez[12], COUT[12]);
            ALU1 ALU13 (A[13], B[13], COUT[12], BNegate, 1'b0, ALUCtrl, AluRez[13], COUT[13]);
            ALU1 ALU14 (A[14], B[14], COUT[13], BNegate, 1'b0, ALUCtrl, AluRez[14], COUT[14]);
            ALU1 ALU15 (A[15], B[15], COUT[14], BNegate, 1'b0, ALUCtrl, AluRez[15], CarryOut);
   

    assign Overflow = COUT[14] ^ CarryOut;
   SRA sraTest(A, 16'b0, Shamt, SRAW);
    SLTI sltiTest(A, B, SLTIW);
     SLL sllTest(A, 16'b0, Shamt, SLLW);

 always @* begin
        if (ALUCtrl == 3'b111) 
            REZ = SRAW;
        else if (ALUCtrl == 3'b001) 
            REZ = SLTIW;
        else if (ALUCtrl == 3'b110) 
            REZ = SLLW;
        else
            REZ = AluRez;
    end

          assign Zero = ~(
        REZ[0] | REZ[1] | REZ[2] | REZ[3] |
        REZ[4] | REZ[5] | REZ[6] | REZ[7] |
        REZ[8] | REZ[9] | REZ[10] | REZ[11] |
        REZ[12] | REZ[13] | REZ[14] | REZ[15]
    );
endmodule