/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12
// Date      : Mon May 27 17:46:55 2024
/////////////////////////////////////////////////////////////


module Controller ( start, rst_n, clk, done, control );
  output [21:0] control;
  input start, rst_n, clk;
  output done;
  wire   n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n1, n2, n4, n6, n8, n9, n10, n31, n32;
  wire   [3:0] Current_State;
  wire   [3:0] Next_State;
  assign control[2] = control[8];

  DFFRPQ_X2M_A9TR Current_State_reg_0_ ( .D(Next_State[0]), .CK(clk), .R(n32), 
        .Q(Current_State[0]) );
  DFFRPQ_X2M_A9TR Current_State_reg_2_ ( .D(Next_State[2]), .CK(clk), .R(n32), 
        .Q(Current_State[2]) );
  DFFRPQ_X2M_A9TR Current_State_reg_1_ ( .D(Next_State[1]), .CK(clk), .R(n32), 
        .Q(Current_State[1]) );
  DFFRPQ_X2M_A9TR Current_State_reg_3_ ( .D(Next_State[3]), .CK(clk), .R(n32), 
        .Q(Current_State[3]) );
  AND2_X1B_A9TR U3 ( .A(Current_State[3]), .B(n8), .Y(n1) );
  NOR2_X1A_A9TR U4 ( .A(Current_State[3]), .B(Current_State[0]), .Y(n30) );
  AND2_X0P7M_A9TR U5 ( .A(n22), .B(n10), .Y(n26) );
  NAND3_X0P5M_A9TR U6 ( .A(n20), .B(n4), .C(n22), .Y(Next_State[2]) );
  NAND2_X0P5B_A9TR U7 ( .A(n28), .B(n25), .Y(n19) );
  AO1B2_X0P5M_A9TR U8 ( .B0(n18), .B1(n25), .A0N(n23), .Y(control[8]) );
  NAND3_X0P5M_A9TR U9 ( .A(Current_State[1]), .B(Current_State[2]), .C(n25), 
        .Y(n21) );
  NAND3_X0P7M_A9TR U10 ( .A(Current_State[2]), .B(n31), .C(n30), .Y(n23) );
  NAND3_X0P5M_A9TR U11 ( .A(Current_State[2]), .B(n31), .C(n25), .Y(n22) );
  NOR2_X0P5M_A9TR U12 ( .A(n31), .B(Current_State[2]), .Y(n18) );
  INV_X0P5B_A9TR U13 ( .A(Current_State[1]), .Y(n31) );
  NAND3_X0P5M_A9TR U14 ( .A(Current_State[0]), .B(Current_State[3]), .C(n28), 
        .Y(n12) );
  NAND3_X0P5M_A9TR U15 ( .A(Current_State[1]), .B(Current_State[2]), .C(n30), 
        .Y(n20) );
  NAND3_X0P5M_A9TR U16 ( .A(n18), .B(Current_State[3]), .C(Current_State[0]), 
        .Y(n14) );
  NAND3_X0P5M_A9TR U17 ( .A(Current_State[3]), .B(n8), .C(n18), .Y(n13) );
  NAND2_X0P5B_A9TR U18 ( .A(Current_State[3]), .B(Current_State[2]), .Y(n15)
         );
  INV_X1M_A9TR U19 ( .A(Current_State[0]), .Y(n8) );
  NAND2_X1A_A9TR U20 ( .A(n1), .B(n28), .Y(n16) );
  NAND4_X0P5M_A9TR U21 ( .A(n13), .B(n23), .C(n16), .D(n29), .Y(Next_State[0])
         );
  INV_X1M_A9TR U22 ( .A(control[5]), .Y(n6) );
  INV_X1M_A9TR U23 ( .A(control[8]), .Y(n4) );
  INV_X1M_A9TR U24 ( .A(n27), .Y(n10) );
  OR2_X1B_A9TR U25 ( .A(control[14]), .B(control[1]), .Y(control[10]) );
  NAND2_X1A_A9TR U26 ( .A(n4), .B(n2), .Y(control[9]) );
  NAND2_X1A_A9TR U27 ( .A(n19), .B(n4), .Y(control[18]) );
  OR2_X1B_A9TR U28 ( .A(control[3]), .B(n9), .Y(control[19]) );
  NAND3BB_X1M_A9TR U29 ( .AN(control[6]), .BN(control[5]), .C(n17), .Y(
        control[21]) );
  INV_X1M_A9TR U30 ( .A(n2), .Y(done) );
  INV_X1M_A9TR U31 ( .A(n17), .Y(n9) );
  NAND3_X1A_A9TR U32 ( .A(n24), .B(n16), .C(n22), .Y(control[11]) );
  NAND3_X1A_A9TR U33 ( .A(n21), .B(n23), .C(n19), .Y(control[12]) );
  NAND2_X1A_A9TR U34 ( .A(n30), .B(n18), .Y(n24) );
  NAND3XXB_X1M_A9TR U35 ( .CN(control[16]), .A(n16), .B(n12), .Y(control[15])
         );
  NAND3_X1A_A9TR U36 ( .A(n20), .B(n21), .C(n22), .Y(control[16]) );
  NAND3_X1A_A9TR U37 ( .A(n23), .B(n6), .C(n10), .Y(control[13]) );
  NAND2_X1A_A9TR U38 ( .A(n21), .B(n12), .Y(control[5]) );
  NAND3_X1A_A9TR U39 ( .A(n12), .B(n4), .C(n16), .Y(control[14]) );
  NAND2_X1A_A9TR U40 ( .A(n24), .B(n20), .Y(n27) );
  INV_X1M_A9TR U41 ( .A(n20), .Y(control[1]) );
  NAND3_X1A_A9TR U42 ( .A(n12), .B(n2), .C(n13), .Y(control[7]) );
  AND2_X1B_A9TR U43 ( .A(n14), .B(n15), .Y(n2) );
  NAND2_X1A_A9TR U44 ( .A(n13), .B(n14), .Y(control[6]) );
  NAND2_X1A_A9TR U45 ( .A(n12), .B(n15), .Y(control[3]) );
  NAND3_X1A_A9TR U46 ( .A(n16), .B(n4), .C(n10), .Y(control[17]) );
  INV_X1M_A9TR U47 ( .A(n16), .Y(control[4]) );
  NAND2_X1A_A9TR U48 ( .A(n17), .B(n16), .Y(control[20]) );
  INV_X1M_A9TR U49 ( .A(n21), .Y(control[0]) );
  NAND2_X1A_A9TR U50 ( .A(n28), .B(n30), .Y(n17) );
  NAND4_X1A_A9TR U51 ( .A(n13), .B(n12), .C(n19), .D(n26), .Y(Next_State[1])
         );
  NAND3_X1A_A9TR U52 ( .A(n13), .B(n6), .C(n16), .Y(Next_State[3]) );
  NOR2_X1A_A9TR U53 ( .A(Current_State[2]), .B(Current_State[1]), .Y(n28) );
  NOR2_X1A_A9TR U54 ( .A(n8), .B(Current_State[3]), .Y(n25) );
  AOI21_X1M_A9TR U55 ( .A0(start), .A1(n9), .B0(n27), .Y(n29) );
  INV_X1M_A9TR U56 ( .A(rst_n), .Y(n32) );
endmodule


module Register_0 ( D, reset, clk, load, Q );
  input [8:0] D;
  output [8:0] Q;
  input reset, clk, load;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n1, n11, n12;

  DFFRPQ_X2M_A9TR Q_reg_8_ ( .D(n10), .CK(clk), .R(n12), .Q(Q[8]) );
  DFFRPQ_X2M_A9TR Q_reg_7_ ( .D(n9), .CK(clk), .R(n12), .Q(Q[7]) );
  DFFRPQ_X2M_A9TR Q_reg_6_ ( .D(n8), .CK(clk), .R(n12), .Q(Q[6]) );
  DFFRPQ_X2M_A9TR Q_reg_5_ ( .D(n7), .CK(clk), .R(n12), .Q(Q[5]) );
  DFFRPQ_X2M_A9TR Q_reg_4_ ( .D(n6), .CK(clk), .R(n12), .Q(Q[4]) );
  DFFRPQ_X2M_A9TR Q_reg_3_ ( .D(n5), .CK(clk), .R(n12), .Q(Q[3]) );
  DFFRPQ_X2M_A9TR Q_reg_2_ ( .D(n4), .CK(clk), .R(n12), .Q(Q[2]) );
  DFFRPQ_X2M_A9TR Q_reg_1_ ( .D(n3), .CK(clk), .R(n12), .Q(Q[1]) );
  DFFRPQ_X2M_A9TR Q_reg_0_ ( .D(n2), .CK(clk), .R(n12), .Q(Q[0]) );
  INV_X1M_A9TR U2 ( .A(n1), .Y(n11) );
  BUFH_X1M_A9TR U3 ( .A(load), .Y(n1) );
  AO22_X1M_A9TR U4 ( .A0(Q[8]), .A1(n11), .B0(D[8]), .B1(n1), .Y(n10) );
  AO22_X1M_A9TR U5 ( .A0(Q[7]), .A1(n11), .B0(D[7]), .B1(n1), .Y(n9) );
  AO22_X1M_A9TR U6 ( .A0(Q[6]), .A1(n11), .B0(D[6]), .B1(n1), .Y(n8) );
  AO22_X1M_A9TR U7 ( .A0(Q[5]), .A1(n11), .B0(D[5]), .B1(n1), .Y(n7) );
  AO22_X1M_A9TR U8 ( .A0(Q[4]), .A1(n11), .B0(D[4]), .B1(n1), .Y(n6) );
  AO22_X1M_A9TR U9 ( .A0(Q[3]), .A1(n11), .B0(D[3]), .B1(n1), .Y(n5) );
  AO22_X1M_A9TR U10 ( .A0(Q[2]), .A1(n11), .B0(D[2]), .B1(n1), .Y(n4) );
  AO22_X1M_A9TR U11 ( .A0(Q[1]), .A1(n11), .B0(D[1]), .B1(n1), .Y(n3) );
  AO22_X1M_A9TR U12 ( .A0(Q[0]), .A1(n11), .B0(n1), .B1(D[0]), .Y(n2) );
  INV_X1M_A9TR U13 ( .A(reset), .Y(n12) );
endmodule


