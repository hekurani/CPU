module ControlUnit(
input [3:0] OPCODE, // Hyrja nga D_OUT_1
output reg RegDst,  // Daljet e CU, CU_OUT_X
output reg Branch,
output reg MemRead,
output reg MemToReg,
output reg[1:0] ALUOp,
output reg ALUSrc,
output reg RegWrite
);

always @(OPCODE)
begin
case(OPCODE) // R format

4'b0110: // AND,OR,ADD,SUB,SLT,XOR,SLL
begin
assign RegDst = 1'b1;
assign ALUSrc = 1'b0;
assign MemToReg = 1'b0;
assign RegWrite = 1'b1;
assign MemRead = 1'b0;
assign MemWrite = 1'b0;
assign ALUOp = 2'b10;
assign Branch = 1'b0;
end

4'b0110: // MUL
begin
assign RegDst = 1'b1;
assign ALUSrc = 1'b0;
assign MemToReg = 1'b0;
assign RegWrite = 1'b1;
assign MemRead = 1'b0;
assign MemWrite = 1'b0;
assign ALUOp = 2'b11;
assign Branch = 1'b0;
end

4'b0001: //ADDI
begin
assign RegDst = 1'b0;
assign ALUSrc = 1'b1;
assign MemToReg = 1'b0;
assign RegWrite = 1'b1;
assign MemRead = 1'b0;
assign MemWrite = 1'b0;
assign ALUOp = 2'b00;
assign Branch = 1'b0;
end

4'b0010: //LS
begin
assign RegDst = 1'b0;
assign ALUSrc = 1'b1;
assign MemToReg = 1'b1;
assign RegWrite = 1'b1;
assign MemRead = 1'b1;
assign MemWrite = 1'b0;
assign ALUOp = 2'b00;
assign Branch = 1'b0;
end

4'b0011: //SS
begin
assign RegDst = 1'b0;
assign ALUSrc = 1'b1;
assign MemTOReg = 1'b0;
assign RegWrite = 1'b0;
assign MemRead = 1'b0;
assign MemWrite = 1'b1;
assign ALUOp = 2'b00;
assign Branch = 1'b0;
end

4'b0100: //BEQ
begin
assign RegDst = 1'b0;
assign ALUSrc = 1'b0;
assign MemToReg = 1'b0;
assign RegWrite = 1'b0;
assign MemRead = 1'b0;
assign MemWrite = 1'b0;
assign ALUOp = 2'b01;
assign Branch = 1'b1;

endcase

end

endmodule
