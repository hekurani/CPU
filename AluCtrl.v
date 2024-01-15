`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.01.2024 10:44:43
// Design Name: 
// Module Name: AluCtrl
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


module ALUControl(
    input [1:0] ALUOp,
    input [1:0] Funct,
    output reg [3:0] Operation,
    input [3:0] OPCode
);

always @(*)
begin
    case(ALUOp)
        2'b00: Operation = 4'b0100; // ADD
        2'b01: Operation = 4'b1100; // SUB
        2'b10:
            case(Funct)
                2'b00: Operation = 4'b0000; // AND
                2'b01: Operation = 4'b0010; // OR
                2'b10: Operation = 4'b0011; // XOR
            endcase
        2'b11:
            case(OPCode)
                4'b0010:
                    begin
                        if (Funct == 2'b00) Operation = 4'b0110; // Some operation for 4'b0010 and FUNC = 2'b00
                        if (Funct == 2'b01) Operation = 4'b0111; // Some operation for 4'b0010 and FUNC = 2'b01
                    end
                4'b1001: Operation = 4'b0101; // ADDI
                4'b1010: Operation = 4'b1101; // SUBI
                4'b1011: Operation = 4'b0001; // SLTI
            endcase
    endcase
end

endmodule
