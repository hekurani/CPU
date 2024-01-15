`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2024 18:04:27
// Design Name: 
// Module Name: SRA
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


module SRA(
  input [15:0] A,
  input [15:0] B,
  input [3:0] shiftAmount,
  output reg [15:0] out
);

  always @* begin
    out = A; // Initialize out with A

    if (shiftAmount[0] == 1'b1)
      out = {1'b0, out[15:1]}; // Adjusted part-select: 14:0 instead of 0:14

    if (shiftAmount[1] == 1'b1)
      out = {2'b00,out[14:1]}; // Adjusted part-select: 13:0 instead of 0:13

    if (shiftAmount[2] == 1'b1)
      out = {4'b0000,out[12:1] };

    if (shiftAmount[3] == 1'b1)
      out = {8'b00000000,  out[8:1]};
  end

endmodule
