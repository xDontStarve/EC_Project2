//: version "1.8.7"

module EXE(ALUResult, PCNext, Zero, B, A, ExtendedSign, BranchTarget, ALUOperation);
//: interface  /sz:(142, 213) /bd:[ Ti0>ALUOperation[3:0](73/142) Li0>A[31:0](86/213) Li1>B[31:0](150/213) Ro0<Zero(57/213) Ro1<ALUResult[31:0](139/213) ]
input [31:0] B;    //: /sn:0 {0}(196,381)(238,381){1}
output Zero;    //: /sn:0 {0}(393,336)(336,336){1}
input [31:0] A;    //: /sn:0 {0}(197,344)(238,344){1}
input [3:0] ALUOperation;    //: /sn:0 {0}(283,277)(283,315){1}
output [31:0] ALUResult;    //: /sn:0 {0}(336,361)(391,361){1}
input [31:0] PCNext;    //: /sn:0 {0}(226,133)(283,133){1}
supply0 CarryIn;    //: /sn:0 /dp:1 {0}(244,85)(297,85)(297,125){1}
input [31:0] ExtendedSign;    //: /sn:0 {0}(229,165)(283,165){1}
output [31:0] BranchTarget;    //: /sn:0 {0}(405,149)(312,149){1}
wire Overflow;    //: /sn:0 /dp:1 {0}(297,173)(297,199)(351,199){1}
//: enddecls

  //: output g4 (ALUResult) @(388,361) /sn:0 /w:[ 1 ]
  //: input g8 (PCNext) @(224,133) /sn:0 /w:[ 0 ]
  //: output g3 (Zero) @(390,336) /sn:0 /w:[ 0 ]
  //: input g2 (B) @(194,381) /sn:0 /w:[ 0 ]
  //: input g1 (A) @(195,344) /sn:0 /w:[ 0 ]
  //: supply0 g10 (CarryIn) @(238,85) /sn:0 /R:3 /w:[ 0 ]
  add g6 (.A(ExtendedSign), .B(PCNext), .S(BranchTarget), .CI(CarryIn), .CO(Overflow));   //: @(299,149) /sn:0 /R:1 /w:[ 1 1 1 1 0 ]
  //: input g7 (ExtendedSign) @(227,165) /sn:0 /w:[ 0 ]
  //: output g9 (BranchTarget) @(402,149) /sn:0 /w:[ 0 ]
  //: input g5 (ALUOperation) @(283,275) /sn:0 /R:3 /w:[ 0 ]
  ALU g0 (.ALUOperation(ALUOperation), .B(B), .A(A), .Zero(Zero), .ALUResult(ALUResult));   //: @(239, 316) /sz:(96, 97) /sn:0 /p:[ Ti0>1 Li0>1 Li1>1 Ro0<1 Ro1<0 ]

endmodule

module ALU(B, ALUResult, ALUOperation, Zero, A);
//: interface  /sz:(96, 97) /bd:[ Ti0>ALUOperation[3:0](44/96) Li0>A[31:0](28/97) Li1>B[31:0](65/97) Ro0<ALUResult[31:0](45/97) Ro1<Zero(20/97) ]
input [31:0] B;    //: /sn:0 {0}(304,108)(191,108){1}
//: {2}(189,106)(189,90){3}
//: {4}(189,110)(189,171){5}
//: {6}(191,173)(305,173){7}
//: {8}(189,175)(189,273)(212,273){9}
output Zero;    //: /sn:0 {0}(656,238)(628,238){1}
input [31:0] A;    //: /sn:0 /dp:1 {0}(305,168)(167,168){1}
//: {2}(165,166)(165,105){3}
//: {4}(167,103)(304,103){5}
//: {6}(165,101)(165,90){7}
//: {8}(165,170)(165,239)(252,239){9}
supply0 [30:0] Massa;    //: /sn:0 /dp:1 {0}(406,297)(400,297)(400,284)(376,284){1}
input [3:0] ALUOperation;    //: /sn:0 {0}(484,89)(484,161){1}
//: {2}(484,162)(484,197){3}
//: {4}(484,198)(484,207){5}
output [31:0] ALUResult;    //: /sn:0 {0}(656,284)(590,284){1}
//: {2}(588,282)(588,238)(607,238){3}
//: {4}(586,284)(554,284){5}
wire [31:0] AsubB;    //: {0}(281,255)(356,255){1}
//: {2}(357,255)(421,255)(421,290)(525,290){3}
wire [31:0] NotBifSub;    //: /sn:0 {0}(233,271)(252,271){1}
wire neg;    //: /sn:0 /dp:1 {0}(357,259)(357,307)(406,307){1}
wire [31:0] AsltB;    //: {0}(412,302)(525,302){1}
wire sub;    //: /dp:1 {0}(479,198)(268,198){1}
//: {2}(264,198)(202,198)(202,268)(212,268){3}
//: {4}(266,200)(266,231){5}
wire [1:0] Selector;    //: /dp:1 {0}(488,162)(541,162)(541,261){1}
wire [31:0] AorB;    //: {0}(326,171)(432,171)(432,278)(525,278){1}
wire [31:0] AandB;    //: {0}(325,106)(441,106)(441,266)(525,266){1}
wire Overflow;    //: /sn:0 {0}(266,279)(266,309)(307,309){1}
//: enddecls

  and g4 (.I0(A), .I1(B), .Z(AandB));   //: @(315,106) /sn:0 /w:[ 5 0 0 ]
  //: joint g8 (B) @(189, 108) /w:[ 1 2 -1 4 ]
  //: joint g16 (B) @(189, 173) /w:[ 6 5 -1 8 ]
  or OR (.I0(A), .I1(B), .Z(AorB));   //: @(316,171) /sn:0 /w:[ 0 7 0 ]
  tran g3(.Z(Selector), .I(ALUOperation[1:0]));   //: @(482,162) /sn:0 /R:2 /w:[ 0 2 1 ] /ss:1
  add g2 (.A(NotBifSub), .B(A), .S(AsubB), .CI(sub), .CO(Overflow));   //: @(268,255) /sn:0 /R:1 /w:[ 1 9 0 5 0 ]
  //: input g1 (B) @(189,88) /sn:0 /R:3 /w:[ 3 ]
  //: output g18 (ALUResult) @(653,284) /sn:0 /w:[ 0 ]
  //: joint g10 (A) @(165, 103) /w:[ 4 6 -1 3 ]
  mux g6 (.I0(AandB), .I1(AorB), .I2(AsubB), .I3(AsltB), .S(Selector), .Z(ALUResult));   //: @(541,284) /sn:0 /R:1 /w:[ 1 1 3 1 1 5 ] /ss:1 /do:1
  //: input g9 (ALUOperation) @(484,87) /sn:0 /R:3 /w:[ 0 ]
  //: joint g7 (A) @(165, 168) /w:[ 1 2 -1 8 ]
  //: supply0 g12 (Massa) @(370,284) /sn:0 /R:3 /w:[ 1 ]
  xor g5 (.I0(sub), .I1(B), .Z(NotBifSub));   //: @(223,271) /sn:0 /w:[ 3 9 0 ]
  tran g14(.Z(neg), .I(AsubB[31]));   //: @(357,253) /sn:0 /R:1 /w:[ 0 1 2 ] /ss:1
  tran g11(.Z(sub), .I(ALUOperation[2]));   //: @(482,198) /sn:0 /R:2 /w:[ 0 4 3 ] /ss:0
  //: output g21 (Zero) @(653,238) /sn:0 /w:[ 0 ]
  nor g19 (.I0(ALUResult), .Z(Zero));   //: @(618,238) /sn:0 /w:[ 3 1 ]
  //: joint g20 (ALUResult) @(588, 284) /w:[ 1 2 4 -1 ]
  //: joint g15 (sub) @(266, 198) /w:[ 1 -1 2 4 ]
  //: input g0 (A) @(165,88) /sn:0 /R:3 /w:[ 7 ]
  concat g13 (.I0(neg), .I1(Massa), .Z(AsltB));   //: @(411,302) /sn:0 /w:[ 1 0 0 ] /dr:0

