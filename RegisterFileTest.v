`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2024 16:38:32
// Design Name: 
// Module Name: RegisterFileTest
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


module registerFileTest;

reg[1:0] RS, RT, RD;
reg RegWrite, Clock;
reg[15:0] WriteData;
wire[15:0] ReadRS, ReadRT;

initial
begin
#0 Clock=1'b0;
#5 RD=2'd1; WriteData = 16'd5; RegWrite=1'b1;
#5 Clock=1'b1;
#5 Clock=1'b0;RegWrite = 1'b0;
#5 RD=2'd2; WriteData = 16'd7; RegWrite=1'b1;
#5 Clock=1'b1;
#5 Clock=1'b0; RegWrite=1'b0;
#5 RS=2'd1; RT=2'd2;
#5 $stop;
end

registerFile RF(RS, RT, RD, WriteData, ReadRS, ReadRT,RegWrite, Clock);

endmodule

