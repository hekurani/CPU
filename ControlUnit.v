`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.01.2024 11:00:02
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
    input [3:0] OPCODE,
    output reg RegDst,
    output reg Branch,
    output reg RegWrite,
    output reg MemToReg,
    output reg MemRead,
    output reg MemWrite,
    output reg ALUSrc,
    output reg [1:0] ALUOp
);

always @(OPCODE)
begin
    case(OPCODE)
        4'b0000:  // R-Format
            begin
                RegDst = 1'b1;
                ALUSrc = 1'b0;
                MemToReg = 1'b0;
                RegWrite = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                ALUOp = 2'b10;
                Branch = 1'b0;
            end

        4'b1001:  // ADDI
            begin
                RegDst = 1'b0;
                ALUSrc = 1'b1;
                MemToReg = 1'b0;
                RegWrite = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                ALUOp = 2'b11;
                Branch = 1'b0;
            end

        4'b1010:  // SUBI
            begin
                RegDst = 1'b0;
                ALUSrc = 1'b1;
                MemToReg = 1'b0;
                RegWrite = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                ALUOp = 2'b11;
                Branch = 1'b0;
            end

        4'b1011:  // SLTI
            begin
                RegDst = 1'b0;
                ALUSrc = 1'b1;
                MemToReg = 1'b0;
                RegWrite = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                ALUOp = 2'b11;
                Branch = 1'b0;
            end

        4'b1100:  // LW
            begin
                RegDst = 1'b0;
                ALUSrc = 1'b1;
                MemToReg = 1'b1;
                RegWrite = 1'b1;
                MemRead = 1'b1;
                MemWrite = 1'b0;
                ALUOp = 2'b00;
                Branch = 1'b0;
            end

        4'b1101:  // SW
            begin
                RegDst = 1'b0;
                ALUSrc = 1'b1;
                MemToReg = 1'b0;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b1;
                ALUOp = 2'b00;
                Branch = 1'b0;
            end

        4'b1111:  // BEQ
            begin
                RegDst = 1'b0;
                ALUSrc = 1'b0;
                MemToReg = 1'b0;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                ALUOp = 2'b01;
                Branch = 1'b1;
            end
    endcase
end

endmodule