endmodule

module BRegs32x32(Read2, Write, Read1, Data2, Data1, clr, clk, RegWrite, WriteData);
//: interface  /sz:(147, 182) /bd:[ Ti0>clr(66/147) Ti1>clr(66/147) Ti2>clr(66/147) Ti3>clr(66/147) Ti4>clr(66/147) Ti5>clr(66/147) Ti6>clr(66/147) Ti7>clr(66/147) Ti8>clr(66/147) Li0>Read1[4:0](32/182) Li1>Read2[4:0](72/182) Li2>Write[4:0](108/182) Li3>WriteData[31:0](148/182) Li4>WriteData[31:0](148/182) Li5>Write[4:0](108/182) Li6>Read2[4:0](72/182) Li7>Read1[4:0](32/182) Li8>Read1[4:0](32/182) Li9>Read2[4:0](72/182) Li10>Write[4:0](108/182) Li11>WriteData[31:0](148/182) Li12>Read1[4:0](32/182) Li13>Read2[4:0](72/182) Li14>Write[4:0](108/182) Li15>WriteData[31:0](148/182) Li16>WriteData[31:0](148/182) Li17>Write[4:0](108/182) Li18>Read2[4:0](72/182) Li19>Read1[4:0](32/182) Li20>Read1[4:0](32/182) Li21>Read2[4:0](72/182) Li22>Write[4:0](108/182) Li23>WriteData[31:0](148/182) Li24>Read1[4:0](32/182) Li25>Read2[4:0](72/182) Li26>Write[4:0](108/182) Li27>WriteData[31:0](148/182) Li28>WriteData[31:0](148/182) Li29>Write[4:0](108/182) Li30>Read2[4:0](72/182) Li31>Read1[4:0](32/182) Li32>Read1[4:0](32/182) Li33>Read2[4:0](72/182) Li34>Write[4:0](108/182) Li35>WriteData[31:0](148/182) Bi0>clk(108/147) Bi1>RegWrite(40/147) Bi2>RegWrite(40/147) Bi3>clk(108/147) Bi4>clk(108/147) Bi5>RegWrite(40/147) Bi6>clk(108/147) Bi7>RegWrite(40/147) Bi8>RegWrite(40/147) Bi9>clk(108/147) Bi10>clk(108/147) Bi11>RegWrite(40/147) Bi12>clk(108/147) Bi13>RegWrite(40/147) Bi14>RegWrite(40/147) Bi15>clk(108/147) Bi16>clk(108/147) Bi17>RegWrite(40/147) Ro0<Data1[31:0](47/182) Ro1<Data2[31:0](139/182) Ro2<Data2[31:0](139/182) Ro3<Data1[31:0](47/182) Ro4<Data1[31:0](47/182) Ro5<Data2[31:0](139/182) Ro6<Data1[31:0](47/182) Ro7<Data2[31:0](139/182) Ro8<Data2[31:0](139/182) Ro9<Data1[31:0](47/182) Ro10<Data1[31:0](47/182) Ro11<Data2[31:0](139/182) Ro12<Data1[31:0](47/182) Ro13<Data2[31:0](139/182) Ro14<Data2[31:0](139/182) Ro15<Data1[31:0](47/182) Ro16<Data1[31:0](47/182) Ro17<Data2[31:0](139/182) ]
output [31:0] Data2;    //: /sn:0 {0}(668,485)(668,472)(669,472)(669,445){1}
input [4:0] Write;    //: /sn:0 {0}(-238,-38)(-138,-38)(-138,-37)(-66,-37){1}
//: {2}(-65,-37)(-28,-37){3}
//: {4}(-27,-37)(-16,-37){5}
input [31:0] WriteData;    //: /sn:0 {0}(669,157)(669,75)(481,75){1}
//: {2}(477,75)(292,75){3}
//: {4}(288,75)(89,75){5}
//: {6}(85,75)(-104,75)(-104,73)(-237,73){7}
//: {8}(87,77)(87,157){9}
//: {10}(290,77)(290,107)(291,107)(291,152){11}
//: {12}(479,77)(479,157){13}
output [31:0] Data1;    //: /sn:0 {0}(59,382)(59,465){1}
supply1 w21;    //: /sn:0 {0}(82,3)(57,3)(57,-11){1}
input clr;    //: /sn:0 {0}(721,193)(731,193)(731,-83)(543,-83){1}
//: {2}(539,-83)(355,-83){3}
//: {4}(351,-83)(150,-83){5}
//: {6}(146,-83)(-44,-83)(-44,-92)(-235,-92){7}
//: {8}(148,-81)(148,193)(139,193){9}
//: {10}(353,-81)(353,188)(343,188){11}
//: {12}(541,-81)(541,193)(531,193){13}
input RegWrite;    //: /sn:0 {0}(-237,263)(-71,263){1}
//: {2}(-67,263)(171,263){3}
//: {4}(175,263)(370,263){5}
//: {6}(374,263)(552,263)(552,219)(556,219){7}
//: {8}(372,261)(372,219)(383,219){9}
//: {10}(173,261)(173,214)(183,214){11}
//: {12}(-69,261)(-69,219)(-38,219){13}
input clk;    //: /sn:0 {0}(556,214)(542,214)(542,285)(364,285){1}
//: {2}(362,283)(362,214)(383,214){3}
//: {4}(360,285)(167,285){5}
//: {6}(165,283)(165,209)(183,209){7}
//: {8}(163,285)(-56,285){9}
//: {10}(-58,283)(-58,214)(-38,214){11}
//: {12}(-60,285)(-237,285){13}
input [4:0] Read1;    //: {0}(-237,96)(-208,96)(-208,95)(-124,95){1}
//: {2}(-123,95)(-96,95){3}
//: {4}(-95,95)(-78,95){5}
input [4:0] Read2;    //: {0}(-237,145)(-141,145){1}
//: {2}(-140,145)(-123,145)(-123,144)(-94,144){3}
//: {4}(-93,144)(-79,144){5}
wire [1:0] w6;    //: /sn:0 {0}(36,369)(-123,369)(-123,99){1}
wire w16;    //: /sn:0 {0}(39,205)(-50,205)(-50,39)(88,39)(88,19){1}
wire w4;    //: /sn:0 {0}(112,19)(112,46)(370,46)(370,205)(431,205){1}
wire [31:0] w3;    //: /sn:0 {0}(77,353)(77,334)(659,334)(659,228){1}
wire [31:0] R2;    //: {0}(65,353)(65,319)(469,319)(469,228){1}
wire [31:0] w0;    //: /sn:0 {0}(651,416)(651,398)(105,398)(105,228){1}
wire w22;    //: /sn:0 {0}(404,217)(431,217){1}
wire w20;    //: /sn:0 {0}(124,19)(124,29)(556,29)(556,205)(621,205){1}
wire [2:0] w19;    //: /sn:0 {0}(431,169)(419,169)(419,109){1}
//: {2}(421,107)(606,107)(606,169)(621,169){3}
//: {4}(417,107)(297,107)(297,106)(231,106){5}
//: {6}(227,106)(25,106){7}
//: {8}(21,106)(-95,106)(-95,99){9}
//: {10}(23,108)(23,169)(39,169){11}
//: {12}(229,108)(229,164)(243,164){13}
wire [2:0] w18;    //: /sn:0 {0}(431,180)(402,180)(402,125){1}
//: {2}(404,123)(589,123)(589,180)(621,180){3}
//: {4}(400,123)(279,123)(279,122)(212,122){5}
//: {6}(208,122)(8,122){7}
//: {8}(4,122)(-93,122)(-93,139){9}
//: {10}(6,124)(6,180)(39,180){11}
//: {12}(210,124)(210,175)(243,175){13}
wire w23;    //: /sn:0 {0}(577,217)(621,217){1}
wire [1:0] w10;    //: /sn:0 {0}(-140,149)(-140,432)(646,432){1}
wire [2:0] w24;    //: /sn:0 {0}(431,193)(381,193)(381,141){1}
//: {2}(383,139)(568,139)(568,193)(621,193){3}
//: {4}(379,139)(260,139)(260,138)(195,138){5}
//: {6}(191,138)(-13,138){7}
//: {8}(-17,138)(-65,138)(-65,-33){9}
//: {10}(-15,140)(-15,193)(39,193){11}
//: {12}(193,140)(193,188)(243,188){13}
wire w31;    //: /sn:0 {0}(243,200)(178,200)(178,60)(100,60)(100,19){1}
wire w1;    //: /sn:0 {0}(-17,217)(39,217){1}
wire [31:0] R1;    //: {0}(281,223)(281,308)(53,308)(53,353){1}
wire [31:0] R3;    //: {0}(687,228)(687,416){1}
wire [1:0] w11;    //: /sn:0 {0}(-27,-33)(-27,-23)(106,-23)(106,-10){1}
wire w2;    //: /sn:0 {0}(243,212)(204,212){1}
wire [31:0] R0;    //: {0}(77,228)(77,299)(41,299)(41,353){1}
wire [31:0] w5;    //: /sn:0 {0}(675,416)(675,372)(497,372)(497,228){1}
wire [31:0] w9;    //: /sn:0 {0}(663,416)(663,387)(309,387)(309,223){1}
//: enddecls

  //: joint g8 (w18) @(6, 122) /w:[ 7 -1 8 10 ]
  //: input g4 (Read2) @(-239,145) /sn:0 /w:[ 0 ]
  //: joint g44 (clr) @(353, -83) /w:[ 3 -1 4 10 ]
  //: input g3 (Write) @(-240,-38) /sn:0 /w:[ 0 ]
  //: joint g16 (clk) @(165, 285) /w:[ 5 6 8 -1 ]
  //: joint g47 (clr) @(541, -83) /w:[ 1 -1 2 12 ]
  //: input g17 (Read1) @(-239,96) /sn:0 /w:[ 0 ]
  //: joint g26 (w19) @(229, 106) /w:[ 5 -1 6 12 ]
  //: output g2 (Data2) @(668,482) /sn:0 /R:3 /w:[ 0 ]
  tran g23(.Z(w24), .I(Write[2:0]));   //: @(-65,-39) /sn:0 /R:1 /w:[ 9 1 2 ] /ss:1
  tran g30(.Z(w10), .I(Read2[4:3]));   //: @(-140,143) /sn:0 /R:1 /w:[ 0 1 2 ] /ss:1
  //: output g1 (Data1) @(59,462) /sn:0 /R:3 /w:[ 1 ]
  //: joint g39 (RegWrite) @(372, 263) /w:[ 6 8 5 -1 ]
  Regs8x32 g24 (.DIN(WriteData), .SD(w24), .SA(w19), .SB(w18), .RegWr(w31), .clk(w2), .clr(clr), .AOUT(R1), .BOUT(w9));   //: @(244, 153) /sz:(98, 69) /sn:0 /p:[ Ti0>11 Li0>13 Li1>13 Li2>13 Li3>0 Li4>0 Ri0>11 Bo0<0 Bo1<1 ]
  Regs8x32 g29 (.DIN(WriteData), .SD(w24), .SA(w19), .SB(w18), .RegWr(w4), .clk(w22), .clr(clr), .AOUT(R2), .BOUT(w5));   //: @(432, 158) /sz:(98, 69) /sn:0 /p:[ Ti0>13 Li0>0 Li1>0 Li2>0 Li3>1 Li4>1 Ri0>13 Bo0<1 Bo1<1 ]
  //: comment g51 /dolink:0 /link:"" @(395,229) /sn:0
  //: /line:"Regs 16-23"
  //: /end
  tran g18(.Z(w19), .I(Read1[2:0]));   //: @(-95,93) /sn:0 /R:1 /w:[ 9 3 4 ] /ss:1
  //: supply1 g10 (w21) @(68,-11) /sn:0 /w:[ 1 ]
  //: joint g25 (w18) @(210, 122) /w:[ 5 -1 6 12 ]
  //: comment g49 /dolink:0 /link:"" @(210,225) /sn:0
  //: /line:"Regs 8-15"
  //: /end
  //: comment g50 /dolink:0 /link:"" @(585,229) /sn:0
  //: /line:"Regs 24-31"
  //: /end
  Regs8x32 g6 (.DIN(WriteData), .SD(w24), .SA(w19), .SB(w18), .RegWr(w16), .clk(w1), .clr(clr), .AOUT(R0), .BOUT(w0));   //: @(40, 158) /sz:(98, 69) /sn:0 /p:[ Ti0>9 Li0>11 Li1>11 Li2>11 Li3>0 Li4>1 Ri0>9 Bo0<0 Bo1<1 ]
  //: joint g7 (w19) @(23, 106) /w:[ 7 -1 8 10 ]
  demux g9 (.I(w11), .E(w21), .Z0(w16), .Z1(w31), .Z2(w4), .Z3(w20));   //: @(106,3) /sn:0 /w:[ 1 0 1 1 0 0 ]
  and g35 (.I0(clk), .I1(RegWrite), .Z(w22));   //: @(394,217) /sn:0 /delay:" 1" /w:[ 3 9 0 ]
  tran g31(.Z(w6), .I(Read1[4:3]));   //: @(-123,93) /sn:0 /R:1 /w:[ 1 1 2 ] /ss:1
  tran g22(.Z(w18), .I(Read2[2:0]));   //: @(-93,142) /sn:0 /R:1 /w:[ 9 3 4 ] /ss:0
  and g36 (.I0(clk), .I1(RegWrite), .Z(w23));   //: @(567,217) /sn:0 /delay:" 1" /w:[ 0 7 0 ]
  //: joint g41 (w19) @(419, 107) /w:[ 2 -1 4 1 ]
  //: joint g45 (WriteData) @(479, 75) /w:[ 1 -1 2 12 ]
  and g33 (.I0(clk), .I1(RegWrite), .Z(w1));   //: @(-27,217) /sn:0 /delay:" 1" /w:[ 11 13 0 ]
  //: input g42 (clr) @(-237,-92) /sn:0 /w:[ 7 ]
  //: joint g40 (w18) @(402, 123) /w:[ 2 -1 4 1 ]
  //: input g12 (clk) @(-239,285) /sn:0 /w:[ 13 ]
  and g34 (.I0(clk), .I1(RegWrite), .Z(w2));   //: @(194,212) /sn:0 /delay:" 1" /w:[ 7 11 1 ]
  //: joint g28 (w24) @(381, 139) /w:[ 2 -1 4 1 ]
  Regs8x32 g46 (.DIN(WriteData), .SD(w24), .SA(w19), .SB(w18), .RegWr(w20), .clk(w23), .clr(clr), .AOUT(w3), .BOUT(R3));   //: @(622, 158) /sz:(98, 69) /sn:0 /p:[ Ti0>0 Li0>3 Li1>3 Li2>3 Li3>1 Li4>1 Ri0>0 Bo0<1 Bo1<0 ]
  //: joint g11 (w24) @(-15, 138) /w:[ 7 -1 8 10 ]
  mux g14 (.I0(R0), .I1(R1), .I2(R2), .I3(w3), .S(w6), .Z(Data1));   //: @(59,369) /sn:0 /w:[ 1 1 0 0 0 0 ] /ss:0 /do:0
  tran g5(.Z(w11), .I(Write[4:3]));   //: @(-27,-39) /sn:0 /R:1 /w:[ 0 3 4 ] /ss:1
  //: joint g19 (clk) @(-58, 285) /w:[ 9 10 12 -1 ]
  //: joint g21 (w24) @(193, 138) /w:[ 5 -1 6 12 ]
  //: input g32 (RegWrite) @(-239,263) /sn:0 /w:[ 0 ]
  //: joint g20 (WriteData) @(87, 75) /w:[ 5 -1 6 8 ]
  //: joint g38 (RegWrite) @(173, 263) /w:[ 4 10 3 -1 ]
  //: joint g15 (clk) @(362, 285) /w:[ 1 2 4 -1 ]
  //: joint g43 (clr) @(148, -83) /w:[ 5 -1 6 8 ]
  //: input g0 (WriteData) @(-239,73) /sn:0 /w:[ 7 ]
  //: joint g27 (WriteData) @(290, 75) /w:[ 3 -1 4 10 ]
  //: comment g48 /dolink:0 /link:"" @(11,228) /sn:0
  //: /line:"Regs 0-7"
  //: /end
  //: joint g37 (RegWrite) @(-69, 263) /w:[ 2 12 1 -1 ]
  mux g13 (.I0(w0), .I1(w9), .I2(w5), .I3(R3), .S(w10), .Z(Data2));   //: @(669,432) /sn:0 /w:[ 0 0 0 1 1 1 ] /ss:0 /do:0

