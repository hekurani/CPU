module ControlUnit(
  input [3:0] OPCODE, // Input from D_OUT_1 for 16-bit CPU
  output reg RegDst,
  output reg Branch,
  output reg MemRead,
  output reg MemToReg,
  output reg[1:0] ALUOp,
  output reg ALUSrc,
  output reg RegWrite
);

always @(OPCODE)
begin
  casez(OPCODE) 

    4'b0110: // AND, OR, ADD, SUB, SLT, XOR, SLL
      begin
        RegDst = 1'b1;
        ALUSrc = 1'b0;
        MemToReg = 1'b0;
        RegWrite = 1'b1;
        MemRead = 1'b0;
        ALUOp = 2'b10;
        Branch = 1'b0;
      end

    4'b1000: // MUL (Assuming a different condition for MUL)
      begin
        RegDst = 1'b1;
        ALUSrc = 1'b0;
        MemToReg = 1'b0;
        RegWrite = 1'b1;
        MemRead = 1'b0;
        ALUOp = 2'b11;
        Branch = 1'b0;
      end

    4'b0001: // ADDI
      begin
        RegDst = 1'b0;
        ALUSrc = 1'b1;
        MemToReg = 1'b0;
        RegWrite = 1'b1;
        MemRead = 1'b0;
        ALUOp = 2'b00;
        Branch = 1'b0;
      end

    4'b0010: // LS
      begin
        RegDst = 1'b0;
        ALUSrc = 1'b1;
        MemToReg = 1'b1;
        RegWrite = 1'b1;
        MemRead = 1'b1;
        ALUOp = 2'b00;
        Branch = 1'b0;
      end

    4'b0011: // SS
      begin
        RegDst = 1'b0;
        ALUSrc = 1'b1;
        MemToReg = 1'b0;
        RegWrite = 1'b0;
        MemRead = 1'b0;
        ALUOp = 2'b00;
        Branch = 1'b0;
      end

    4'b0100: // BEQ
      begin
        RegDst = 1'b0;
        ALUSrc = 1'b0;
        MemToReg = 1'b0;
        RegWrite = 1'b0;
        MemRead = 1'b0;
        ALUOp = 2'b01;
        Branch = 1'b1;
      end

    default: // Default case
      begin
        RegDst = 1'b0;
        ALUSrc = 1'b0;
        MemToReg = 1'b0;
        RegWrite = 1'b0;
        MemRead = 1'b0;
        ALUOp = 2'b00;
        Branch = 1'b0;
      end
  endcase
end

endmodule
