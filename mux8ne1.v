`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.01.2024 17:50:09
// Design Name: 
// Module Name: mux8ne1
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


module mux8ne1(
input wire h1 , //000 and
    input wire h2, //010 or
    input wire h3, //100 add-sub
    input wire h4, //101 addyI-subI8
//    input wire h5, //111 SRA
    input wire h6, //011 xOr
    input wire h7,//110 Less
//    input wire h8, //001 SLTI
    input wire [2:0] s,
    output wire dalja
    );
    assign dalja = s[2]? (s[1]?(!s[0]&h7):(s[0]?h4:h3)):(s[1]?(s[0]?h6:h2):(s[0]?1'bX:h1));  

endmodule