endmodule

module Regs8x32(SB, SA, BOUT, AOUT, clk, clr, RegWr, SD, DIN);
//: interface  /sz:(98, 69) /bd:[ Ti0>DIN[31:0](47/98) Ti1>DIN[31:0](47/98) Ti2>DIN[31:0](47/98) Ti3>DIN[31:0](47/98) Ti4>DIN[31:0](47/98) Ti5>DIN[31:0](47/98) Ti6>DIN[31:0](47/98) Ti7>DIN[31:0](47/98) Ti8>DIN[31:0](47/98) Li0>clk(59/69) Li1>RegWr(47/69) Li2>SB[2:0](22/69) Li3>SA[2:0](11/69) Li4>SD[2:0](35/69) Li5>SD[2:0](35/69) Li6>SA[2:0](11/69) Li7>SB[2:0](22/69) Li8>RegWr(47/69) Li9>clk(59/69) Li10>clk(59/69) Li11>RegWr(47/69) Li12>SB[2:0](22/69) Li13>SA[2:0](11/69) Li14>SD[2:0](35/69) Li15>clk(59/69) Li16>RegWr(47/69) Li17>SB[2:0](22/69) Li18>SA[2:0](11/69) Li19>SD[2:0](35/69) Li20>SD[2:0](35/69) Li21>SA[2:0](11/69) Li22>SB[2:0](22/69) Li23>RegWr(47/69) Li24>clk(59/69) Li25>clk(59/69) Li26>RegWr(47/69) Li27>SB[2:0](22/69) Li28>SA[2:0](11/69) Li29>SD[2:0](35/69) Li30>clk(59/69) Li31>RegWr(47/69) Li32>SB[2:0](22/69) Li33>SA[2:0](11/69) Li34>SD[2:0](35/69) Li35>SD[2:0](35/69) Li36>SA[2:0](11/69) Li37>SB[2:0](22/69) Li38>RegWr(47/69) Li39>clk(59/69) Li40>clk(59/69) Li41>RegWr(47/69) Li42>SB[2:0](22/69) Li43>SA[2:0](11/69) Li44>SD[2:0](35/69) Ri0>clr(35/69) Ri1>clr(35/69) Ri2>clr(35/69) Ri3>clr(35/69) Ri4>clr(35/69) Ri5>clr(35/69) Ri6>clr(35/69) Ri7>clr(35/69) Ri8>clr(35/69) Bo0<BOUT[31:0](65/98) Bo1<AOUT[31:0](37/98) Bo2<AOUT[31:0](37/98) Bo3<BOUT[31:0](65/98) Bo4<BOUT[31:0](65/98) Bo5<AOUT[31:0](37/98) Bo6<BOUT[31:0](65/98) Bo7<AOUT[31:0](37/98) Bo8<AOUT[31:0](37/98) Bo9<BOUT[31:0](65/98) Bo10<BOUT[31:0](65/98) Bo11<AOUT[31:0](37/98) Bo12<BOUT[31:0](65/98) Bo13<AOUT[31:0](37/98) Bo14<AOUT[31:0](37/98) Bo15<BOUT[31:0](65/98) Bo16<BOUT[31:0](65/98) Bo17<AOUT[31:0](37/98) ]
input [31:0] DIN;    //: /sn:0 {0}(531,269)(531,318){1}
//: {2}(533,320)(627,320){3}
//: {4}(631,320)(715,320){5}
//: {6}(719,320)(807,320)(807,429){7}
//: {8}(717,322)(717,352){9}
//: {10}(629,322)(629,433){11}
//: {12}(529,320)(435,320){13}
//: {14}(431,320)(342,320){15}
//: {16}(338,320)(264,320){17}
//: {18}(260,320)(181,320)(181,352){19}
//: {20}(262,322)(262,439){21}
//: {22}(340,322)(340,351){23}
//: {24}(433,322)(433,436){25}
//: {26}(531,322)(531,348){27}
output [31:0] BOUT;    //: /sn:0 {0}(516,697)(516,672){1}
input [2:0] SD;    //: /sn:0 {0}(782,138)(852,138)(852,156){1}
supply1 w21;    //: /sn:0 {0}(828,169)(801,169)(801,153){1}
input [2:0] SB;    //: /sn:0 {0}(466,659)(493,659){1}
input RegWr;    //: /sn:0 {0}(48,363)(68,363)(68,378)(82,378){1}
input [2:0] SA;    //: /sn:0 {0}(256,657)(231,657){1}
input clr;    //: /sn:0 /dp:1 {0}(959,337)(1032,337){1}
input clk;    //: /sn:0 {0}(82,383)(68,383)(68,398)(55,398){1}
output [31:0] AOUT;    //: /sn:0 {0}(279,670)(279,702){1}
wire [31:0] w16;    //: /sn:0 {0}(531,369)(531,574)(520,574){1}
//: {2}(516,574)(282,574)(282,641){3}
//: {4}(518,576)(518,587)(519,587)(519,643){5}
wire w7;    //: /sn:0 {0}(472,451)(513,451)(513,405)(848,405)(848,185){1}
wire [31:0] R5;    //: {0}(288,641)(288,586)(525,586){1}
//: {2}(529,586)(629,586)(629,454){3}
//: {4}(527,588)(527,617)(525,617)(525,643){5}
wire w4;    //: /sn:0 {0}(943,337)(906,337){1}
//: {2}(902,337)(767,337){3}
//: {4}(763,337)(588,337){5}
//: {6}(584,337)(390,337){7}
//: {8}(386,337)(231,337)(231,357)(220,357){9}
//: {10}(388,339)(388,356)(379,356){11}
//: {12}(586,339)(586,353)(570,353){13}
//: {14}(765,339)(765,357)(756,357){15}
//: {16}(904,339)(904,417)(865,417){17}
//: {18}(861,417)(675,417){19}
//: {20}(671,417)(489,417){21}
//: {22}(485,417)(302,417)(302,444)(301,444){23}
//: {24}(487,419)(487,441)(472,441){25}
//: {26}(673,419)(673,438)(668,438){27}
//: {28}(863,419)(863,434)(846,434){29}
wire [31:0] R2;    //: {0}(262,641)(262,537){1}
//: {2}(264,535)(499,535)(499,643){3}
//: {4}(262,533)(262,460){5}
wire w0;    //: /sn:0 {0}(770,439)(764,439)(764,481)(579,481){1}
//: {2}(577,479)(577,443)(592,443){3}
//: {4}(575,481)(390,481){5}
//: {6}(388,479)(388,446)(396,446){7}
//: {8}(386,481)(214,481){9}
//: {10}(212,479)(212,449)(225,449){11}
//: {12}(210,481)(125,481)(125,383){13}
//: {14}(127,381)(291,381){15}
//: {16}(295,381)(477,381){17}
//: {18}(481,381)(660,381)(660,362)(680,362){19}
//: {20}(479,379)(479,358)(494,358){21}
//: {22}(293,379)(293,361)(303,361){23}
//: {24}(125,379)(125,362)(144,362){25}
//: {26}(123,381)(103,381){27}
wire w3;    //: /sn:0 {0}(835,185)(835,397)(330,397)(330,454)(301,454){1}
wire [31:0] R7;    //: {0}(807,450)(807,609)(541,609){1}
//: {2}(537,609)(302,609)(302,641){3}
//: {4}(539,611)(539,643){5}
wire w12;    //: /sn:0 {0}(756,367)(787,367)(787,258)(868,258)(868,185){1}
wire w10;    //: /sn:0 {0}(846,444)(875,444)(875,185){1}
wire [31:0] R4;    //: {0}(340,372)(340,545){1}
//: {2}(342,547)(505,547)(505,643){3}
//: {4}(338,547)(268,547)(268,641){5}
wire [31:0] R3;    //: {0}(512,643)(512,559)(435,559){1}
//: {2}(433,557)(433,457){3}
//: {4}(431,559)(275,559)(275,641){5}
wire w8;    //: /sn:0 {0}(220,367)(249,367)(249,213)(828,213)(828,185){1}
wire Z5;    //: /sn:0 {0}(861,185)(861,413)(700,413)(700,448)(668,448){1}
wire w14;    //: /sn:0 {0}(379,366)(414,366)(414,229)(841,229)(841,185){1}
wire [31:0] R0;    //: {0}(492,643)(492,523)(257,523){1}
//: {2}(253,523)(181,523)(181,373){3}
//: {4}(255,525)(255,641){5}
wire w15;    //: /sn:0 {0}(570,363)(608,363)(608,244)(855,244)(855,185){1}
wire [31:0] R10;    //: /sn:0 {0}(295,641)(295,600)(530,600){1}
//: {2}(534,600)(717,600)(717,373){3}
//: {4}(532,602)(532,643){5}
//: enddecls

  //: joint g8 (w16) @(518, 574) /w:[ 1 -1 2 4 ]
  //: input g4 (SB) @(464,659) /sn:0 /w:[ 0 ]
  //: input g3 (SA) @(229,657) /sn:0 /w:[ 1 ]
  //: joint g16 (R3) @(433, 559) /w:[ 1 2 4 -1 ]
  //: joint g17 (R4) @(340, 547) /w:[ 2 1 4 -1 ]
  //: joint g26 (DIN) @(340, 320) /w:[ 15 -1 16 22 ]
  register R5 (.Q(R5), .D(DIN), .EN(Z5), .CLR(w4), .CK(!w0));   //: @(629,443) /w:[ 3 11 1 27 3 ]
  //: output g2 (BOUT) @(516,694) /sn:0 /R:3 /w:[ 0 ]
  //: joint g23 (w4) @(765, 337) /w:[ 3 -1 4 14 ]
  //: joint g30 (w0) @(212, 481) /w:[ 9 10 12 -1 ]
  //: output g1 (AOUT) @(279,699) /sn:0 /R:3 /w:[ 1 ]
  //: joint g39 (DIN) @(262, 320) /w:[ 17 -1 18 20 ]
  //: joint g24 (DIN) @(531, 320) /w:[ 2 1 12 26 ]
  //: joint g29 (w0) @(388, 481) /w:[ 5 6 8 -1 ]
  register R2 (.Q(R4), .D(DIN), .EN(w14), .CLR(w4), .CK(!w0));   //: @(340,361) /w:[ 0 23 0 11 23 ]
  register R7 (.Q(R7), .D(DIN), .EN(w10), .CLR(w4), .CK(!w0));   //: @(807,439) /w:[ 0 7 0 29 0 ]
  //: joint g18 (R2) @(262, 535) /w:[ 2 4 -1 1 ]
  //: supply1 g10 (w21) @(812,153) /sn:0 /w:[ 1 ]
  not g25 (.I(clr), .Z(w4));   //: @(953,337) /sn:0 /R:2 /w:[ 0 0 ]
  //: joint g6 (R7) @(539, 609) /w:[ 1 -1 2 4 ]
  register R6 (.Q(R10), .D(DIN), .EN(w12), .CLR(w4), .CK(!w0));   //: @(717,362) /w:[ 3 9 0 15 19 ]
  //: joint g7 (R10) @(532, 600) /w:[ 2 -1 1 4 ]
  register R4 (.Q(w16), .D(DIN), .EN(w15), .CLR(w4), .CK(!w0));   //: @(531,358) /w:[ 0 27 0 13 21 ]
  demux g9 (.I(SD), .E(w21), .Z0(!w8), .Z1(!w3), .Z2(!w14), .Z3(!w7), .Z4(!w15), .Z5(!Z5), .Z6(!w12), .Z7(!w10));   //: @(852,169) /sn:0 /w:[ 1 0 1 0 1 1 1 0 1 1 ]
  and g35 (.I0(RegWr), .I1(clk), .Z(w0));   //: @(93,381) /sn:0 /delay:" 1" /w:[ 1 0 27 ]
  //: joint g31 (w4) @(863, 417) /w:[ 17 -1 18 28 ]
  //: joint g22 (w4) @(586, 337) /w:[ 5 -1 6 12 ]
  register R3 (.Q(R3), .D(DIN), .EN(w7), .CLR(w4), .CK(!w0));   //: @(433,446) /w:[ 3 25 0 25 7 ]
  register R1 (.Q(R2), .D(DIN), .EN(w3), .CLR(w4), .CK(!w0));   //: @(262,449) /w:[ 5 21 1 23 11 ]
  //: joint g36 (w4) @(904, 337) /w:[ 1 -1 2 16 ]
  //: joint g41 (DIN) @(717, 320) /w:[ 6 -1 5 8 ]
  //: joint g33 (w4) @(673, 417) /w:[ 19 -1 20 26 ]
  //: joint g42 (DIN) @(629, 320) /w:[ 4 -1 3 10 ]
  //: joint g40 (DIN) @(433, 320) /w:[ 13 -1 14 24 ]
  //: joint g12 (w0) @(479, 381) /w:[ 18 20 17 -1 ]
  //: input g34 (clk) @(53,398) /sn:0 /w:[ 1 ]
  //: input g28 (clr) @(1034,337) /sn:0 /R:2 /w:[ 1 ]
  //: joint g11 (w0) @(293, 381) /w:[ 16 22 15 -1 ]
  //: input g5 (RegWr) @(46,363) /sn:0 /w:[ 0 ]
  mux g14 (.I0(R0), .I1(R2), .I2(R4), .I3(R3), .I4(w16), .I5(R5), .I6(R10), .I7(R7), .S(SA), .Z(AOUT));   //: @(279,657) /sn:0 /w:[ 5 0 5 5 3 0 0 3 0 0 ] /ss:0 /do:0
  //: joint g19 (R0) @(255, 523) /w:[ 1 -1 2 4 ]
  //: joint g21 (w4) @(388, 337) /w:[ 7 -1 8 10 ]
  //: joint g32 (w4) @(487, 417) /w:[ 21 -1 22 24 ]
  //: input g20 (SD) @(780,138) /sn:0 /w:[ 0 ]
  register R0 (.Q(R0), .D(DIN), .EN(w8), .CLR(w4), .CK(!w0));   //: @(181,362) /w:[ 3 19 0 9 25 ]
  //: joint g38 (w0) @(577, 481) /w:[ 1 2 4 -1 ]
  //: joint g15 (R5) @(527, 586) /w:[ 2 -1 1 4 ]
  //: input g0 (DIN) @(531,267) /sn:0 /R:3 /w:[ 0 ]
  //: joint g27 (w0) @(125, 381) /w:[ 14 24 26 13 ]
  mux g13 (.I0(R0), .I1(R2), .I2(R4), .I3(R3), .I4(w16), .I5(R5), .I6(R10), .I7(R7), .S(SB), .Z(BOUT));   //: @(516,659) /sn:0 /w:[ 0 3 3 0 5 5 5 5 1 1 ] /ss:0 /do:0

