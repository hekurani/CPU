`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2024 16:42:40
// Design Name: 
// Module Name: InstructionMemoryTest
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


module InstructionMemoryTest;

    reg [15:0] PC;
    wire [15:0] instruction;

    InstrMemory inst(PC, instruction);

    initial begin
        #0 PC = 16'd10;
        #10 $stop;
    end

endmodule
