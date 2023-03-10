`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2023 04:51:36 PM
// Design Name: 
// Module Name: lab6-q3
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


module q3(
input [15:0] sw,
input [3:0] btn,
output [7:0] D0_seg, D1_seg,
output [3:0] D0_a, D1_a
);
// implement wires for segemnt components
wire [7:0] seg0, seg1, seg2, seg3;
hexEncode h0(sw[3:0], seg0);
hexEncode h1(sw[7:4], seg1);
hexEncode h2(sw[11:8], seg2);
hexEncode h3(sw[15:12], seg3);

//Use ternary operators to select position from buttons
assign D1_seg = btn[3] ? seg3 : btn[2] ? seg2 : btn[1] ? seg1 : btn[0] ? seg0 : 8'b11111111;

assign D1_a  = btn[3] ? 4'b0111 : btn[2] ? 4'b1011 : btn[1] ? 4'b1101 : btn[0] ? 4'b1110 : 4'b1111;

endmodule
