`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2024 00:44:04
// Design Name: 
// Module Name: xOr
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


module xorGate(
input A, input B, output out
    );
wire joA;
wire joB;
wire cout;
assign joA= ~A;
assign joB =~B;
    
    
assign out = (joA & B) | (joB & A);
endmodule