`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2024 20:30:10
// Design Name: 
// Module Name: SRATest
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


module SRATest;
reg[15:0] A;
reg[15:0] B;
reg[3:0] shamt;
wire[15:0] out;
initial $monitor("A=%d,B=%d,shamt=%b,out=%d",A,B,shamt,out);

initial begin
#0 A=16'b00000000000000010;B=16'b000000000000000000;shamt=4'b0001;
#5 $stop;

end
SRA test(A,B,shamt,out);



endmodule
