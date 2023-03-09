`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2023 04:21:15 PM
// Design Name: 
// Module Name: lab6-q2
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

module hexEncode(input [3:0] bin, output wire [7:0] hex);

  wire A,B,C,D;

  assign A = bin[3];
  assign B = bin[2];
  assign C = bin[1];
  assign D = bin[0];


    assign hex[7] = 1;
    assign hex[6] = (~A & ~B & ~C & ~D) | (~A & ~B & ~C & D) | (~A & B & C & D);
    assign hex[5] = (~A & ~B & ~C & D) | (~A & ~B & C & ~D) | (~A & ~B & C & D) | (~A & B & C & D) | (A & B & ~C & D);
    assign hex[4] = (~A & ~B & ~C & D) | (~A & ~B & C & D) | (~A & B & ~C & ~D) | (~A & B & ~C & D) | (~A & B & C & D) | (A & ~B & ~C & D);
    assign hex[3] = (~A & ~B & ~C & D) | (~A & B & ~C & ~D) | (~A & B & C & D) | (A & ~B & C & ~D) | (A & B & C & D);
    assign hex[2] = (~A & ~B & C & ~D) | (A & B & ~C & ~D) | (A & B & C & ~D) | (A & B & C & D);
    assign hex[1] = (~A & B & ~C & D) |  (~A & B & C & ~D) | (A & ~B & C & D) |  (A & B & ~C & ~D) | (A & B & C & ~D) |  (A & B & C & D);
  assign hex[0] = (~A & B & ~C & ~D) | (A & ~B & C & D) | (A & B & ~C & D) | (~A&~B&~C&D);
endmodule

module tld(
input [15:0] sw,
output [7:0] D0_seg, D1_seg,
output [3:0] D0_a, D1_a
);

hexEncode h1(sw[3:0], D1_seg);
assign D1_a = 4'b1110;
endmodule
