/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : X-2025.06-SP1
// Date      : Wed Nov 11 19:30:15 2026
/////////////////////////////////////////////////////////////


module PWM_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;

  gf180mcu_fd_sc_mcu7t5v0__addh_1 U2 ( .A(A[8]), .B(n2), .CO(n1), .S(SUM[8])
         );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U3 ( .A(A[7]), .B(n3), .CO(n2), .S(SUM[7])
         );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U4 ( .A(A[6]), .B(n4), .CO(n3), .S(SUM[6])
         );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U5 ( .A(A[5]), .B(n5), .CO(n4), .S(SUM[5])
         );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U6 ( .A(A[4]), .B(n6), .CO(n5), .S(SUM[4])
         );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U7 ( .A(A[3]), .B(n7), .CO(n6), .S(SUM[3])
         );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U8 ( .A(A[2]), .B(n8), .CO(n7), .S(SUM[2])
         );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U9 ( .A(A[1]), .B(A[0]), .CO(n8), .S(SUM[1])
         );
  gf180mcu_fd_sc_mcu7t5v0__xor2_1 U13 ( .A1(n1), .A2(A[9]), .Z(SUM[9]) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U14 ( .I(A[0]), .ZN(SUM[0]) );
endmodule


module PWM_DW01_inc_1 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;

  gf180mcu_fd_sc_mcu7t5v0__addh_1 U2 ( .A(A[8]), .B(n2), .CO(n1), .S(SUM[8])
         );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U3 ( .A(A[7]), .B(n3), .CO(n2), .S(SUM[7])
         );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U4 ( .A(A[6]), .B(n4), .CO(n3), .S(SUM[6])
         );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U5 ( .A(A[5]), .B(n5), .CO(n4), .S(SUM[5])
         );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U6 ( .A(A[4]), .B(n6), .CO(n5), .S(SUM[4])
         );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U7 ( .A(A[3]), .B(n7), .CO(n6), .S(SUM[3])
         );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U8 ( .A(A[2]), .B(n8), .CO(n7), .S(SUM[2])
         );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U9 ( .A(A[1]), .B(A[0]), .CO(n8), .S(SUM[1])
         );
  gf180mcu_fd_sc_mcu7t5v0__xor2_1 U13 ( .A1(n1), .A2(A[9]), .Z(SUM[9]) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U14 ( .I(A[0]), .ZN(SUM[0]) );
endmodule


module PWM_DP_OP_15_122_8448_1 ( I1, I2, O1 );
  input [9:0] I1;
  input [7:0] I2;
  output [18:0] O1;
  wire   n1, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n17, n19,
         n20, n21, n22, n24, n25, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n272,
         n275, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n302, n304, n305, n306, n307, n308, n309, n310,
         n311;
  assign n251 = I1[0];
  assign n253 = I1[9];
  assign n254 = I1[8];
  assign n255 = I1[7];
  assign n256 = I1[6];
  assign n257 = I1[5];
  assign n258 = I1[4];
  assign n259 = I1[3];
  assign n260 = I1[2];
  assign n261 = I1[1];
  assign O1[18] = n272;
  assign O1[0] = n275;
  assign O1[2] = n277;
  assign O1[3] = n278;
  assign O1[4] = n279;
  assign O1[5] = n280;
  assign O1[6] = n281;
  assign O1[7] = n282;
  assign O1[8] = n283;
  assign O1[9] = n284;
  assign O1[10] = n285;
  assign O1[11] = n286;
  assign O1[12] = n287;
  assign O1[13] = n288;
  assign O1[14] = n289;
  assign O1[15] = n290;
  assign O1[16] = n291;
  assign O1[17] = n292;
  assign n293 = I2[0];
  assign n294 = I2[1];
  assign n295 = I2[2];
  assign n296 = I2[3];
  assign n297 = I2[4];
  assign n298 = I2[5];
  assign n299 = I2[6];
  assign n300 = I2[7];

  gf180mcu_fd_sc_mcu7t5v0__xnor2_1 U15 ( .A1(n1), .A2(n20), .ZN(n279) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U19 ( .A1(n302), .A2(n19), .ZN(n1) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U31 ( .A(n169), .B(n162), .CI(n32), .CO(n28), 
        .S(n29) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U32 ( .A(n38), .B(n33), .CI(n36), .CO(n30), 
        .S(n31) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U33 ( .A(n177), .B(n163), .CI(n170), .CO(n32), .S(n33) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U34 ( .A(n44), .B(n37), .CI(n42), .CO(n34), 
        .S(n35) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U35 ( .A(n178), .B(n46), .CI(n39), .CO(n36), 
        .S(n37) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U36 ( .A(n185), .B(n164), .CI(n171), .CO(n38), .S(n39) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U37 ( .A(n52), .B(n50), .CI(n43), .CO(n40), 
        .S(n41) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U38 ( .A(n54), .B(n47), .CI(n45), .CO(n42), 
        .S(n43) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U39 ( .A(n186), .B(n179), .CI(n56), .CO(n44), 
        .S(n45) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U40 ( .A(n193), .B(n165), .CI(n172), .CO(n46), .S(n47) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U41 ( .A(n53), .B(n60), .CI(n51), .CO(n48), 
        .S(n49) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U42 ( .A(n57), .B(n64), .CI(n62), .CO(n50), 
        .S(n51) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U43 ( .A(n68), .B(n66), .CI(n55), .CO(n52), 
        .S(n53) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U44 ( .A(n180), .B(n187), .CI(n194), .CO(n54), .S(n55) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U45 ( .A(n201), .B(n166), .CI(n173), .CO(n56), .S(n57) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U46 ( .A(n63), .B(n72), .CI(n61), .CO(n58), 
        .S(n59) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U47 ( .A(n76), .B(n65), .CI(n74), .CO(n60), 
        .S(n61) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U48 ( .A(n78), .B(n67), .CI(n69), .CO(n62), 
        .S(n63) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U49 ( .A(n188), .B(n82), .CI(n80), .CO(n64), 
        .S(n65) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U50 ( .A(n202), .B(n181), .CI(n195), .CO(n66), .S(n67) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U51 ( .A(n209), .B(n167), .CI(n174), .CO(n68), .S(n69) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U52 ( .A(n75), .B(n86), .CI(n73), .CO(n70), 
        .S(n71) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U53 ( .A(n90), .B(n77), .CI(n88), .CO(n72), 
        .S(n73) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U54 ( .A(n92), .B(n79), .CI(n81), .CO(n74), 
        .S(n75) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U55 ( .A(n96), .B(n83), .CI(n94), .CO(n76), 
        .S(n77) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U56 ( .A(n210), .B(n189), .CI(n203), .CO(n78), .S(n79) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U57 ( .A(n196), .B(n217), .CI(n182), .CO(n80), .S(n81) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U59 ( .A(n100), .B(n89), .CI(n87), .CO(n84), 
        .S(n85) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U60 ( .A(n95), .B(n91), .CI(n102), .CO(n86), 
        .S(n87) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U61 ( .A(n106), .B(n104), .CI(n93), .CO(n88), 
        .S(n89) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U62 ( .A(n218), .B(n108), .CI(n97), .CO(n90), 
        .S(n91) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U63 ( .A(n204), .B(n225), .CI(n211), .CO(n92), .S(n93) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U64 ( .A(n233), .B(n190), .CI(n197), .CO(n94), .S(n95) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U66 ( .A(n103), .B(n112), .CI(n101), .CO(n98), .S(n99) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U67 ( .A(n107), .B(n114), .CI(n105), .CO(
        n100), .S(n101) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U68 ( .A(n234), .B(n109), .CI(n116), .CO(
        n102), .S(n103) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U69 ( .A(n219), .B(n226), .CI(n118), .CO(
        n104), .S(n105) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U70 ( .A(n198), .B(n212), .CI(n205), .CO(
        n106), .S(n107) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U72 ( .A(n122), .B(n115), .CI(n113), .CO(
        n110), .S(n111) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U73 ( .A(n119), .B(n124), .CI(n117), .CO(
        n112), .S(n113) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U74 ( .A(n206), .B(n126), .CI(n235), .CO(
        n114), .S(n115) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U75 ( .A(n192), .B(n213), .CI(n220), .CO(
        n116), .S(n117) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U77 ( .A(n130), .B(n125), .CI(n123), .CO(
        n120), .S(n121) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U78 ( .A(n132), .B(n236), .CI(n127), .CO(
        n122), .S(n123) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U79 ( .A(n200), .B(n214), .CI(n221), .CO(
        n124), .S(n125) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U81 ( .A(n237), .B(n133), .CI(n134), .CO(
        n128), .S(n129) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U82 ( .A(n229), .B(n215), .CI(n136), .CO(
        n130), .S(n131) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U84 ( .A(n223), .B(n138), .CI(n238), .CO(
        n134), .S(n135) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U87 ( .A1(n263), .A2(n242), .ZN(n161) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U157 ( .A1(n269), .A2(n250), .ZN(n231) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U158 ( .A1(n270), .A2(n250), .ZN(n232) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U188 ( .A1(n251), .A2(n270), .ZN(n275) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U156 ( .A1(n268), .A2(n250), .ZN(n230) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U142 ( .A1(n270), .A2(n248), .ZN(n216) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U134 ( .A1(n270), .A2(n247), .ZN(n208) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U148 ( .A1(n268), .A2(n249), .ZN(n222) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U149 ( .A1(n269), .A2(n249), .ZN(n223) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U141 ( .A1(n269), .A2(n248), .ZN(n215) );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U86 ( .A(n224), .B(n231), .CO(n138), .S(n139) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U24 ( .A(n239), .B(n139), .CI(n22), .CO(n21), 
        .S(n277) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U153 ( .A1(n265), .A2(n250), .ZN(n227) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U154 ( .A1(n266), .A2(n250), .ZN(n228) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U133 ( .A1(n269), .A2(n247), .ZN(n207) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U146 ( .A1(n266), .A2(n249), .ZN(n220) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U147 ( .A1(n267), .A2(n249), .ZN(n221) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U139 ( .A1(n267), .A2(n248), .ZN(n213) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U140 ( .A1(n268), .A2(n248), .ZN(n214) );
  gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U16 ( .A1(n302), .A2(n20), .B(n17), .ZN(n15) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U117 ( .A1(n269), .A2(n245), .ZN(n191) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U110 ( .A1(n270), .A2(n244), .ZN(n184) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U124 ( .A1(n268), .A2(n246), .ZN(n198) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U132 ( .A1(n268), .A2(n247), .ZN(n206) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U131 ( .A1(n267), .A2(n247), .ZN(n205) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U138 ( .A1(n266), .A2(n248), .ZN(n212) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U145 ( .A1(n265), .A2(n249), .ZN(n219) );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U76 ( .A(n199), .B(n227), .CO(n118), .S(n119) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U94 ( .A1(n270), .A2(n242), .ZN(n168) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U101 ( .A1(n269), .A2(n243), .ZN(n175) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U109 ( .A1(n269), .A2(n244), .ZN(n183) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U116 ( .A1(n268), .A2(n245), .ZN(n190) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U130 ( .A1(n266), .A2(n247), .ZN(n204) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U123 ( .A1(n267), .A2(n246), .ZN(n197) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U144 ( .A1(n264), .A2(n249), .ZN(n218) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U137 ( .A1(n265), .A2(n248), .ZN(n211) );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U71 ( .A(n191), .B(n184), .CO(n108), .S(n109) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U13 ( .A(n128), .B(n121), .CI(n25), .CO(n14), 
        .S(n280) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U122 ( .A1(n266), .A2(n246), .ZN(n196) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U115 ( .A1(n267), .A2(n245), .ZN(n189) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U136 ( .A1(n264), .A2(n248), .ZN(n210) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U108 ( .A1(n268), .A2(n244), .ZN(n182) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U129 ( .A1(n265), .A2(n247), .ZN(n203) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U135 ( .A1(n263), .A2(n248), .ZN(n209) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U100 ( .A1(n268), .A2(n243), .ZN(n174) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U114 ( .A1(n266), .A2(n245), .ZN(n188) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U128 ( .A1(n264), .A2(n247), .ZN(n202) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U121 ( .A1(n265), .A2(n246), .ZN(n195) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U93 ( .A1(n269), .A2(n242), .ZN(n167) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U107 ( .A1(n267), .A2(n244), .ZN(n181) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U10 ( .A(n98), .B(n85), .CI(n12), .CO(n11), 
        .S(n283) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U127 ( .A1(n263), .A2(n247), .ZN(n201) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U99 ( .A1(n267), .A2(n243), .ZN(n173) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U112 ( .A1(n264), .A2(n245), .ZN(n186) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U98 ( .A1(n266), .A2(n243), .ZN(n172) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U106 ( .A1(n266), .A2(n244), .ZN(n180) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U113 ( .A1(n265), .A2(n245), .ZN(n187) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U92 ( .A1(n268), .A2(n242), .ZN(n166) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U91 ( .A1(n267), .A2(n242), .ZN(n165) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U9 ( .A(n84), .B(n71), .CI(n11), .CO(n10), 
        .S(n284) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U97 ( .A1(n265), .A2(n243), .ZN(n171) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U90 ( .A1(n266), .A2(n242), .ZN(n164) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U8 ( .A(n70), .B(n59), .CI(n10), .CO(n9), 
        .S(n285) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U104 ( .A1(n264), .A2(n244), .ZN(n178) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U6 ( .A(n48), .B(n41), .CI(n8), .CO(n7), .S(
        n287) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U96 ( .A1(n264), .A2(n243), .ZN(n170) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U103 ( .A1(n263), .A2(n244), .ZN(n177) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U89 ( .A1(n265), .A2(n242), .ZN(n163) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U95 ( .A1(n263), .A2(n243), .ZN(n169) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U88 ( .A1(n264), .A2(n242), .ZN(n162) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U3 ( .A(n29), .B(n30), .CI(n5), .CO(n4), .S(
        n290) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U150 ( .A1(n270), .A2(n249), .ZN(n224) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U155 ( .A1(n267), .A2(n250), .ZN(n229) );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U83 ( .A(n222), .B(n208), .CO(n132), .S(n133) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U125 ( .A1(n269), .A2(n246), .ZN(n199) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U118 ( .A1(n270), .A2(n245), .ZN(n192) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U126 ( .A1(n270), .A2(n246), .ZN(n200) );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U80 ( .A(n207), .B(n228), .CO(n126), .S(n127) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U152 ( .A1(n264), .A2(n250), .ZN(n226) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U151 ( .A1(n263), .A2(n250), .ZN(n225) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U159 ( .A1(n263), .A2(n262), .ZN(n233) );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U65 ( .A(n183), .B(n176), .CO(n96), .S(n97)
         );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U12 ( .A(n120), .B(n111), .CI(n14), .CO(n13), 
        .S(n281) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U7 ( .A(n58), .B(n49), .CI(n9), .CO(n8), .S(
        n286) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U211 ( .I(n253), .ZN(n242) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U212 ( .I(n15), .ZN(n25) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U213 ( .I(n255), .ZN(n244) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U214 ( .I(n298), .ZN(n265) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U215 ( .I(n300), .ZN(n263) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U216 ( .I(n299), .ZN(n264) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U217 ( .I(n254), .ZN(n243) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U219 ( .I(n256), .ZN(n245) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U220 ( .I(n257), .ZN(n246) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U224 ( .I(n297), .ZN(n266) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U225 ( .I(n296), .ZN(n267) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U226 ( .I(n259), .ZN(n248) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U227 ( .I(n258), .ZN(n247) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U228 ( .I(n260), .ZN(n249) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U229 ( .I(n293), .ZN(n270) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U230 ( .I(n294), .ZN(n269) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U231 ( .I(n261), .ZN(n250) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U232 ( .I(n251), .ZN(n262) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U233 ( .I(n19), .ZN(n17) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U234 ( .A1(n129), .A2(n131), .ZN(n19) );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U235 ( .A(n216), .B(n230), .CO(n136), .S(
        n137) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U238 ( .A(n137), .B(n21), .CI(n135), .CO(n20), .S(n278) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U239 ( .A1(n270), .A2(n243), .ZN(n176) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U240 ( .A1(n263), .A2(n249), .ZN(n217) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U241 ( .I(n295), .ZN(n268) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U242 ( .A(n110), .B(n99), .CI(n13), .CO(n12), 
        .S(n282) );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U243 ( .A(n175), .B(n168), .CO(n82), .S(n83)
         );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U244 ( .A1(n264), .A2(n246), .ZN(n194) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U245 ( .A1(n263), .A2(n246), .ZN(n193) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U246 ( .A1(n265), .A2(n244), .ZN(n179) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U247 ( .A1(n263), .A2(n245), .ZN(n185) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U248 ( .A(n31), .B(n34), .CI(n6), .CO(n5), 
        .S(n289) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U249 ( .A(n40), .B(n35), .CI(n7), .CO(n6), 
        .S(n288) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U250 ( .A(n161), .B(n28), .CI(n4), .CO(n292), 
        .S(n291) );
  gf180mcu_fd_sc_mcu7t5v0__or2_1 U252 ( .A1(n129), .A2(n131), .Z(n302) );
  gf180mcu_fd_sc_mcu7t5v0__tiel U254 ( .ZN(n272) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U255 ( .I(n24), .ZN(n22) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U218 ( .I(n304), .ZN(n234) );
  gf180mcu_fd_sc_mcu7t5v0__oai22_1 U221 ( .A1(n251), .A2(n300), .B1(n262), 
        .B2(n299), .ZN(n304) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U222 ( .I(n305), .ZN(n235) );
  gf180mcu_fd_sc_mcu7t5v0__oai22_1 U223 ( .A1(n251), .A2(n299), .B1(n262), 
        .B2(n298), .ZN(n305) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U236 ( .I(n306), .ZN(n236) );
  gf180mcu_fd_sc_mcu7t5v0__oai22_1 U237 ( .A1(n251), .A2(n298), .B1(n262), 
        .B2(n297), .ZN(n306) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U251 ( .I(n307), .ZN(O1[1]) );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 U253 ( .A1(n232), .A2(n240), .B(n24), .ZN(
        n307) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U256 ( .A1(n232), .A2(n240), .ZN(n24) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U257 ( .I(n308), .ZN(n239) );
  gf180mcu_fd_sc_mcu7t5v0__oai22_1 U258 ( .A1(n295), .A2(n251), .B1(n262), 
        .B2(n294), .ZN(n308) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U259 ( .I(n309), .ZN(n238) );
  gf180mcu_fd_sc_mcu7t5v0__oai22_1 U260 ( .A1(n251), .A2(n296), .B1(n262), 
        .B2(n295), .ZN(n309) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U261 ( .I(n310), .ZN(n237) );
  gf180mcu_fd_sc_mcu7t5v0__oai22_1 U262 ( .A1(n251), .A2(n297), .B1(n262), 
        .B2(n296), .ZN(n310) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U263 ( .I(n311), .ZN(n240) );
  gf180mcu_fd_sc_mcu7t5v0__oai22_1 U264 ( .A1(n294), .A2(n251), .B1(n262), 
        .B2(n293), .ZN(n311) );
endmodule


module PWM_DP_OP_37_123_5779_1 ( I1, I2, I3, I4, O1, O2 );
  input [18:0] I1;
  input [25:0] I2;
  input [6:0] I3;
  input [6:0] I4;
  output [44:0] O1;
  output [6:0] O2;
  wire   n59, n69, n73, n74, n75, n76, n77, n79, n80, n81, n132, n134, n139,
         n140, n141, n142, n143, n144, n145, n147, n156, n157, n164, n165,
         n166, n167, n176, n177, n178, n180, n181, n182, n183, n184, n185,
         n186, n198, n199, n200, n201, n202, n203, n204, n206, n219, n220,
         n221, n222, n232, n235, n240, n241, n242, n243, n251, n252, n254,
         n255, n256, n257, n258, n263, n264, n267, n268, n269, n284, n291,
         n297, n298, n300, n302, n303, n304, n306, n308, n309, n310, n312,
         n319, n326, n332, n333, n335, n337, n338, n339, n341, n343, n344,
         n345, n347, n349, n350, n351, n353, n355, n356, n357, n366, n367,
         n368, n369, n370, n371, n372, n373, n374, n395, n396, n400, n401,
         n403, n420, n421, n422, n423, n424, n425, n426, n427, n428, n429,
         n430, n431, n432, n433, n434, n435, n436, n437, n438, n439, n440,
         n441, n442, n443, n444, n445, n446, n447, n448, n449, n450, n451,
         n452, n453, n455, n456, n457, n458, n459, n460, n461, n462, n463,
         n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, n475,
         n476, n477, n478, n481, n485, n486, n487, n488, n489, n490, n491,
         n493, n494, n495, n497, n498, n499, n501, n502, n503, n504, n505,
         n507, n508, n509, n510, n511, n512, n513, n514, n515, n516, n517,
         n518, n519, n520, n521, n522, n523, n525, n526, n527, n528, n529,
         n530, n531, n532, n533, n534, n535, n536, n537, n538, n539, n540,
         n541, n542, n543, n544, n545, n546, n547, n548, n549, n550, n551,
         n552, n553, n554, n555, n556, n557, n558, n559, n560, n561, n562,
         n563, n564, n565, n566, n567, n568, n569, n570, n571, n572, n573,
         n574, n575, n576, n580, n581, n582, n583, n584, n585, n587, n588,
         n589, n590, n592, n594, n595, n596, n597, n598, n599, n602, n603,
         n608, n609, n610, n614, n615, n620, n657, n658, n686, n687, n688,
         n689, n690, n691, n692, n693, n694, n695, n696, n705, n706, n707,
         n708, n709, n728, n729, n730, n731, n732, n733, n734, n735, n736,
         n737, n738, n739, n740, n742, n744, n745, n746, n747, n752, n753,
         n754, n755, n756, n757;
  assign n434 = I1[15];
  assign n481 = I1[13];
  assign n497 = I1[8];
  assign n507 = I1[6];
  assign n582 = I1[18];
  assign n583 = I1[17];
  assign n584 = I1[16];
  assign n585 = I1[14];
  assign n587 = I1[12];
  assign n588 = I1[11];
  assign n589 = I1[10];
  assign n590 = I1[9];
  assign n592 = I1[7];
  assign n594 = I1[5];
  assign n595 = I1[4];
  assign n596 = I1[3];
  assign n597 = I1[2];
  assign n598 = I1[1];
  assign n599 = I1[0];
  assign n657 = I4[0];
  assign n658 = I4[1];
  assign O1[26] = n686;
  assign O1[27] = n687;
  assign O1[28] = n688;
  assign O1[29] = n689;
  assign O1[30] = n690;
  assign O1[31] = n691;
  assign O1[32] = n692;
  assign O1[33] = n693;
  assign O1[34] = n694;
  assign O1[35] = n695;
  assign O1[36] = n696;
  assign n705 = I4[2];
  assign n706 = I4[3];
  assign n707 = I4[4];
  assign n708 = I4[5];
  assign n709 = I4[6];

  gf180mcu_fd_sc_mcu7t5v0__xnor2_1 U114 ( .A1(n403), .A2(n73), .ZN(n695) );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 U132 ( .A1(n178), .A2(n139), .B(n140), .ZN(
        n403) );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 U140 ( .A1(n157), .A2(n143), .B(n144), .ZN(
        n142) );
  gf180mcu_fd_sc_mcu7t5v0__xnor2_1 U145 ( .A1(n401), .A2(n75), .ZN(n693) );
  gf180mcu_fd_sc_mcu7t5v0__xnor2_1 U161 ( .A1(n400), .A2(n76), .ZN(n692) );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 U170 ( .A1(n177), .A2(n166), .B(n167), .ZN(
        n165) );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 U177 ( .A1(n178), .A2(n176), .B(n177), .ZN(
        n400) );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 U194 ( .A1(n254), .A2(n181), .B(n182), .ZN(
        n180) );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 U198 ( .A1(n199), .A2(n185), .B(n186), .ZN(
        n184) );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 U219 ( .A1(n202), .A2(n220), .B(n203), .ZN(
        n201) );
  gf180mcu_fd_sc_mcu7t5v0__xnor2_1 U224 ( .A1(n396), .A2(n80), .ZN(n688) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U240 ( .A1(n372), .A2(n220), .ZN(n80) );
  gf180mcu_fd_sc_mcu7t5v0__xnor2_1 U244 ( .A1(n395), .A2(n81), .ZN(n687) );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 U245 ( .A1(n235), .A2(n221), .B(n222), .ZN(
        n396) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U258 ( .A1(n373), .A2(n222), .ZN(n81) );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 U271 ( .A1(n252), .A2(n242), .B(n243), .ZN(
        n241) );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 U293 ( .A1(n257), .A2(n264), .B(n258), .ZN(
        n256) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U308 ( .A1(n445), .A2(n446), .ZN(n264) );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 U313 ( .A1(n268), .A2(n284), .B(n269), .ZN(
        n267) );
  gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U315 ( .A1(n744), .A2(n745), .B(n746), .ZN(
        n269) );
  gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U337 ( .A1(n736), .A2(n615), .B(n742), .ZN(
        n284) );
  gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U348 ( .A1(n735), .A2(n614), .B(n734), .ZN(
        n291) );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 U358 ( .A1(n297), .A2(n300), .B(n298), .ZN(
        n614) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U361 ( .A1(n455), .A2(n456), .ZN(n297) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U362 ( .A1(n455), .A2(n456), .ZN(n298) );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 U368 ( .A1(n303), .A2(n306), .B(n304), .ZN(
        n302) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U371 ( .A1(n457), .A2(n458), .ZN(n303) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U372 ( .A1(n457), .A2(n458), .ZN(n304) );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 U378 ( .A1(n309), .A2(n312), .B(n310), .ZN(
        n308) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U381 ( .A1(n459), .A2(n460), .ZN(n309) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U382 ( .A1(n459), .A2(n460), .ZN(n310) );
  gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U385 ( .A1(n732), .A2(n610), .B(n731), .ZN(
        n312) );
  gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U396 ( .A1(n730), .A2(n609), .B(n733), .ZN(
        n319) );
  gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U407 ( .A1(n728), .A2(n608), .B(n729), .ZN(
        n326) );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 U417 ( .A1(n332), .A2(n335), .B(n333), .ZN(
        n608) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U420 ( .A1(n467), .A2(n468), .ZN(n332) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U421 ( .A1(n467), .A2(n468), .ZN(n333) );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 U427 ( .A1(n338), .A2(n341), .B(n339), .ZN(
        n337) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U430 ( .A1(n469), .A2(n470), .ZN(n338) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U431 ( .A1(n469), .A2(n470), .ZN(n339) );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 U437 ( .A1(n344), .A2(n347), .B(n345), .ZN(
        n343) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U440 ( .A1(n471), .A2(n472), .ZN(n344) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U441 ( .A1(n471), .A2(n472), .ZN(n345) );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 U447 ( .A1(n350), .A2(n353), .B(n351), .ZN(
        n349) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U450 ( .A1(n473), .A2(n594), .ZN(n350) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U451 ( .A1(n473), .A2(n594), .ZN(n351) );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 U456 ( .A1(n356), .A2(n69), .B(n357), .ZN(
        n355) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U461 ( .A1(n575), .A2(n475), .ZN(n356) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U462 ( .A1(n575), .A2(n475), .ZN(n357) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U483 ( .A(n458), .B(n434), .CI(n583), .CO(
        n422), .S(n423) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U485 ( .A(n585), .B(n458), .CI(n584), .CO(
        n424), .S(n425) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U487 ( .A(n485), .B(n458), .CI(n434), .CO(
        n426), .S(n427) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U490 ( .A(n585), .B(n486), .CI(n583), .CO(
        n428), .S(n429) );
  gf180mcu_fd_sc_mcu7t5v0__xnor2_1 U491 ( .A1(n487), .A2(n587), .ZN(n486) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U493 ( .A(n481), .B(n488), .CI(n584), .CO(
        n430), .S(n431) );
  gf180mcu_fd_sc_mcu7t5v0__xnor2_1 U494 ( .A1(n489), .A2(n588), .ZN(n488) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U496 ( .A(n738), .B(n490), .CI(n491), .CO(
        n432), .S(n433) );
  gf180mcu_fd_sc_mcu7t5v0__xnor2_1 U497 ( .A1(n587), .A2(n589), .ZN(n490) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U499 ( .A(n588), .B(n493), .CI(n585), .CO(
        n491), .S(n435) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U501 ( .A(n495), .B(n498), .CI(n481), .CO(
        n436), .S(n438) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U502 ( .A(n497), .B(n589), .CI(n737), .CO(
        n494), .S(n495) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U505 ( .A(n502), .B(n499), .CI(n420), .CO(
        n437), .S(n440) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U506 ( .A(n590), .B(n501), .CI(n587), .CO(
        n498), .S(n499) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U508 ( .A(n503), .B(n452), .CI(n508), .CO(
        n439), .S(n441) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U509 ( .A(n505), .B(n510), .CI(n588), .CO(
        n502), .S(n503) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U510 ( .A(n507), .B(n512), .CI(n497), .CO(
        n504), .S(n505) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U513 ( .A(n59), .B(n420), .CI(n509), .CO(
        n442), .S(n443) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U514 ( .A(n516), .B(n511), .CI(n514), .CO(
        n508), .S(n509) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U515 ( .A(n592), .B(n513), .CI(n589), .CO(
        n510), .S(n511) );
  gf180mcu_fd_sc_mcu7t5v0__xnor2_1 U516 ( .A1(n518), .A2(n594), .ZN(n513) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U518 ( .A(n520), .B(n515), .CI(n452), .CO(
        n444), .S(n445) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U519 ( .A(n590), .B(n517), .CI(n456), .CO(
        n514), .S(n515) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U520 ( .A(n747), .B(n519), .CI(n522), .CO(
        n516), .S(n517) );
  gf180mcu_fd_sc_mcu7t5v0__xnor2_1 U521 ( .A1(n507), .A2(n595), .ZN(n519) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U523 ( .A(n526), .B(n521), .CI(n59), .CO(
        n446), .S(n447) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U524 ( .A(n528), .B(n523), .CI(n458), .CO(
        n520), .S(n521) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U525 ( .A(n594), .B(n525), .CI(n497), .CO(
        n522), .S(n523) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U527 ( .A(n527), .B(n456), .CI(n420), .CO(
        n448), .S(n449) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U528 ( .A(n529), .B(n460), .CI(n532), .CO(
        n526), .S(n527) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U529 ( .A(n531), .B(n534), .CI(n592), .CO(
        n528), .S(n529) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U530 ( .A(n597), .B(n595), .CI(n536), .CO(
        n530), .S(n531) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U531 ( .A(n533), .B(n458), .CI(n538), .CO(
        n450), .S(n451) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U532 ( .A(n535), .B(n462), .CI(n539), .CO(
        n532), .S(n533) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U533 ( .A(n537), .B(n507), .CI(n541), .CO(
        n534), .S(n535) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U534 ( .A(n598), .B(n543), .CI(n596), .CO(
        n536), .S(n537) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U535 ( .A(n540), .B(n460), .CI(n545), .CO(
        n538), .S(n453) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U536 ( .A(n542), .B(n464), .CI(n546), .CO(
        n539), .S(n540) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U537 ( .A(n544), .B(n548), .CI(n594), .CO(
        n541), .S(n542) );
  gf180mcu_fd_sc_mcu7t5v0__xnor2_1 U538 ( .A1(n597), .A2(n599), .ZN(n544) );
  gf180mcu_fd_sc_mcu7t5v0__or2_1 U539 ( .A1(n597), .A2(n599), .Z(n543) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U540 ( .A(n547), .B(n462), .CI(n550), .CO(
        n545), .S(n455) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U541 ( .A(n549), .B(n466), .CI(n551), .CO(
        n546), .S(n547) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U542 ( .A(n598), .B(n553), .CI(n595), .CO(
        n548), .S(n549) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U543 ( .A(n552), .B(n464), .CI(n555), .CO(
        n550), .S(n457) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U544 ( .A(n554), .B(n468), .CI(n556), .CO(
        n551), .S(n552) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U546 ( .A(n557), .B(n466), .CI(n558), .CO(
        n555), .S(n459) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U547 ( .A(n597), .B(n559), .CI(n470), .CO(
        n556), .S(n557) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U548 ( .A(n560), .B(n468), .CI(n561), .CO(
        n558), .S(n461) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U549 ( .A(n598), .B(n472), .CI(n562), .CO(
        n559), .S(n560) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U550 ( .A(n563), .B(n470), .CI(n564), .CO(
        n561), .S(n463) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U551 ( .A(n599), .B(n565), .CI(n580), .CO(
        n562), .S(n563) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U552 ( .A(n566), .B(n472), .CI(n567), .CO(
        n564), .S(n465) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U554 ( .A(n569), .B(n580), .CI(n570), .CO(
        n567), .S(n467) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U556 ( .A(n475), .B(n572), .CI(n573), .CO(
        n570), .S(n469) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U558 ( .A(n575), .B(n576), .CI(n580), .CO(
        n573), .S(n471) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U560 ( .A(n478), .B(n476), .CI(n574), .CO(
        n576), .S(n473) );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U545 ( .A(n599), .B(n596), .CO(n553), .S(
        n554) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U297 ( .A1(n443), .A2(n444), .ZN(n258) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U307 ( .A1(n445), .A2(n446), .ZN(n263) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U296 ( .A1(n443), .A2(n444), .ZN(n257) );
  gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U291 ( .A1(n255), .A2(n267), .B(n256), .ZN(
        n254) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U218 ( .A1(n202), .A2(n219), .ZN(n200) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U243 ( .A1(n435), .A2(n436), .ZN(n220) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U261 ( .A1(n437), .A2(n438), .ZN(n222) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U223 ( .A1(n433), .A2(n434), .ZN(n203) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U275 ( .A1(n439), .A2(n440), .ZN(n243) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U287 ( .A1(n441), .A2(n442), .ZN(n252) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U286 ( .A1(n441), .A2(n442), .ZN(n251) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U274 ( .A1(n439), .A2(n440), .ZN(n242) );
  gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U265 ( .A1(n620), .A2(n240), .B(n241), .ZN(
        n235) );
  gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U217 ( .A1(n200), .A2(n232), .B(n201), .ZN(
        n199) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U216 ( .A1(n200), .A2(n373), .ZN(n198) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U202 ( .A1(n431), .A2(n432), .ZN(n186) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U201 ( .A1(n431), .A2(n432), .ZN(n185) );
  gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U196 ( .A1(n183), .A2(n241), .B(n184), .ZN(
        n182) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U195 ( .A1(n240), .A2(n183), .ZN(n181) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U174 ( .A1(n427), .A2(n428), .ZN(n167) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U188 ( .A1(n429), .A2(n430), .ZN(n176) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U173 ( .A1(n427), .A2(n428), .ZN(n166) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U189 ( .A1(n429), .A2(n430), .ZN(n177) );
  gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U225 ( .A1(n396), .A2(n372), .B(n206), .ZN(
        n204) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U144 ( .A1(n423), .A2(n424), .ZN(n144) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U143 ( .A1(n423), .A2(n424), .ZN(n143) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U139 ( .A1(n156), .A2(n143), .ZN(n141) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U137 ( .A1(n141), .A2(n164), .ZN(n139) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U157 ( .A1(n367), .A2(n157), .ZN(n75) );
  gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U138 ( .A1(n141), .A2(n165), .B(n142), .ZN(
        n140) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U186 ( .A1(n369), .A2(n177), .ZN(n77) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U129 ( .A1(n421), .A2(n422), .ZN(n134) );
  gf180mcu_fd_sc_mcu7t5v0__xor2_1 U176 ( .A1(n77), .A2(n178), .Z(n691) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U171 ( .A1(n368), .A2(n167), .ZN(n76) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U126 ( .A1(n740), .A2(n134), .ZN(n73) );
  gf180mcu_fd_sc_mcu7t5v0__xor2_1 U131 ( .A1(n74), .A2(n145), .Z(n694) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U292 ( .A1(n257), .A2(n263), .ZN(n255) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U242 ( .A1(n435), .A2(n436), .ZN(n219) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U260 ( .A1(n437), .A2(n438), .ZN(n221) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U222 ( .A1(n433), .A2(n434), .ZN(n202) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U270 ( .A1(n251), .A2(n242), .ZN(n240) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U197 ( .A1(n185), .A2(n198), .ZN(n183) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U599 ( .I(n434), .ZN(n59) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U600 ( .I(n134), .ZN(n132) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U601 ( .I(n166), .ZN(n368) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U602 ( .I(n180), .ZN(n178) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U605 ( .I(n156), .ZN(n367) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U606 ( .I(n176), .ZN(n369) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U608 ( .I(n185), .ZN(n370) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U609 ( .I(n235), .ZN(n395) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U610 ( .I(n219), .ZN(n372) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U611 ( .I(n220), .ZN(n206) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U612 ( .I(n202), .ZN(n371) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U613 ( .I(n221), .ZN(n373) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U614 ( .I(n584), .ZN(n452) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U615 ( .I(n585), .ZN(n456) );
  gf180mcu_fd_sc_mcu7t5v0__addf_1 U618 ( .A(n478), .B(n602), .CI(n596), .CO(
        n603) );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U619 ( .A(n477), .B(n581), .CO(n574), .S(
        n575) );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U620 ( .A(n476), .B(n574), .CO(n571), .S(
        n572) );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U621 ( .A(n581), .B(n571), .CO(n568), .S(
        n569) );
  gf180mcu_fd_sc_mcu7t5v0__addh_1 U622 ( .A(n475), .B(n568), .CO(n565), .S(
        n566) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U623 ( .I(n590), .ZN(n466) );
  gf180mcu_fd_sc_mcu7t5v0__or2_1 U624 ( .A1(n507), .A2(n595), .Z(n518) );
  gf180mcu_fd_sc_mcu7t5v0__or2_1 U625 ( .A1(n518), .A2(n594), .Z(n512) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U626 ( .I(n291), .ZN(n615) );
  gf180mcu_fd_sc_mcu7t5v0__or2_1 U627 ( .A1(n587), .A2(n589), .Z(n489) );
  gf180mcu_fd_sc_mcu7t5v0__or2_1 U628 ( .A1(n489), .A2(n588), .Z(n487) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U630 ( .I(n254), .ZN(n620) );
  gf180mcu_fd_sc_mcu7t5v0__or2_1 U631 ( .A1(n487), .A2(n587), .Z(n485) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U632 ( .A1(n371), .A2(n203), .ZN(n79) );
  gf180mcu_fd_sc_mcu7t5v0__xor2_1 U633 ( .A1(n79), .A2(n204), .Z(n689) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U634 ( .A1(n176), .A2(n166), .ZN(n164) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U635 ( .A1(n425), .A2(n426), .ZN(n157) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U636 ( .A1(n425), .A2(n426), .ZN(n156) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U638 ( .I(n157), .ZN(n147) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U639 ( .I(n143), .ZN(n366) );
  gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U640 ( .A1(n401), .A2(n367), .B(n147), .ZN(
        n145) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U641 ( .A1(n366), .A2(n144), .ZN(n74) );
  gf180mcu_fd_sc_mcu7t5v0__or2_1 U642 ( .A1(n465), .A2(n466), .Z(n728) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U643 ( .A1(n465), .A2(n466), .Z(n729) );
  gf180mcu_fd_sc_mcu7t5v0__or2_1 U644 ( .A1(n463), .A2(n464), .Z(n730) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U645 ( .A1(n461), .A2(n462), .Z(n731) );
  gf180mcu_fd_sc_mcu7t5v0__or2_1 U646 ( .A1(n461), .A2(n462), .Z(n732) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U647 ( .A1(n463), .A2(n464), .Z(n733) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U648 ( .A1(n453), .A2(n59), .Z(n734) );
  gf180mcu_fd_sc_mcu7t5v0__or2_1 U649 ( .A1(n453), .A2(n59), .Z(n735) );
  gf180mcu_fd_sc_mcu7t5v0__or2_1 U650 ( .A1(n451), .A2(n452), .Z(n736) );
  gf180mcu_fd_sc_mcu7t5v0__or2_1 U651 ( .A1(n504), .A2(n592), .Z(n737) );
  gf180mcu_fd_sc_mcu7t5v0__or2_1 U652 ( .A1(n494), .A2(n590), .Z(n738) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U653 ( .I(n481), .ZN(n458) );
  gf180mcu_fd_sc_mcu7t5v0__or2_1 U654 ( .A1(n584), .A2(n481), .Z(n739) );
  gf180mcu_fd_sc_mcu7t5v0__or2_1 U655 ( .A1(n421), .A2(n422), .Z(n740) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U656 ( .I(n583), .ZN(n420) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U658 ( .A1(n451), .A2(n452), .Z(n742) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U660 ( .A1(n449), .A2(n450), .Z(n744) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U662 ( .A1(n447), .A2(n448), .Z(n746) );
  gf180mcu_fd_sc_mcu7t5v0__or2_1 U663 ( .A1(n530), .A2(n596), .Z(n747) );
  gf180mcu_fd_sc_mcu7t5v0__xnor2_1 U664 ( .A1(n590), .A2(n494), .ZN(n493) );
  gf180mcu_fd_sc_mcu7t5v0__xnor2_1 U665 ( .A1(n592), .A2(n504), .ZN(n501) );
  gf180mcu_fd_sc_mcu7t5v0__xnor2_1 U666 ( .A1(n596), .A2(n530), .ZN(n525) );
  gf180mcu_fd_sc_mcu7t5v0__xnor2_1 U667 ( .A1(n481), .A2(n584), .ZN(n421) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U668 ( .I(n603), .ZN(n69) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U669 ( .I(n319), .ZN(n610) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U670 ( .I(n326), .ZN(n609) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U671 ( .I(n596), .ZN(n581) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U672 ( .I(n594), .ZN(n580) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U673 ( .I(n658), .ZN(n477) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U675 ( .I(n595), .ZN(n475) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U676 ( .I(n507), .ZN(n472) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U677 ( .I(n592), .ZN(n470) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U678 ( .I(n497), .ZN(n468) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U679 ( .I(n589), .ZN(n464) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U680 ( .I(n588), .ZN(n462) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U681 ( .I(n587), .ZN(n460) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U682 ( .I(n242), .ZN(n374) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U683 ( .I(n599), .ZN(n478) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U684 ( .I(n355), .ZN(n353) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U685 ( .I(n349), .ZN(n347) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U686 ( .I(n343), .ZN(n341) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U687 ( .I(n337), .ZN(n335) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U688 ( .I(n308), .ZN(n306) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U689 ( .I(n302), .ZN(n300) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U691 ( .I(n222), .ZN(n232) );
  gf180mcu_fd_sc_mcu7t5v0__xnor3_1 U603 ( .A1(n739), .A2(n420), .A3(n752), 
        .ZN(n696) );
  gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U604 ( .A1(n740), .A2(n403), .B(n132), .ZN(
        n752) );
  gf180mcu_fd_sc_mcu7t5v0__xnor2_1 U607 ( .A1(n756), .A2(n753), .ZN(n690) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U616 ( .A1(n186), .A2(n370), .ZN(n753) );
  gf180mcu_fd_sc_mcu7t5v0__xnor2_1 U617 ( .A1(n757), .A2(n754), .ZN(n686) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U629 ( .A1(n243), .A2(n374), .ZN(n754) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U637 ( .I(n755), .ZN(n401) );
  gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U657 ( .A1(n180), .A2(n164), .B(n165), .ZN(
        n755) );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 U659 ( .A1(n235), .A2(n198), .B(n199), .ZN(
        n756) );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 U661 ( .A1(n254), .A2(n251), .B(n252), .ZN(
        n757) );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 U674 ( .A1(n450), .A2(n449), .B(n745), .ZN(
        n268) );
  gf180mcu_fd_sc_mcu7t5v0__or2_1 U690 ( .A1(n448), .A2(n447), .Z(n745) );
  gf180mcu_fd_sc_mcu7t5v0__and3_1 U692 ( .A1(n478), .A2(n477), .A3(n476), .Z(
        n602) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U693 ( .I(n597), .ZN(n476) );
endmodule


module PWM ( clk, enable, reset, duty_cycle, PSC, ARR, pwm );
  input [7:0] duty_cycle;
  input [9:0] PSC;
  input [9:0] ARR;
  input clk, enable, reset;
  output pwm;
  wire   \div_1/net1390 , net3743, N14, N15, N16, N17, N18, N19, N20, N21, N22,
         N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N35, N36, N42, N43,
         N44, N45, N46, N47, N48, N49, N50, N51, N62, N63, N64, N65, N66, N67,
         N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, N81,
         N82, N83, N84, N85, N86, N87, N88, N89, N90, N91, N92, N93, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n73, n74;
  wire   [10:0] CCR;
  wire   [9:0] CNT;
  wire   [9:0] PSC_counter;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29, 
        SYNOPSYS_UNCONNECTED__30, SYNOPSYS_UNCONNECTED__31, 
        SYNOPSYS_UNCONNECTED__32, SYNOPSYS_UNCONNECTED__33;

  gf180mcu_fd_sc_mcu7t5v0__inv_1 I_1 ( .I(enable), .ZN(N35) );
  gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 \PSC_counter_reg[0]  ( .D(N72), .CLK(clk), 
        .RN(n1), .Q(PSC_counter[0]) );
  gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 \CNT_reg[0]  ( .D(n12), .CLK(clk), .RN(n1), 
        .Q(CNT[0]) );
  gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 \CNT_reg[1]  ( .D(n13), .CLK(clk), .RN(n1), 
        .Q(CNT[1]) );
  gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 \CNT_reg[2]  ( .D(n11), .CLK(clk), .RN(n1), 
        .Q(CNT[2]) );
  gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 \CNT_reg[3]  ( .D(n10), .CLK(clk), .RN(n1), 
        .Q(CNT[3]) );
  gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 \CNT_reg[4]  ( .D(n9), .CLK(clk), .RN(n1), 
        .Q(CNT[4]) );
  gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 \CNT_reg[5]  ( .D(n8), .CLK(clk), .RN(n1), 
        .Q(CNT[5]) );
  gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 \CNT_reg[6]  ( .D(n7), .CLK(clk), .RN(n1), 
        .Q(CNT[6]) );
  gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 \CNT_reg[7]  ( .D(n6), .CLK(clk), .RN(n1), 
        .Q(CNT[7]) );
  gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 \CNT_reg[8]  ( .D(n5), .CLK(clk), .RN(n1), 
        .Q(CNT[8]) );
  gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 \CNT_reg[9]  ( .D(n4), .CLK(clk), .RN(n1), 
        .Q(CNT[9]) );
  gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 \PSC_counter_reg[9]  ( .D(N81), .CLK(clk), 
        .RN(n1), .Q(PSC_counter[9]) );
  gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 \PSC_counter_reg[1]  ( .D(N73), .CLK(clk), 
        .RN(n1), .Q(PSC_counter[1]) );
  gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 \PSC_counter_reg[2]  ( .D(N74), .CLK(clk), 
        .RN(n1), .Q(PSC_counter[2]) );
  gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 \PSC_counter_reg[3]  ( .D(N75), .CLK(clk), 
        .RN(n1), .Q(PSC_counter[3]) );
  gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 \PSC_counter_reg[4]  ( .D(N76), .CLK(clk), 
        .RN(n1), .Q(PSC_counter[4]) );
  gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 \PSC_counter_reg[5]  ( .D(N77), .CLK(clk), 
        .RN(n1), .Q(PSC_counter[5]) );
  gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 \PSC_counter_reg[6]  ( .D(N78), .CLK(clk), 
        .RN(n1), .Q(PSC_counter[6]) );
  gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 \PSC_counter_reg[7]  ( .D(N79), .CLK(clk), 
        .RN(n1), .Q(PSC_counter[7]) );
  gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 \PSC_counter_reg[8]  ( .D(N80), .CLK(clk), 
        .RN(n1), .Q(PSC_counter[8]) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U3 ( .I(reset), .ZN(n1) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U4 ( .A1(n2), .A2(N51), .Z(N92) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U5 ( .A1(n2), .A2(N50), .Z(N91) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U6 ( .A1(n2), .A2(N49), .Z(N90) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U7 ( .A1(n2), .A2(N48), .Z(N89) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U8 ( .A1(n2), .A2(N47), .Z(N88) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U9 ( .A1(n2), .A2(N46), .Z(N87) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U10 ( .A1(n2), .A2(N45), .Z(N86) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U11 ( .A1(n2), .A2(N44), .Z(N85) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U12 ( .A1(n2), .A2(N43), .Z(N84) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U13 ( .A1(n2), .A2(N42), .Z(N83) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U14 ( .A1(n73), .A2(N93), .Z(n2) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U15 ( .A1(enable), .A2(n3), .ZN(N82) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U17 ( .A1(n41), .A2(N71), .Z(N81) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U18 ( .A1(n41), .A2(N70), .Z(N80) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U19 ( .A1(n41), .A2(N69), .Z(N79) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U20 ( .A1(n41), .A2(N68), .Z(N78) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U21 ( .A1(n41), .A2(N67), .Z(N77) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U22 ( .A1(n41), .A2(N66), .Z(N76) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U23 ( .A1(n41), .A2(N65), .Z(N75) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U24 ( .A1(n41), .A2(N64), .Z(N74) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U25 ( .A1(n41), .A2(N63), .Z(N73) );
  gf180mcu_fd_sc_mcu7t5v0__and2_1 U26 ( .A1(n41), .A2(N62), .Z(N72) );
  gf180mcu_fd_sc_mcu7t5v0__mux2_1 U27 ( .I0(CNT[1]), .I1(N84), .S(N82), .Z(n13) );
  gf180mcu_fd_sc_mcu7t5v0__mux2_1 U28 ( .I0(CNT[0]), .I1(N83), .S(N82), .Z(n12) );
  gf180mcu_fd_sc_mcu7t5v0__mux2_1 U29 ( .I0(CNT[2]), .I1(N85), .S(N82), .Z(n11) );
  gf180mcu_fd_sc_mcu7t5v0__mux2_1 U30 ( .I0(CNT[3]), .I1(N86), .S(N82), .Z(n10) );
  gf180mcu_fd_sc_mcu7t5v0__mux2_1 U31 ( .I0(CNT[4]), .I1(N87), .S(N82), .Z(n9)
         );
  gf180mcu_fd_sc_mcu7t5v0__mux2_1 U32 ( .I0(CNT[5]), .I1(N88), .S(N82), .Z(n8)
         );
  gf180mcu_fd_sc_mcu7t5v0__mux2_1 U33 ( .I0(CNT[6]), .I1(N89), .S(N82), .Z(n7)
         );
  gf180mcu_fd_sc_mcu7t5v0__mux2_1 U34 ( .I0(CNT[7]), .I1(N90), .S(N82), .Z(n6)
         );
  gf180mcu_fd_sc_mcu7t5v0__mux2_1 U35 ( .I0(CNT[8]), .I1(N91), .S(N82), .Z(n5)
         );
  gf180mcu_fd_sc_mcu7t5v0__mux2_1 U36 ( .I0(CNT[9]), .I1(N92), .S(N82), .Z(n4)
         );
  gf180mcu_fd_sc_mcu7t5v0__xnor2_1 U37 ( .A1(PSC[6]), .A2(PSC_counter[6]), 
        .ZN(n25) );
  gf180mcu_fd_sc_mcu7t5v0__xnor2_1 U38 ( .A1(PSC_counter[4]), .A2(PSC[4]), 
        .ZN(n24) );
  gf180mcu_fd_sc_mcu7t5v0__xor2_1 U39 ( .A1(PSC[1]), .A2(PSC_counter[1]), .Z(
        n17) );
  gf180mcu_fd_sc_mcu7t5v0__xor2_1 U40 ( .A1(PSC[2]), .A2(PSC_counter[2]), .Z(
        n16) );
  gf180mcu_fd_sc_mcu7t5v0__xor2_1 U41 ( .A1(PSC[0]), .A2(PSC_counter[0]), .Z(
        n15) );
  gf180mcu_fd_sc_mcu7t5v0__xor2_1 U42 ( .A1(PSC[3]), .A2(PSC_counter[3]), .Z(
        n14) );
  gf180mcu_fd_sc_mcu7t5v0__nor4_1 U43 ( .A1(n17), .A2(n16), .A3(n15), .A4(n14), 
        .ZN(n23) );
  gf180mcu_fd_sc_mcu7t5v0__xor2_1 U44 ( .A1(PSC[7]), .A2(PSC_counter[7]), .Z(
        n21) );
  gf180mcu_fd_sc_mcu7t5v0__xor2_1 U45 ( .A1(PSC[5]), .A2(PSC_counter[5]), .Z(
        n20) );
  gf180mcu_fd_sc_mcu7t5v0__xor2_1 U46 ( .A1(PSC[8]), .A2(PSC_counter[8]), .Z(
        n19) );
  gf180mcu_fd_sc_mcu7t5v0__xor2_1 U47 ( .A1(PSC[9]), .A2(PSC_counter[9]), .Z(
        n18) );
  gf180mcu_fd_sc_mcu7t5v0__nor4_1 U48 ( .A1(n21), .A2(n20), .A3(n19), .A4(n18), 
        .ZN(n22) );
  gf180mcu_fd_sc_mcu7t5v0__and4_1 U49 ( .A1(n25), .A2(n24), .A3(n23), .A4(n22), 
        .Z(N36) );
  gf180mcu_fd_sc_mcu7t5v0__xnor2_1 U50 ( .A1(ARR[6]), .A2(CNT[6]), .ZN(n37) );
  gf180mcu_fd_sc_mcu7t5v0__xnor2_1 U51 ( .A1(CNT[4]), .A2(ARR[4]), .ZN(n36) );
  gf180mcu_fd_sc_mcu7t5v0__xor2_1 U52 ( .A1(ARR[1]), .A2(CNT[1]), .Z(n29) );
  gf180mcu_fd_sc_mcu7t5v0__xor2_1 U53 ( .A1(ARR[2]), .A2(CNT[2]), .Z(n28) );
  gf180mcu_fd_sc_mcu7t5v0__xor2_1 U54 ( .A1(ARR[0]), .A2(CNT[0]), .Z(n27) );
  gf180mcu_fd_sc_mcu7t5v0__xor2_1 U55 ( .A1(ARR[3]), .A2(CNT[3]), .Z(n26) );
  gf180mcu_fd_sc_mcu7t5v0__nor4_1 U56 ( .A1(n29), .A2(n28), .A3(n27), .A4(n26), 
        .ZN(n35) );
  gf180mcu_fd_sc_mcu7t5v0__xor2_1 U57 ( .A1(ARR[7]), .A2(CNT[7]), .Z(n33) );
  gf180mcu_fd_sc_mcu7t5v0__xor2_1 U58 ( .A1(ARR[5]), .A2(CNT[5]), .Z(n32) );
  gf180mcu_fd_sc_mcu7t5v0__xor2_1 U59 ( .A1(ARR[8]), .A2(CNT[8]), .Z(n31) );
  gf180mcu_fd_sc_mcu7t5v0__xor2_1 U60 ( .A1(ARR[9]), .A2(CNT[9]), .Z(n30) );
  gf180mcu_fd_sc_mcu7t5v0__nor4_1 U61 ( .A1(n33), .A2(n32), .A3(n31), .A4(n30), 
        .ZN(n34) );
  PWM_DW01_inc_0 add_x_5 ( .A(PSC_counter), .SUM({N71, N70, N69, N68, N67, N66, 
        N65, N64, N63, N62}) );
  PWM_DW01_inc_1 add_x_4 ( .A(CNT), .SUM({N51, N50, N49, N48, N47, N46, N45, 
        N44, N43, N42}) );
  PWM_DP_OP_15_122_8448_1 DP_OP_15_122_8448 ( .I1(ARR), .I2(duty_cycle), .O1({
        N32, N31, N30, N29, N28, N27, N26, N25, N24, N23, N22, N21, N20, N19, 
        N18, N17, N16, N15, N14}) );
  PWM_DP_OP_37_123_5779_1 \div_1/u_div/DP_OP_37_123_5779  ( .I1({N32, N31, N30, 
        N29, N28, N27, N26, N25, N24, N23, N22, N21, N20, N19, N18, N17, N16, 
        N15, N14}), .I2({net3743, net3743, net3743, net3743, net3743, net3743, 
        \div_1/net1390 , net3743, \div_1/net1390 , net3743, net3743, net3743, 
        \div_1/net1390 , \div_1/net1390 , \div_1/net1390 , \div_1/net1390 , 
        net3743, \div_1/net1390 , net3743, \div_1/net1390 , \div_1/net1390 , 
        \div_1/net1390 , net3743, net3743, net3743, net3743}), .I3({
        \div_1/net1390 , \div_1/net1390 , net3743, net3743, \div_1/net1390 , 
        net3743, net3743}), .I4({N20, N19, N18, N17, N16, N15, N14}), .O1({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, CCR, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29, 
        SYNOPSYS_UNCONNECTED__30, SYNOPSYS_UNCONNECTED__31, 
        SYNOPSYS_UNCONNECTED__32, SYNOPSYS_UNCONNECTED__33}) );
  gf180mcu_fd_sc_mcu7t5v0__inv_1 U65 ( .I(n66), .ZN(n67) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U68 ( .A1(N36), .A2(N35), .ZN(n41) );
  gf180mcu_fd_sc_mcu7t5v0__tieh U69 ( .Z(\div_1/net1390 ) );
  gf180mcu_fd_sc_mcu7t5v0__tiel U70 ( .ZN(net3743) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U71 ( .I(CNT[9]), .ZN(n42) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U72 ( .I(CNT[8]), .ZN(n68) );
  gf180mcu_fd_sc_mcu7t5v0__oai22_1 U73 ( .A1(n42), .A2(CCR[9]), .B1(n68), .B2(
        CCR[8]), .ZN(n43) );
  gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U74 ( .A1(n42), .A2(CCR[9]), .B(CCR[10]), 
        .ZN(n66) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U76 ( .I(CCR[7]), .ZN(n64) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U77 ( .A1(CNT[7]), .A2(n64), .ZN(n44) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U78 ( .A1(CCR[6]), .A2(n44), .ZN(n45) );
  gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U79 ( .A1(CNT[6]), .A2(n45), .B1(CNT[7]), 
        .B2(n64), .ZN(n70) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U80 ( .I(CCR[6]), .ZN(n65) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U81 ( .I(CNT[5]), .ZN(n46) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U82 ( .A1(CCR[5]), .A2(n46), .ZN(n56) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U83 ( .A1(CNT[4]), .A2(n56), .ZN(n47) );
  gf180mcu_fd_sc_mcu7t5v0__oai22_1 U84 ( .A1(CCR[4]), .A2(n47), .B1(CCR[5]), 
        .B2(n46), .ZN(n63) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U85 ( .I(CNT[2]), .ZN(n48) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U86 ( .I(CCR[3]), .ZN(n51) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U87 ( .A1(CNT[3]), .A2(n51), .ZN(n50) );
  gf180mcu_fd_sc_mcu7t5v0__aoi21_1 U88 ( .A1(n48), .A2(CCR[2]), .B(n50), .ZN(
        n49) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U89 ( .I(n49), .ZN(n61) );
  gf180mcu_fd_sc_mcu7t5v0__nor2_1 U90 ( .A1(CCR[2]), .A2(n50), .ZN(n52) );
  gf180mcu_fd_sc_mcu7t5v0__aoi22_1 U91 ( .A1(CNT[2]), .A2(n52), .B1(CNT[3]), 
        .B2(n51), .ZN(n60) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U92 ( .I(CCR[1]), .ZN(n54) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U93 ( .A1(n54), .A2(CNT[1]), .ZN(n53) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U94 ( .A1(CCR[0]), .A2(n53), .ZN(n55) );
  gf180mcu_fd_sc_mcu7t5v0__oai22_1 U95 ( .A1(CNT[0]), .A2(n55), .B1(n54), .B2(
        CNT[1]), .ZN(n59) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U96 ( .I(CCR[4]), .ZN(n57) );
  gf180mcu_fd_sc_mcu7t5v0__oai21_1 U97 ( .A1(CNT[4]), .A2(n57), .B(n56), .ZN(
        n58) );
  gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U98 ( .A1(n61), .A2(n60), .B1(n59), .B2(
        n60), .C(n58), .ZN(n62) );
  gf180mcu_fd_sc_mcu7t5v0__oai222_1 U99 ( .A1(CNT[6]), .A2(n65), .B1(CNT[7]), 
        .B2(n64), .C1(n63), .C2(n62), .ZN(n69) );
  gf180mcu_fd_sc_mcu7t5v0__aoi221_1 U100 ( .A1(n70), .A2(n69), .B1(CCR[8]), 
        .B2(n68), .C(n67), .ZN(n71) );
  gf180mcu_fd_sc_mcu7t5v0__nand4_1 U102 ( .A1(n37), .A2(n36), .A3(n35), .A4(
        n34), .ZN(n73) );
  gf180mcu_fd_sc_mcu7t5v0__aoi211_1 U66 ( .A1(n66), .A2(n43), .B(n71), .C(n74), 
        .ZN(pwm) );
  gf180mcu_fd_sc_mcu7t5v0__or2_1 U67 ( .A1(reset), .A2(N35), .Z(n74) );
  gf180mcu_fd_sc_mcu7t5v0__clkinv_1 U75 ( .I(n3), .ZN(N93) );
  gf180mcu_fd_sc_mcu7t5v0__nand2_1 U101 ( .A1(enable), .A2(N36), .ZN(n3) );
endmodule

