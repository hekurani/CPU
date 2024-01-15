`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.01.2024 23:58:53
// Design Name: 
// Module Name: CPU_TEST
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


module CPU_Test();

reg Clock;

integer i;
initial
begin
    Clock = 0;
    for(i=0; i<4; i=i+1)
    begin
        #5     Clock = 0;
        #5     Clock = 1;
    end
    
    #5      $stop;
end

CPU cpu(Clock);

endmodule