`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2024 15:34:30
// Design Name: 
// Module Name: DataMemoryTest
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


module DataMemoryTest;
reg Clock,MemWrite,MemRead;
reg [15:0] Adresa;
reg[15:0] WD;
wire[15:0] ReadData;
initial
begin
#5 Clock=1'b0;
#5 MemWrite=1'b1;Adresa=16'd10;WD=16'h1234;MemRead=1'b0;
#5 Clock=1'b1;
#5 Clock=1'b0;MemWrite=1'b0;
#5 MemRead=1'b1; Adresa=16'd10;
#5 $stop;
end
DataMemory dm(WD,Clock,Adresa,MemWrite,MemRead,ReadData);

endmodule

