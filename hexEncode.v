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
