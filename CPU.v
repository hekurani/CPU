`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.01.2024 11:31:02
// Design Name: 
// Module Name: CPU
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


 module CPU(
    input Clock
    );

wire [3:0] opcode;
wire RegDst, Branch, MemRead, MemWrite, RegWrite, MemToReg, ALUSrc;
wire [1:0] ALUOp;

Datapath DP(Clock, RegDst, Branch, MemRead, MemWrite, RegWrite, MemToReg, ALUSrc, ALUOp, opcode);

ControlUnit CU(opcode, RegDst, Branch, RegWrite, MemToReg, MemRead, MemWrite, ALUSrc, ALUOp);

endmodule