module Register_8 ( D, reset, clk, load, Q );
  input [8:0] D;
  output [8:0] Q;
  input reset, clk, load;
  wire   n1, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20;

  DFFRPQ_X2M_A9TR Q_reg_8_ ( .D(n12), .CK(clk), .R(n11), .Q(Q[8]) );
  DFFRPQ_X2M_A9TR Q_reg_7_ ( .D(n13), .CK(clk), .R(n11), .Q(Q[7]) );
  DFFRPQ_X2M_A9TR Q_reg_6_ ( .D(n14), .CK(clk), .R(n11), .Q(Q[6]) );
  DFFRPQ_X2M_A9TR Q_reg_5_ ( .D(n15), .CK(clk), .R(n11), .Q(Q[5]) );
  DFFRPQ_X2M_A9TR Q_reg_4_ ( .D(n16), .CK(clk), .R(n11), .Q(Q[4]) );
  DFFRPQ_X2M_A9TR Q_reg_3_ ( .D(n17), .CK(clk), .R(n11), .Q(Q[3]) );
  DFFRPQ_X2M_A9TR Q_reg_2_ ( .D(n18), .CK(clk), .R(n11), .Q(Q[2]) );
  DFFRPQ_X2M_A9TR Q_reg_1_ ( .D(n19), .CK(clk), .R(n11), .Q(Q[1]) );
  DFFRPQ_X2M_A9TR Q_reg_0_ ( .D(n20), .CK(clk), .R(n11), .Q(Q[0]) );
  INV_X1M_A9TR U2 ( .A(load), .Y(n1) );
  AO22_X1M_A9TR U3 ( .A0(Q[8]), .A1(n1), .B0(D[8]), .B1(load), .Y(n12) );
  AO22_X1M_A9TR U4 ( .A0(Q[7]), .A1(n1), .B0(D[7]), .B1(load), .Y(n13) );
  AO22_X1M_A9TR U5 ( .A0(Q[6]), .A1(n1), .B0(D[6]), .B1(load), .Y(n14) );
  AO22_X1M_A9TR U6 ( .A0(Q[5]), .A1(n1), .B0(D[5]), .B1(load), .Y(n15) );
  AO22_X1M_A9TR U7 ( .A0(Q[4]), .A1(n1), .B0(D[4]), .B1(load), .Y(n16) );
  AO22_X1M_A9TR U8 ( .A0(Q[3]), .A1(n1), .B0(D[3]), .B1(load), .Y(n17) );
  AO22_X1M_A9TR U9 ( .A0(Q[2]), .A1(n1), .B0(D[2]), .B1(load), .Y(n18) );
  AO22_X1M_A9TR U10 ( .A0(Q[1]), .A1(n1), .B0(D[1]), .B1(load), .Y(n19) );
  AO22_X1M_A9TR U11 ( .A0(Q[0]), .A1(n1), .B0(load), .B1(D[0]), .Y(n20) );
  INV_X1M_A9TR U12 ( .A(reset), .Y(n11) );
endmodule


module Register_7 ( D, reset, clk, load, Q );
  input [8:0] D;
  output [8:0] Q;
  input reset, clk, load;
  wire   n1, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20;

  DFFRPQ_X2M_A9TR Q_reg_8_ ( .D(n12), .CK(clk), .R(n11), .Q(Q[8]) );
  DFFRPQ_X2M_A9TR Q_reg_7_ ( .D(n13), .CK(clk), .R(n11), .Q(Q[7]) );
  DFFRPQ_X2M_A9TR Q_reg_6_ ( .D(n14), .CK(clk), .R(n11), .Q(Q[6]) );
  DFFRPQ_X2M_A9TR Q_reg_5_ ( .D(n15), .CK(clk), .R(n11), .Q(Q[5]) );
  DFFRPQ_X2M_A9TR Q_reg_4_ ( .D(n16), .CK(clk), .R(n11), .Q(Q[4]) );
  DFFRPQ_X2M_A9TR Q_reg_3_ ( .D(n17), .CK(clk), .R(n11), .Q(Q[3]) );
  DFFRPQ_X2M_A9TR Q_reg_2_ ( .D(n18), .CK(clk), .R(n11), .Q(Q[2]) );
  DFFRPQ_X2M_A9TR Q_reg_1_ ( .D(n19), .CK(clk), .R(n11), .Q(Q[1]) );
  DFFRPQ_X2M_A9TR Q_reg_0_ ( .D(n20), .CK(clk), .R(n11), .Q(Q[0]) );
  INV_X1M_A9TR U2 ( .A(load), .Y(n1) );
  AO22_X1M_A9TR U3 ( .A0(Q[8]), .A1(n1), .B0(D[8]), .B1(load), .Y(n12) );
  AO22_X1M_A9TR U4 ( .A0(Q[7]), .A1(n1), .B0(D[7]), .B1(load), .Y(n13) );
  AO22_X1M_A9TR U5 ( .A0(Q[6]), .A1(n1), .B0(D[6]), .B1(load), .Y(n14) );
  AO22_X1M_A9TR U6 ( .A0(Q[5]), .A1(n1), .B0(D[5]), .B1(load), .Y(n15) );
  AO22_X1M_A9TR U7 ( .A0(Q[4]), .A1(n1), .B0(D[4]), .B1(load), .Y(n16) );
  AO22_X1M_A9TR U8 ( .A0(Q[3]), .A1(n1), .B0(D[3]), .B1(load), .Y(n17) );
  AO22_X1M_A9TR U9 ( .A0(Q[2]), .A1(n1), .B0(D[2]), .B1(load), .Y(n18) );
  AO22_X1M_A9TR U10 ( .A0(Q[1]), .A1(n1), .B0(D[1]), .B1(load), .Y(n19) );
  AO22_X1M_A9TR U11 ( .A0(Q[0]), .A1(n1), .B0(load), .B1(D[0]), .Y(n20) );
  INV_X1M_A9TR U12 ( .A(reset), .Y(n11) );
endmodule


module Register_6 ( D, reset, clk, load, Q );
  input [8:0] D;
  output [8:0] Q;
  input reset, clk, load;
  wire   n1, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20;

  DFFRPQ_X2M_A9TR Q_reg_8_ ( .D(n12), .CK(clk), .R(n11), .Q(Q[8]) );
  DFFRPQ_X2M_A9TR Q_reg_7_ ( .D(n13), .CK(clk), .R(n11), .Q(Q[7]) );
  DFFRPQ_X2M_A9TR Q_reg_6_ ( .D(n14), .CK(clk), .R(n11), .Q(Q[6]) );
  DFFRPQ_X2M_A9TR Q_reg_5_ ( .D(n15), .CK(clk), .R(n11), .Q(Q[5]) );
  DFFRPQ_X2M_A9TR Q_reg_4_ ( .D(n16), .CK(clk), .R(n11), .Q(Q[4]) );
  DFFRPQ_X2M_A9TR Q_reg_3_ ( .D(n17), .CK(clk), .R(n11), .Q(Q[3]) );
  DFFRPQ_X2M_A9TR Q_reg_2_ ( .D(n18), .CK(clk), .R(n11), .Q(Q[2]) );
  DFFRPQ_X2M_A9TR Q_reg_1_ ( .D(n19), .CK(clk), .R(n11), .Q(Q[1]) );
  DFFRPQ_X2M_A9TR Q_reg_0_ ( .D(n20), .CK(clk), .R(n11), .Q(Q[0]) );
  INV_X1M_A9TR U2 ( .A(load), .Y(n1) );
  AO22_X1M_A9TR U3 ( .A0(Q[8]), .A1(n1), .B0(D[8]), .B1(load), .Y(n12) );
  AO22_X1M_A9TR U4 ( .A0(Q[7]), .A1(n1), .B0(D[7]), .B1(load), .Y(n13) );
  AO22_X1M_A9TR U5 ( .A0(Q[6]), .A1(n1), .B0(D[6]), .B1(load), .Y(n14) );
  AO22_X1M_A9TR U6 ( .A0(Q[5]), .A1(n1), .B0(D[5]), .B1(load), .Y(n15) );
  AO22_X1M_A9TR U7 ( .A0(Q[4]), .A1(n1), .B0(D[4]), .B1(load), .Y(n16) );
  AO22_X1M_A9TR U8 ( .A0(Q[3]), .A1(n1), .B0(D[3]), .B1(load), .Y(n17) );
  AO22_X1M_A9TR U9 ( .A0(Q[2]), .A1(n1), .B0(D[2]), .B1(load), .Y(n18) );
  AO22_X1M_A9TR U10 ( .A0(Q[1]), .A1(n1), .B0(D[1]), .B1(load), .Y(n19) );
  AO22_X1M_A9TR U11 ( .A0(Q[0]), .A1(n1), .B0(load), .B1(D[0]), .Y(n20) );
  INV_X1M_A9TR U12 ( .A(reset), .Y(n11) );
endmodule


module Register_5 ( D, reset, clk, load, Q );
  input [8:0] D;
  output [8:0] Q;
  input reset, clk, load;
  wire   n1, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;

  DFFRPQ_X2M_A9TR Q_reg_8_ ( .D(n13), .CK(clk), .R(n12), .Q(Q[8]) );
  DFFRPQ_X2M_A9TR Q_reg_7_ ( .D(n14), .CK(clk), .R(n12), .Q(Q[7]) );
  DFFRPQ_X2M_A9TR Q_reg_6_ ( .D(n15), .CK(clk), .R(n12), .Q(Q[6]) );
  DFFRPQ_X2M_A9TR Q_reg_5_ ( .D(n16), .CK(clk), .R(n12), .Q(Q[5]) );
  DFFRPQ_X2M_A9TR Q_reg_4_ ( .D(n17), .CK(clk), .R(n12), .Q(Q[4]) );
  DFFRPQ_X2M_A9TR Q_reg_3_ ( .D(n18), .CK(clk), .R(n12), .Q(Q[3]) );
  DFFRPQ_X2M_A9TR Q_reg_2_ ( .D(n19), .CK(clk), .R(n12), .Q(Q[2]) );
  DFFRPQ_X2M_A9TR Q_reg_1_ ( .D(n20), .CK(clk), .R(n12), .Q(Q[1]) );
  DFFRPQ_X2M_A9TR Q_reg_0_ ( .D(n21), .CK(clk), .R(n12), .Q(Q[0]) );
  INV_X1M_A9TR U2 ( .A(n1), .Y(n11) );
  BUFH_X1M_A9TR U3 ( .A(load), .Y(n1) );
  AO22_X1M_A9TR U4 ( .A0(Q[8]), .A1(n11), .B0(D[8]), .B1(n1), .Y(n13) );
  AO22_X1M_A9TR U5 ( .A0(Q[7]), .A1(n11), .B0(D[7]), .B1(n1), .Y(n14) );
  AO22_X1M_A9TR U6 ( .A0(Q[6]), .A1(n11), .B0(D[6]), .B1(n1), .Y(n15) );
  AO22_X1M_A9TR U7 ( .A0(Q[5]), .A1(n11), .B0(D[5]), .B1(n1), .Y(n16) );
  AO22_X1M_A9TR U8 ( .A0(Q[4]), .A1(n11), .B0(D[4]), .B1(n1), .Y(n17) );
  AO22_X1M_A9TR U9 ( .A0(Q[3]), .A1(n11), .B0(D[3]), .B1(n1), .Y(n18) );
  AO22_X1M_A9TR U10 ( .A0(Q[2]), .A1(n11), .B0(D[2]), .B1(n1), .Y(n19) );
  AO22_X1M_A9TR U11 ( .A0(Q[1]), .A1(n11), .B0(D[1]), .B1(n1), .Y(n20) );
  AO22_X1M_A9TR U12 ( .A0(Q[0]), .A1(n11), .B0(n1), .B1(D[0]), .Y(n21) );
  INV_X1M_A9TR U13 ( .A(reset), .Y(n12) );
