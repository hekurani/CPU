`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2024 16:24:08
// Design Name: 
// Module Name: registerFile
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


module registerFile(
    input [1:0] RS,
    input [1:0] RT,
    input [1:0] RD,
    input [15:0] WD,
    output  [15:0] ReadRS,
    output  [15:0] ReadRT,
    input RegWrite,
    input Clock
);

    reg [15:0] Registers[3:0];

    always @(posedge Clock) begin
        if (RegWrite) Registers[RD] <= WD;
    end

    assign ReadRS = Registers[RS];
    assign ReadRT = Registers[RT];

endmodule
