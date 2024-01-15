`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.01.2024 17:57:07
// Design Name: 
// Module Name: mux8ne1Test
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


module mux8ne1_Test;
reg h1;reg h2; reg h3; reg h4; reg h5; reg h6; reg h7; reg h8;
reg [2:0] s;
wire dalja;


initial $monitor("h1=%b,h2=%b,h3=%b,h4=%b,h5=%b,h6=%b,h7=%b,h8=%b,s=%b,out=%b ",
h1,h2,h3,h4,h5,h6,h7,h8,s,dalja);


initial begin
#0 h1=1'b0;h2=1'b0;h3=1'b0;h4=1'b1;h5=1'b0;h6=1'b0;h7=1'b0;h8=1'b0;s=3'b011;
#5 h1=1'b0;h2=1'b0;h3=1'b0;h4=1'b1;h5=1'b0;h6=1'b0;h7=1'b1;h8=1'b0;s=3'b110;
#5 h1=1'b0;h2=1'b0;h3=1'b0;h4=1'b1;h5=1'b0;h6=1'b0;h7=1'b1;h8=1'b1;s=3'b111;
#5 $stop;
end


mux8ne1 test(h1,h2,h3,h4,h5,h6,h7,h8,s,dalja);

endmodule