endmodule


module Register_4 ( D, reset, clk, load, Q );
  input [8:0] D;
  output [8:0] Q;
  input reset, clk, load;
  wire   n1, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;

  DFFRPQ_X2M_A9TR Q_reg_8_ ( .D(n13), .CK(clk), .R(n12), .Q(Q[8]) );
  DFFRPQ_X2M_A9TR Q_reg_7_ ( .D(n14), .CK(clk), .R(n12), .Q(Q[7]) );
  DFFRPQ_X2M_A9TR Q_reg_6_ ( .D(n15), .CK(clk), .R(n12), .Q(Q[6]) );
  DFFRPQ_X2M_A9TR Q_reg_5_ ( .D(n16), .CK(clk), .R(n12), .Q(Q[5]) );
  DFFRPQ_X2M_A9TR Q_reg_4_ ( .D(n17), .CK(clk), .R(n12), .Q(Q[4]) );
  DFFRPQ_X2M_A9TR Q_reg_3_ ( .D(n18), .CK(clk), .R(n12), .Q(Q[3]) );
  DFFRPQ_X2M_A9TR Q_reg_2_ ( .D(n19), .CK(clk), .R(n12), .Q(Q[2]) );
  DFFRPQ_X2M_A9TR Q_reg_1_ ( .D(n20), .CK(clk), .R(n12), .Q(Q[1]) );
  DFFRPQ_X2M_A9TR Q_reg_0_ ( .D(n21), .CK(clk), .R(n12), .Q(Q[0]) );
  INV_X1M_A9TR U2 ( .A(n1), .Y(n11) );
  BUFH_X1M_A9TR U3 ( .A(load), .Y(n1) );
  AO22_X1M_A9TR U4 ( .A0(Q[8]), .A1(n11), .B0(D[8]), .B1(n1), .Y(n13) );
  AO22_X1M_A9TR U5 ( .A0(Q[7]), .A1(n11), .B0(D[7]), .B1(n1), .Y(n14) );
  AO22_X1M_A9TR U6 ( .A0(Q[6]), .A1(n11), .B0(D[6]), .B1(n1), .Y(n15) );
  AO22_X1M_A9TR U7 ( .A0(Q[5]), .A1(n11), .B0(D[5]), .B1(n1), .Y(n16) );
  AO22_X1M_A9TR U8 ( .A0(Q[4]), .A1(n11), .B0(D[4]), .B1(n1), .Y(n17) );
  AO22_X1M_A9TR U9 ( .A0(Q[3]), .A1(n11), .B0(D[3]), .B1(n1), .Y(n18) );
  AO22_X1M_A9TR U10 ( .A0(Q[2]), .A1(n11), .B0(D[2]), .B1(n1), .Y(n19) );
  AO22_X1M_A9TR U11 ( .A0(Q[1]), .A1(n11), .B0(D[1]), .B1(n1), .Y(n20) );
  AO22_X1M_A9TR U12 ( .A0(Q[0]), .A1(n11), .B0(n1), .B1(D[0]), .Y(n21) );
  INV_X1M_A9TR U13 ( .A(reset), .Y(n12) );
endmodule


module MUX3_0 ( A, B, C, S, Y );
  input [8:0] A;
  input [8:0] B;
  input [8:0] C;
  input [1:0] S;
  output [8:0] Y;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n1;

  INV_X1M_A9TR U1 ( .A(S[0]), .Y(n1) );
  XNOR2_X0P5M_A9TR U2 ( .A(S[0]), .B(S[1]), .Y(n4) );
  AO1B2_X0P5M_A9TR U3 ( .B0(B[3]), .B1(n2), .A0N(n10), .Y(Y[3]) );
  AO1B2_X0P5M_A9TR U4 ( .B0(B[4]), .B1(n2), .A0N(n9), .Y(Y[4]) );
  AO1B2_X0P5M_A9TR U5 ( .B0(B[5]), .B1(n2), .A0N(n8), .Y(Y[5]) );
  AO1B2_X0P5M_A9TR U6 ( .B0(B[6]), .B1(n2), .A0N(n7), .Y(Y[6]) );
  AO1B2_X0P5M_A9TR U7 ( .B0(B[7]), .B1(n2), .A0N(n6), .Y(Y[7]) );
  AO1B2_X0P5M_A9TR U8 ( .B0(B[8]), .B1(n2), .A0N(n3), .Y(Y[8]) );
  NOR2_X0P5M_A9TR U9 ( .A(n1), .B(S[1]), .Y(n2) );
  AND2_X0P7M_A9TR U10 ( .A(S[1]), .B(n1), .Y(n5) );
  AOI22_X0P5M_A9TR U11 ( .A0(A[2]), .A1(n4), .B0(C[2]), .B1(n5), .Y(n11) );
  AOI22_X0P5M_A9TR U12 ( .A0(A[3]), .A1(n4), .B0(C[3]), .B1(n5), .Y(n10) );
  AOI22_X0P5M_A9TR U13 ( .A0(A[0]), .A1(n4), .B0(C[0]), .B1(n5), .Y(n13) );
  AOI22_X0P5M_A9TR U14 ( .A0(A[4]), .A1(n4), .B0(C[4]), .B1(n5), .Y(n9) );
  AOI22_X0P5M_A9TR U15 ( .A0(A[5]), .A1(n4), .B0(C[5]), .B1(n5), .Y(n8) );
  AOI22_X0P5M_A9TR U16 ( .A0(A[6]), .A1(n4), .B0(C[6]), .B1(n5), .Y(n7) );
  AOI22_X0P5M_A9TR U17 ( .A0(A[7]), .A1(n4), .B0(C[7]), .B1(n5), .Y(n6) );
  AOI22_X0P5M_A9TR U18 ( .A0(A[8]), .A1(n4), .B0(C[8]), .B1(n5), .Y(n3) );
  AO1B2_X1M_A9TR U19 ( .B0(B[2]), .B1(n2), .A0N(n11), .Y(Y[2]) );
  AO1B2_X1M_A9TR U20 ( .B0(B[1]), .B1(n2), .A0N(n12), .Y(Y[1]) );
  AOI22_X1M_A9TR U21 ( .A0(A[1]), .A1(n4), .B0(C[1]), .B1(n5), .Y(n12) );
  AO1B2_X1M_A9TR U22 ( .B0(B[0]), .B1(n2), .A0N(n13), .Y(Y[0]) );
endmodule


module MUX4 ( A, B, C, D, S, Y );
  input [8:0] A;
  input [8:0] B;
  input [8:0] C;
  input [8:0] D;
  input [1:0] S;
  output [8:0] Y;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n1;

  AND2_X1B_A9TR U1 ( .A(S[1]), .B(S[0]), .Y(n4) );
  NOR2_X1A_A9TR U2 ( .A(n1), .B(S[1]), .Y(n6) );
  AND2_X1B_A9TR U3 ( .A(S[1]), .B(n1), .Y(n5) );
  INV_X1M_A9TR U4 ( .A(S[0]), .Y(n1) );
  NOR2_X1A_A9TR U5 ( .A(S[0]), .B(S[1]), .Y(n7) );
  NAND2_X1A_A9TR U6 ( .A(n2), .B(n3), .Y(Y[8]) );
  NAND2_X1A_A9TR U7 ( .A(n18), .B(n19), .Y(Y[2]) );
  NAND2_X1A_A9TR U8 ( .A(n16), .B(n17), .Y(Y[3]) );
  NAND2_X1A_A9TR U9 ( .A(n14), .B(n15), .Y(Y[4]) );
  NAND2_X1A_A9TR U10 ( .A(n12), .B(n13), .Y(Y[5]) );
  NAND2_X1A_A9TR U11 ( .A(n10), .B(n11), .Y(Y[6]) );
  NAND2_X1A_A9TR U12 ( .A(n8), .B(n9), .Y(Y[7]) );
  NAND2_X1A_A9TR U13 ( .A(n20), .B(n21), .Y(Y[1]) );
  NAND2_X1A_A9TR U14 ( .A(n22), .B(n23), .Y(Y[0]) );
  AOI22_X1M_A9TR U15 ( .A0(B[0]), .A1(n6), .B0(A[0]), .B1(n7), .Y(n22) );
  AOI22_X1M_A9TR U16 ( .A0(D[0]), .A1(n4), .B0(C[0]), .B1(n5), .Y(n23) );
  AOI22_X1M_A9TR U17 ( .A0(D[1]), .A1(n4), .B0(C[1]), .B1(n5), .Y(n21) );
  AOI22_X1M_A9TR U18 ( .A0(B[1]), .A1(n6), .B0(A[1]), .B1(n7), .Y(n20) );
  AOI22_X1M_A9TR U19 ( .A0(D[2]), .A1(n4), .B0(C[2]), .B1(n5), .Y(n19) );
  AOI22_X1M_A9TR U20 ( .A0(B[2]), .A1(n6), .B0(A[2]), .B1(n7), .Y(n18) );
  AOI22_X1M_A9TR U21 ( .A0(D[3]), .A1(n4), .B0(C[3]), .B1(n5), .Y(n17) );
  AOI22_X1M_A9TR U22 ( .A0(B[3]), .A1(n6), .B0(A[3]), .B1(n7), .Y(n16) );
  AOI22_X1M_A9TR U23 ( .A0(D[4]), .A1(n4), .B0(C[4]), .B1(n5), .Y(n15) );
  AOI22_X1M_A9TR U24 ( .A0(B[4]), .A1(n6), .B0(A[4]), .B1(n7), .Y(n14) );
  AOI22_X1M_A9TR U25 ( .A0(D[5]), .A1(n4), .B0(C[5]), .B1(n5), .Y(n13) );
  AOI22_X1M_A9TR U26 ( .A0(B[5]), .A1(n6), .B0(A[5]), .B1(n7), .Y(n12) );
  AOI22_X1M_A9TR U27 ( .A0(D[6]), .A1(n4), .B0(C[6]), .B1(n5), .Y(n11) );
  AOI22_X1M_A9TR U28 ( .A0(B[6]), .A1(n6), .B0(A[6]), .B1(n7), .Y(n10) );
  AOI22_X1M_A9TR U29 ( .A0(D[7]), .A1(n4), .B0(C[7]), .B1(n5), .Y(n9) );
  AOI22_X1M_A9TR U30 ( .A0(B[7]), .A1(n6), .B0(A[7]), .B1(n7), .Y(n8) );
  AOI22_X1M_A9TR U31 ( .A0(D[8]), .A1(n4), .B0(C[8]), .B1(n5), .Y(n3) );
  AOI22_X1M_A9TR U32 ( .A0(B[8]), .A1(n6), .B0(A[8]), .B1(n7), .Y(n2) );