endmodule

module Extend(S, A);
//: interface  /sz:(40, 40) /bd:[ Li0>A[15:0](23/40) Li1>A[15:0](23/40) Ro0<S[31:0](23/40) Ro1<S[31:0](23/40) ]
input [15:0] A;    //: /sn:0 {0}(307,243)(307,412)(325,412){1}
//: {2}(326,412)(355,412){3}
output [31:0] S;    //: /sn:0 /dp:1 {0}(361,332)(401,332){1}
wire w1;    //: /sn:0 {0}(326,407)(326,404){1}
//: {2}(328,402)(355,402){3}
//: {4}(326,400)(326,394){5}
//: {6}(328,392)(355,392){7}
//: {8}(326,390)(326,384){9}
//: {10}(328,382)(355,382){11}
//: {12}(326,380)(326,374){13}
//: {14}(328,372)(355,372){15}
//: {16}(326,370)(326,364){17}
//: {18}(328,362)(355,362){19}
//: {20}(326,360)(326,354){21}
//: {22}(328,352)(355,352){23}
//: {24}(326,350)(326,344){25}
//: {26}(328,342)(355,342){27}
//: {28}(326,340)(326,334){29}
//: {30}(328,332)(355,332){31}
//: {32}(326,330)(326,324){33}
//: {34}(328,322)(355,322){35}
//: {36}(326,320)(326,314){37}
//: {38}(328,312)(355,312){39}
//: {40}(326,310)(326,304){41}
//: {42}(328,302)(355,302){43}
//: {44}(326,300)(326,294){45}
//: {46}(328,292)(355,292){47}
//: {48}(326,290)(326,284){49}
//: {50}(328,282)(355,282){51}
//: {52}(326,280)(326,274){53}
//: {54}(328,272)(355,272){55}
//: {56}(326,270)(326,264){57}
//: {58}(328,262)(355,262){59}
//: {60}(326,260)(326,252)(355,252){61}
//: enddecls

  tran g4(.Z(w1), .I(A[15]));   //: @(326,410) /sn:0 /R:1 /w:[ 0 1 2 ] /ss:0
  //: joint g8 (w1) @(326, 382) /w:[ 10 12 -1 9 ]
  //: joint g16 (w1) @(326, 302) /w:[ 42 44 -1 41 ]
  //: joint g17 (w1) @(326, 292) /w:[ 46 48 -1 45 ]
  concat g2 (.I0(A), .I1(w1), .I2(w1), .I3(w1), .I4(w1), .I5(w1), .I6(w1), .I7(w1), .I8(w1), .I9(w1), .I10(w1), .I11(w1), .I12(w1), .I13(w1), .I14(w1), .I15(w1), .I16(w1), .Z(S));   //: @(360,332) /sn:0 /w:[ 3 3 7 11 15 19 23 27 31 35 39 43 47 51 55 59 61 0 ] /dr:0
  //: output g1 (S) @(398,332) /sn:0 /w:[ 1 ]
  //: joint g18 (w1) @(326, 282) /w:[ 50 52 -1 49 ]
  //: joint g10 (w1) @(326, 362) /w:[ 18 20 -1 17 ]
  //: joint g7 (w1) @(326, 392) /w:[ 6 8 -1 5 ]
  //: joint g9 (w1) @(326, 372) /w:[ 14 16 -1 13 ]
  //: joint g12 (w1) @(326, 342) /w:[ 26 28 -1 25 ]
  //: joint g5 (w1) @(326, 402) /w:[ 2 4 -1 1 ]
  //: joint g11 (w1) @(326, 352) /w:[ 22 24 -1 21 ]
  //: joint g14 (w1) @(326, 322) /w:[ 34 36 -1 33 ]
  //: joint g19 (w1) @(326, 272) /w:[ 54 56 -1 53 ]
  //: joint g20 (w1) @(326, 262) /w:[ 58 60 -1 57 ]
  //: input g0 (A) @(307,241) /sn:0 /R:3 /w:[ 0 ]
  //: joint g15 (w1) @(326, 312) /w:[ 38 40 -1 37 ]
  //: joint g13 (w1) @(326, 332) /w:[ 30 32 -1 29 ]

