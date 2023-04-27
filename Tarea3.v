//: version "1.8.7"

module EXE(ALUResult, Zero, B, A, ALUOperation);
//: interface  /sz:(142, 122) /bd:[ Ti0>ALUOperation[3:0](73/142) Li0>A[31:0](31/122) Li1>B[31:0](79/122) Ro0<Zero(33/122) Ro1<ALUResult[31:0](80/122) ]
input [31:0] B;    //: /sn:0 {0}(204,170)(246,170){1}
output Zero;    //: /sn:0 {0}(401,125)(344,125){1}
input [31:0] A;    //: /sn:0 {0}(205,133)(246,133){1}
input [3:0] ALUOperation;    //: /sn:0 {0}(291,66)(291,104){1}
output [31:0] ALUResult;    //: /sn:0 {0}(344,150)(399,150){1}
//: enddecls

  //: output g4 (ALUResult) @(396,150) /sn:0 /w:[ 1 ]
  //: output g3 (Zero) @(398,125) /sn:0 /w:[ 0 ]
  //: input g2 (B) @(202,170) /sn:0 /w:[ 0 ]
  //: input g1 (A) @(203,133) /sn:0 /w:[ 0 ]
  //: input g5 (ALUOperation) @(291,64) /sn:0 /R:3 /w:[ 0 ]
  ALU g0 (.ALUOperation(ALUOperation), .B(B), .A(A), .Zero(Zero), .ALUResult(ALUResult));   //: @(247, 105) /sz:(96, 97) /sn:0 /p:[ Ti0>1 Li0>1 Li1>1 Ro0<1 Ro1<0 ]

endmodule

module ALU(B, ALUResult, ALUOperation, Zero, A);
//: interface  /sz:(96, 97) /bd:[ Ti0>ALUOperation[3:0](51/109) Li0>A[31:0](33/114) Li1>B[31:0](77/114) Ro0<ALUResult[31:0](54/114) Ro1<Zero(24/114) ]
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

module main;    //: root_module
wire [31:0] B;    //: /sn:0 {0}(126,141)(126,157)(235,157){1}
wire Zero;    //: /dp:1 {0}(379,111)(425,111)(425,128){1}
wire [31:0] A;    //: /sn:0 /dp:1 {0}(125,80)(125,109)(235,109){1}
wire [3:0] ALUOperation;    //: /sn:0 {0}(309,35)(309,77){1}
wire [31:0] ALUResult;    //: /dp:1 {0}(379,158)(448,158){1}
//: {2}(452,158)(565,158)(565,147){3}
//: {4}(450,160)(450,221){5}
//: {6}(452,223)(560,223)(560,213){7}
//: {8}(450,225)(450,278)(562,278)(562,268){9}
//: enddecls

  //: joint g4 (ALUResult) @(450, 158) /w:[ 2 -1 1 4 ]
  //: dip B (B) @(126,131) /w:[ 0 ] /st:6
  led Binari (.I(ALUResult));   //: @(562,261) /w:[ 9 ] /type:1
  //: dip A (A) @(125,70) /w:[ 0 ] /st:9
  //: dip ALUOperation (ALUOperation) @(309,25) /w:[ 0 ] /st:7
  //: comment ALUOperation_Table /dolink:0 /link:"" @(363,-11) /sn:0
  //: /line:"0000 (0) - AND"
  //: /line:"0001 (1) - OR"
  //: /line:"0010 (2) - ADD"
  //: /line:"0110 (6) - SUB"
  //: /line:"0111 (7) - SLT"
  //: /end
  //: joint g6 (ALUResult) @(450, 223) /w:[ 6 5 -1 8 ]
  led Hexadecimal (.I(ALUResult));   //: @(560,206) /w:[ 7 ] /type:2
  led Decimal (.I(ALUResult));   //: @(565,140) /w:[ 3 ] /type:3
  led g5 (.I(Zero));   //: @(425,135) /sn:0 /R:2 /w:[ 1 ] /type:0
  EXE g0 (.ALUOperation(ALUOperation), .B(B), .A(A), .ALUResult(ALUResult), .Zero(Zero));   //: @(236, 78) /sz:(142, 122) /sn:0 /p:[ Ti0>1 Li0>1 Li1>1 Ro0<0 Ro1<0 ]

endmodule