endmodule


module MUX3_2 ( A, B, C, S, Y );
  input [8:0] A;
  input [8:0] B;
  input [8:0] C;
  input [1:0] S;
  output [8:0] Y;
  wire   n1, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25;

  XNOR2_X0P7M_A9TR U1 ( .A(S[0]), .B(S[1]), .Y(n23) );
  INV_X1M_A9TR U2 ( .A(S[0]), .Y(n1) );
  AND2_X1B_A9TR U3 ( .A(S[1]), .B(n1), .Y(n22) );
  NOR2_X1A_A9TR U4 ( .A(n1), .B(S[1]), .Y(n25) );
  AO1B2_X1M_A9TR U5 ( .B0(B[8]), .B1(n25), .A0N(n24), .Y(Y[8]) );
  AOI22_X1M_A9TR U6 ( .A0(A[8]), .A1(n23), .B0(C[8]), .B1(n22), .Y(n24) );
  AO1B2_X1M_A9TR U7 ( .B0(B[2]), .B1(n25), .A0N(n16), .Y(Y[2]) );
  AOI22_X1M_A9TR U8 ( .A0(A[2]), .A1(n23), .B0(C[2]), .B1(n22), .Y(n16) );
  AO1B2_X1M_A9TR U9 ( .B0(B[3]), .B1(n25), .A0N(n17), .Y(Y[3]) );
  AOI22_X1M_A9TR U10 ( .A0(A[3]), .A1(n23), .B0(C[3]), .B1(n22), .Y(n17) );
  AO1B2_X1M_A9TR U11 ( .B0(B[4]), .B1(n25), .A0N(n18), .Y(Y[4]) );
  AOI22_X1M_A9TR U12 ( .A0(A[4]), .A1(n23), .B0(C[4]), .B1(n22), .Y(n18) );
  AO1B2_X1M_A9TR U13 ( .B0(B[5]), .B1(n25), .A0N(n19), .Y(Y[5]) );
  AOI22_X1M_A9TR U14 ( .A0(A[5]), .A1(n23), .B0(C[5]), .B1(n22), .Y(n19) );
  AO1B2_X1M_A9TR U15 ( .B0(B[6]), .B1(n25), .A0N(n20), .Y(Y[6]) );
  AOI22_X1M_A9TR U16 ( .A0(A[6]), .A1(n23), .B0(C[6]), .B1(n22), .Y(n20) );
  AO1B2_X1M_A9TR U17 ( .B0(B[7]), .B1(n25), .A0N(n21), .Y(Y[7]) );
  AOI22_X1M_A9TR U18 ( .A0(A[7]), .A1(n23), .B0(C[7]), .B1(n22), .Y(n21) );
  AO1B2_X1M_A9TR U19 ( .B0(B[1]), .B1(n25), .A0N(n15), .Y(Y[1]) );
  AO1B2_X1M_A9TR U20 ( .B0(B[0]), .B1(n25), .A0N(n14), .Y(Y[0]) );
  AOI22_X1M_A9TR U21 ( .A0(A[0]), .A1(n23), .B0(C[0]), .B1(n22), .Y(n14) );
  AOI22_X1M_A9TR U22 ( .A0(A[1]), .A1(n23), .B0(C[1]), .B1(n22), .Y(n15) );
endmodule


module MUX3_1 ( A, B, C, S, Y );
  input [8:0] A;
  input [8:0] B;
  input [8:0] C;
  input [1:0] S;
  output [8:0] Y;
  wire   n1, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25;

  AO21B_X1M_A9TR U1 ( .A0(B[8]), .A1(n25), .B0N(n24), .Y(Y[8]) );
  XNOR2_X0P7M_A9TR U2 ( .A(S[0]), .B(S[1]), .Y(n23) );
  INV_X1M_A9TR U3 ( .A(S[0]), .Y(n1) );
  AND2_X1B_A9TR U4 ( .A(S[1]), .B(n1), .Y(n22) );
  NOR2_X1A_A9TR U5 ( .A(n1), .B(S[1]), .Y(n25) );
  AOI22_X1M_A9TR U6 ( .A0(A[8]), .A1(n23), .B0(C[8]), .B1(n22), .Y(n24) );
  AO1B2_X1M_A9TR U7 ( .B0(B[7]), .B1(n25), .A0N(n21), .Y(Y[7]) );
  AOI22_X1M_A9TR U8 ( .A0(A[7]), .A1(n23), .B0(C[7]), .B1(n22), .Y(n21) );
  AO1B2_X1M_A9TR U9 ( .B0(B[6]), .B1(n25), .A0N(n20), .Y(Y[6]) );
  AOI22_X1M_A9TR U10 ( .A0(A[6]), .A1(n23), .B0(C[6]), .B1(n22), .Y(n20) );
  AO1B2_X1M_A9TR U11 ( .B0(B[5]), .B1(n25), .A0N(n19), .Y(Y[5]) );
  AOI22_X1M_A9TR U12 ( .A0(A[5]), .A1(n23), .B0(C[5]), .B1(n22), .Y(n19) );
  AO1B2_X1M_A9TR U13 ( .B0(B[4]), .B1(n25), .A0N(n18), .Y(Y[4]) );
  AOI22_X1M_A9TR U14 ( .A0(A[4]), .A1(n23), .B0(C[4]), .B1(n22), .Y(n18) );
  AO1B2_X1M_A9TR U15 ( .B0(B[3]), .B1(n25), .A0N(n17), .Y(Y[3]) );
  AOI22_X1M_A9TR U16 ( .A0(A[3]), .A1(n23), .B0(C[3]), .B1(n22), .Y(n17) );
  AO1B2_X1M_A9TR U17 ( .B0(B[2]), .B1(n25), .A0N(n16), .Y(Y[2]) );
  AOI22_X1M_A9TR U18 ( .A0(A[2]), .A1(n23), .B0(C[2]), .B1(n22), .Y(n16) );
  AO1B2_X1M_A9TR U19 ( .B0(B[1]), .B1(n25), .A0N(n15), .Y(Y[1]) );
  AOI22_X1M_A9TR U20 ( .A0(A[1]), .A1(n23), .B0(C[1]), .B1(n22), .Y(n15) );
  AO1B2_X1M_A9TR U21 ( .B0(B[0]), .B1(n25), .A0N(n14), .Y(Y[0]) );
  AOI22_X1M_A9TR U22 ( .A0(A[0]), .A1(n23), .B0(C[0]), .B1(n22), .Y(n14) );
endmodule


module MUX2_0 ( A, B, S, Y );
  input [8:0] A;
  input [8:0] B;
  output [8:0] Y;
  input S;
  wire   n1;

  INV_X1M_A9TR U1 ( .A(S), .Y(n1) );
  AO22_X1M_A9TR U2 ( .A0(S), .A1(B[8]), .B0(A[8]), .B1(n1), .Y(Y[8]) );
  AO22_X1M_A9TR U3 ( .A0(B[7]), .A1(S), .B0(A[7]), .B1(n1), .Y(Y[7]) );
  AO22_X1M_A9TR U4 ( .A0(B[6]), .A1(S), .B0(A[6]), .B1(n1), .Y(Y[6]) );
  AO22_X1M_A9TR U5 ( .A0(B[5]), .A1(S), .B0(A[5]), .B1(n1), .Y(Y[5]) );
  AO22_X1M_A9TR U6 ( .A0(B[4]), .A1(S), .B0(A[4]), .B1(n1), .Y(Y[4]) );
  AO22_X1M_A9TR U7 ( .A0(B[3]), .A1(S), .B0(A[3]), .B1(n1), .Y(Y[3]) );
  AO22_X1M_A9TR U8 ( .A0(B[2]), .A1(S), .B0(A[2]), .B1(n1), .Y(Y[2]) );
  AO22_X1M_A9TR U9 ( .A0(B[1]), .A1(S), .B0(A[1]), .B1(n1), .Y(Y[1]) );
  AO22_X1M_A9TR U10 ( .A0(B[0]), .A1(S), .B0(A[0]), .B1(n1), .Y(Y[0]) );
endmodule


module MUX2_4 ( A, B, S, Y );
  input [8:0] A;
  input [8:0] B;
  output [8:0] Y;
  input S;
  wire   n1;

  INV_X1M_A9TR U1 ( .A(S), .Y(n1) );
  AO22_X1M_A9TR U2 ( .A0(S), .A1(B[8]), .B0(A[8]), .B1(n1), .Y(Y[8]) );
  AO22_X1M_A9TR U3 ( .A0(B[7]), .A1(S), .B0(A[7]), .B1(n1), .Y(Y[7]) );
  AO22_X1M_A9TR U4 ( .A0(B[6]), .A1(S), .B0(A[6]), .B1(n1), .Y(Y[6]) );
  AO22_X1M_A9TR U5 ( .A0(B[5]), .A1(S), .B0(A[5]), .B1(n1), .Y(Y[5]) );
  AO22_X1M_A9TR U6 ( .A0(B[4]), .A1(S), .B0(A[4]), .B1(n1), .Y(Y[4]) );
  AO22_X1M_A9TR U7 ( .A0(B[3]), .A1(S), .B0(A[3]), .B1(n1), .Y(Y[3]) );
  AO22_X1M_A9TR U8 ( .A0(B[2]), .A1(S), .B0(A[2]), .B1(n1), .Y(Y[2]) );
  AO22_X1M_A9TR U9 ( .A0(B[1]), .A1(S), .B0(A[1]), .B1(n1), .Y(Y[1]) );
  AO22_X1M_A9TR U10 ( .A0(B[0]), .A1(S), .B0(A[0]), .B1(n1), .Y(Y[0]) );
endmodule


module MUX2_3 ( A, B, S, Y );
  input [8:0] A;
  input [8:0] B;
  output [8:0] Y;
  input S;
  wire   n1;

  AO22_X0P7M_A9TR U1 ( .A0(S), .A1(B[8]), .B0(A[8]), .B1(n1), .Y(Y[8]) );
  INV_X1M_A9TR U2 ( .A(S), .Y(n1) );
  AO22_X1M_A9TR U3 ( .A0(B[7]), .A1(S), .B0(A[7]), .B1(n1), .Y(Y[7]) );
  AO22_X1M_A9TR U4 ( .A0(B[6]), .A1(S), .B0(A[6]), .B1(n1), .Y(Y[6]) );
  AO22_X1M_A9TR U5 ( .A0(B[5]), .A1(S), .B0(A[5]), .B1(n1), .Y(Y[5]) );
  AO22_X1M_A9TR U6 ( .A0(B[4]), .A1(S), .B0(A[4]), .B1(n1), .Y(Y[4]) );
  AO22_X1M_A9TR U7 ( .A0(B[3]), .A1(S), .B0(A[3]), .B1(n1), .Y(Y[3]) );
  AO22_X1M_A9TR U8 ( .A0(B[2]), .A1(S), .B0(A[2]), .B1(n1), .Y(Y[2]) );
  AO22_X1M_A9TR U9 ( .A0(B[1]), .A1(S), .B0(A[1]), .B1(n1), .Y(Y[1]) );
  AO22_X1M_A9TR U10 ( .A0(B[0]), .A1(S), .B0(A[0]), .B1(n1), .Y(Y[0]) );