endmodule

module main;    //: root_module
wire w6;    //: /sn:0 {0}(281,359)(281,369){1}
wire [31:0] w13;    //: /sn:0 {0}(565,279)(575,279){1}
wire w7;    //: /sn:0 {0}(213,359)(213,369){1}
wire [31:0] BranchTarget0;    //: /sn:0 {0}(632,104)(575,104)(575,169)(565,169){1}
wire [4:0] w4;    //: /sn:0 {0}(156,202)(146,202){1}
wire PCSrc;    //: /sn:0 {0}(648,-55)(648,71){1}
wire w0;    //: /sn:0 {0}(235,138)(235,128){1}
wire [4:0] w3;    //: /sn:0 {0}(156,235)(146,235){1}
wire [25:0] Inm26;    //: /sn:0 {0}(189,-22)(189,-15)(490,-15){1}
wire [31:0] w19;    //: /sn:0 {0}(731,84)(741,84){1}
wire [31:0] w18;    //: /sn:0 /dp:1 {0}(661,94)(702,94){1}
wire [3:0] w10;    //: /sn:0 {0}(497,139)(497,56){1}
wire [31:0] JumpAddr;    //: /sn:0 /dp:1 {0}(702,74)(689,74)(689,-20)(496,-20){1}
wire [31:0] PCNext;    //: /sn:0 {0}(632,84)(384,84){1}
//: {2}(383,84)(360,84)(360,105){3}
//: {4}(358,107)(71,107){5}
//: {6}(360,109)(360,163)(426,163){7}
wire w1;    //: /sn:0 {0}(156,285)(146,285){1}
wire [31:0] w8;    //: /sn:0 {0}(324,214)(426,214){1}
wire w14;    //: /sn:0 {0}(565,197)(575,197){1}
wire [31:0] w2;    //: /sn:0 {0}(156,329)(146,329){1}
wire [31:0] w11;    //: /sn:0 {0}(357,407)(357,335)(426,335){1}
wire [5:0] w15;    //: /sn:0 {0}(384,79)(384,-25)(490,-25){1}
wire [4:0] w5;    //: /sn:0 {0}(156,169)(146,169){1}
wire [31:0] w9;    //: /sn:0 {0}(324,284)(426,284){1}
wire Jump;    //: /sn:0 {0}(718,-63)(718,61){1}
//: enddecls

  mux g4 (.I0(w18), .I1(JumpAddr), .S(Jump), .Z(w19));   //: @(718,84) /sn:0 /R:1 /w:[ 1 0 1 0 ] /ss:1 /do:0
  //: comment g8 /dolink:0 /link:"" @(287,90) /sn:0
  //: /line:"PCNext"
  //: /end
  //: joint g3 (PCNext) @(360, 107) /w:[ -1 3 4 6 ]
  mux g2 (.I0(PCNext), .I1(BranchTarget0), .S(PCSrc), .Z(w18));   //: @(648,94) /sn:0 /R:1 /w:[ 0 0 1 0 ] /ss:1 /do:1
  EXE g1 (.ALUOperation(w10), .PCNext(PCNext), .ExtendedSign(w11), .A(w8), .B(w9), .BranchTarget(BranchTarget0), .Zero(w14), .ALUResult(w13));   //: @(427, 140) /sz:(137, 213) /sn:0 /p:[ Ti0>0 Li0>7 Li1>1 Li2>1 Li3>1 Ro0<1 Ro1<0 Ro2<0 ]
  //: comment g10 /dolink:0 /link:"" @(725,45) /sn:0
  //: /line:"Jump"
  //: /end
  tran g6(.Z(w15), .I(PCNext[31:26]));   //: @(384,82) /sn:0 /R:1 /w:[ 0 2 1 ] /ss:0
  //: comment g7 /dolink:0 /link:"" @(227,-37) /sn:0
  //: /line:"Inm26"
  //: /end
  //: comment g9 /dolink:0 /link:"" @(616,41) /sn:0
  //: /line:"PCSrc"
  //: /end
  concat g5 (.I0(Inm26), .I1(w15), .Z(JumpAddr));   //: @(495,-20) /sn:0 /w:[ 1 1 1 ] /dr:0
  Read g0 (.Clr(w0), .Read1(w5), .Read2(w4), .Write(w3), .WriteData(w2), .RegDst(w1), .RegWrite(w7), .Clk(w6), .Data2(w9), .Data1(w8));   //: @(157, 139) /sz:(166, 219) /sn:0 /p:[ Ti0>0 Li0>0 Li1>0 Li2>0 Li3>0 Li4>0 Bi0>0 Bi1>0 Ro0<0 Ro1<0 ]

