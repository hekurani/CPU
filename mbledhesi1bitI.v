`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.01.2024 22:41:30
// Design Name: 
// Module Name: mbledhesi1bitI
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



module mbledhesi1bitI(
    input[15:0] rs, // A
    input[15:0] immediate, // mB
input CIN,
output COUT,
output S
    );
    wire teli1Dhe,teli2Dhe,teli3Dhe;
assign S=rs^immediate^CIN;
assign teli1Dhe=rs&immediate;
assign teli2Dhe=immediate&CIN;
assign teli3Dhe=rs&CIN;
assign COUT=teli1Dhe | teli2Dhe|teli3Dhe;
endmodule