endmodule


module MUX2_2 ( A, B, S, Y );
  input [8:0] A;
  input [8:0] B;
  output [8:0] Y;
  input S;
  wire   n1;

  AO22_X1M_A9TR U1 ( .A0(S), .A1(B[8]), .B0(A[8]), .B1(n1), .Y(Y[8]) );
  INV_X1M_A9TR U2 ( .A(S), .Y(n1) );
  AO22_X1M_A9TR U3 ( .A0(B[7]), .A1(S), .B0(A[7]), .B1(n1), .Y(Y[7]) );
  AO22_X1M_A9TR U4 ( .A0(B[6]), .A1(S), .B0(A[6]), .B1(n1), .Y(Y[6]) );
  AO22_X1M_A9TR U5 ( .A0(B[5]), .A1(S), .B0(A[5]), .B1(n1), .Y(Y[5]) );
  AO22_X1M_A9TR U6 ( .A0(B[4]), .A1(S), .B0(A[4]), .B1(n1), .Y(Y[4]) );
  AO22_X1M_A9TR U7 ( .A0(B[3]), .A1(S), .B0(A[3]), .B1(n1), .Y(Y[3]) );
  AO22_X1M_A9TR U8 ( .A0(B[2]), .A1(S), .B0(A[2]), .B1(n1), .Y(Y[2]) );
  AO22_X1M_A9TR U9 ( .A0(B[1]), .A1(S), .B0(A[1]), .B1(n1), .Y(Y[1]) );
  AO22_X1M_A9TR U10 ( .A0(B[0]), .A1(S), .B0(A[0]), .B1(n1), .Y(Y[0]) );
endmodule


module MUX2_1 ( A, B, S, Y );
  input [8:0] A;
  input [8:0] B;
  output [8:0] Y;
  input S;
  wire   n1;

  AO22_X0P7M_A9TR U1 ( .A0(S), .A1(B[8]), .B0(A[8]), .B1(n1), .Y(Y[8]) );
  INV_X1M_A9TR U2 ( .A(S), .Y(n1) );
  AO22_X1M_A9TR U3 ( .A0(B[7]), .A1(S), .B0(A[7]), .B1(n1), .Y(Y[7]) );
  AO22_X1M_A9TR U4 ( .A0(B[6]), .A1(S), .B0(A[6]), .B1(n1), .Y(Y[6]) );
  AO22_X1M_A9TR U5 ( .A0(B[5]), .A1(S), .B0(A[5]), .B1(n1), .Y(Y[5]) );
  AO22_X1M_A9TR U6 ( .A0(B[4]), .A1(S), .B0(A[4]), .B1(n1), .Y(Y[4]) );
  AO22_X1M_A9TR U7 ( .A0(B[3]), .A1(S), .B0(A[3]), .B1(n1), .Y(Y[3]) );
  AO22_X1M_A9TR U8 ( .A0(B[2]), .A1(S), .B0(A[2]), .B1(n1), .Y(Y[2]) );
  AO22_X1M_A9TR U9 ( .A0(B[1]), .A1(S), .B0(A[1]), .B1(n1), .Y(Y[1]) );
  AO22_X1M_A9TR U10 ( .A0(B[0]), .A1(S), .B0(A[0]), .B1(n1), .Y(Y[0]) );
endmodule