endmodule

module Read(Clk, ExtendedSign, R2, R1, Data1, RegDst, WriteData, Clr, WriteRegister, Data2, SignExtend, RegWrite);
//: interface  /sz:(166, 219) /bd:[ Ti0>Clr(78/166) Ti1>Clr(78/166) Ti2>Clr(78/166) Li0>Read1[4:0](30/219) Li1>Read2[4:0](63/219) Li2>Write[4:0](96/219) Li3>WriteData[31:0](190/219) Li4>RegDst(146/219) Li5>Read1[4:0](30/219) Li6>Read2[4:0](63/219) Li7>Write[4:0](96/219) Li8>WriteData[31:0](190/219) Li9>RegDst(146/219) Li10>Read1[4:0](30/219) Li11>Read2[4:0](63/219) Li12>Write[4:0](96/219) Li13>WriteData[31:0](190/219) Li14>RegDst(146/219) Bi0>RegWrite(56/166) Bi1>Clk(124/166) Bi2>RegWrite(56/166) Bi3>Clk(124/166) Bi4>RegWrite(56/166) Bi5>Clk(124/166) Ro0<Data2[31:0](145/219) Ro1<Data1[31:0](75/219) Ro2<Data2[31:0](145/219) Ro3<Data1[31:0](75/219) Ro4<Data2[31:0](145/219) Ro5<Data1[31:0](75/219) ]
output [31:0] Data2;    //: /sn:0 /dp:1 {0}(538,288)(627,288){1}
input [4:0] R2;    //: /sn:0 {0}(230,221)(258,221){1}
//: {2}(262,221)(389,221){3}
//: {4}(260,223)(260,268)(302,268){5}
input [31:0] WriteData;    //: /sn:0 {0}(290,387)(352,387)(352,297)(389,297){1}
input Clk;    //: /sn:0 {0}(483,425)(498,425)(498,376){1}
input [15:0] SignExtend;    //: /sn:0 /dp:1 {0}(442,462)(278,462){1}
output [31:0] Data1;    //: /sn:0 {0}(622,196)(538,196){1}
input [4:0] R1;    //: /sn:0 {0}(351,181)(389,181){1}
input RegDst;    //: /sn:0 {0}(144,331)(318,331)(318,281){1}
input RegWrite;    //: /sn:0 {0}(389,435)(430,435)(430,332){1}
output [31:0] ExtendedSign;    //: /sn:0 /dp:1 {0}(484,464)(614,464){1}
input Clr;    //: /sn:0 {0}(406,77)(462,77)(462,148){1}
input [4:0] WriteRegister;    //: /sn:0 {0}(222,248)(302,248){1}
wire [4:0] w10;    //: /sn:0 {0}(331,258)(389,258){1}
wire w2;    //: /sn:0 {0}(498,360)(498,332){1}
//: enddecls

  //: joint g4 (R2) @(260, 221) /w:[ 2 -1 1 4 ]
  //: input g8 (Clk) @(481,425) /sn:0 /w:[ 0 ]
  //: output g16 (ExtendedSign) @(611,464) /sn:0 /w:[ 1 ]
  mux g3 (.I0(R2), .I1(WriteRegister), .S(RegDst), .Z(w10));   //: @(318,258) /sn:0 /R:1 /w:[ 5 1 1 0 ] /ss:0 /do:0
  //: input g2 (R2) @(228,221) /sn:0 /w:[ 0 ]
  //: input g1 (R1) @(349,181) /sn:0 /w:[ 0 ]
  //: output g10 (Data1) @(619,196) /sn:0 /w:[ 0 ]
  //: input g6 (RegDst) @(142,331) /sn:0 /w:[ 0 ]
  //: input g7 (WriteData) @(288,387) /sn:0 /w:[ 0 ]
  //: input g9 (Clr) @(404,77) /sn:0 /w:[ 0 ]
  not g12 (.I(Clk), .Z(w2));   //: @(498,370) /sn:0 /R:1 /w:[ 1 0 ]
  //: input g5 (WriteRegister) @(220,248) /sn:0 /w:[ 0 ]
  //: output g11 (Data2) @(624,288) /sn:0 /w:[ 1 ]
  //: input g14 (SignExtend) @(276,462) /sn:0 /w:[ 1 ]
  Extend g15 (.A(SignExtend), .S(ExtendedSign));   //: @(443, 447) /sz:(40, 40) /sn:0 /p:[ Li0>0 Ro0<0 ]
  BRegs32x32 g0 (.clr(Clr), .Read1(R1), .Read2(R2), .Write(w10), .WriteData(WriteData), .clk(w2), .RegWrite(RegWrite), .Data1(Data1), .Data2(Data2));   //: @(390, 149) /sz:(147, 182) /sn:0 /p:[ Ti0>1 Li0>1 Li1>3 Li2>1 Li3>1 Bi0>1 Bi1>1 Ro0<1 Ro1<0 ]
  //: input g13 (RegWrite) @(387,435) /sn:0 /w:[ 0 ]

endmodule
