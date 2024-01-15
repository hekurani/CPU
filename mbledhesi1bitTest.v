`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2024 00:22:31
// Design Name: 
// Module Name: mbledhesi1bitTest
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


module Adder1BitTest;
reg A; reg B; reg cin;
wire sum;wire cout;

initial 
$monitor ("A=%b,B=%b,Cin=%b,Sum=%b,Cout=%b",A,B,cin,sum,cout);

initial begin 
#0 A=1'b0;B=1'b0;cin=1'b0;
#1 A=1'b0;B=1'b0;cin=1'b1;
#1 A=1'b0;B=1'b1;cin=1'b0;
#1 A=1'b0;B=1'b1;cin=1'b1;
#1 A=1'b1;B=1'b0;cin=1'b0;
#1 A=1'b1;B=1'b0;cin=1'b1;
#1 A=1'b1;B=1'b1;cin=1'b0;
#1 A=1'b1;B=1'b1;cin=1'b1;

#1 $stop;
end

Mbledhesi1bit test(.A(A),.B(B),.CIN(cin),.COUT(cout),.S(sum));
endmodule