module Mul_DW_mult_tc_0 ( a, b, \product[16] , \product[15] , \product[14] , 
        \product[13] , \product[12] , \product[11] , \product[10] , 
        \product[9] , \product[8]  );
  input [8:0] a;
  input [8:0] b;
  output \product[16] , \product[15] , \product[14] , \product[13] ,
         \product[12] , \product[11] , \product[10] , \product[9] ,
         \product[8] ;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n18, n19, n20, n21, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n81, n82, n86, n87,
         n88, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n121, n122, n123, n124,
         n125, n126, n127, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n306, n307, n308, n309, n310,
         n311, n312, n313, n314, n315, n316, n317, n318, n319, n320, n321,
         n322, n323, n324, n325, n326, n327, n328, n329, n330, n331, n332,
         n333, n334, n335, n336, n337, n338, n339, n340, n341, n342, n343,
         n344, n345, n346, n347, n348;
  wire   [16:8] product;
  assign \product[16]  = product[16];
  assign \product[15]  = product[15];
  assign \product[14]  = product[14];
  assign \product[13]  = product[13];
  assign \product[12]  = product[12];
  assign \product[11]  = product[11];
  assign \product[10]  = product[10];
  assign \product[9]  = product[9];
  assign \product[8]  = product[8];

  ADDF_X1M_A9TR U3 ( .A(n20), .B(n19), .CI(n3), .CO(n2), .S(product[15]) );
  ADDF_X1M_A9TR U4 ( .A(n21), .B(n24), .CI(n4), .CO(n3), .S(product[14]) );
  ADDF_X1M_A9TR U5 ( .A(n28), .B(n25), .CI(n5), .CO(n4), .S(product[13]) );
  ADDF_X1M_A9TR U6 ( .A(n29), .B(n34), .CI(n6), .CO(n5), .S(product[12]) );
  ADDF_X1M_A9TR U7 ( .A(n35), .B(n40), .CI(n7), .CO(n6), .S(product[11]) );
  ADDF_X1M_A9TR U8 ( .A(n41), .B(n48), .CI(n8), .CO(n7), .S(product[10]) );
  ADDF_X1M_A9TR U9 ( .A(n49), .B(n56), .CI(n9), .CO(n8), .S(product[9]) );
  ADDF_X1M_A9TR U10 ( .A(n57), .B(n62), .CI(n263), .CO(n9), .S(product[8]) );
  ADDF_X1M_A9TR U19 ( .A(n86), .B(n261), .CI(n91), .CO(n18), .S(n19) );
  ADDF_X1M_A9TR U20 ( .A(n23), .B(n92), .CI(n26), .CO(n20), .S(n21) );
  ADDF_X1M_A9TR U22 ( .A(n30), .B(n101), .CI(n27), .CO(n24), .S(n25) );
  ADDF_X1M_A9TR U23 ( .A(n87), .B(n260), .CI(n93), .CO(n26), .S(n27) );
  ADDF_X1M_A9TR U24 ( .A(n31), .B(n38), .CI(n36), .CO(n28), .S(n29) );
  ADDF_X1M_A9TR U25 ( .A(n94), .B(n102), .CI(n33), .CO(n30), .S(n31) );
  ADDF_X1M_A9TR U27 ( .A(n42), .B(n39), .CI(n37), .CO(n34), .S(n35) );
  ADDF_X1M_A9TR U28 ( .A(n111), .B(n95), .CI(n44), .CO(n36), .S(n37) );
  ADDF_X1M_A9TR U29 ( .A(n88), .B(n259), .CI(n103), .CO(n38), .S(n39) );
  ADDF_X1M_A9TR U30 ( .A(n50), .B(n45), .CI(n43), .CO(n40), .S(n41) );
  ADDF_X1M_A9TR U31 ( .A(n54), .B(n112), .CI(n52), .CO(n42), .S(n43) );
  ADDF_X1M_A9TR U32 ( .A(n104), .B(n96), .CI(n47), .CO(n44), .S(n45) );
  ADDF_X1M_A9TR U34 ( .A(n58), .B(n53), .CI(n51), .CO(n48), .S(n49) );
  ADDF_X1M_A9TR U35 ( .A(n60), .B(n121), .CI(n55), .CO(n50), .S(n51) );
  ADDF_X1M_A9TR U36 ( .A(n97), .B(n113), .CI(n105), .CO(n52), .S(n53) );
  ADDF_X1M_A9TR U39 ( .A(n61), .B(n64), .CI(n59), .CO(n56), .S(n57) );
  ADDF_X1M_A9TR U40 ( .A(n98), .B(n106), .CI(n66), .CO(n58), .S(n59) );
  ADDF_X1M_A9TR U41 ( .A(n122), .B(n90), .CI(n114), .CO(n60), .S(n61) );
  ADDF_X1M_A9TR U42 ( .A(n67), .B(n70), .CI(n65), .CO(n62), .S(n63) );
  ADDF_X1M_A9TR U43 ( .A(n81), .B(n115), .CI(n107), .CO(n64), .S(n65) );
  ADDH_X1M_A9TR U44 ( .A(n99), .B(n123), .CO(n66), .S(n67) );
  ADDF_X1M_A9TR U45 ( .A(n74), .B(n108), .CI(n71), .CO(n68), .S(n69) );
  ADDF_X1M_A9TR U46 ( .A(n124), .B(n100), .CI(n116), .CO(n70), .S(n71) );
  ADDF_X1M_A9TR U47 ( .A(n82), .B(n109), .CI(n76), .CO(n72), .S(n73) );
  ADDH_X1M_A9TR U48 ( .A(n117), .B(n125), .CO(n74), .S(n75) );
  ADDF_X1M_A9TR U49 ( .A(n126), .B(n110), .CI(n118), .CO(n76), .S(n77) );
  ADDH_X1M_A9TR U50 ( .A(n119), .B(n127), .CO(n78), .S(n79) );
  XNOR2_X0P7M_A9TR U196 ( .A(a[2]), .B(a[1]), .Y(n316) );
  AOI222_X1M_A9TR U197 ( .A0(n268), .A1(n73), .B0(n268), .B1(n75), .C0(n75), 
        .C1(n73), .Y(n339) );
  AO21_X0P7M_A9TR U198 ( .A0(n319), .A1(n316), .B0(n326), .Y(n111) );
  INV_X1M_A9TR U199 ( .A(b[2]), .Y(n275) );
  INV_X1M_A9TR U200 ( .A(b[0]), .Y(n276) );
  INV_X1M_A9TR U201 ( .A(b[1]), .Y(n277) );
  INV_X1M_A9TR U202 ( .A(b[4]), .Y(n278) );
  INV_X1M_A9TR U203 ( .A(b[6]), .Y(n274) );
  INV_X1M_A9TR U204 ( .A(n338), .Y(n265) );
  INV_X1M_A9TR U205 ( .A(n339), .Y(n266) );
  AOI222_X1M_A9TR U206 ( .A0(n265), .A1(n63), .B0(n265), .B1(n68), .C0(n68), 
        .C1(n63), .Y(n337) );
  INV_X1M_A9TR U207 ( .A(n340), .Y(n268) );
  AOI222_X1M_A9TR U208 ( .A0(n269), .A1(n77), .B0(n269), .B1(n78), .C0(n78), 
        .C1(n77), .Y(n340) );
  INV_X1M_A9TR U209 ( .A(n341), .Y(n269) );
  AOI222_X1M_A9TR U210 ( .A0(n342), .A1(n79), .B0(n343), .B1(n342), .C0(n343), 
        .C1(n79), .Y(n341) );
  INV_X1M_A9TR U211 ( .A(n311), .Y(n271) );
  INV_X1M_A9TR U212 ( .A(n282), .Y(n262) );
  INV_X1M_A9TR U213 ( .A(n47), .Y(n259) );
  INV_X1M_A9TR U214 ( .A(n33), .Y(n260) );
  INV_X1M_A9TR U215 ( .A(n23), .Y(n261) );
  NAND2_X1A_A9TR U216 ( .A(n316), .B(n345), .Y(n319) );
  XOR2_X0P7M_A9TR U217 ( .A(n279), .B(n280), .Y(product[16]) );
  INV_X1M_A9TR U218 ( .A(a[1]), .Y(n272) );
  INV_X1M_A9TR U219 ( .A(a[0]), .Y(n273) );
  XNOR2_X0P7M_A9TR U220 ( .A(a[4]), .B(a[3]), .Y(n299) );
  NAND2_X1A_A9TR U221 ( .A(n299), .B(n336), .Y(n298) );
  INV_X1M_A9TR U222 ( .A(a[3]), .Y(n270) );
  INV_X1M_A9TR U223 ( .A(a[5]), .Y(n267) );
  XNOR2_X0P7M_A9TR U224 ( .A(a[6]), .B(a[5]), .Y(n283) );
  NAND2_X1A_A9TR U225 ( .A(n283), .B(n301), .Y(n286) );
  INV_X1M_A9TR U226 ( .A(a[7]), .Y(n264) );
  INV_X1M_A9TR U227 ( .A(n337), .Y(n263) );
  XOR2_X0P7M_A9TR U228 ( .A(n2), .B(n18), .Y(n280) );
  NAND2_X0P5A_A9TR U229 ( .A(n281), .B(n282), .Y(n279) );
  XOR2_X0P5M_A9TR U230 ( .A(b[8]), .B(a[8]), .Y(n281) );
  OAI22_X0P5M_A9TR U231 ( .A0(n283), .A1(n284), .B0(n285), .B1(n286), .Y(n99)
         );
  XOR2_X0P5M_A9TR U232 ( .A(n276), .B(a[7]), .Y(n285) );
  OAI22_X0P5M_A9TR U233 ( .A0(n283), .A1(n287), .B0(n284), .B1(n286), .Y(n98)
         );
  XOR2_X0P5M_A9TR U234 ( .A(n277), .B(a[7]), .Y(n284) );
  OAI22_X0P5M_A9TR U235 ( .A0(n283), .A1(n288), .B0(n287), .B1(n286), .Y(n97)
         );
  XOR2_X0P5M_A9TR U236 ( .A(n275), .B(a[7]), .Y(n287) );
  OAI22_X0P5M_A9TR U237 ( .A0(n283), .A1(n289), .B0(n288), .B1(n286), .Y(n96)
         );
  XOR2_X0P5M_A9TR U238 ( .A(b[3]), .B(n264), .Y(n288) );
  OAI22_X0P5M_A9TR U239 ( .A0(n283), .A1(n290), .B0(n289), .B1(n286), .Y(n95)
         );
  XOR2_X0P5M_A9TR U240 ( .A(n278), .B(a[7]), .Y(n289) );
  OAI22_X0P5M_A9TR U241 ( .A0(n283), .A1(n291), .B0(n290), .B1(n286), .Y(n94)
         );
  XOR2_X0P5M_A9TR U242 ( .A(b[5]), .B(n264), .Y(n290) );
  OAI22_X0P5M_A9TR U243 ( .A0(n283), .A1(n292), .B0(n291), .B1(n286), .Y(n93)
         );
  XOR2_X0P5M_A9TR U244 ( .A(n274), .B(a[7]), .Y(n291) );
  OAI22_X0P5M_A9TR U245 ( .A0(n283), .A1(n293), .B0(n292), .B1(n286), .Y(n92)
         );
  XOR2_X0P5M_A9TR U246 ( .A(b[7]), .B(n264), .Y(n292) );
  AO21_X0P5M_A9TR U247 ( .A0(n286), .A1(n283), .B0(n293), .Y(n91) );
  XNOR2_X0P5M_A9TR U248 ( .A(b[8]), .B(a[7]), .Y(n293) );
  NOR2_X0P5A_A9TR U249 ( .A(n262), .B(n276), .Y(n90) );
  NOR2_X0P5A_A9TR U250 ( .A(n262), .B(n294), .Y(n88) );
  XNOR2_X0P5M_A9TR U251 ( .A(b[3]), .B(a[8]), .Y(n294) );
  NOR2_X0P5A_A9TR U252 ( .A(n262), .B(n295), .Y(n87) );
  XNOR2_X0P5M_A9TR U253 ( .A(b[5]), .B(a[8]), .Y(n295) );
  NOR2_X0P5A_A9TR U254 ( .A(n262), .B(n296), .Y(n86) );
  XNOR2_X0P5M_A9TR U255 ( .A(b[7]), .B(a[8]), .Y(n296) );
  OAI22_X0P5M_A9TR U256 ( .A0(n267), .A1(n297), .B0(n267), .B1(n298), .Y(n82)
         );
  OR2_X0P5B_A9TR U257 ( .A(n299), .B(b[0]), .Y(n297) );
  OAI22_X0P5M_A9TR U258 ( .A0(n264), .A1(n300), .B0(n264), .B1(n286), .Y(n81)
         );
  XOR2_X0P5M_A9TR U259 ( .A(a[7]), .B(a[6]), .Y(n301) );
  OR2_X0P5B_A9TR U260 ( .A(n283), .B(b[0]), .Y(n300) );
  XNOR2_X0P5M_A9TR U261 ( .A(n302), .B(n303), .Y(n55) );
  NAND2_X0P5A_A9TR U262 ( .A(n303), .B(n302), .Y(n54) );
  NAND3_X0P5A_A9TR U263 ( .A(n282), .B(n276), .C(a[8]), .Y(n302) );
  NAND2_X0P5A_A9TR U264 ( .A(n304), .B(n282), .Y(n303) );
  XOR2_X0P5M_A9TR U265 ( .A(b[1]), .B(a[8]), .Y(n304) );
  NAND2_X0P5A_A9TR U266 ( .A(n305), .B(n282), .Y(n47) );
  XOR2_X0P5M_A9TR U267 ( .A(b[2]), .B(a[8]), .Y(n305) );
  NAND2_X0P5A_A9TR U268 ( .A(n306), .B(n282), .Y(n33) );
  XOR2_X0P5M_A9TR U269 ( .A(b[4]), .B(a[8]), .Y(n306) );
  NAND2_X0P5A_A9TR U270 ( .A(n307), .B(n282), .Y(n23) );
  XOR2_X0P5M_A9TR U271 ( .A(a[8]), .B(a[7]), .Y(n282) );
  XOR2_X0P5M_A9TR U272 ( .A(b[6]), .B(a[8]), .Y(n307) );
  OAI22BB_X0P5M_A9TR U273 ( .A0(n308), .A1(n273), .B0N(n309), .B1N(n271), .Y(
        n127) );
  OAI22_X0P5M_A9TR U274 ( .A0(n310), .A1(n273), .B0(n308), .B1(n311), .Y(n126)
         );
  XOR2_X0P5M_A9TR U275 ( .A(b[3]), .B(n272), .Y(n308) );
  OAI22_X0P5M_A9TR U276 ( .A0(n312), .A1(n273), .B0(n310), .B1(n311), .Y(n125)
         );
  XOR2_X0P5M_A9TR U277 ( .A(n278), .B(a[1]), .Y(n310) );
  OAI22_X0P5M_A9TR U278 ( .A0(n313), .A1(n273), .B0(n312), .B1(n311), .Y(n124)
         );
  XOR2_X0P5M_A9TR U279 ( .A(b[5]), .B(n272), .Y(n312) );
  OAI22_X0P5M_A9TR U280 ( .A0(n314), .A1(n273), .B0(n313), .B1(n311), .Y(n123)
         );
  XOR2_X0P5M_A9TR U281 ( .A(n274), .B(a[1]), .Y(n313) );
  OAI22_X0P5M_A9TR U282 ( .A0(n315), .A1(n273), .B0(n314), .B1(n311), .Y(n122)
         );
  XOR2_X0P5M_A9TR U283 ( .A(b[7]), .B(n272), .Y(n314) );
  AO21_X0P5M_A9TR U284 ( .A0(n273), .A1(n311), .B0(n315), .Y(n121) );
  XNOR2_X0P5M_A9TR U285 ( .A(b[8]), .B(a[1]), .Y(n315) );
  OAI22_X0P5M_A9TR U286 ( .A0(n316), .A1(n317), .B0(n318), .B1(n319), .Y(n119)
         );
  XOR2_X0P5M_A9TR U287 ( .A(n276), .B(a[3]), .Y(n318) );
  OAI22_X0P5M_A9TR U288 ( .A0(n316), .A1(n320), .B0(n317), .B1(n319), .Y(n118)
         );
  XOR2_X0P5M_A9TR U289 ( .A(n277), .B(a[3]), .Y(n317) );
  OAI22_X0P5M_A9TR U290 ( .A0(n316), .A1(n321), .B0(n320), .B1(n319), .Y(n117)
         );
  XOR2_X0P5M_A9TR U291 ( .A(n275), .B(a[3]), .Y(n320) );
  OAI22_X0P5M_A9TR U292 ( .A0(n316), .A1(n322), .B0(n321), .B1(n319), .Y(n116)
         );
  XOR2_X0P5M_A9TR U293 ( .A(b[3]), .B(n270), .Y(n321) );
  OAI22_X0P5M_A9TR U294 ( .A0(n316), .A1(n323), .B0(n322), .B1(n319), .Y(n115)
         );
  XOR2_X0P5M_A9TR U295 ( .A(n278), .B(a[3]), .Y(n322) );
  OAI22_X0P5M_A9TR U296 ( .A0(n316), .A1(n324), .B0(n323), .B1(n319), .Y(n114)
         );
  XOR2_X0P5M_A9TR U297 ( .A(b[5]), .B(n270), .Y(n323) );
  OAI22_X0P5M_A9TR U298 ( .A0(n316), .A1(n325), .B0(n324), .B1(n319), .Y(n113)
         );
  XOR2_X0P5M_A9TR U299 ( .A(n274), .B(a[3]), .Y(n324) );
  OAI22_X0P5M_A9TR U300 ( .A0(n316), .A1(n326), .B0(n325), .B1(n319), .Y(n112)
         );
  XOR2_X0P5M_A9TR U301 ( .A(b[7]), .B(n270), .Y(n325) );
  XNOR2_X0P5M_A9TR U302 ( .A(b[8]), .B(a[3]), .Y(n326) );
  NOR2_X0P5A_A9TR U303 ( .A(n299), .B(n276), .Y(n110) );
  OAI22_X0P5M_A9TR U304 ( .A0(n299), .A1(n327), .B0(n328), .B1(n298), .Y(n109)
         );
  XOR2_X0P5M_A9TR U305 ( .A(n276), .B(a[5]), .Y(n328) );
  OAI22_X0P5M_A9TR U306 ( .A0(n299), .A1(n329), .B0(n327), .B1(n298), .Y(n108)
         );
  XOR2_X0P5M_A9TR U307 ( .A(n277), .B(a[5]), .Y(n327) );
  OAI22_X0P5M_A9TR U308 ( .A0(n299), .A1(n330), .B0(n329), .B1(n298), .Y(n107)
         );
  XOR2_X0P5M_A9TR U309 ( .A(n275), .B(a[5]), .Y(n329) );
  OAI22_X0P5M_A9TR U310 ( .A0(n299), .A1(n331), .B0(n330), .B1(n298), .Y(n106)
         );
  XOR2_X0P5M_A9TR U311 ( .A(b[3]), .B(n267), .Y(n330) );
  OAI22_X0P5M_A9TR U312 ( .A0(n299), .A1(n332), .B0(n331), .B1(n298), .Y(n105)
         );
  XOR2_X0P5M_A9TR U313 ( .A(n278), .B(a[5]), .Y(n331) );
  OAI22_X0P5M_A9TR U314 ( .A0(n299), .A1(n333), .B0(n332), .B1(n298), .Y(n104)
         );
  XOR2_X0P5M_A9TR U315 ( .A(b[5]), .B(n267), .Y(n332) );
  OAI22_X0P5M_A9TR U316 ( .A0(n299), .A1(n334), .B0(n333), .B1(n298), .Y(n103)
         );
  XOR2_X0P5M_A9TR U317 ( .A(n274), .B(a[5]), .Y(n333) );
  OAI22_X0P5M_A9TR U318 ( .A0(n299), .A1(n335), .B0(n334), .B1(n298), .Y(n102)
         );
  XOR2_X0P5M_A9TR U319 ( .A(b[7]), .B(n267), .Y(n334) );
  AO21_X0P5M_A9TR U320 ( .A0(n298), .A1(n299), .B0(n335), .Y(n101) );
  XNOR2_X0P5M_A9TR U321 ( .A(b[8]), .B(a[5]), .Y(n335) );
  XOR2_X0P5M_A9TR U322 ( .A(a[5]), .B(a[4]), .Y(n336) );
  NOR2_X0P5A_A9TR U323 ( .A(n283), .B(n276), .Y(n100) );
  AOI222_X0P5M_A9TR U324 ( .A0(n266), .A1(n69), .B0(n266), .B1(n72), .C0(n72), 
        .C1(n69), .Y(n338) );
  OAI22_X0P5M_A9TR U325 ( .A0(n270), .A1(n344), .B0(n270), .B1(n319), .Y(n343)
         );
  XOR2_X0P5M_A9TR U326 ( .A(a[3]), .B(a[2]), .Y(n345) );
  OR2_X0P5B_A9TR U327 ( .A(n316), .B(b[0]), .Y(n344) );
  MXT2_X0P5M_A9TR U328 ( .A(n346), .B(n347), .S0(n276), .Y(n342) );
  NOR3_X0P5A_A9TR U329 ( .A(n272), .B(b[1]), .C(n348), .Y(n347) );
  NOR2_X0P5A_A9TR U330 ( .A(n348), .B(n316), .Y(n346) );
  AOI22_X0P5M_A9TR U331 ( .A0(n309), .A1(a[0]), .B0(n277), .B1(n271), .Y(n348)
         );
  NAND2_X0P5A_A9TR U332 ( .A(a[1]), .B(n273), .Y(n311) );
  XOR2_X0P5M_A9TR U333 ( .A(n275), .B(n272), .Y(n309) );
