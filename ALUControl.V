module ALUControl(
input [1:0] ALUOp,
input [3:0] Funct,
input [3:0] opcode,
output reg[3:0] ALUCtrl
);

always @(ALUOp)
begin
case(ALUOp) // vlera e ALUOp, 00-l1,sw; 01-beq,bne, 10-R format, 11-Operacioni MUL
2'b00: ALUCtrl = 4'b0010; // LW ose SW(mbledhje)
2'b01: ALUCtrl = 4'b1010; // BEQ/BNE(zbritje)

2'b10: // R-Format
case(Funct)

4'b0000: ALUCtrl = 4'b0000; // AND
4'b0001: ALUCtrl = 4'b0001; // OR
4'b0010: ALUCtrl = 4'b0010; // ADD
4'b0011: ALUCtrl = 4'b1010; // SUB
4'b0100: ALUCtrl = 4'b0011; // SLT
4'b0110: ALUCtrl = 4'b0101; // XOR
4'b0111: ALUCtrl = 4'b0110; // SLL

2'b11: // MUL operation
case(opcode)
4'b0110: ALUCtrl = 4'b0100; // MUL

endcase
endcase
end

endmodule

