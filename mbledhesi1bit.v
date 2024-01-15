`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2024 00:19:39
// Design Name: 
// Module Name: mbledhesi1bit
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


module Mbledhesi1bit(
input  A,
input B,
input CIN,
output COUT,
output S);
wire teli1Dhe,teli2Dhe,teli3Dhe;
assign S=A^B^CIN;
assign teli1Dhe=A&B;
assign teli2Dhe=B&CIN;
assign teli3Dhe=A&CIN;
assign COUT=teli1Dhe | teli2Dhe|teli3Dhe;
endmodule