endmodule


module Mul ( A, B, Mul );
  input [8:0] A;
  input [8:0] B;
  output [8:0] Mul;
  wire   SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
         SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8,
         SYNOPSYS_UNCONNECTED_9;

  Mul_DW_mult_tc_0 mult_7 ( .a(A), .b(B), .\product[16] (Mul[8]), 
        .\product[15] (Mul[7]), .\product[14] (Mul[6]), .\product[13] (Mul[5]), 
        .\product[12] (Mul[4]), .\product[11] (Mul[3]), .\product[10] (Mul[2]), 
        .\product[9] (Mul[1]), .\product[8] (Mul[0]) );
endmodule


module Add_DW01_add_0 ( A, B, SUM );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  wire   n1;
  wire   [8:2] carry;

  ADDF_X1M_A9TR U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .S(SUM[8]) );
  ADDF_X1M_A9TR U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(
        SUM[7]) );
  ADDF_X1M_A9TR U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(
        SUM[6]) );
  ADDF_X1M_A9TR U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(
        SUM[5]) );
  ADDF_X1M_A9TR U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(
        SUM[4]) );
  ADDF_X1M_A9TR U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(
        SUM[3]) );
  ADDF_X1M_A9TR U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(
        SUM[2]) );
  ADDF_X1M_A9TR U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1])
         );
  AND2_X1B_A9TR U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2_X0P7M_A9TR U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module Add ( A, B, Add );
  input [8:0] A;
  input [8:0] B;
  output [8:0] Add;
  wire   n1;

  Add_DW01_add_0 add_5 ( .A(A), .B(B), .SUM(Add) );
  TIELO_X1M_A9TR U1 ( .Y(n1) );
endmodule


module ROM ( addr, data );
  input [2:0] addr;
  output [8:0] data;
  wire   n3, n4, n5, n6, n7, n1, n2;

  INV_X1M_A9TR U3 ( .A(n6), .Y(n1) );
  NAND2_X1A_A9TR U4 ( .A(n1), .B(n2), .Y(data[2]) );
  NOR2_X1A_A9TR U5 ( .A(n1), .B(n2), .Y(data[0]) );
  OA21_X1M_A9TR U6 ( .A0(n5), .A1(n2), .B0(n7), .Y(n3) );
  NAND2_X1A_A9TR U7 ( .A(n3), .B(n4), .Y(data[8]) );
  NAND3_X1A_A9TR U8 ( .A(n5), .B(n6), .C(n4), .Y(data[7]) );
  NAND2_X1A_A9TR U9 ( .A(addr[0]), .B(addr[2]), .Y(n6) );
  NAND2B_X1M_A9TR U10 ( .AN(addr[2]), .B(addr[0]), .Y(n5) );
  NOR2_X1A_A9TR U11 ( .A(addr[1]), .B(n5), .Y(data[1]) );
  AO21A1AI2_X1M_A9TR U12 ( .A0(addr[1]), .A1(addr[2]), .B0(addr[0]), .C0(n7), 
        .Y(data[3]) );
  NAND2_X1A_A9TR U13 ( .A(n1), .B(addr[1]), .Y(n7) );
  INV_X1M_A9TR U14 ( .A(addr[1]), .Y(n2) );
  OAI21_X1M_A9TR U15 ( .A0(addr[0]), .A1(n2), .B0(n5), .Y(data[4]) );
  OAI31_X1M_A9TR U16 ( .A0(addr[0]), .A1(addr[2]), .A2(addr[1]), .B0(n3), .Y(
        data[6]) );
  OAI21_X1M_A9TR U17 ( .A0(addr[1]), .A1(n4), .B0(n7), .Y(data[5]) );
  NAND2B_X1M_A9TR U18 ( .AN(addr[0]), .B(addr[2]), .Y(n4) );
endmodule


module Register_3 ( D, reset, clk, load, Q );
  input [8:0] D;
  output [8:0] Q;
  input reset, clk, load;
  wire   n1, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22;

  DFFRPQ_X2M_A9TR Q_reg_8_ ( .D(n14), .CK(clk), .R(n13), .Q(Q[8]) );
  DFFRPQ_X2M_A9TR Q_reg_7_ ( .D(n15), .CK(clk), .R(n13), .Q(Q[7]) );
  DFFRPQ_X2M_A9TR Q_reg_6_ ( .D(n16), .CK(clk), .R(n13), .Q(Q[6]) );
  DFFRPQ_X2M_A9TR Q_reg_5_ ( .D(n17), .CK(clk), .R(n13), .Q(Q[5]) );
  DFFRPQ_X2M_A9TR Q_reg_4_ ( .D(n18), .CK(clk), .R(n13), .Q(Q[4]) );
  DFFRPQ_X2M_A9TR Q_reg_3_ ( .D(n19), .CK(clk), .R(n13), .Q(Q[3]) );
  DFFRPQ_X2M_A9TR Q_reg_2_ ( .D(n20), .CK(clk), .R(n13), .Q(Q[2]) );
  DFFRPQ_X2M_A9TR Q_reg_1_ ( .D(n21), .CK(clk), .R(n13), .Q(Q[1]) );
  DFFRPQ_X2M_A9TR Q_reg_0_ ( .D(n22), .CK(clk), .R(n13), .Q(Q[0]) );
  INV_X1M_A9TR U2 ( .A(n12), .Y(n11) );
  INV_X1M_A9TR U3 ( .A(n1), .Y(n12) );
  BUFH_X1M_A9TR U4 ( .A(load), .Y(n1) );
  AO22_X1M_A9TR U5 ( .A0(Q[1]), .A1(n12), .B0(D[1]), .B1(n11), .Y(n21) );
  AO22_X1M_A9TR U6 ( .A0(Q[2]), .A1(n12), .B0(D[2]), .B1(n11), .Y(n20) );
  AO22_X1M_A9TR U7 ( .A0(Q[3]), .A1(n12), .B0(D[3]), .B1(n11), .Y(n19) );
  AO22_X1M_A9TR U8 ( .A0(Q[4]), .A1(n12), .B0(D[4]), .B1(n11), .Y(n18) );
  AO22_X1M_A9TR U9 ( .A0(Q[5]), .A1(n12), .B0(D[5]), .B1(n11), .Y(n17) );
  AO22_X1M_A9TR U10 ( .A0(Q[6]), .A1(n12), .B0(D[6]), .B1(n11), .Y(n16) );
  AO22_X1M_A9TR U11 ( .A0(Q[7]), .A1(n12), .B0(D[7]), .B1(n11), .Y(n15) );
  AO22_X1M_A9TR U12 ( .A0(Q[8]), .A1(n12), .B0(D[8]), .B1(n11), .Y(n14) );
  AO22_X1M_A9TR U13 ( .A0(Q[0]), .A1(n12), .B0(n11), .B1(D[0]), .Y(n22) );
  INV_X1M_A9TR U14 ( .A(reset), .Y(n13) );
endmodule


