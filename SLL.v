`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2024 14:13:55
// Design Name: 
// Module Name: SLL
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


module SLL(
  input [15:0] A,
  input [15:0] B,
  input [3:0] shiftAmount,
  output reg [15:0] out
);

  always @* begin
    out = A; // Initialize out with A

    if (shiftAmount[0] == 1'b1)
      out = {out[14:0], 1'b0}; // Adjusted part-select: 14:0 instead of 0:14

    if (shiftAmount[1] == 1'b1)
      out = {out[13:0], 2'b00}; // Adjusted part-select: 13:0 instead of 0:13

    if (shiftAmount[2] == 1'b1)
      out = {out[11:0], 4'b0000};

    if (shiftAmount[3] == 1'b1)
      out = {out[7:0], 8'b00000000};
  end

endmodule
