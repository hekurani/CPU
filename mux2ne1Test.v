`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.01.2024 17:47:41
// Design Name: 
// Module Name: mux2ne1Test
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


module mux2ne1Test;
reg h1, h2, s;
    wire dalja;

    initial $monitor("hyrja1=%b, hyrja2=%b, sinjali=%b, dalja=%b", h1, h2, s, dalja);

    initial begin
        #0 h1 = 1'b0; h2 = 1'b0; s = 1'b0;
        #5 h1 = 1'b0; h2 = 1'b0; s = 1'b1;
        #5 h1 = 1'b0; h2 = 1'b1; s = 1'b0;
        #5 h1 = 1'b0; h2 = 1'b1; s = 1'b1;
        #5 h1 = 1'b1; h2 = 1'b0; s = 1'b0;
        #5 h1 = 1'b1; h2 = 1'b0; s = 1'b1;
        #5 h1 = 1'b1; h2 = 1'b1; s = 1'b0;
        #5 h1 = 1'b1; h2 = 1'b1; s = 1'b1;
        #5 $stop;
    end

    mux2ne1 test(h1, h2, s, dalja);
endmodule