module Register_2 ( D, reset, clk, load, Q );
  input [8:0] D;
  output [8:0] Q;
  input reset, clk, load;
  wire   n1, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22;

  DFFRPQ_X2M_A9TR Q_reg_8_ ( .D(n14), .CK(clk), .R(n13), .Q(Q[8]) );
  DFFRPQ_X2M_A9TR Q_reg_7_ ( .D(n15), .CK(clk), .R(n13), .Q(Q[7]) );
  DFFRPQ_X2M_A9TR Q_reg_6_ ( .D(n16), .CK(clk), .R(n13), .Q(Q[6]) );
  DFFRPQ_X2M_A9TR Q_reg_5_ ( .D(n17), .CK(clk), .R(n13), .Q(Q[5]) );
  DFFRPQ_X2M_A9TR Q_reg_4_ ( .D(n18), .CK(clk), .R(n13), .Q(Q[4]) );
  DFFRPQ_X2M_A9TR Q_reg_3_ ( .D(n19), .CK(clk), .R(n13), .Q(Q[3]) );
  DFFRPQ_X2M_A9TR Q_reg_2_ ( .D(n20), .CK(clk), .R(n13), .Q(Q[2]) );
  DFFRPQ_X2M_A9TR Q_reg_1_ ( .D(n21), .CK(clk), .R(n13), .Q(Q[1]) );
  DFFRPQ_X2M_A9TR Q_reg_0_ ( .D(n22), .CK(clk), .R(n13), .Q(Q[0]) );
  INV_X1M_A9TR U2 ( .A(n12), .Y(n11) );
  INV_X1M_A9TR U3 ( .A(n1), .Y(n12) );
  BUFH_X1M_A9TR U4 ( .A(load), .Y(n1) );
  AO22_X1M_A9TR U5 ( .A0(Q[1]), .A1(n12), .B0(D[1]), .B1(n11), .Y(n21) );
  AO22_X1M_A9TR U6 ( .A0(Q[2]), .A1(n12), .B0(D[2]), .B1(n11), .Y(n20) );
  AO22_X1M_A9TR U7 ( .A0(Q[3]), .A1(n12), .B0(D[3]), .B1(n11), .Y(n19) );
  AO22_X1M_A9TR U8 ( .A0(Q[4]), .A1(n12), .B0(D[4]), .B1(n11), .Y(n18) );
  AO22_X1M_A9TR U9 ( .A0(Q[5]), .A1(n12), .B0(D[5]), .B1(n11), .Y(n17) );
  AO22_X1M_A9TR U10 ( .A0(Q[6]), .A1(n12), .B0(D[6]), .B1(n11), .Y(n16) );
  AO22_X1M_A9TR U11 ( .A0(Q[7]), .A1(n12), .B0(D[7]), .B1(n11), .Y(n15) );
  AO22_X1M_A9TR U12 ( .A0(Q[8]), .A1(n12), .B0(D[8]), .B1(n11), .Y(n14) );
  AO22_X1M_A9TR U13 ( .A0(Q[0]), .A1(n12), .B0(n11), .B1(D[0]), .Y(n22) );
  INV_X1M_A9TR U14 ( .A(reset), .Y(n13) );
endmodule


module Register_1 ( D, reset, clk, load, Q );
  input [8:0] D;
  output [8:0] Q;
  input reset, clk, load;
  wire   n1, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20;

  DFFRPQ_X2M_A9TR Q_reg_8_ ( .D(n12), .CK(clk), .R(n11), .Q(Q[8]) );
  DFFRPQ_X2M_A9TR Q_reg_7_ ( .D(n13), .CK(clk), .R(n11), .Q(Q[7]) );
  DFFRPQ_X2M_A9TR Q_reg_6_ ( .D(n14), .CK(clk), .R(n11), .Q(Q[6]) );
  DFFRPQ_X2M_A9TR Q_reg_5_ ( .D(n15), .CK(clk), .R(n11), .Q(Q[5]) );
  DFFRPQ_X2M_A9TR Q_reg_4_ ( .D(n16), .CK(clk), .R(n11), .Q(Q[4]) );
  DFFRPQ_X2M_A9TR Q_reg_3_ ( .D(n17), .CK(clk), .R(n11), .Q(Q[3]) );
  DFFRPQ_X2M_A9TR Q_reg_2_ ( .D(n18), .CK(clk), .R(n11), .Q(Q[2]) );
  DFFRPQ_X2M_A9TR Q_reg_1_ ( .D(n19), .CK(clk), .R(n11), .Q(Q[1]) );
  DFFRPQ_X2M_A9TR Q_reg_0_ ( .D(n20), .CK(clk), .R(n11), .Q(Q[0]) );
  INV_X1M_A9TR U2 ( .A(load), .Y(n1) );
  AO22_X1M_A9TR U3 ( .A0(Q[1]), .A1(n1), .B0(D[1]), .B1(load), .Y(n19) );
  AO22_X1M_A9TR U4 ( .A0(Q[2]), .A1(n1), .B0(D[2]), .B1(load), .Y(n18) );
  AO22_X1M_A9TR U5 ( .A0(Q[3]), .A1(n1), .B0(D[3]), .B1(load), .Y(n17) );
  AO22_X1M_A9TR U6 ( .A0(Q[4]), .A1(n1), .B0(D[4]), .B1(load), .Y(n16) );
  AO22_X1M_A9TR U7 ( .A0(Q[5]), .A1(n1), .B0(D[5]), .B1(load), .Y(n15) );
  AO22_X1M_A9TR U8 ( .A0(Q[6]), .A1(n1), .B0(D[6]), .B1(load), .Y(n14) );
  AO22_X1M_A9TR U9 ( .A0(Q[7]), .A1(n1), .B0(D[7]), .B1(load), .Y(n13) );
  AO22_X1M_A9TR U10 ( .A0(Q[8]), .A1(n1), .B0(D[8]), .B1(load), .Y(n12) );
  AO22_X1M_A9TR U11 ( .A0(Q[0]), .A1(n1), .B0(load), .B1(D[0]), .Y(n20) );
  INV_X1M_A9TR U12 ( .A(reset), .Y(n11) );
endmodule


module Datapath ( inportR, inportG, inportB, control, clk, rst_n, outportY, 
        outportU, outportV, done );
  input [8:0] inportR;
  input [8:0] inportG;
  input [8:0] inportB;
  input [21:0] control;
  output [8:0] outportY;
  output [8:0] outportU;
  output [8:0] outportV;
  input clk, rst_n, done;
  wire   n_Logic1_, n_Logic0_, n1;
  wire   [8:0] M4_OUT;
  wire   [8:0] R1;
  wire   [8:0] M5_OUT;
  wire   [8:0] R2;
  wire   [8:0] M6_OUT;
  wire   [8:0] R3;
  wire   [8:0] M7_OUT;
  wire   [8:0] R4;
  wire   [8:0] M8_OUT;
  wire   [8:0] R5;
  wire   [8:0] M9_OUT;
  wire   [8:0] R6;
  wire   [8:0] M1_OUT;
  wire   [8:0] M2_OUT;
  wire   [8:0] M3_OUT;
  wire   [8:0] Fmul;
  wire   [8:0] Fadd;
  wire   [8:0] data;

  Register_0 r1 ( .D(M4_OUT), .reset(rst_n), .clk(clk), .load(control[21]), 
        .Q(R1) );
  Register_8 r2 ( .D(M5_OUT), .reset(rst_n), .clk(clk), .load(control[20]), 
        .Q(R2) );
  Register_7 r3 ( .D(M6_OUT), .reset(rst_n), .clk(clk), .load(control[19]), 
        .Q(R3) );
  Register_6 r4 ( .D(M7_OUT), .reset(rst_n), .clk(clk), .load(control[18]), 
        .Q(R4) );
  Register_5 r5 ( .D(M8_OUT), .reset(rst_n), .clk(clk), .load(control[17]), 
        .Q(R5) );
  Register_4 r6 ( .D(M9_OUT), .reset(rst_n), .clk(clk), .load(control[16]), 
        .Q(R6) );
  MUX3_0 M1 ( .A(R3), .B(R2), .C(R1), .S(control[12:11]), .Y(M1_OUT) );
  MUX4 M2 ( .A({n_Logic0_, n_Logic1_, n_Logic0_, n_Logic0_, n_Logic0_, 
        n_Logic0_, n_Logic0_, n_Logic0_, n_Logic0_}), .B(R3), .C(R5), .D(R4), 
        .S(control[10:9]), .Y(M2_OUT) );
  MUX3_2 M3 ( .A(R6), .B(R1), .C(R5), .S(control[8:7]), .Y(M3_OUT) );
  MUX3_1 M4 ( .A(inportR), .B(Fmul), .C(Fadd), .S(control[6:5]), .Y(M4_OUT) );
  MUX2_0 M5 ( .A(inportG), .B(Fadd), .S(control[4]), .Y(M5_OUT) );
  MUX2_4 M6 ( .A(inportB), .B(Fadd), .S(control[3]), .Y(M6_OUT) );
  MUX2_3 M7 ( .A(Fmul), .B(Fadd), .S(control[2]), .Y(M7_OUT) );
  MUX2_2 M8 ( .A(Fmul), .B(Fadd), .S(control[1]), .Y(M8_OUT) );
  MUX2_1 M9 ( .A(Fmul), .B(Fadd), .S(control[0]), .Y(M9_OUT) );
  Mul FU1 ( .A(M1_OUT), .B(data), .Mul(Fmul) );
  Add FU2 ( .A(M2_OUT), .B(M3_OUT), .Add(Fadd) );
  ROM FU3 ( .addr(control[15:13]), .data(data) );
  Register_3 r7 ( .D(R4), .reset(rst_n), .clk(clk), .load(n1), .Q(outportY) );
  Register_2 r9 ( .D(R2), .reset(rst_n), .clk(clk), .load(n1), .Q(outportU) );
  Register_1 r8 ( .D(R1), .reset(rst_n), .clk(clk), .load(n1), .Q(outportV) );
  BUFH_X1M_A9TR U3 ( .A(done), .Y(n1) );
  TIEHI_X1M_A9TR U4 ( .Y(n_Logic1_) );
  TIELO_X1M_A9TR U5 ( .Y(n_Logic0_) );
endmodule


module RGB2YUV ( start, clk, rst_n, inportR, inportG, inportB, done, outportY, 
        outportU, outportV );
  input [8:0] inportR;
  input [8:0] inportG;
  input [8:0] inportB;
  output [8:0] outportY;
  output [8:0] outportU;
  output [8:0] outportV;
  input start, clk, rst_n;
  output done;

  wire   [21:0] control;

  Controller Controller ( .start(start), .rst_n(rst_n), .clk(clk), .done(done), 
        .control(control) );
  Datapath Datapath ( .inportR(inportR), .inportG(inportG), .inportB(inportB), 
        .control(control), .clk(clk), .rst_n(rst_n), .outportY(outportY), 
        .outportU(outportU), .outportV(outportV), .done(done) );
endmodule

