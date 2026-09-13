/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Thu Oct  9 21:44:09 2025
/////////////////////////////////////////////////////////////


module CLK_DIV_0_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKXOR2X2M U2 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
endmodule


module CLK_DIV_0_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [5:0] A;
  input [5:0] B;
  output [5:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7;
  wire   [6:0] carry;

  ADDFX2M U2_4 ( .A(A[4]), .B(n3), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  XOR3XLM U2_5 ( .A(A[5]), .B(n4), .C(carry[5]), .Y(DIFF[5]) );
  INVX2M U1 ( .A(B[5]), .Y(n4) );
  INVX2M U2 ( .A(B[2]), .Y(n6) );
  INVX2M U3 ( .A(B[3]), .Y(n5) );
  NAND2X2M U4 ( .A(B[0]), .B(n2), .Y(carry[1]) );
  INVX2M U5 ( .A(B[1]), .Y(n7) );
  INVX2M U6 ( .A(A[0]), .Y(n2) );
  INVX2M U7 ( .A(B[4]), .Y(n3) );
  XNOR2X2M U8 ( .A(A[1]), .B(A[0]), .Y(DIFF[0]) );
endmodule


module CLK_DIV_0 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, o_div_clk );
  input [5:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en;
  output o_div_clk;
  wire   N0, div_clk, flag, N15, N16, N17, N18, N19, N20, N21, N22, N23, N24,
         N25, N26, N27, N28, n16, n17, n1, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27;
  wire   [5:0] i_div_ratio_c;
  wire   [5:0] div_value;
  wire   [5:0] anti_div_value;
  wire   [6:0] counter;

  CLK_DIV_0_DW01_inc_0 add_49 ( .A(counter), .SUM({N21, N20, N19, N18, N17, 
        N16, N15}) );
  CLK_DIV_0_DW01_sub_0 sub_30 ( .A(i_div_ratio_c), .B(div_value), .CI(1'b0), 
        .DIFF(anti_div_value) );
  DFFRQX2M div_clk_reg ( .D(n16), .CK(i_ref_clk), .RN(i_rst_n), .Q(div_clk) );
  DFFSQX2M flag_reg ( .D(n17), .CK(i_ref_clk), .SN(i_rst_n), .Q(flag) );
  DFFRQX2M \counter_reg[6]  ( .D(N28), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[6]) );
  DFFRQX2M \counter_reg[4]  ( .D(N26), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[4]) );
  DFFRQX2M \counter_reg[3]  ( .D(N25), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[3]) );
  DFFRQX2M \i_div_ratio_c_reg[0]  ( .D(i_div_ratio[0]), .CK(i_ref_clk), .RN(
        i_rst_n), .Q(i_div_ratio_c[0]) );
  DFFRQX2M \counter_reg[0]  ( .D(N22), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[0]) );
  DFFRQX2M \counter_reg[5]  ( .D(N27), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[5]) );
  DFFRQX2M \counter_reg[2]  ( .D(N24), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[2]) );
  DFFRQX2M \counter_reg[1]  ( .D(N23), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[1]) );
  DFFRQX2M \i_div_ratio_c_reg[3]  ( .D(i_div_ratio[3]), .CK(i_ref_clk), .RN(
        i_rst_n), .Q(i_div_ratio_c[3]) );
  DFFRQX2M \i_div_ratio_c_reg[2]  ( .D(i_div_ratio[2]), .CK(i_ref_clk), .RN(
        i_rst_n), .Q(i_div_ratio_c[2]) );
  DFFRQX2M \i_div_ratio_c_reg[5]  ( .D(i_div_ratio[5]), .CK(i_ref_clk), .RN(
        i_rst_n), .Q(i_div_ratio_c[5]) );
  DFFRQX2M \i_div_ratio_c_reg[4]  ( .D(i_div_ratio[4]), .CK(i_ref_clk), .RN(
        i_rst_n), .Q(i_div_ratio_c[4]) );
  DFFRQX2M \i_div_ratio_c_reg[1]  ( .D(i_div_ratio[1]), .CK(i_ref_clk), .RN(
        i_rst_n), .Q(i_div_ratio_c[1]) );
  MX2X2M U3 ( .A(div_clk), .B(i_ref_clk), .S0(N0), .Y(o_div_clk) );
  INVX2M U4 ( .A(i_div_ratio_c[1]), .Y(div_value[0]) );
  NAND2BX1M U5 ( .AN(i_div_ratio_c[2]), .B(div_value[0]), .Y(n1) );
  OAI2BB1X1M U7 ( .A0N(i_div_ratio_c[1]), .A1N(i_div_ratio_c[2]), .B0(n1), .Y(
        div_value[1]) );
  OR2X1M U8 ( .A(n1), .B(i_div_ratio_c[3]), .Y(n3) );
  OAI2BB1X1M U9 ( .A0N(n1), .A1N(i_div_ratio_c[3]), .B0(n3), .Y(div_value[2])
         );
  XNOR2X1M U10 ( .A(i_div_ratio_c[4]), .B(n3), .Y(div_value[3]) );
  NOR3X1M U11 ( .A(i_div_ratio_c[4]), .B(i_div_ratio_c[5]), .C(n3), .Y(
        div_value[5]) );
  OAI21X1M U12 ( .A0(i_div_ratio_c[4]), .A1(n3), .B0(i_div_ratio_c[5]), .Y(n4)
         );
  NAND2BX1M U13 ( .AN(div_value[5]), .B(n4), .Y(div_value[4]) );
  XNOR2X1M U14 ( .A(flag), .B(n5), .Y(n17) );
  CLKXOR2X2M U15 ( .A(n6), .B(div_clk), .Y(n16) );
  NOR2BX1M U16 ( .AN(N21), .B(n6), .Y(N28) );
  NOR2BX1M U17 ( .AN(N20), .B(n6), .Y(N27) );
  NOR2BX1M U18 ( .AN(N19), .B(n6), .Y(N26) );
  NOR2BX1M U19 ( .AN(N18), .B(n6), .Y(N25) );
  NOR2BX1M U20 ( .AN(N17), .B(n6), .Y(N24) );
  NOR2BX1M U21 ( .AN(N16), .B(n6), .Y(N23) );
  NOR2BX1M U22 ( .AN(N15), .B(n6), .Y(N22) );
  OAI31X1M U23 ( .A0(n7), .A1(i_div_ratio_c[0]), .A2(n8), .B0(n5), .Y(n6) );
  NAND3X1M U24 ( .A(i_div_ratio_c[0]), .B(i_clk_en), .C(n9), .Y(n5) );
  MXI2X1M U25 ( .A(n7), .B(n10), .S0(flag), .Y(n9) );
  NAND4X1M U26 ( .A(n11), .B(n12), .C(n13), .D(n14), .Y(n10) );
  NOR4X1M U27 ( .A(counter[6]), .B(n15), .C(n18), .D(n19), .Y(n14) );
  CLKXOR2X2M U28 ( .A(counter[2]), .B(anti_div_value[2]), .Y(n19) );
  CLKXOR2X2M U29 ( .A(counter[1]), .B(anti_div_value[1]), .Y(n18) );
  CLKXOR2X2M U30 ( .A(counter[0]), .B(anti_div_value[0]), .Y(n15) );
  XNOR2X1M U31 ( .A(counter[4]), .B(anti_div_value[4]), .Y(n13) );
  XNOR2X1M U32 ( .A(counter[5]), .B(anti_div_value[5]), .Y(n12) );
  XNOR2X1M U33 ( .A(counter[3]), .B(anti_div_value[3]), .Y(n11) );
  CLKINVX1M U34 ( .A(i_clk_en), .Y(n8) );
  NAND4X1M U35 ( .A(n20), .B(n21), .C(n22), .D(n23), .Y(n7) );
  NOR4X1M U36 ( .A(counter[6]), .B(n24), .C(n25), .D(n26), .Y(n23) );
  CLKXOR2X2M U37 ( .A(div_value[1]), .B(counter[1]), .Y(n26) );
  CLKXOR2X2M U38 ( .A(div_value[0]), .B(counter[0]), .Y(n25) );
  CLKXOR2X2M U39 ( .A(div_value[5]), .B(counter[5]), .Y(n24) );
  XNOR2X1M U40 ( .A(counter[3]), .B(div_value[3]), .Y(n22) );
  XNOR2X1M U41 ( .A(counter[4]), .B(div_value[4]), .Y(n21) );
  XNOR2X1M U42 ( .A(counter[2]), .B(div_value[2]), .Y(n20) );
  OAI31X1M U43 ( .A0(n27), .A1(i_div_ratio_c[2]), .A2(i_div_ratio_c[1]), .B0(
        i_clk_en), .Y(N0) );
  OR3X1M U44 ( .A(i_div_ratio_c[5]), .B(i_div_ratio_c[4]), .C(i_div_ratio_c[3]), .Y(n27) );
endmodule


module CLK_DIV_1_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKXOR2X2M U2 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
endmodule


module CLK_DIV_1_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [5:0] A;
  input [5:0] B;
  output [5:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7;
  wire   [6:0] carry;

  ADDFX2M U2_4 ( .A(A[4]), .B(n3), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  XOR3XLM U2_5 ( .A(A[5]), .B(n4), .C(carry[5]), .Y(DIFF[5]) );
  INVX2M U1 ( .A(B[5]), .Y(n4) );
  INVX2M U2 ( .A(B[2]), .Y(n6) );
  INVX2M U3 ( .A(B[3]), .Y(n5) );
  NAND2X2M U4 ( .A(B[0]), .B(n2), .Y(carry[1]) );
  INVX2M U5 ( .A(B[1]), .Y(n7) );
  INVX2M U6 ( .A(A[0]), .Y(n2) );
  INVX2M U7 ( .A(B[4]), .Y(n3) );
  XNOR2X2M U8 ( .A(A[1]), .B(A[0]), .Y(DIFF[0]) );
endmodule


module CLK_DIV_1 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, o_div_clk );
  input [5:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en;
  output o_div_clk;
  wire   N0, div_clk, flag, N15, N16, N17, N18, N19, N20, N21, N22, N23, N24,
         N25, N26, N27, N28, n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29;
  wire   [5:0] i_div_ratio_c;
  wire   [5:0] div_value;
  wire   [5:0] anti_div_value;
  wire   [6:0] counter;

  CLK_DIV_1_DW01_inc_0 add_49 ( .A(counter), .SUM({N21, N20, N19, N18, N17, 
        N16, N15}) );
  CLK_DIV_1_DW01_sub_0 sub_30 ( .A(i_div_ratio_c), .B(div_value), .CI(1'b0), 
        .DIFF(anti_div_value) );
  DFFRQX2M div_clk_reg ( .D(n29), .CK(i_ref_clk), .RN(i_rst_n), .Q(div_clk) );
  DFFSQX2M flag_reg ( .D(n28), .CK(i_ref_clk), .SN(i_rst_n), .Q(flag) );
  DFFRQX2M \counter_reg[6]  ( .D(N28), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[6]) );
  DFFRQX2M \counter_reg[4]  ( .D(N26), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[4]) );
  DFFRQX2M \counter_reg[3]  ( .D(N25), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[3]) );
  DFFRQX2M \i_div_ratio_c_reg[0]  ( .D(i_div_ratio[0]), .CK(i_ref_clk), .RN(
        i_rst_n), .Q(i_div_ratio_c[0]) );
  DFFRQX2M \counter_reg[0]  ( .D(N22), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[0]) );
  DFFRQX2M \counter_reg[5]  ( .D(N27), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[5]) );
  DFFRQX2M \counter_reg[2]  ( .D(N24), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[2]) );
  DFFRQX2M \counter_reg[1]  ( .D(N23), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[1]) );
  DFFRQX2M \i_div_ratio_c_reg[3]  ( .D(i_div_ratio[3]), .CK(i_ref_clk), .RN(
        i_rst_n), .Q(i_div_ratio_c[3]) );
  DFFRQX2M \i_div_ratio_c_reg[2]  ( .D(i_div_ratio[2]), .CK(i_ref_clk), .RN(
        i_rst_n), .Q(i_div_ratio_c[2]) );
  DFFRQX2M \i_div_ratio_c_reg[5]  ( .D(i_div_ratio[5]), .CK(i_ref_clk), .RN(
        i_rst_n), .Q(i_div_ratio_c[5]) );
  DFFRQX2M \i_div_ratio_c_reg[4]  ( .D(i_div_ratio[4]), .CK(i_ref_clk), .RN(
        i_rst_n), .Q(i_div_ratio_c[4]) );
  DFFRQX2M \i_div_ratio_c_reg[1]  ( .D(i_div_ratio[1]), .CK(i_ref_clk), .RN(
        i_rst_n), .Q(i_div_ratio_c[1]) );
  MX2X2M U3 ( .A(div_clk), .B(i_ref_clk), .S0(N0), .Y(o_div_clk) );
  INVX2M U4 ( .A(i_div_ratio_c[1]), .Y(div_value[0]) );
  NAND2BX1M U5 ( .AN(i_div_ratio_c[2]), .B(div_value[0]), .Y(n1) );
  OAI2BB1X1M U7 ( .A0N(i_div_ratio_c[1]), .A1N(i_div_ratio_c[2]), .B0(n1), .Y(
        div_value[1]) );
  OR2X1M U8 ( .A(n1), .B(i_div_ratio_c[3]), .Y(n3) );
  OAI2BB1X1M U9 ( .A0N(n1), .A1N(i_div_ratio_c[3]), .B0(n3), .Y(div_value[2])
         );
  XNOR2X1M U10 ( .A(i_div_ratio_c[4]), .B(n3), .Y(div_value[3]) );
  NOR3X1M U11 ( .A(i_div_ratio_c[4]), .B(i_div_ratio_c[5]), .C(n3), .Y(
        div_value[5]) );
  OAI21X1M U12 ( .A0(i_div_ratio_c[4]), .A1(n3), .B0(i_div_ratio_c[5]), .Y(n4)
         );
  NAND2BX1M U13 ( .AN(div_value[5]), .B(n4), .Y(div_value[4]) );
  XNOR2X1M U14 ( .A(flag), .B(n5), .Y(n28) );
  CLKXOR2X2M U15 ( .A(n6), .B(div_clk), .Y(n29) );
  NOR2BX1M U16 ( .AN(N21), .B(n6), .Y(N28) );
  NOR2BX1M U17 ( .AN(N20), .B(n6), .Y(N27) );
  NOR2BX1M U18 ( .AN(N19), .B(n6), .Y(N26) );
  NOR2BX1M U19 ( .AN(N18), .B(n6), .Y(N25) );
  NOR2BX1M U20 ( .AN(N17), .B(n6), .Y(N24) );
  NOR2BX1M U21 ( .AN(N16), .B(n6), .Y(N23) );
  NOR2BX1M U22 ( .AN(N15), .B(n6), .Y(N22) );
  OAI31X1M U23 ( .A0(n7), .A1(i_div_ratio_c[0]), .A2(n8), .B0(n5), .Y(n6) );
  NAND3X1M U24 ( .A(i_div_ratio_c[0]), .B(i_clk_en), .C(n9), .Y(n5) );
  MXI2X1M U25 ( .A(n7), .B(n10), .S0(flag), .Y(n9) );
  NAND4X1M U26 ( .A(n11), .B(n12), .C(n13), .D(n14), .Y(n10) );
  NOR4X1M U27 ( .A(counter[6]), .B(n15), .C(n18), .D(n19), .Y(n14) );
  CLKXOR2X2M U28 ( .A(counter[2]), .B(anti_div_value[2]), .Y(n19) );
  CLKXOR2X2M U29 ( .A(counter[1]), .B(anti_div_value[1]), .Y(n18) );
  CLKXOR2X2M U30 ( .A(counter[0]), .B(anti_div_value[0]), .Y(n15) );
  XNOR2X1M U31 ( .A(counter[4]), .B(anti_div_value[4]), .Y(n13) );
  XNOR2X1M U32 ( .A(counter[5]), .B(anti_div_value[5]), .Y(n12) );
  XNOR2X1M U33 ( .A(counter[3]), .B(anti_div_value[3]), .Y(n11) );
  CLKINVX1M U34 ( .A(i_clk_en), .Y(n8) );
  NAND4X1M U35 ( .A(n20), .B(n21), .C(n22), .D(n23), .Y(n7) );
  NOR4X1M U36 ( .A(counter[6]), .B(n24), .C(n25), .D(n26), .Y(n23) );
  CLKXOR2X2M U37 ( .A(div_value[1]), .B(counter[1]), .Y(n26) );
  CLKXOR2X2M U38 ( .A(div_value[0]), .B(counter[0]), .Y(n25) );
  CLKXOR2X2M U39 ( .A(div_value[5]), .B(counter[5]), .Y(n24) );
  XNOR2X1M U40 ( .A(counter[3]), .B(div_value[3]), .Y(n22) );
  XNOR2X1M U41 ( .A(counter[4]), .B(div_value[4]), .Y(n21) );
  XNOR2X1M U42 ( .A(counter[2]), .B(div_value[2]), .Y(n20) );
  OAI31X1M U43 ( .A0(n27), .A1(i_div_ratio_c[2]), .A2(i_div_ratio_c[1]), .B0(
        i_clk_en), .Y(N0) );
  OR3X1M U44 ( .A(i_div_ratio_c[5]), .B(i_div_ratio_c[4]), .C(i_div_ratio_c[3]), .Y(n27) );
endmodule


module Prescale_DATA_WIDTH8 ( IN_PRE, div_ratio_RX );
  input [5:0] IN_PRE;
  output [5:0] div_ratio_RX;
  wire   div_ratio_RX_0, n1, n2, n3;
  assign div_ratio_RX[1] = 1'b0;
  assign div_ratio_RX[4] = 1'b0;
  assign div_ratio_RX[5] = 1'b0;
  assign div_ratio_RX[0] = div_ratio_RX_0;

  OAI21X2M U3 ( .A0(n1), .A1(n3), .B0(n2), .Y(div_ratio_RX[2]) );
  AND2X2M U4 ( .A(n1), .B(n2), .Y(div_ratio_RX_0) );
  AND2X2M U5 ( .A(n2), .B(n3), .Y(div_ratio_RX[3]) );
  NOR3BX2M U6 ( .AN(IN_PRE[3]), .B(IN_PRE[4]), .C(IN_PRE[5]), .Y(n3) );
  NOR3BX2M U7 ( .AN(IN_PRE[5]), .B(IN_PRE[3]), .C(IN_PRE[4]), .Y(n1) );
  NOR3X2M U8 ( .A(IN_PRE[2]), .B(IN_PRE[1]), .C(IN_PRE[0]), .Y(n2) );
endmodule


module Reg_File_DATA_WIDTH8_ADDR_WIDTH4_DEPTH16 ( WrData, Address, WrEn, RdEn, 
        CLK, RST, RdData_Valid, RdData, REG0, REG1, REG2, REG3 );
  input [7:0] WrData;
  input [3:0] Address;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input WrEn, RdEn, CLK, RST;
  output RdData_Valid;
  wire   N11, N12, N13, N14, \RegFile[15][7] , \RegFile[15][6] ,
         \RegFile[15][5] , \RegFile[15][4] , \RegFile[15][3] ,
         \RegFile[15][2] , \RegFile[15][1] , \RegFile[15][0] ,
         \RegFile[14][7] , \RegFile[14][6] , \RegFile[14][5] ,
         \RegFile[14][4] , \RegFile[14][3] , \RegFile[14][2] ,
         \RegFile[14][1] , \RegFile[14][0] , \RegFile[13][7] ,
         \RegFile[13][6] , \RegFile[13][5] , \RegFile[13][4] ,
         \RegFile[13][3] , \RegFile[13][2] , \RegFile[13][1] ,
         \RegFile[13][0] , \RegFile[12][7] , \RegFile[12][6] ,
         \RegFile[12][5] , \RegFile[12][4] , \RegFile[12][3] ,
         \RegFile[12][2] , \RegFile[12][1] , \RegFile[12][0] ,
         \RegFile[11][7] , \RegFile[11][6] , \RegFile[11][5] ,
         \RegFile[11][4] , \RegFile[11][3] , \RegFile[11][2] ,
         \RegFile[11][1] , \RegFile[11][0] , \RegFile[10][7] ,
         \RegFile[10][6] , \RegFile[10][5] , \RegFile[10][4] ,
         \RegFile[10][3] , \RegFile[10][2] , \RegFile[10][1] ,
         \RegFile[10][0] , \RegFile[9][7] , \RegFile[9][6] , \RegFile[9][5] ,
         \RegFile[9][4] , \RegFile[9][3] , \RegFile[9][2] , \RegFile[9][1] ,
         \RegFile[9][0] , \RegFile[8][7] , \RegFile[8][6] , \RegFile[8][5] ,
         \RegFile[8][4] , \RegFile[8][3] , \RegFile[8][2] , \RegFile[8][1] ,
         \RegFile[8][0] , \RegFile[7][7] , \RegFile[7][6] , \RegFile[7][5] ,
         \RegFile[7][4] , \RegFile[7][3] , \RegFile[7][2] , \RegFile[7][1] ,
         \RegFile[7][0] , \RegFile[6][7] , \RegFile[6][6] , \RegFile[6][5] ,
         \RegFile[6][4] , \RegFile[6][3] , \RegFile[6][2] , \RegFile[6][1] ,
         \RegFile[6][0] , \RegFile[5][7] , \RegFile[5][6] , \RegFile[5][5] ,
         \RegFile[5][4] , \RegFile[5][3] , \RegFile[5][2] , \RegFile[5][1] ,
         \RegFile[5][0] , \RegFile[4][7] , \RegFile[4][6] , \RegFile[4][5] ,
         \RegFile[4][4] , \RegFile[4][3] , \RegFile[4][2] , \RegFile[4][1] ,
         \RegFile[4][0] , N36, N37, N38, N39, N40, N41, N42, N43, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];

  DFFSQX2M \RegFile_reg[3][5]  ( .D(n78), .CK(CLK), .SN(n203), .Q(REG3[5]) );
  DFFRQX2M \RegFile_reg[13][7]  ( .D(n160), .CK(CLK), .RN(n211), .Q(
        \RegFile[13][7] ) );
  DFFRQX2M \RegFile_reg[13][6]  ( .D(n159), .CK(CLK), .RN(n211), .Q(
        \RegFile[13][6] ) );
  DFFRQX2M \RegFile_reg[13][5]  ( .D(n158), .CK(CLK), .RN(n210), .Q(
        \RegFile[13][5] ) );
  DFFRQX2M \RegFile_reg[13][4]  ( .D(n157), .CK(CLK), .RN(n210), .Q(
        \RegFile[13][4] ) );
  DFFRQX2M \RegFile_reg[13][3]  ( .D(n156), .CK(CLK), .RN(n210), .Q(
        \RegFile[13][3] ) );
  DFFRQX2M \RegFile_reg[13][2]  ( .D(n155), .CK(CLK), .RN(n210), .Q(
        \RegFile[13][2] ) );
  DFFRQX2M \RegFile_reg[13][1]  ( .D(n154), .CK(CLK), .RN(n210), .Q(
        \RegFile[13][1] ) );
  DFFRQX2M \RegFile_reg[13][0]  ( .D(n153), .CK(CLK), .RN(n210), .Q(
        \RegFile[13][0] ) );
  DFFRQX2M \RegFile_reg[9][7]  ( .D(n128), .CK(CLK), .RN(n208), .Q(
        \RegFile[9][7] ) );
  DFFRQX2M \RegFile_reg[9][6]  ( .D(n127), .CK(CLK), .RN(n208), .Q(
        \RegFile[9][6] ) );
  DFFRQX2M \RegFile_reg[9][5]  ( .D(n126), .CK(CLK), .RN(n208), .Q(
        \RegFile[9][5] ) );
  DFFRQX2M \RegFile_reg[9][4]  ( .D(n125), .CK(CLK), .RN(n208), .Q(
        \RegFile[9][4] ) );
  DFFRQX2M \RegFile_reg[9][3]  ( .D(n124), .CK(CLK), .RN(n208), .Q(
        \RegFile[9][3] ) );
  DFFRQX2M \RegFile_reg[9][2]  ( .D(n123), .CK(CLK), .RN(n208), .Q(
        \RegFile[9][2] ) );
  DFFRQX2M \RegFile_reg[9][1]  ( .D(n122), .CK(CLK), .RN(n208), .Q(
        \RegFile[9][1] ) );
  DFFRQX2M \RegFile_reg[9][0]  ( .D(n121), .CK(CLK), .RN(n208), .Q(
        \RegFile[9][0] ) );
  DFFRQX2M \RegFile_reg[5][7]  ( .D(n96), .CK(CLK), .RN(n206), .Q(
        \RegFile[5][7] ) );
  DFFRQX2M \RegFile_reg[5][6]  ( .D(n95), .CK(CLK), .RN(n206), .Q(
        \RegFile[5][6] ) );
  DFFRQX2M \RegFile_reg[5][5]  ( .D(n94), .CK(CLK), .RN(n206), .Q(
        \RegFile[5][5] ) );
  DFFRQX2M \RegFile_reg[5][4]  ( .D(n93), .CK(CLK), .RN(n206), .Q(
        \RegFile[5][4] ) );
  DFFRQX2M \RegFile_reg[5][3]  ( .D(n92), .CK(CLK), .RN(n206), .Q(
        \RegFile[5][3] ) );
  DFFRQX2M \RegFile_reg[5][2]  ( .D(n91), .CK(CLK), .RN(n206), .Q(
        \RegFile[5][2] ) );
  DFFRQX2M \RegFile_reg[5][1]  ( .D(n90), .CK(CLK), .RN(n206), .Q(
        \RegFile[5][1] ) );
  DFFRQX2M \RegFile_reg[5][0]  ( .D(n89), .CK(CLK), .RN(n206), .Q(
        \RegFile[5][0] ) );
  DFFRQX2M \RegFile_reg[15][7]  ( .D(n176), .CK(CLK), .RN(n203), .Q(
        \RegFile[15][7] ) );
  DFFRQX2M \RegFile_reg[15][6]  ( .D(n175), .CK(CLK), .RN(n212), .Q(
        \RegFile[15][6] ) );
  DFFRQX2M \RegFile_reg[15][5]  ( .D(n174), .CK(CLK), .RN(n212), .Q(
        \RegFile[15][5] ) );
  DFFRQX2M \RegFile_reg[15][4]  ( .D(n173), .CK(CLK), .RN(n211), .Q(
        \RegFile[15][4] ) );
  DFFRQX2M \RegFile_reg[15][3]  ( .D(n172), .CK(CLK), .RN(n211), .Q(
        \RegFile[15][3] ) );
  DFFRQX2M \RegFile_reg[15][2]  ( .D(n171), .CK(CLK), .RN(n211), .Q(
        \RegFile[15][2] ) );
  DFFRQX2M \RegFile_reg[15][1]  ( .D(n170), .CK(CLK), .RN(n211), .Q(
        \RegFile[15][1] ) );
  DFFRQX2M \RegFile_reg[15][0]  ( .D(n169), .CK(CLK), .RN(n211), .Q(
        \RegFile[15][0] ) );
  DFFRQX2M \RegFile_reg[11][7]  ( .D(n144), .CK(CLK), .RN(n210), .Q(
        \RegFile[11][7] ) );
  DFFRQX2M \RegFile_reg[11][6]  ( .D(n143), .CK(CLK), .RN(n209), .Q(
        \RegFile[11][6] ) );
  DFFRQX2M \RegFile_reg[11][5]  ( .D(n142), .CK(CLK), .RN(n209), .Q(
        \RegFile[11][5] ) );
  DFFRQX2M \RegFile_reg[11][4]  ( .D(n141), .CK(CLK), .RN(n209), .Q(
        \RegFile[11][4] ) );
  DFFRQX2M \RegFile_reg[11][3]  ( .D(n140), .CK(CLK), .RN(n209), .Q(
        \RegFile[11][3] ) );
  DFFRQX2M \RegFile_reg[11][2]  ( .D(n139), .CK(CLK), .RN(n209), .Q(
        \RegFile[11][2] ) );
  DFFRQX2M \RegFile_reg[11][1]  ( .D(n138), .CK(CLK), .RN(n209), .Q(
        \RegFile[11][1] ) );
  DFFRQX2M \RegFile_reg[11][0]  ( .D(n137), .CK(CLK), .RN(n209), .Q(
        \RegFile[11][0] ) );
  DFFRQX2M \RegFile_reg[7][7]  ( .D(n112), .CK(CLK), .RN(n207), .Q(
        \RegFile[7][7] ) );
  DFFRQX2M \RegFile_reg[7][6]  ( .D(n111), .CK(CLK), .RN(n207), .Q(
        \RegFile[7][6] ) );
  DFFRQX2M \RegFile_reg[7][5]  ( .D(n110), .CK(CLK), .RN(n207), .Q(
        \RegFile[7][5] ) );
  DFFRQX2M \RegFile_reg[7][4]  ( .D(n109), .CK(CLK), .RN(n207), .Q(
        \RegFile[7][4] ) );
  DFFRQX2M \RegFile_reg[7][3]  ( .D(n108), .CK(CLK), .RN(n207), .Q(
        \RegFile[7][3] ) );
  DFFRQX2M \RegFile_reg[7][2]  ( .D(n107), .CK(CLK), .RN(n207), .Q(
        \RegFile[7][2] ) );
  DFFRQX2M \RegFile_reg[7][1]  ( .D(n106), .CK(CLK), .RN(n207), .Q(
        \RegFile[7][1] ) );
  DFFRQX2M \RegFile_reg[7][0]  ( .D(n105), .CK(CLK), .RN(n207), .Q(
        \RegFile[7][0] ) );
  DFFRQX2M \RegFile_reg[3][7]  ( .D(n80), .CK(CLK), .RN(n205), .Q(REG3[7]) );
  DFFRQX2M \RegFile_reg[3][6]  ( .D(n79), .CK(CLK), .RN(n205), .Q(REG3[6]) );
  DFFRQX2M \RegFile_reg[14][7]  ( .D(n168), .CK(CLK), .RN(n211), .Q(
        \RegFile[14][7] ) );
  DFFRQX2M \RegFile_reg[14][6]  ( .D(n167), .CK(CLK), .RN(n211), .Q(
        \RegFile[14][6] ) );
  DFFRQX2M \RegFile_reg[14][5]  ( .D(n166), .CK(CLK), .RN(n211), .Q(
        \RegFile[14][5] ) );
  DFFRQX2M \RegFile_reg[14][4]  ( .D(n165), .CK(CLK), .RN(n211), .Q(
        \RegFile[14][4] ) );
  DFFRQX2M \RegFile_reg[14][3]  ( .D(n164), .CK(CLK), .RN(n211), .Q(
        \RegFile[14][3] ) );
  DFFRQX2M \RegFile_reg[14][2]  ( .D(n163), .CK(CLK), .RN(n211), .Q(
        \RegFile[14][2] ) );
  DFFRQX2M \RegFile_reg[14][1]  ( .D(n162), .CK(CLK), .RN(n211), .Q(
        \RegFile[14][1] ) );
  DFFRQX2M \RegFile_reg[14][0]  ( .D(n161), .CK(CLK), .RN(n211), .Q(
        \RegFile[14][0] ) );
  DFFRQX2M \RegFile_reg[10][7]  ( .D(n136), .CK(CLK), .RN(n209), .Q(
        \RegFile[10][7] ) );
  DFFRQX2M \RegFile_reg[10][6]  ( .D(n135), .CK(CLK), .RN(n209), .Q(
        \RegFile[10][6] ) );
  DFFRQX2M \RegFile_reg[10][5]  ( .D(n134), .CK(CLK), .RN(n209), .Q(
        \RegFile[10][5] ) );
  DFFRQX2M \RegFile_reg[10][4]  ( .D(n133), .CK(CLK), .RN(n209), .Q(
        \RegFile[10][4] ) );
  DFFRQX2M \RegFile_reg[10][3]  ( .D(n132), .CK(CLK), .RN(n209), .Q(
        \RegFile[10][3] ) );
  DFFRQX2M \RegFile_reg[10][2]  ( .D(n131), .CK(CLK), .RN(n209), .Q(
        \RegFile[10][2] ) );
  DFFRQX2M \RegFile_reg[10][1]  ( .D(n130), .CK(CLK), .RN(n209), .Q(
        \RegFile[10][1] ) );
  DFFRQX2M \RegFile_reg[10][0]  ( .D(n129), .CK(CLK), .RN(n209), .Q(
        \RegFile[10][0] ) );
  DFFRQX2M \RegFile_reg[6][7]  ( .D(n104), .CK(CLK), .RN(n207), .Q(
        \RegFile[6][7] ) );
  DFFRQX2M \RegFile_reg[6][6]  ( .D(n103), .CK(CLK), .RN(n207), .Q(
        \RegFile[6][6] ) );
  DFFRQX2M \RegFile_reg[6][5]  ( .D(n102), .CK(CLK), .RN(n207), .Q(
        \RegFile[6][5] ) );
  DFFRQX2M \RegFile_reg[6][4]  ( .D(n101), .CK(CLK), .RN(n207), .Q(
        \RegFile[6][4] ) );
  DFFRQX2M \RegFile_reg[6][3]  ( .D(n100), .CK(CLK), .RN(n207), .Q(
        \RegFile[6][3] ) );
  DFFRQX2M \RegFile_reg[6][2]  ( .D(n99), .CK(CLK), .RN(n206), .Q(
        \RegFile[6][2] ) );
  DFFRQX2M \RegFile_reg[6][1]  ( .D(n98), .CK(CLK), .RN(n206), .Q(
        \RegFile[6][1] ) );
  DFFRQX2M \RegFile_reg[6][0]  ( .D(n97), .CK(CLK), .RN(n206), .Q(
        \RegFile[6][0] ) );
  DFFRQX2M \RegFile_reg[12][7]  ( .D(n152), .CK(CLK), .RN(n210), .Q(
        \RegFile[12][7] ) );
  DFFRQX2M \RegFile_reg[12][6]  ( .D(n151), .CK(CLK), .RN(n210), .Q(
        \RegFile[12][6] ) );
  DFFRQX2M \RegFile_reg[12][5]  ( .D(n150), .CK(CLK), .RN(n210), .Q(
        \RegFile[12][5] ) );
  DFFRQX2M \RegFile_reg[12][4]  ( .D(n149), .CK(CLK), .RN(n210), .Q(
        \RegFile[12][4] ) );
  DFFRQX2M \RegFile_reg[12][3]  ( .D(n148), .CK(CLK), .RN(n210), .Q(
        \RegFile[12][3] ) );
  DFFRQX2M \RegFile_reg[12][2]  ( .D(n147), .CK(CLK), .RN(n210), .Q(
        \RegFile[12][2] ) );
  DFFRQX2M \RegFile_reg[12][1]  ( .D(n146), .CK(CLK), .RN(n210), .Q(
        \RegFile[12][1] ) );
  DFFRQX2M \RegFile_reg[12][0]  ( .D(n145), .CK(CLK), .RN(n210), .Q(
        \RegFile[12][0] ) );
  DFFRQX2M \RegFile_reg[8][7]  ( .D(n120), .CK(CLK), .RN(n208), .Q(
        \RegFile[8][7] ) );
  DFFRQX2M \RegFile_reg[8][6]  ( .D(n119), .CK(CLK), .RN(n208), .Q(
        \RegFile[8][6] ) );
  DFFRQX2M \RegFile_reg[8][5]  ( .D(n118), .CK(CLK), .RN(n208), .Q(
        \RegFile[8][5] ) );
  DFFRQX2M \RegFile_reg[8][4]  ( .D(n117), .CK(CLK), .RN(n208), .Q(
        \RegFile[8][4] ) );
  DFFRQX2M \RegFile_reg[8][3]  ( .D(n116), .CK(CLK), .RN(n208), .Q(
        \RegFile[8][3] ) );
  DFFRQX2M \RegFile_reg[8][2]  ( .D(n115), .CK(CLK), .RN(n208), .Q(
        \RegFile[8][2] ) );
  DFFRQX2M \RegFile_reg[8][1]  ( .D(n114), .CK(CLK), .RN(n208), .Q(
        \RegFile[8][1] ) );
  DFFRQX2M \RegFile_reg[8][0]  ( .D(n113), .CK(CLK), .RN(n207), .Q(
        \RegFile[8][0] ) );
  DFFRQX2M \RegFile_reg[4][7]  ( .D(n88), .CK(CLK), .RN(n206), .Q(
        \RegFile[4][7] ) );
  DFFRQX2M \RegFile_reg[4][6]  ( .D(n87), .CK(CLK), .RN(n206), .Q(
        \RegFile[4][6] ) );
  DFFRQX2M \RegFile_reg[4][5]  ( .D(n86), .CK(CLK), .RN(n206), .Q(
        \RegFile[4][5] ) );
  DFFRQX2M \RegFile_reg[4][4]  ( .D(n85), .CK(CLK), .RN(n206), .Q(
        \RegFile[4][4] ) );
  DFFRQX2M \RegFile_reg[4][3]  ( .D(n84), .CK(CLK), .RN(n205), .Q(
        \RegFile[4][3] ) );
  DFFRQX2M \RegFile_reg[4][2]  ( .D(n83), .CK(CLK), .RN(n205), .Q(
        \RegFile[4][2] ) );
  DFFRQX2M \RegFile_reg[4][1]  ( .D(n82), .CK(CLK), .RN(n205), .Q(
        \RegFile[4][1] ) );
  DFFRQX2M \RegFile_reg[4][0]  ( .D(n81), .CK(CLK), .RN(n205), .Q(
        \RegFile[4][0] ) );
  DFFRQX2M \RegFile_reg[3][4]  ( .D(n77), .CK(CLK), .RN(n205), .Q(REG3[4]) );
  DFFRQX2M \RegFile_reg[3][3]  ( .D(n76), .CK(CLK), .RN(n205), .Q(REG3[3]) );
  DFFRQX2M \RegFile_reg[3][2]  ( .D(n75), .CK(CLK), .RN(n205), .Q(REG3[2]) );
  DFFRQX2M \RegFile_reg[3][1]  ( .D(n74), .CK(CLK), .RN(n205), .Q(REG3[1]) );
  DFFRQX2M \RegFile_reg[3][0]  ( .D(n73), .CK(CLK), .RN(n205), .Q(REG3[0]) );
  DFFRQX2M \RdData_reg[7]  ( .D(n47), .CK(CLK), .RN(n203), .Q(RdData[7]) );
  DFFRQX2M \RdData_reg[6]  ( .D(n46), .CK(CLK), .RN(n203), .Q(RdData[6]) );
  DFFRQX2M \RdData_reg[5]  ( .D(n45), .CK(CLK), .RN(n203), .Q(RdData[5]) );
  DFFRQX2M \RdData_reg[4]  ( .D(n44), .CK(CLK), .RN(n203), .Q(RdData[4]) );
  DFFRQX2M \RdData_reg[3]  ( .D(n43), .CK(CLK), .RN(n203), .Q(RdData[3]) );
  DFFRQX2M \RdData_reg[2]  ( .D(n42), .CK(CLK), .RN(n203), .Q(RdData[2]) );
  DFFRQX2M \RdData_reg[1]  ( .D(n41), .CK(CLK), .RN(n203), .Q(RdData[1]) );
  DFFRQX2M \RdData_reg[0]  ( .D(n40), .CK(CLK), .RN(n207), .Q(RdData[0]) );
  DFFRQX2M \RegFile_reg[2][1]  ( .D(n66), .CK(CLK), .RN(n204), .Q(REG2[1]) );
  DFFRQX2M \RegFile_reg[2][3]  ( .D(n68), .CK(CLK), .RN(n204), .Q(REG2[3]) );
  DFFRQX2M \RegFile_reg[2][2]  ( .D(n67), .CK(CLK), .RN(n205), .Q(REG2[2]) );
  DFFSQX2M \RegFile_reg[2][7]  ( .D(n72), .CK(CLK), .SN(n203), .Q(REG2[7]) );
  DFFSQX2M \RegFile_reg[2][0]  ( .D(n65), .CK(CLK), .SN(n203), .Q(REG2[0]) );
  DFFRQX2M \RegFile_reg[2][5]  ( .D(n70), .CK(CLK), .RN(n205), .Q(REG2[5]) );
  DFFRQX2M \RegFile_reg[2][6]  ( .D(n71), .CK(CLK), .RN(n205), .Q(REG2[6]) );
  DFFRQX2M \RegFile_reg[2][4]  ( .D(n69), .CK(CLK), .RN(n205), .Q(REG2[4]) );
  DFFRQX2M RdData_Valid_reg ( .D(n48), .CK(CLK), .RN(n203), .Q(RdData_Valid)
         );
  DFFRQX2M \RegFile_reg[0][1]  ( .D(n50), .CK(CLK), .RN(n203), .Q(REG0[1]) );
  DFFRQX2M \RegFile_reg[0][0]  ( .D(n49), .CK(CLK), .RN(n203), .Q(REG0[0]) );
  DFFRQX2M \RegFile_reg[0][2]  ( .D(n51), .CK(CLK), .RN(n203), .Q(REG0[2]) );
  DFFRQX2M \RegFile_reg[0][3]  ( .D(n52), .CK(CLK), .RN(n204), .Q(REG0[3]) );
  DFFRQX2M \RegFile_reg[0][4]  ( .D(n53), .CK(CLK), .RN(n204), .Q(REG0[4]) );
  DFFRQX2M \RegFile_reg[0][5]  ( .D(n54), .CK(CLK), .RN(n204), .Q(REG0[5]) );
  DFFRQX2M \RegFile_reg[0][6]  ( .D(n55), .CK(CLK), .RN(n204), .Q(REG0[6]) );
  DFFRQX2M \RegFile_reg[1][7]  ( .D(n64), .CK(CLK), .RN(n204), .Q(REG1[7]) );
  DFFRQX2M \RegFile_reg[1][6]  ( .D(n63), .CK(CLK), .RN(n204), .Q(REG1[6]) );
  DFFRQX2M \RegFile_reg[1][5]  ( .D(n62), .CK(CLK), .RN(n204), .Q(REG1[5]) );
  DFFRQX2M \RegFile_reg[1][4]  ( .D(n61), .CK(CLK), .RN(n204), .Q(REG1[4]) );
  DFFRQX2M \RegFile_reg[1][1]  ( .D(n58), .CK(CLK), .RN(n204), .Q(REG1[1]) );
  DFFRQX2M \RegFile_reg[0][7]  ( .D(n56), .CK(CLK), .RN(n204), .Q(REG0[7]) );
  DFFRQX2M \RegFile_reg[1][2]  ( .D(n59), .CK(CLK), .RN(n204), .Q(REG1[2]) );
  DFFRQX2M \RegFile_reg[1][3]  ( .D(n60), .CK(CLK), .RN(n204), .Q(REG1[3]) );
  DFFRQX2M \RegFile_reg[1][0]  ( .D(n57), .CK(CLK), .RN(n204), .Q(REG1[0]) );
  NOR2X2M U3 ( .A(n219), .B(N13), .Y(n20) );
  NOR2X2M U4 ( .A(N12), .B(N13), .Y(n15) );
  NOR2BX2M U5 ( .AN(N13), .B(N12), .Y(n23) );
  NOR2BX2M U6 ( .AN(N13), .B(n219), .Y(n26) );
  INVX2M U7 ( .A(n200), .Y(n201) );
  INVX2M U8 ( .A(n198), .Y(n199) );
  INVX2M U9 ( .A(n200), .Y(n202) );
  BUFX2M U10 ( .A(n218), .Y(n200) );
  BUFX2M U11 ( .A(n219), .Y(n198) );
  INVX2M U12 ( .A(WrData[0]), .Y(n225) );
  INVX2M U13 ( .A(WrData[1]), .Y(n226) );
  INVX2M U14 ( .A(WrData[2]), .Y(n227) );
  INVX2M U15 ( .A(WrData[3]), .Y(n228) );
  INVX2M U16 ( .A(n12), .Y(n220) );
  BUFX2M U17 ( .A(n217), .Y(n203) );
  BUFX2M U18 ( .A(n217), .Y(n204) );
  BUFX2M U19 ( .A(n216), .Y(n205) );
  BUFX2M U20 ( .A(n216), .Y(n206) );
  BUFX2M U21 ( .A(n215), .Y(n207) );
  BUFX2M U22 ( .A(n215), .Y(n208) );
  BUFX2M U23 ( .A(n214), .Y(n209) );
  BUFX2M U24 ( .A(n214), .Y(n210) );
  BUFX2M U25 ( .A(n213), .Y(n211) );
  BUFX2M U26 ( .A(n213), .Y(n212) );
  NOR2BX2M U27 ( .AN(n27), .B(N11), .Y(n16) );
  NOR2BX2M U28 ( .AN(n27), .B(n218), .Y(n18) );
  NOR2BX2M U29 ( .AN(n38), .B(N11), .Y(n30) );
  NOR2BX2M U30 ( .AN(n38), .B(n218), .Y(n32) );
  NAND2X2M U31 ( .A(n18), .B(n15), .Y(n17) );
  NAND2X2M U32 ( .A(n30), .B(n15), .Y(n29) );
  NAND2X2M U33 ( .A(n32), .B(n15), .Y(n31) );
  NAND2X2M U34 ( .A(n30), .B(n20), .Y(n33) );
  NAND2X2M U35 ( .A(n32), .B(n20), .Y(n34) );
  NAND2X2M U36 ( .A(n20), .B(n16), .Y(n19) );
  NAND2X2M U37 ( .A(n20), .B(n18), .Y(n21) );
  NAND2X2M U38 ( .A(n23), .B(n16), .Y(n22) );
  NAND2X2M U39 ( .A(n23), .B(n18), .Y(n24) );
  NAND2X2M U40 ( .A(n26), .B(n16), .Y(n25) );
  NAND2X2M U41 ( .A(n26), .B(n18), .Y(n28) );
  NAND2X2M U42 ( .A(n30), .B(n23), .Y(n35) );
  NAND2X2M U43 ( .A(n32), .B(n23), .Y(n36) );
  NAND2X2M U44 ( .A(n30), .B(n26), .Y(n37) );
  NAND2X2M U45 ( .A(n32), .B(n26), .Y(n39) );
  NAND2X2M U46 ( .A(n15), .B(n16), .Y(n14) );
  INVX2M U47 ( .A(WrData[4]), .Y(n224) );
  INVX2M U48 ( .A(WrData[5]), .Y(n223) );
  INVX2M U49 ( .A(WrData[6]), .Y(n222) );
  INVX2M U50 ( .A(WrData[7]), .Y(n221) );
  NAND2BX2M U51 ( .AN(WrEn), .B(RdEn), .Y(n12) );
  NOR2BX2M U52 ( .AN(WrEn), .B(RdEn), .Y(n13) );
  BUFX2M U53 ( .A(RST), .Y(n216) );
  BUFX2M U54 ( .A(RST), .Y(n215) );
  BUFX2M U55 ( .A(RST), .Y(n214) );
  BUFX2M U56 ( .A(RST), .Y(n213) );
  BUFX2M U57 ( .A(RST), .Y(n217) );
  OAI2BB2X1M U58 ( .B0(n14), .B1(n225), .A0N(REG0[0]), .A1N(n14), .Y(n49) );
  OAI2BB2X1M U59 ( .B0(n14), .B1(n226), .A0N(REG0[1]), .A1N(n14), .Y(n50) );
  OAI2BB2X1M U60 ( .B0(n14), .B1(n227), .A0N(REG0[2]), .A1N(n14), .Y(n51) );
  OAI2BB2X1M U61 ( .B0(n14), .B1(n228), .A0N(REG0[3]), .A1N(n14), .Y(n52) );
  OAI2BB2X1M U62 ( .B0(n14), .B1(n224), .A0N(REG0[4]), .A1N(n14), .Y(n53) );
  OAI2BB2X1M U63 ( .B0(n14), .B1(n223), .A0N(REG0[5]), .A1N(n14), .Y(n54) );
  OAI2BB2X1M U64 ( .B0(n14), .B1(n222), .A0N(REG0[6]), .A1N(n14), .Y(n55) );
  OAI2BB2X1M U65 ( .B0(n14), .B1(n221), .A0N(REG0[7]), .A1N(n14), .Y(n56) );
  OAI2BB2X1M U66 ( .B0(n225), .B1(n17), .A0N(REG1[0]), .A1N(n17), .Y(n57) );
  OAI2BB2X1M U67 ( .B0(n226), .B1(n17), .A0N(REG1[1]), .A1N(n17), .Y(n58) );
  OAI2BB2X1M U68 ( .B0(n227), .B1(n17), .A0N(REG1[2]), .A1N(n17), .Y(n59) );
  OAI2BB2X1M U69 ( .B0(n228), .B1(n17), .A0N(REG1[3]), .A1N(n17), .Y(n60) );
  OAI2BB2X1M U70 ( .B0(n224), .B1(n17), .A0N(REG1[4]), .A1N(n17), .Y(n61) );
  OAI2BB2X1M U71 ( .B0(n223), .B1(n17), .A0N(REG1[5]), .A1N(n17), .Y(n62) );
  OAI2BB2X1M U72 ( .B0(n222), .B1(n17), .A0N(REG1[6]), .A1N(n17), .Y(n63) );
  OAI2BB2X1M U73 ( .B0(n221), .B1(n17), .A0N(REG1[7]), .A1N(n17), .Y(n64) );
  OAI2BB2X1M U74 ( .B0(n225), .B1(n22), .A0N(\RegFile[4][0] ), .A1N(n22), .Y(
        n81) );
  OAI2BB2X1M U75 ( .B0(n226), .B1(n22), .A0N(\RegFile[4][1] ), .A1N(n22), .Y(
        n82) );
  OAI2BB2X1M U76 ( .B0(n227), .B1(n22), .A0N(\RegFile[4][2] ), .A1N(n22), .Y(
        n83) );
  OAI2BB2X1M U77 ( .B0(n228), .B1(n22), .A0N(\RegFile[4][3] ), .A1N(n22), .Y(
        n84) );
  OAI2BB2X1M U78 ( .B0(n224), .B1(n22), .A0N(\RegFile[4][4] ), .A1N(n22), .Y(
        n85) );
  OAI2BB2X1M U79 ( .B0(n223), .B1(n22), .A0N(\RegFile[4][5] ), .A1N(n22), .Y(
        n86) );
  OAI2BB2X1M U80 ( .B0(n222), .B1(n22), .A0N(\RegFile[4][6] ), .A1N(n22), .Y(
        n87) );
  OAI2BB2X1M U81 ( .B0(n221), .B1(n22), .A0N(\RegFile[4][7] ), .A1N(n22), .Y(
        n88) );
  OAI2BB2X1M U82 ( .B0(n225), .B1(n24), .A0N(\RegFile[5][0] ), .A1N(n24), .Y(
        n89) );
  OAI2BB2X1M U83 ( .B0(n226), .B1(n24), .A0N(\RegFile[5][1] ), .A1N(n24), .Y(
        n90) );
  OAI2BB2X1M U84 ( .B0(n227), .B1(n24), .A0N(\RegFile[5][2] ), .A1N(n24), .Y(
        n91) );
  OAI2BB2X1M U85 ( .B0(n228), .B1(n24), .A0N(\RegFile[5][3] ), .A1N(n24), .Y(
        n92) );
  OAI2BB2X1M U86 ( .B0(n224), .B1(n24), .A0N(\RegFile[5][4] ), .A1N(n24), .Y(
        n93) );
  OAI2BB2X1M U87 ( .B0(n223), .B1(n24), .A0N(\RegFile[5][5] ), .A1N(n24), .Y(
        n94) );
  OAI2BB2X1M U88 ( .B0(n222), .B1(n24), .A0N(\RegFile[5][6] ), .A1N(n24), .Y(
        n95) );
  OAI2BB2X1M U89 ( .B0(n221), .B1(n24), .A0N(\RegFile[5][7] ), .A1N(n24), .Y(
        n96) );
  OAI2BB2X1M U90 ( .B0(n225), .B1(n25), .A0N(\RegFile[6][0] ), .A1N(n25), .Y(
        n97) );
  OAI2BB2X1M U91 ( .B0(n226), .B1(n25), .A0N(\RegFile[6][1] ), .A1N(n25), .Y(
        n98) );
  OAI2BB2X1M U92 ( .B0(n227), .B1(n25), .A0N(\RegFile[6][2] ), .A1N(n25), .Y(
        n99) );
  OAI2BB2X1M U93 ( .B0(n228), .B1(n25), .A0N(\RegFile[6][3] ), .A1N(n25), .Y(
        n100) );
  OAI2BB2X1M U94 ( .B0(n224), .B1(n25), .A0N(\RegFile[6][4] ), .A1N(n25), .Y(
        n101) );
  OAI2BB2X1M U95 ( .B0(n223), .B1(n25), .A0N(\RegFile[6][5] ), .A1N(n25), .Y(
        n102) );
  OAI2BB2X1M U96 ( .B0(n222), .B1(n25), .A0N(\RegFile[6][6] ), .A1N(n25), .Y(
        n103) );
  OAI2BB2X1M U97 ( .B0(n221), .B1(n25), .A0N(\RegFile[6][7] ), .A1N(n25), .Y(
        n104) );
  OAI2BB2X1M U98 ( .B0(n225), .B1(n28), .A0N(\RegFile[7][0] ), .A1N(n28), .Y(
        n105) );
  OAI2BB2X1M U99 ( .B0(n226), .B1(n28), .A0N(\RegFile[7][1] ), .A1N(n28), .Y(
        n106) );
  OAI2BB2X1M U100 ( .B0(n227), .B1(n28), .A0N(\RegFile[7][2] ), .A1N(n28), .Y(
        n107) );
  OAI2BB2X1M U101 ( .B0(n228), .B1(n28), .A0N(\RegFile[7][3] ), .A1N(n28), .Y(
        n108) );
  OAI2BB2X1M U102 ( .B0(n224), .B1(n28), .A0N(\RegFile[7][4] ), .A1N(n28), .Y(
        n109) );
  OAI2BB2X1M U103 ( .B0(n223), .B1(n28), .A0N(\RegFile[7][5] ), .A1N(n28), .Y(
        n110) );
  OAI2BB2X1M U104 ( .B0(n222), .B1(n28), .A0N(\RegFile[7][6] ), .A1N(n28), .Y(
        n111) );
  OAI2BB2X1M U105 ( .B0(n221), .B1(n28), .A0N(\RegFile[7][7] ), .A1N(n28), .Y(
        n112) );
  OAI2BB2X1M U106 ( .B0(n225), .B1(n29), .A0N(\RegFile[8][0] ), .A1N(n29), .Y(
        n113) );
  OAI2BB2X1M U107 ( .B0(n226), .B1(n29), .A0N(\RegFile[8][1] ), .A1N(n29), .Y(
        n114) );
  OAI2BB2X1M U108 ( .B0(n227), .B1(n29), .A0N(\RegFile[8][2] ), .A1N(n29), .Y(
        n115) );
  OAI2BB2X1M U109 ( .B0(n228), .B1(n29), .A0N(\RegFile[8][3] ), .A1N(n29), .Y(
        n116) );
  OAI2BB2X1M U110 ( .B0(n224), .B1(n29), .A0N(\RegFile[8][4] ), .A1N(n29), .Y(
        n117) );
  OAI2BB2X1M U111 ( .B0(n223), .B1(n29), .A0N(\RegFile[8][5] ), .A1N(n29), .Y(
        n118) );
  OAI2BB2X1M U112 ( .B0(n222), .B1(n29), .A0N(\RegFile[8][6] ), .A1N(n29), .Y(
        n119) );
  OAI2BB2X1M U113 ( .B0(n221), .B1(n29), .A0N(\RegFile[8][7] ), .A1N(n29), .Y(
        n120) );
  OAI2BB2X1M U114 ( .B0(n225), .B1(n31), .A0N(\RegFile[9][0] ), .A1N(n31), .Y(
        n121) );
  OAI2BB2X1M U115 ( .B0(n226), .B1(n31), .A0N(\RegFile[9][1] ), .A1N(n31), .Y(
        n122) );
  OAI2BB2X1M U116 ( .B0(n227), .B1(n31), .A0N(\RegFile[9][2] ), .A1N(n31), .Y(
        n123) );
  OAI2BB2X1M U117 ( .B0(n228), .B1(n31), .A0N(\RegFile[9][3] ), .A1N(n31), .Y(
        n124) );
  OAI2BB2X1M U118 ( .B0(n224), .B1(n31), .A0N(\RegFile[9][4] ), .A1N(n31), .Y(
        n125) );
  OAI2BB2X1M U119 ( .B0(n223), .B1(n31), .A0N(\RegFile[9][5] ), .A1N(n31), .Y(
        n126) );
  OAI2BB2X1M U120 ( .B0(n222), .B1(n31), .A0N(\RegFile[9][6] ), .A1N(n31), .Y(
        n127) );
  OAI2BB2X1M U121 ( .B0(n221), .B1(n31), .A0N(\RegFile[9][7] ), .A1N(n31), .Y(
        n128) );
  OAI2BB2X1M U122 ( .B0(n225), .B1(n33), .A0N(\RegFile[10][0] ), .A1N(n33), 
        .Y(n129) );
  OAI2BB2X1M U123 ( .B0(n226), .B1(n33), .A0N(\RegFile[10][1] ), .A1N(n33), 
        .Y(n130) );
  OAI2BB2X1M U124 ( .B0(n227), .B1(n33), .A0N(\RegFile[10][2] ), .A1N(n33), 
        .Y(n131) );
  OAI2BB2X1M U125 ( .B0(n228), .B1(n33), .A0N(\RegFile[10][3] ), .A1N(n33), 
        .Y(n132) );
  OAI2BB2X1M U126 ( .B0(n224), .B1(n33), .A0N(\RegFile[10][4] ), .A1N(n33), 
        .Y(n133) );
  OAI2BB2X1M U127 ( .B0(n223), .B1(n33), .A0N(\RegFile[10][5] ), .A1N(n33), 
        .Y(n134) );
  OAI2BB2X1M U128 ( .B0(n222), .B1(n33), .A0N(\RegFile[10][6] ), .A1N(n33), 
        .Y(n135) );
  OAI2BB2X1M U129 ( .B0(n221), .B1(n33), .A0N(\RegFile[10][7] ), .A1N(n33), 
        .Y(n136) );
  OAI2BB2X1M U130 ( .B0(n225), .B1(n34), .A0N(\RegFile[11][0] ), .A1N(n34), 
        .Y(n137) );
  OAI2BB2X1M U131 ( .B0(n226), .B1(n34), .A0N(\RegFile[11][1] ), .A1N(n34), 
        .Y(n138) );
  OAI2BB2X1M U132 ( .B0(n227), .B1(n34), .A0N(\RegFile[11][2] ), .A1N(n34), 
        .Y(n139) );
  OAI2BB2X1M U133 ( .B0(n228), .B1(n34), .A0N(\RegFile[11][3] ), .A1N(n34), 
        .Y(n140) );
  OAI2BB2X1M U134 ( .B0(n224), .B1(n34), .A0N(\RegFile[11][4] ), .A1N(n34), 
        .Y(n141) );
  OAI2BB2X1M U135 ( .B0(n223), .B1(n34), .A0N(\RegFile[11][5] ), .A1N(n34), 
        .Y(n142) );
  OAI2BB2X1M U136 ( .B0(n222), .B1(n34), .A0N(\RegFile[11][6] ), .A1N(n34), 
        .Y(n143) );
  OAI2BB2X1M U137 ( .B0(n221), .B1(n34), .A0N(\RegFile[11][7] ), .A1N(n34), 
        .Y(n144) );
  OAI2BB2X1M U138 ( .B0(n225), .B1(n35), .A0N(\RegFile[12][0] ), .A1N(n35), 
        .Y(n145) );
  OAI2BB2X1M U139 ( .B0(n226), .B1(n35), .A0N(\RegFile[12][1] ), .A1N(n35), 
        .Y(n146) );
  OAI2BB2X1M U140 ( .B0(n227), .B1(n35), .A0N(\RegFile[12][2] ), .A1N(n35), 
        .Y(n147) );
  OAI2BB2X1M U141 ( .B0(n228), .B1(n35), .A0N(\RegFile[12][3] ), .A1N(n35), 
        .Y(n148) );
  OAI2BB2X1M U142 ( .B0(n224), .B1(n35), .A0N(\RegFile[12][4] ), .A1N(n35), 
        .Y(n149) );
  OAI2BB2X1M U143 ( .B0(n223), .B1(n35), .A0N(\RegFile[12][5] ), .A1N(n35), 
        .Y(n150) );
  OAI2BB2X1M U144 ( .B0(n222), .B1(n35), .A0N(\RegFile[12][6] ), .A1N(n35), 
        .Y(n151) );
  OAI2BB2X1M U145 ( .B0(n221), .B1(n35), .A0N(\RegFile[12][7] ), .A1N(n35), 
        .Y(n152) );
  OAI2BB2X1M U146 ( .B0(n225), .B1(n36), .A0N(\RegFile[13][0] ), .A1N(n36), 
        .Y(n153) );
  OAI2BB2X1M U147 ( .B0(n226), .B1(n36), .A0N(\RegFile[13][1] ), .A1N(n36), 
        .Y(n154) );
  OAI2BB2X1M U148 ( .B0(n227), .B1(n36), .A0N(\RegFile[13][2] ), .A1N(n36), 
        .Y(n155) );
  OAI2BB2X1M U149 ( .B0(n228), .B1(n36), .A0N(\RegFile[13][3] ), .A1N(n36), 
        .Y(n156) );
  OAI2BB2X1M U150 ( .B0(n224), .B1(n36), .A0N(\RegFile[13][4] ), .A1N(n36), 
        .Y(n157) );
  OAI2BB2X1M U151 ( .B0(n223), .B1(n36), .A0N(\RegFile[13][5] ), .A1N(n36), 
        .Y(n158) );
  OAI2BB2X1M U152 ( .B0(n222), .B1(n36), .A0N(\RegFile[13][6] ), .A1N(n36), 
        .Y(n159) );
  OAI2BB2X1M U153 ( .B0(n221), .B1(n36), .A0N(\RegFile[13][7] ), .A1N(n36), 
        .Y(n160) );
  OAI2BB2X1M U154 ( .B0(n225), .B1(n37), .A0N(\RegFile[14][0] ), .A1N(n37), 
        .Y(n161) );
  OAI2BB2X1M U155 ( .B0(n226), .B1(n37), .A0N(\RegFile[14][1] ), .A1N(n37), 
        .Y(n162) );
  OAI2BB2X1M U156 ( .B0(n227), .B1(n37), .A0N(\RegFile[14][2] ), .A1N(n37), 
        .Y(n163) );
  OAI2BB2X1M U157 ( .B0(n228), .B1(n37), .A0N(\RegFile[14][3] ), .A1N(n37), 
        .Y(n164) );
  OAI2BB2X1M U158 ( .B0(n224), .B1(n37), .A0N(\RegFile[14][4] ), .A1N(n37), 
        .Y(n165) );
  OAI2BB2X1M U159 ( .B0(n223), .B1(n37), .A0N(\RegFile[14][5] ), .A1N(n37), 
        .Y(n166) );
  OAI2BB2X1M U160 ( .B0(n222), .B1(n37), .A0N(\RegFile[14][6] ), .A1N(n37), 
        .Y(n167) );
  OAI2BB2X1M U161 ( .B0(n221), .B1(n37), .A0N(\RegFile[14][7] ), .A1N(n37), 
        .Y(n168) );
  OAI2BB2X1M U162 ( .B0(n225), .B1(n39), .A0N(\RegFile[15][0] ), .A1N(n39), 
        .Y(n169) );
  OAI2BB2X1M U163 ( .B0(n226), .B1(n39), .A0N(\RegFile[15][1] ), .A1N(n39), 
        .Y(n170) );
  OAI2BB2X1M U164 ( .B0(n227), .B1(n39), .A0N(\RegFile[15][2] ), .A1N(n39), 
        .Y(n171) );
  OAI2BB2X1M U165 ( .B0(n228), .B1(n39), .A0N(\RegFile[15][3] ), .A1N(n39), 
        .Y(n172) );
  OAI2BB2X1M U166 ( .B0(n224), .B1(n39), .A0N(\RegFile[15][4] ), .A1N(n39), 
        .Y(n173) );
  OAI2BB2X1M U167 ( .B0(n223), .B1(n39), .A0N(\RegFile[15][5] ), .A1N(n39), 
        .Y(n174) );
  OAI2BB2X1M U168 ( .B0(n222), .B1(n39), .A0N(\RegFile[15][6] ), .A1N(n39), 
        .Y(n175) );
  OAI2BB2X1M U169 ( .B0(n221), .B1(n39), .A0N(\RegFile[15][7] ), .A1N(n39), 
        .Y(n176) );
  OAI2BB2X1M U170 ( .B0(n226), .B1(n19), .A0N(REG2[1]), .A1N(n19), .Y(n66) );
  OAI2BB2X1M U171 ( .B0(n227), .B1(n19), .A0N(REG2[2]), .A1N(n19), .Y(n67) );
  OAI2BB2X1M U172 ( .B0(n228), .B1(n19), .A0N(REG2[3]), .A1N(n19), .Y(n68) );
  OAI2BB2X1M U173 ( .B0(n224), .B1(n19), .A0N(REG2[4]), .A1N(n19), .Y(n69) );
  OAI2BB2X1M U174 ( .B0(n223), .B1(n19), .A0N(REG2[5]), .A1N(n19), .Y(n70) );
  OAI2BB2X1M U175 ( .B0(n222), .B1(n19), .A0N(REG2[6]), .A1N(n19), .Y(n71) );
  OAI2BB2X1M U176 ( .B0(n225), .B1(n21), .A0N(REG3[0]), .A1N(n21), .Y(n73) );
  OAI2BB2X1M U177 ( .B0(n226), .B1(n21), .A0N(REG3[1]), .A1N(n21), .Y(n74) );
  OAI2BB2X1M U178 ( .B0(n227), .B1(n21), .A0N(REG3[2]), .A1N(n21), .Y(n75) );
  OAI2BB2X1M U179 ( .B0(n228), .B1(n21), .A0N(REG3[3]), .A1N(n21), .Y(n76) );
  OAI2BB2X1M U180 ( .B0(n224), .B1(n21), .A0N(REG3[4]), .A1N(n21), .Y(n77) );
  OAI2BB2X1M U181 ( .B0(n222), .B1(n21), .A0N(REG3[6]), .A1N(n21), .Y(n79) );
  OAI2BB2X1M U182 ( .B0(n221), .B1(n21), .A0N(REG3[7]), .A1N(n21), .Y(n80) );
  NOR2BX2M U183 ( .AN(n13), .B(N14), .Y(n27) );
  OAI2BB2X1M U184 ( .B0(n225), .B1(n19), .A0N(REG2[0]), .A1N(n19), .Y(n65) );
  OAI2BB2X1M U185 ( .B0(n221), .B1(n19), .A0N(REG2[7]), .A1N(n19), .Y(n72) );
  OAI2BB2X1M U186 ( .B0(n223), .B1(n21), .A0N(REG3[5]), .A1N(n21), .Y(n78) );
  MX4X1M U187 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n201), 
        .S1(N12), .Y(n8) );
  MX4X1M U188 ( .A(\RegFile[4][0] ), .B(\RegFile[5][0] ), .C(\RegFile[6][0] ), 
        .D(\RegFile[7][0] ), .S0(N11), .S1(N12), .Y(n3) );
  MX4X1M U189 ( .A(\RegFile[4][1] ), .B(\RegFile[5][1] ), .C(\RegFile[6][1] ), 
        .D(\RegFile[7][1] ), .S0(n201), .S1(N12), .Y(n7) );
  MX4X1M U190 ( .A(\RegFile[4][2] ), .B(\RegFile[5][2] ), .C(\RegFile[6][2] ), 
        .D(\RegFile[7][2] ), .S0(n201), .S1(n199), .Y(n11) );
  MX4X1M U191 ( .A(\RegFile[4][3] ), .B(\RegFile[5][3] ), .C(\RegFile[6][3] ), 
        .D(\RegFile[7][3] ), .S0(n201), .S1(n199), .Y(n180) );
  MX4X1M U192 ( .A(\RegFile[4][4] ), .B(\RegFile[5][4] ), .C(\RegFile[6][4] ), 
        .D(\RegFile[7][4] ), .S0(n201), .S1(n199), .Y(n184) );
  MX4X1M U193 ( .A(\RegFile[4][5] ), .B(\RegFile[5][5] ), .C(\RegFile[6][5] ), 
        .D(\RegFile[7][5] ), .S0(n202), .S1(n199), .Y(n188) );
  MX4X1M U194 ( .A(\RegFile[4][6] ), .B(\RegFile[5][6] ), .C(\RegFile[6][6] ), 
        .D(\RegFile[7][6] ), .S0(n202), .S1(N12), .Y(n192) );
  MX4X1M U195 ( .A(\RegFile[4][7] ), .B(\RegFile[5][7] ), .C(\RegFile[6][7] ), 
        .D(\RegFile[7][7] ), .S0(n202), .S1(N12), .Y(n196) );
  MX4X1M U196 ( .A(\RegFile[12][0] ), .B(\RegFile[13][0] ), .C(
        \RegFile[14][0] ), .D(\RegFile[15][0] ), .S0(n202), .S1(n199), .Y(n1)
         );
  MX4X1M U197 ( .A(\RegFile[12][2] ), .B(\RegFile[13][2] ), .C(
        \RegFile[14][2] ), .D(\RegFile[15][2] ), .S0(n201), .S1(n199), .Y(n9)
         );
  MX4X1M U198 ( .A(\RegFile[12][3] ), .B(\RegFile[13][3] ), .C(
        \RegFile[14][3] ), .D(\RegFile[15][3] ), .S0(n201), .S1(n199), .Y(n178) );
  MX4X1M U199 ( .A(\RegFile[12][4] ), .B(\RegFile[13][4] ), .C(
        \RegFile[14][4] ), .D(\RegFile[15][4] ), .S0(n201), .S1(n199), .Y(n182) );
  MX4X1M U200 ( .A(\RegFile[12][5] ), .B(\RegFile[13][5] ), .C(
        \RegFile[14][5] ), .D(\RegFile[15][5] ), .S0(n202), .S1(N12), .Y(n186)
         );
  MX4X1M U201 ( .A(\RegFile[12][6] ), .B(\RegFile[13][6] ), .C(
        \RegFile[14][6] ), .D(\RegFile[15][6] ), .S0(n202), .S1(N12), .Y(n190)
         );
  MX4X1M U202 ( .A(\RegFile[12][7] ), .B(\RegFile[13][7] ), .C(
        \RegFile[14][7] ), .D(\RegFile[15][7] ), .S0(n202), .S1(N12), .Y(n194)
         );
  OAI2BB1X2M U203 ( .A0N(RdData_Valid), .A1N(n13), .B0(n12), .Y(n48) );
  AND2X2M U204 ( .A(N14), .B(n13), .Y(n38) );
  AO22X1M U205 ( .A0(N43), .A1(n220), .B0(RdData[0]), .B1(n12), .Y(n40) );
  MX4X1M U206 ( .A(n4), .B(n2), .C(n3), .D(n1), .S0(N14), .S1(N13), .Y(N43) );
  MX4X1M U207 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(N11), 
        .S1(N12), .Y(n4) );
  MX4X1M U208 ( .A(\RegFile[8][0] ), .B(\RegFile[9][0] ), .C(\RegFile[10][0] ), 
        .D(\RegFile[11][0] ), .S0(N11), .S1(N12), .Y(n2) );
  AO22X1M U209 ( .A0(N42), .A1(n220), .B0(RdData[1]), .B1(n12), .Y(n41) );
  MX4X1M U210 ( .A(n8), .B(n6), .C(n7), .D(n5), .S0(N14), .S1(N13), .Y(N42) );
  MX4X1M U211 ( .A(\RegFile[8][1] ), .B(\RegFile[9][1] ), .C(\RegFile[10][1] ), 
        .D(\RegFile[11][1] ), .S0(N11), .S1(N12), .Y(n6) );
  MX4X1M U212 ( .A(\RegFile[12][1] ), .B(\RegFile[13][1] ), .C(
        \RegFile[14][1] ), .D(\RegFile[15][1] ), .S0(n201), .S1(N12), .Y(n5)
         );
  AO22X1M U213 ( .A0(N41), .A1(n220), .B0(RdData[2]), .B1(n12), .Y(n42) );
  MX4X1M U214 ( .A(n177), .B(n10), .C(n11), .D(n9), .S0(N14), .S1(N13), .Y(N41) );
  MX4X1M U215 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n201), 
        .S1(n199), .Y(n177) );
  MX4X1M U216 ( .A(\RegFile[8][2] ), .B(\RegFile[9][2] ), .C(\RegFile[10][2] ), 
        .D(\RegFile[11][2] ), .S0(n201), .S1(n199), .Y(n10) );
  AO22X1M U217 ( .A0(N40), .A1(n220), .B0(RdData[3]), .B1(n12), .Y(n43) );
  MX4X1M U218 ( .A(n181), .B(n179), .C(n180), .D(n178), .S0(N14), .S1(N13), 
        .Y(N40) );
  MX4X1M U219 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n201), 
        .S1(n199), .Y(n181) );
  MX4X1M U220 ( .A(\RegFile[8][3] ), .B(\RegFile[9][3] ), .C(\RegFile[10][3] ), 
        .D(\RegFile[11][3] ), .S0(n201), .S1(n199), .Y(n179) );
  AO22X1M U221 ( .A0(N39), .A1(n220), .B0(RdData[4]), .B1(n12), .Y(n44) );
  MX4X1M U222 ( .A(n185), .B(n183), .C(n184), .D(n182), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4X1M U223 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n202), 
        .S1(n199), .Y(n185) );
  MX4X1M U224 ( .A(\RegFile[8][4] ), .B(\RegFile[9][4] ), .C(\RegFile[10][4] ), 
        .D(\RegFile[11][4] ), .S0(n201), .S1(n199), .Y(n183) );
  AO22X1M U225 ( .A0(N38), .A1(n220), .B0(RdData[5]), .B1(n12), .Y(n45) );
  MX4X1M U226 ( .A(n189), .B(n187), .C(n188), .D(n186), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4X1M U227 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n202), 
        .S1(N12), .Y(n189) );
  MX4X1M U228 ( .A(\RegFile[8][5] ), .B(\RegFile[9][5] ), .C(\RegFile[10][5] ), 
        .D(\RegFile[11][5] ), .S0(n202), .S1(N12), .Y(n187) );
  AO22X1M U229 ( .A0(N37), .A1(n220), .B0(RdData[6]), .B1(n12), .Y(n46) );
  MX4X1M U230 ( .A(n193), .B(n191), .C(n192), .D(n190), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U231 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n202), 
        .S1(N12), .Y(n193) );
  MX4X1M U232 ( .A(\RegFile[8][6] ), .B(\RegFile[9][6] ), .C(\RegFile[10][6] ), 
        .D(\RegFile[11][6] ), .S0(n202), .S1(N12), .Y(n191) );
  AO22X1M U233 ( .A0(N36), .A1(n220), .B0(RdData[7]), .B1(n12), .Y(n47) );
  MX4X1M U234 ( .A(n197), .B(n195), .C(n196), .D(n194), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U235 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n202), 
        .S1(N12), .Y(n197) );
  MX4X1M U236 ( .A(\RegFile[8][7] ), .B(\RegFile[9][7] ), .C(\RegFile[10][7] ), 
        .D(\RegFile[11][7] ), .S0(n202), .S1(N12), .Y(n195) );
  INVX2M U237 ( .A(N11), .Y(n218) );
  INVX2M U238 ( .A(N12), .Y(n219) );
endmodule


module RST_SYNC_NUM_OF_STAGE2_0 ( clk, rst, sync_rst );
  input clk, rst;
  output sync_rst;
  wire   \reset_ff[0] ;

  DFFRQX2M \reset_ff_reg[1]  ( .D(\reset_ff[0] ), .CK(clk), .RN(rst), .Q(
        sync_rst) );
  DFFRQX2M \reset_ff_reg[0]  ( .D(1'b1), .CK(clk), .RN(rst), .Q(\reset_ff[0] )
         );
endmodule


module RST_SYNC_NUM_OF_STAGE2_1 ( clk, rst, sync_rst );
  input clk, rst;
  output sync_rst;
  wire   \reset_ff[0] ;

  DFFRQX2M \reset_ff_reg[1]  ( .D(\reset_ff[0] ), .CK(clk), .RN(rst), .Q(
        sync_rst) );
  DFFRQX2M \reset_ff_reg[0]  ( .D(1'b1), .CK(clk), .RN(rst), .Q(\reset_ff[0] )
         );
endmodule


module FIFO_MEM_CNTRL_ADDR_WIDTH4_DATA_WIDTH8 ( w_inc, full, w_clk, w_rst, 
        w_data, w_addr, r_addr, r_data );
  input [7:0] w_data;
  input [3:0] w_addr;
  input [3:0] r_addr;
  output [7:0] r_data;
  input w_inc, full, w_clk, w_rst;
  wire   N10, N11, N12, N13, \FIFO_MEM[15][7] , \FIFO_MEM[15][6] ,
         \FIFO_MEM[15][5] , \FIFO_MEM[15][4] , \FIFO_MEM[15][3] ,
         \FIFO_MEM[15][2] , \FIFO_MEM[15][1] , \FIFO_MEM[15][0] ,
         \FIFO_MEM[14][7] , \FIFO_MEM[14][6] , \FIFO_MEM[14][5] ,
         \FIFO_MEM[14][4] , \FIFO_MEM[14][3] , \FIFO_MEM[14][2] ,
         \FIFO_MEM[14][1] , \FIFO_MEM[14][0] , \FIFO_MEM[13][7] ,
         \FIFO_MEM[13][6] , \FIFO_MEM[13][5] , \FIFO_MEM[13][4] ,
         \FIFO_MEM[13][3] , \FIFO_MEM[13][2] , \FIFO_MEM[13][1] ,
         \FIFO_MEM[13][0] , \FIFO_MEM[12][7] , \FIFO_MEM[12][6] ,
         \FIFO_MEM[12][5] , \FIFO_MEM[12][4] , \FIFO_MEM[12][3] ,
         \FIFO_MEM[12][2] , \FIFO_MEM[12][1] , \FIFO_MEM[12][0] ,
         \FIFO_MEM[11][7] , \FIFO_MEM[11][6] , \FIFO_MEM[11][5] ,
         \FIFO_MEM[11][4] , \FIFO_MEM[11][3] , \FIFO_MEM[11][2] ,
         \FIFO_MEM[11][1] , \FIFO_MEM[11][0] , \FIFO_MEM[10][7] ,
         \FIFO_MEM[10][6] , \FIFO_MEM[10][5] , \FIFO_MEM[10][4] ,
         \FIFO_MEM[10][3] , \FIFO_MEM[10][2] , \FIFO_MEM[10][1] ,
         \FIFO_MEM[10][0] , \FIFO_MEM[9][7] , \FIFO_MEM[9][6] ,
         \FIFO_MEM[9][5] , \FIFO_MEM[9][4] , \FIFO_MEM[9][3] ,
         \FIFO_MEM[9][2] , \FIFO_MEM[9][1] , \FIFO_MEM[9][0] ,
         \FIFO_MEM[8][7] , \FIFO_MEM[8][6] , \FIFO_MEM[8][5] ,
         \FIFO_MEM[8][4] , \FIFO_MEM[8][3] , \FIFO_MEM[8][2] ,
         \FIFO_MEM[8][1] , \FIFO_MEM[8][0] , \FIFO_MEM[7][7] ,
         \FIFO_MEM[7][6] , \FIFO_MEM[7][5] , \FIFO_MEM[7][4] ,
         \FIFO_MEM[7][3] , \FIFO_MEM[7][2] , \FIFO_MEM[7][1] ,
         \FIFO_MEM[7][0] , \FIFO_MEM[6][7] , \FIFO_MEM[6][6] ,
         \FIFO_MEM[6][5] , \FIFO_MEM[6][4] , \FIFO_MEM[6][3] ,
         \FIFO_MEM[6][2] , \FIFO_MEM[6][1] , \FIFO_MEM[6][0] ,
         \FIFO_MEM[5][7] , \FIFO_MEM[5][6] , \FIFO_MEM[5][5] ,
         \FIFO_MEM[5][4] , \FIFO_MEM[5][3] , \FIFO_MEM[5][2] ,
         \FIFO_MEM[5][1] , \FIFO_MEM[5][0] , \FIFO_MEM[4][7] ,
         \FIFO_MEM[4][6] , \FIFO_MEM[4][5] , \FIFO_MEM[4][4] ,
         \FIFO_MEM[4][3] , \FIFO_MEM[4][2] , \FIFO_MEM[4][1] ,
         \FIFO_MEM[4][0] , \FIFO_MEM[3][7] , \FIFO_MEM[3][6] ,
         \FIFO_MEM[3][5] , \FIFO_MEM[3][4] , \FIFO_MEM[3][3] ,
         \FIFO_MEM[3][2] , \FIFO_MEM[3][1] , \FIFO_MEM[3][0] ,
         \FIFO_MEM[2][7] , \FIFO_MEM[2][6] , \FIFO_MEM[2][5] ,
         \FIFO_MEM[2][4] , \FIFO_MEM[2][3] , \FIFO_MEM[2][2] ,
         \FIFO_MEM[2][1] , \FIFO_MEM[2][0] , \FIFO_MEM[1][7] ,
         \FIFO_MEM[1][6] , \FIFO_MEM[1][5] , \FIFO_MEM[1][4] ,
         \FIFO_MEM[1][3] , \FIFO_MEM[1][2] , \FIFO_MEM[1][1] ,
         \FIFO_MEM[1][0] , \FIFO_MEM[0][7] , \FIFO_MEM[0][6] ,
         \FIFO_MEM[0][5] , \FIFO_MEM[0][4] , \FIFO_MEM[0][3] ,
         \FIFO_MEM[0][2] , \FIFO_MEM[0][1] , \FIFO_MEM[0][0] , n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218;
  assign N10 = r_addr[0];
  assign N11 = r_addr[1];
  assign N12 = r_addr[2];
  assign N13 = r_addr[3];

  DFFRQX2M \FIFO_MEM_reg[13][7]  ( .D(n149), .CK(w_clk), .RN(n195), .Q(
        \FIFO_MEM[13][7] ) );
  DFFRQX2M \FIFO_MEM_reg[13][6]  ( .D(n148), .CK(w_clk), .RN(n195), .Q(
        \FIFO_MEM[13][6] ) );
  DFFRQX2M \FIFO_MEM_reg[13][5]  ( .D(n147), .CK(w_clk), .RN(n195), .Q(
        \FIFO_MEM[13][5] ) );
  DFFRQX2M \FIFO_MEM_reg[13][4]  ( .D(n146), .CK(w_clk), .RN(n195), .Q(
        \FIFO_MEM[13][4] ) );
  DFFRQX2M \FIFO_MEM_reg[13][3]  ( .D(n145), .CK(w_clk), .RN(n195), .Q(
        \FIFO_MEM[13][3] ) );
  DFFRQX2M \FIFO_MEM_reg[13][2]  ( .D(n144), .CK(w_clk), .RN(n195), .Q(
        \FIFO_MEM[13][2] ) );
  DFFRQX2M \FIFO_MEM_reg[13][1]  ( .D(n143), .CK(w_clk), .RN(n195), .Q(
        \FIFO_MEM[13][1] ) );
  DFFRQX2M \FIFO_MEM_reg[13][0]  ( .D(n142), .CK(w_clk), .RN(n195), .Q(
        \FIFO_MEM[13][0] ) );
  DFFRQX2M \FIFO_MEM_reg[9][7]  ( .D(n117), .CK(w_clk), .RN(n197), .Q(
        \FIFO_MEM[9][7] ) );
  DFFRQX2M \FIFO_MEM_reg[9][6]  ( .D(n116), .CK(w_clk), .RN(n197), .Q(
        \FIFO_MEM[9][6] ) );
  DFFRQX2M \FIFO_MEM_reg[9][5]  ( .D(n115), .CK(w_clk), .RN(n197), .Q(
        \FIFO_MEM[9][5] ) );
  DFFRQX2M \FIFO_MEM_reg[9][4]  ( .D(n114), .CK(w_clk), .RN(n197), .Q(
        \FIFO_MEM[9][4] ) );
  DFFRQX2M \FIFO_MEM_reg[9][3]  ( .D(n113), .CK(w_clk), .RN(n198), .Q(
        \FIFO_MEM[9][3] ) );
  DFFRQX2M \FIFO_MEM_reg[9][2]  ( .D(n112), .CK(w_clk), .RN(n198), .Q(
        \FIFO_MEM[9][2] ) );
  DFFRQX2M \FIFO_MEM_reg[9][1]  ( .D(n111), .CK(w_clk), .RN(n198), .Q(
        \FIFO_MEM[9][1] ) );
  DFFRQX2M \FIFO_MEM_reg[9][0]  ( .D(n110), .CK(w_clk), .RN(n198), .Q(
        \FIFO_MEM[9][0] ) );
  DFFRQX2M \FIFO_MEM_reg[5][7]  ( .D(n85), .CK(w_clk), .RN(n200), .Q(
        \FIFO_MEM[5][7] ) );
  DFFRQX2M \FIFO_MEM_reg[5][6]  ( .D(n84), .CK(w_clk), .RN(n200), .Q(
        \FIFO_MEM[5][6] ) );
  DFFRQX2M \FIFO_MEM_reg[5][5]  ( .D(n83), .CK(w_clk), .RN(n200), .Q(
        \FIFO_MEM[5][5] ) );
  DFFRQX2M \FIFO_MEM_reg[5][4]  ( .D(n82), .CK(w_clk), .RN(n200), .Q(
        \FIFO_MEM[5][4] ) );
  DFFRQX2M \FIFO_MEM_reg[5][3]  ( .D(n81), .CK(w_clk), .RN(n200), .Q(
        \FIFO_MEM[5][3] ) );
  DFFRQX2M \FIFO_MEM_reg[5][2]  ( .D(n80), .CK(w_clk), .RN(n200), .Q(
        \FIFO_MEM[5][2] ) );
  DFFRQX2M \FIFO_MEM_reg[5][1]  ( .D(n79), .CK(w_clk), .RN(n200), .Q(
        \FIFO_MEM[5][1] ) );
  DFFRQX2M \FIFO_MEM_reg[5][0]  ( .D(n78), .CK(w_clk), .RN(n200), .Q(
        \FIFO_MEM[5][0] ) );
  DFFRQX2M \FIFO_MEM_reg[1][7]  ( .D(n53), .CK(w_clk), .RN(n202), .Q(
        \FIFO_MEM[1][7] ) );
  DFFRQX2M \FIFO_MEM_reg[1][6]  ( .D(n52), .CK(w_clk), .RN(n202), .Q(
        \FIFO_MEM[1][6] ) );
  DFFRQX2M \FIFO_MEM_reg[1][5]  ( .D(n51), .CK(w_clk), .RN(n202), .Q(
        \FIFO_MEM[1][5] ) );
  DFFRQX2M \FIFO_MEM_reg[1][4]  ( .D(n50), .CK(w_clk), .RN(n202), .Q(
        \FIFO_MEM[1][4] ) );
  DFFRQX2M \FIFO_MEM_reg[1][3]  ( .D(n49), .CK(w_clk), .RN(n202), .Q(
        \FIFO_MEM[1][3] ) );
  DFFRQX2M \FIFO_MEM_reg[1][2]  ( .D(n48), .CK(w_clk), .RN(n203), .Q(
        \FIFO_MEM[1][2] ) );
  DFFRQX2M \FIFO_MEM_reg[1][1]  ( .D(n47), .CK(w_clk), .RN(n203), .Q(
        \FIFO_MEM[1][1] ) );
  DFFRQX2M \FIFO_MEM_reg[1][0]  ( .D(n46), .CK(w_clk), .RN(n203), .Q(
        \FIFO_MEM[1][0] ) );
  DFFRQX2M \FIFO_MEM_reg[15][7]  ( .D(n165), .CK(w_clk), .RN(n194), .Q(
        \FIFO_MEM[15][7] ) );
  DFFRQX2M \FIFO_MEM_reg[15][6]  ( .D(n164), .CK(w_clk), .RN(n194), .Q(
        \FIFO_MEM[15][6] ) );
  DFFRQX2M \FIFO_MEM_reg[15][5]  ( .D(n163), .CK(w_clk), .RN(n194), .Q(
        \FIFO_MEM[15][5] ) );
  DFFRQX2M \FIFO_MEM_reg[15][4]  ( .D(n162), .CK(w_clk), .RN(n194), .Q(
        \FIFO_MEM[15][4] ) );
  DFFRQX2M \FIFO_MEM_reg[15][3]  ( .D(n161), .CK(w_clk), .RN(n194), .Q(
        \FIFO_MEM[15][3] ) );
  DFFRQX2M \FIFO_MEM_reg[15][2]  ( .D(n160), .CK(w_clk), .RN(n194), .Q(
        \FIFO_MEM[15][2] ) );
  DFFRQX2M \FIFO_MEM_reg[15][1]  ( .D(n159), .CK(w_clk), .RN(n194), .Q(
        \FIFO_MEM[15][1] ) );
  DFFRQX2M \FIFO_MEM_reg[15][0]  ( .D(n158), .CK(w_clk), .RN(n194), .Q(
        \FIFO_MEM[15][0] ) );
  DFFRQX2M \FIFO_MEM_reg[11][7]  ( .D(n133), .CK(w_clk), .RN(n196), .Q(
        \FIFO_MEM[11][7] ) );
  DFFRQX2M \FIFO_MEM_reg[11][6]  ( .D(n132), .CK(w_clk), .RN(n196), .Q(
        \FIFO_MEM[11][6] ) );
  DFFRQX2M \FIFO_MEM_reg[11][5]  ( .D(n131), .CK(w_clk), .RN(n196), .Q(
        \FIFO_MEM[11][5] ) );
  DFFRQX2M \FIFO_MEM_reg[11][4]  ( .D(n130), .CK(w_clk), .RN(n196), .Q(
        \FIFO_MEM[11][4] ) );
  DFFRQX2M \FIFO_MEM_reg[11][3]  ( .D(n129), .CK(w_clk), .RN(n196), .Q(
        \FIFO_MEM[11][3] ) );
  DFFRQX2M \FIFO_MEM_reg[11][2]  ( .D(n128), .CK(w_clk), .RN(n196), .Q(
        \FIFO_MEM[11][2] ) );
  DFFRQX2M \FIFO_MEM_reg[11][1]  ( .D(n127), .CK(w_clk), .RN(n196), .Q(
        \FIFO_MEM[11][1] ) );
  DFFRQX2M \FIFO_MEM_reg[11][0]  ( .D(n126), .CK(w_clk), .RN(n197), .Q(
        \FIFO_MEM[11][0] ) );
  DFFRQX2M \FIFO_MEM_reg[7][7]  ( .D(n101), .CK(w_clk), .RN(n198), .Q(
        \FIFO_MEM[7][7] ) );
  DFFRQX2M \FIFO_MEM_reg[7][6]  ( .D(n100), .CK(w_clk), .RN(n199), .Q(
        \FIFO_MEM[7][6] ) );
  DFFRQX2M \FIFO_MEM_reg[7][5]  ( .D(n99), .CK(w_clk), .RN(n199), .Q(
        \FIFO_MEM[7][5] ) );
  DFFRQX2M \FIFO_MEM_reg[7][4]  ( .D(n98), .CK(w_clk), .RN(n199), .Q(
        \FIFO_MEM[7][4] ) );
  DFFRQX2M \FIFO_MEM_reg[7][3]  ( .D(n97), .CK(w_clk), .RN(n199), .Q(
        \FIFO_MEM[7][3] ) );
  DFFRQX2M \FIFO_MEM_reg[7][2]  ( .D(n96), .CK(w_clk), .RN(n199), .Q(
        \FIFO_MEM[7][2] ) );
  DFFRQX2M \FIFO_MEM_reg[7][1]  ( .D(n95), .CK(w_clk), .RN(n199), .Q(
        \FIFO_MEM[7][1] ) );
  DFFRQX2M \FIFO_MEM_reg[7][0]  ( .D(n94), .CK(w_clk), .RN(n199), .Q(
        \FIFO_MEM[7][0] ) );
  DFFRQX2M \FIFO_MEM_reg[3][7]  ( .D(n69), .CK(w_clk), .RN(n201), .Q(
        \FIFO_MEM[3][7] ) );
  DFFRQX2M \FIFO_MEM_reg[3][6]  ( .D(n68), .CK(w_clk), .RN(n201), .Q(
        \FIFO_MEM[3][6] ) );
  DFFRQX2M \FIFO_MEM_reg[3][5]  ( .D(n67), .CK(w_clk), .RN(n201), .Q(
        \FIFO_MEM[3][5] ) );
  DFFRQX2M \FIFO_MEM_reg[3][4]  ( .D(n66), .CK(w_clk), .RN(n201), .Q(
        \FIFO_MEM[3][4] ) );
  DFFRQX2M \FIFO_MEM_reg[3][3]  ( .D(n65), .CK(w_clk), .RN(n201), .Q(
        \FIFO_MEM[3][3] ) );
  DFFRQX2M \FIFO_MEM_reg[3][2]  ( .D(n64), .CK(w_clk), .RN(n201), .Q(
        \FIFO_MEM[3][2] ) );
  DFFRQX2M \FIFO_MEM_reg[3][1]  ( .D(n63), .CK(w_clk), .RN(n201), .Q(
        \FIFO_MEM[3][1] ) );
  DFFRQX2M \FIFO_MEM_reg[3][0]  ( .D(n62), .CK(w_clk), .RN(n201), .Q(
        \FIFO_MEM[3][0] ) );
  DFFRQX2M \FIFO_MEM_reg[14][7]  ( .D(n157), .CK(w_clk), .RN(n194), .Q(
        \FIFO_MEM[14][7] ) );
  DFFRQX2M \FIFO_MEM_reg[14][6]  ( .D(n156), .CK(w_clk), .RN(n194), .Q(
        \FIFO_MEM[14][6] ) );
  DFFRQX2M \FIFO_MEM_reg[14][5]  ( .D(n155), .CK(w_clk), .RN(n194), .Q(
        \FIFO_MEM[14][5] ) );
  DFFRQX2M \FIFO_MEM_reg[14][4]  ( .D(n154), .CK(w_clk), .RN(n194), .Q(
        \FIFO_MEM[14][4] ) );
  DFFRQX2M \FIFO_MEM_reg[14][3]  ( .D(n153), .CK(w_clk), .RN(n194), .Q(
        \FIFO_MEM[14][3] ) );
  DFFRQX2M \FIFO_MEM_reg[14][2]  ( .D(n152), .CK(w_clk), .RN(n195), .Q(
        \FIFO_MEM[14][2] ) );
  DFFRQX2M \FIFO_MEM_reg[14][1]  ( .D(n151), .CK(w_clk), .RN(n195), .Q(
        \FIFO_MEM[14][1] ) );
  DFFRQX2M \FIFO_MEM_reg[14][0]  ( .D(n150), .CK(w_clk), .RN(n195), .Q(
        \FIFO_MEM[14][0] ) );
  DFFRQX2M \FIFO_MEM_reg[10][7]  ( .D(n125), .CK(w_clk), .RN(n197), .Q(
        \FIFO_MEM[10][7] ) );
  DFFRQX2M \FIFO_MEM_reg[10][6]  ( .D(n124), .CK(w_clk), .RN(n197), .Q(
        \FIFO_MEM[10][6] ) );
  DFFRQX2M \FIFO_MEM_reg[10][5]  ( .D(n123), .CK(w_clk), .RN(n197), .Q(
        \FIFO_MEM[10][5] ) );
  DFFRQX2M \FIFO_MEM_reg[10][4]  ( .D(n122), .CK(w_clk), .RN(n197), .Q(
        \FIFO_MEM[10][4] ) );
  DFFRQX2M \FIFO_MEM_reg[10][3]  ( .D(n121), .CK(w_clk), .RN(n197), .Q(
        \FIFO_MEM[10][3] ) );
  DFFRQX2M \FIFO_MEM_reg[10][2]  ( .D(n120), .CK(w_clk), .RN(n197), .Q(
        \FIFO_MEM[10][2] ) );
  DFFRQX2M \FIFO_MEM_reg[10][1]  ( .D(n119), .CK(w_clk), .RN(n197), .Q(
        \FIFO_MEM[10][1] ) );
  DFFRQX2M \FIFO_MEM_reg[10][0]  ( .D(n118), .CK(w_clk), .RN(n197), .Q(
        \FIFO_MEM[10][0] ) );
  DFFRQX2M \FIFO_MEM_reg[6][7]  ( .D(n93), .CK(w_clk), .RN(n199), .Q(
        \FIFO_MEM[6][7] ) );
  DFFRQX2M \FIFO_MEM_reg[6][6]  ( .D(n92), .CK(w_clk), .RN(n199), .Q(
        \FIFO_MEM[6][6] ) );
  DFFRQX2M \FIFO_MEM_reg[6][5]  ( .D(n91), .CK(w_clk), .RN(n199), .Q(
        \FIFO_MEM[6][5] ) );
  DFFRQX2M \FIFO_MEM_reg[6][4]  ( .D(n90), .CK(w_clk), .RN(n199), .Q(
        \FIFO_MEM[6][4] ) );
  DFFRQX2M \FIFO_MEM_reg[6][3]  ( .D(n89), .CK(w_clk), .RN(n199), .Q(
        \FIFO_MEM[6][3] ) );
  DFFRQX2M \FIFO_MEM_reg[6][2]  ( .D(n88), .CK(w_clk), .RN(n199), .Q(
        \FIFO_MEM[6][2] ) );
  DFFRQX2M \FIFO_MEM_reg[6][1]  ( .D(n87), .CK(w_clk), .RN(n200), .Q(
        \FIFO_MEM[6][1] ) );
  DFFRQX2M \FIFO_MEM_reg[6][0]  ( .D(n86), .CK(w_clk), .RN(n200), .Q(
        \FIFO_MEM[6][0] ) );
  DFFRQX2M \FIFO_MEM_reg[2][7]  ( .D(n61), .CK(w_clk), .RN(n202), .Q(
        \FIFO_MEM[2][7] ) );
  DFFRQX2M \FIFO_MEM_reg[2][6]  ( .D(n60), .CK(w_clk), .RN(n202), .Q(
        \FIFO_MEM[2][6] ) );
  DFFRQX2M \FIFO_MEM_reg[2][5]  ( .D(n59), .CK(w_clk), .RN(n202), .Q(
        \FIFO_MEM[2][5] ) );
  DFFRQX2M \FIFO_MEM_reg[2][4]  ( .D(n58), .CK(w_clk), .RN(n202), .Q(
        \FIFO_MEM[2][4] ) );
  DFFRQX2M \FIFO_MEM_reg[2][3]  ( .D(n57), .CK(w_clk), .RN(n202), .Q(
        \FIFO_MEM[2][3] ) );
  DFFRQX2M \FIFO_MEM_reg[2][2]  ( .D(n56), .CK(w_clk), .RN(n202), .Q(
        \FIFO_MEM[2][2] ) );
  DFFRQX2M \FIFO_MEM_reg[2][1]  ( .D(n55), .CK(w_clk), .RN(n202), .Q(
        \FIFO_MEM[2][1] ) );
  DFFRQX2M \FIFO_MEM_reg[2][0]  ( .D(n54), .CK(w_clk), .RN(n202), .Q(
        \FIFO_MEM[2][0] ) );
  DFFRQX2M \FIFO_MEM_reg[12][7]  ( .D(n141), .CK(w_clk), .RN(n195), .Q(
        \FIFO_MEM[12][7] ) );
  DFFRQX2M \FIFO_MEM_reg[12][6]  ( .D(n140), .CK(w_clk), .RN(n195), .Q(
        \FIFO_MEM[12][6] ) );
  DFFRQX2M \FIFO_MEM_reg[12][5]  ( .D(n139), .CK(w_clk), .RN(n196), .Q(
        \FIFO_MEM[12][5] ) );
  DFFRQX2M \FIFO_MEM_reg[12][4]  ( .D(n138), .CK(w_clk), .RN(n196), .Q(
        \FIFO_MEM[12][4] ) );
  DFFRQX2M \FIFO_MEM_reg[12][3]  ( .D(n137), .CK(w_clk), .RN(n196), .Q(
        \FIFO_MEM[12][3] ) );
  DFFRQX2M \FIFO_MEM_reg[12][2]  ( .D(n136), .CK(w_clk), .RN(n196), .Q(
        \FIFO_MEM[12][2] ) );
  DFFRQX2M \FIFO_MEM_reg[12][1]  ( .D(n135), .CK(w_clk), .RN(n196), .Q(
        \FIFO_MEM[12][1] ) );
  DFFRQX2M \FIFO_MEM_reg[12][0]  ( .D(n134), .CK(w_clk), .RN(n196), .Q(
        \FIFO_MEM[12][0] ) );
  DFFRQX2M \FIFO_MEM_reg[8][7]  ( .D(n109), .CK(w_clk), .RN(n198), .Q(
        \FIFO_MEM[8][7] ) );
  DFFRQX2M \FIFO_MEM_reg[8][6]  ( .D(n108), .CK(w_clk), .RN(n198), .Q(
        \FIFO_MEM[8][6] ) );
  DFFRQX2M \FIFO_MEM_reg[8][5]  ( .D(n107), .CK(w_clk), .RN(n198), .Q(
        \FIFO_MEM[8][5] ) );
  DFFRQX2M \FIFO_MEM_reg[8][4]  ( .D(n106), .CK(w_clk), .RN(n198), .Q(
        \FIFO_MEM[8][4] ) );
  DFFRQX2M \FIFO_MEM_reg[8][3]  ( .D(n105), .CK(w_clk), .RN(n198), .Q(
        \FIFO_MEM[8][3] ) );
  DFFRQX2M \FIFO_MEM_reg[8][2]  ( .D(n104), .CK(w_clk), .RN(n198), .Q(
        \FIFO_MEM[8][2] ) );
  DFFRQX2M \FIFO_MEM_reg[8][1]  ( .D(n103), .CK(w_clk), .RN(n198), .Q(
        \FIFO_MEM[8][1] ) );
  DFFRQX2M \FIFO_MEM_reg[8][0]  ( .D(n102), .CK(w_clk), .RN(n198), .Q(
        \FIFO_MEM[8][0] ) );
  DFFRQX2M \FIFO_MEM_reg[4][7]  ( .D(n77), .CK(w_clk), .RN(n200), .Q(
        \FIFO_MEM[4][7] ) );
  DFFRQX2M \FIFO_MEM_reg[4][6]  ( .D(n76), .CK(w_clk), .RN(n200), .Q(
        \FIFO_MEM[4][6] ) );
  DFFRQX2M \FIFO_MEM_reg[4][5]  ( .D(n75), .CK(w_clk), .RN(n200), .Q(
        \FIFO_MEM[4][5] ) );
  DFFRQX2M \FIFO_MEM_reg[4][4]  ( .D(n74), .CK(w_clk), .RN(n201), .Q(
        \FIFO_MEM[4][4] ) );
  DFFRQX2M \FIFO_MEM_reg[4][3]  ( .D(n73), .CK(w_clk), .RN(n201), .Q(
        \FIFO_MEM[4][3] ) );
  DFFRQX2M \FIFO_MEM_reg[4][2]  ( .D(n72), .CK(w_clk), .RN(n201), .Q(
        \FIFO_MEM[4][2] ) );
  DFFRQX2M \FIFO_MEM_reg[4][1]  ( .D(n71), .CK(w_clk), .RN(n201), .Q(
        \FIFO_MEM[4][1] ) );
  DFFRQX2M \FIFO_MEM_reg[4][0]  ( .D(n70), .CK(w_clk), .RN(n201), .Q(
        \FIFO_MEM[4][0] ) );
  DFFRQX2M \FIFO_MEM_reg[0][7]  ( .D(n45), .CK(w_clk), .RN(n203), .Q(
        \FIFO_MEM[0][7] ) );
  DFFRQX2M \FIFO_MEM_reg[0][6]  ( .D(n44), .CK(w_clk), .RN(n203), .Q(
        \FIFO_MEM[0][6] ) );
  DFFRQX2M \FIFO_MEM_reg[0][5]  ( .D(n43), .CK(w_clk), .RN(n203), .Q(
        \FIFO_MEM[0][5] ) );
  DFFRQX2M \FIFO_MEM_reg[0][4]  ( .D(n42), .CK(w_clk), .RN(n203), .Q(
        \FIFO_MEM[0][4] ) );
  DFFRQX2M \FIFO_MEM_reg[0][3]  ( .D(n41), .CK(w_clk), .RN(n203), .Q(
        \FIFO_MEM[0][3] ) );
  DFFRQX2M \FIFO_MEM_reg[0][2]  ( .D(n40), .CK(w_clk), .RN(n203), .Q(
        \FIFO_MEM[0][2] ) );
  DFFRQX2M \FIFO_MEM_reg[0][1]  ( .D(n39), .CK(w_clk), .RN(n203), .Q(
        \FIFO_MEM[0][1] ) );
  DFFRQX2M \FIFO_MEM_reg[0][0]  ( .D(n38), .CK(w_clk), .RN(n203), .Q(
        \FIFO_MEM[0][0] ) );
  NOR2X2M U2 ( .A(n218), .B(w_addr[2]), .Y(n17) );
  NOR2X2M U3 ( .A(w_addr[1]), .B(w_addr[2]), .Y(n12) );
  BUFX2M U4 ( .A(n204), .Y(n202) );
  BUFX2M U5 ( .A(n205), .Y(n201) );
  BUFX2M U6 ( .A(n205), .Y(n200) );
  BUFX2M U7 ( .A(n206), .Y(n199) );
  BUFX2M U8 ( .A(n206), .Y(n198) );
  BUFX2M U9 ( .A(n207), .Y(n197) );
  BUFX2M U10 ( .A(n207), .Y(n196) );
  BUFX2M U11 ( .A(n208), .Y(n195) );
  BUFX2M U12 ( .A(n208), .Y(n194) );
  BUFX2M U13 ( .A(n204), .Y(n203) );
  NOR2BX2M U14 ( .AN(w_inc), .B(full), .Y(n26) );
  INVX2M U15 ( .A(n189), .Y(n190) );
  BUFX2M U16 ( .A(w_rst), .Y(n204) );
  BUFX2M U17 ( .A(w_rst), .Y(n205) );
  BUFX2M U18 ( .A(w_rst), .Y(n206) );
  BUFX2M U19 ( .A(w_rst), .Y(n207) );
  BUFX2M U20 ( .A(w_rst), .Y(n208) );
  NAND2X2M U21 ( .A(n15), .B(n12), .Y(n14) );
  NAND2X2M U22 ( .A(n17), .B(n13), .Y(n16) );
  NAND2X2M U23 ( .A(n17), .B(n15), .Y(n18) );
  NAND2X2M U24 ( .A(n20), .B(n13), .Y(n19) );
  NAND2X2M U25 ( .A(n20), .B(n15), .Y(n21) );
  NAND2X2M U26 ( .A(n23), .B(n13), .Y(n22) );
  NAND2X2M U27 ( .A(n23), .B(n15), .Y(n25) );
  NAND2X2M U28 ( .A(n12), .B(n13), .Y(n11) );
  AND2X2M U29 ( .A(n24), .B(n217), .Y(n13) );
  INVX2M U30 ( .A(n191), .Y(n192) );
  BUFX2M U31 ( .A(n188), .Y(n189) );
  NAND2X2M U32 ( .A(n28), .B(n12), .Y(n27) );
  NAND2X2M U33 ( .A(n30), .B(n12), .Y(n29) );
  NAND2X2M U34 ( .A(n28), .B(n17), .Y(n31) );
  NAND2X2M U35 ( .A(n30), .B(n17), .Y(n32) );
  NAND2X2M U36 ( .A(n28), .B(n20), .Y(n33) );
  NAND2X2M U37 ( .A(n30), .B(n20), .Y(n34) );
  NAND2X2M U38 ( .A(n28), .B(n23), .Y(n35) );
  NAND2X2M U39 ( .A(n30), .B(n23), .Y(n37) );
  AND2X2M U40 ( .A(n36), .B(n217), .Y(n28) );
  OAI2BB2X1M U41 ( .B0(n11), .B1(n209), .A0N(\FIFO_MEM[0][0] ), .A1N(n11), .Y(
        n38) );
  OAI2BB2X1M U42 ( .B0(n11), .B1(n210), .A0N(\FIFO_MEM[0][1] ), .A1N(n11), .Y(
        n39) );
  OAI2BB2X1M U43 ( .B0(n11), .B1(n211), .A0N(\FIFO_MEM[0][2] ), .A1N(n11), .Y(
        n40) );
  OAI2BB2X1M U44 ( .B0(n11), .B1(n212), .A0N(\FIFO_MEM[0][3] ), .A1N(n11), .Y(
        n41) );
  OAI2BB2X1M U45 ( .B0(n11), .B1(n213), .A0N(\FIFO_MEM[0][4] ), .A1N(n11), .Y(
        n42) );
  OAI2BB2X1M U46 ( .B0(n11), .B1(n214), .A0N(\FIFO_MEM[0][5] ), .A1N(n11), .Y(
        n43) );
  OAI2BB2X1M U47 ( .B0(n11), .B1(n215), .A0N(\FIFO_MEM[0][6] ), .A1N(n11), .Y(
        n44) );
  OAI2BB2X1M U48 ( .B0(n11), .B1(n216), .A0N(\FIFO_MEM[0][7] ), .A1N(n11), .Y(
        n45) );
  OAI2BB2X1M U49 ( .B0(n209), .B1(n16), .A0N(\FIFO_MEM[2][0] ), .A1N(n16), .Y(
        n54) );
  OAI2BB2X1M U50 ( .B0(n210), .B1(n16), .A0N(\FIFO_MEM[2][1] ), .A1N(n16), .Y(
        n55) );
  OAI2BB2X1M U51 ( .B0(n211), .B1(n16), .A0N(\FIFO_MEM[2][2] ), .A1N(n16), .Y(
        n56) );
  OAI2BB2X1M U52 ( .B0(n212), .B1(n16), .A0N(\FIFO_MEM[2][3] ), .A1N(n16), .Y(
        n57) );
  OAI2BB2X1M U53 ( .B0(n213), .B1(n16), .A0N(\FIFO_MEM[2][4] ), .A1N(n16), .Y(
        n58) );
  OAI2BB2X1M U54 ( .B0(n214), .B1(n16), .A0N(\FIFO_MEM[2][5] ), .A1N(n16), .Y(
        n59) );
  OAI2BB2X1M U55 ( .B0(n215), .B1(n16), .A0N(\FIFO_MEM[2][6] ), .A1N(n16), .Y(
        n60) );
  OAI2BB2X1M U56 ( .B0(n216), .B1(n16), .A0N(\FIFO_MEM[2][7] ), .A1N(n16), .Y(
        n61) );
  OAI2BB2X1M U57 ( .B0(n209), .B1(n18), .A0N(\FIFO_MEM[3][0] ), .A1N(n18), .Y(
        n62) );
  OAI2BB2X1M U58 ( .B0(n210), .B1(n18), .A0N(\FIFO_MEM[3][1] ), .A1N(n18), .Y(
        n63) );
  OAI2BB2X1M U59 ( .B0(n211), .B1(n18), .A0N(\FIFO_MEM[3][2] ), .A1N(n18), .Y(
        n64) );
  OAI2BB2X1M U60 ( .B0(n212), .B1(n18), .A0N(\FIFO_MEM[3][3] ), .A1N(n18), .Y(
        n65) );
  OAI2BB2X1M U61 ( .B0(n213), .B1(n18), .A0N(\FIFO_MEM[3][4] ), .A1N(n18), .Y(
        n66) );
  OAI2BB2X1M U62 ( .B0(n214), .B1(n18), .A0N(\FIFO_MEM[3][5] ), .A1N(n18), .Y(
        n67) );
  OAI2BB2X1M U63 ( .B0(n215), .B1(n18), .A0N(\FIFO_MEM[3][6] ), .A1N(n18), .Y(
        n68) );
  OAI2BB2X1M U64 ( .B0(n216), .B1(n18), .A0N(\FIFO_MEM[3][7] ), .A1N(n18), .Y(
        n69) );
  OAI2BB2X1M U65 ( .B0(n209), .B1(n14), .A0N(\FIFO_MEM[1][0] ), .A1N(n14), .Y(
        n46) );
  OAI2BB2X1M U66 ( .B0(n210), .B1(n14), .A0N(\FIFO_MEM[1][1] ), .A1N(n14), .Y(
        n47) );
  OAI2BB2X1M U67 ( .B0(n211), .B1(n14), .A0N(\FIFO_MEM[1][2] ), .A1N(n14), .Y(
        n48) );
  OAI2BB2X1M U68 ( .B0(n212), .B1(n14), .A0N(\FIFO_MEM[1][3] ), .A1N(n14), .Y(
        n49) );
  OAI2BB2X1M U69 ( .B0(n213), .B1(n14), .A0N(\FIFO_MEM[1][4] ), .A1N(n14), .Y(
        n50) );
  OAI2BB2X1M U70 ( .B0(n214), .B1(n14), .A0N(\FIFO_MEM[1][5] ), .A1N(n14), .Y(
        n51) );
  OAI2BB2X1M U71 ( .B0(n215), .B1(n14), .A0N(\FIFO_MEM[1][6] ), .A1N(n14), .Y(
        n52) );
  OAI2BB2X1M U72 ( .B0(n216), .B1(n14), .A0N(\FIFO_MEM[1][7] ), .A1N(n14), .Y(
        n53) );
  OAI2BB2X1M U73 ( .B0(n209), .B1(n19), .A0N(\FIFO_MEM[4][0] ), .A1N(n19), .Y(
        n70) );
  OAI2BB2X1M U74 ( .B0(n210), .B1(n19), .A0N(\FIFO_MEM[4][1] ), .A1N(n19), .Y(
        n71) );
  OAI2BB2X1M U75 ( .B0(n211), .B1(n19), .A0N(\FIFO_MEM[4][2] ), .A1N(n19), .Y(
        n72) );
  OAI2BB2X1M U76 ( .B0(n212), .B1(n19), .A0N(\FIFO_MEM[4][3] ), .A1N(n19), .Y(
        n73) );
  OAI2BB2X1M U77 ( .B0(n213), .B1(n19), .A0N(\FIFO_MEM[4][4] ), .A1N(n19), .Y(
        n74) );
  OAI2BB2X1M U78 ( .B0(n214), .B1(n19), .A0N(\FIFO_MEM[4][5] ), .A1N(n19), .Y(
        n75) );
  OAI2BB2X1M U79 ( .B0(n215), .B1(n19), .A0N(\FIFO_MEM[4][6] ), .A1N(n19), .Y(
        n76) );
  OAI2BB2X1M U80 ( .B0(n216), .B1(n19), .A0N(\FIFO_MEM[4][7] ), .A1N(n19), .Y(
        n77) );
  OAI2BB2X1M U81 ( .B0(n209), .B1(n21), .A0N(\FIFO_MEM[5][0] ), .A1N(n21), .Y(
        n78) );
  OAI2BB2X1M U82 ( .B0(n210), .B1(n21), .A0N(\FIFO_MEM[5][1] ), .A1N(n21), .Y(
        n79) );
  OAI2BB2X1M U83 ( .B0(n211), .B1(n21), .A0N(\FIFO_MEM[5][2] ), .A1N(n21), .Y(
        n80) );
  OAI2BB2X1M U84 ( .B0(n212), .B1(n21), .A0N(\FIFO_MEM[5][3] ), .A1N(n21), .Y(
        n81) );
  OAI2BB2X1M U85 ( .B0(n213), .B1(n21), .A0N(\FIFO_MEM[5][4] ), .A1N(n21), .Y(
        n82) );
  OAI2BB2X1M U86 ( .B0(n214), .B1(n21), .A0N(\FIFO_MEM[5][5] ), .A1N(n21), .Y(
        n83) );
  OAI2BB2X1M U87 ( .B0(n215), .B1(n21), .A0N(\FIFO_MEM[5][6] ), .A1N(n21), .Y(
        n84) );
  OAI2BB2X1M U88 ( .B0(n216), .B1(n21), .A0N(\FIFO_MEM[5][7] ), .A1N(n21), .Y(
        n85) );
  OAI2BB2X1M U89 ( .B0(n209), .B1(n22), .A0N(\FIFO_MEM[6][0] ), .A1N(n22), .Y(
        n86) );
  OAI2BB2X1M U90 ( .B0(n210), .B1(n22), .A0N(\FIFO_MEM[6][1] ), .A1N(n22), .Y(
        n87) );
  OAI2BB2X1M U91 ( .B0(n211), .B1(n22), .A0N(\FIFO_MEM[6][2] ), .A1N(n22), .Y(
        n88) );
  OAI2BB2X1M U92 ( .B0(n212), .B1(n22), .A0N(\FIFO_MEM[6][3] ), .A1N(n22), .Y(
        n89) );
  OAI2BB2X1M U93 ( .B0(n213), .B1(n22), .A0N(\FIFO_MEM[6][4] ), .A1N(n22), .Y(
        n90) );
  OAI2BB2X1M U94 ( .B0(n214), .B1(n22), .A0N(\FIFO_MEM[6][5] ), .A1N(n22), .Y(
        n91) );
  OAI2BB2X1M U95 ( .B0(n215), .B1(n22), .A0N(\FIFO_MEM[6][6] ), .A1N(n22), .Y(
        n92) );
  OAI2BB2X1M U96 ( .B0(n216), .B1(n22), .A0N(\FIFO_MEM[6][7] ), .A1N(n22), .Y(
        n93) );
  OAI2BB2X1M U97 ( .B0(n209), .B1(n25), .A0N(\FIFO_MEM[7][0] ), .A1N(n25), .Y(
        n94) );
  OAI2BB2X1M U98 ( .B0(n210), .B1(n25), .A0N(\FIFO_MEM[7][1] ), .A1N(n25), .Y(
        n95) );
  OAI2BB2X1M U99 ( .B0(n211), .B1(n25), .A0N(\FIFO_MEM[7][2] ), .A1N(n25), .Y(
        n96) );
  OAI2BB2X1M U100 ( .B0(n212), .B1(n25), .A0N(\FIFO_MEM[7][3] ), .A1N(n25), 
        .Y(n97) );
  OAI2BB2X1M U101 ( .B0(n213), .B1(n25), .A0N(\FIFO_MEM[7][4] ), .A1N(n25), 
        .Y(n98) );
  OAI2BB2X1M U102 ( .B0(n214), .B1(n25), .A0N(\FIFO_MEM[7][5] ), .A1N(n25), 
        .Y(n99) );
  OAI2BB2X1M U103 ( .B0(n215), .B1(n25), .A0N(\FIFO_MEM[7][6] ), .A1N(n25), 
        .Y(n100) );
  OAI2BB2X1M U104 ( .B0(n216), .B1(n25), .A0N(\FIFO_MEM[7][7] ), .A1N(n25), 
        .Y(n101) );
  AND2X2M U105 ( .A(n24), .B(w_addr[0]), .Y(n15) );
  NOR2BX2M U106 ( .AN(n26), .B(w_addr[3]), .Y(n24) );
  INVX2M U107 ( .A(w_data[0]), .Y(n209) );
  INVX2M U108 ( .A(w_data[1]), .Y(n210) );
  INVX2M U109 ( .A(w_data[2]), .Y(n211) );
  INVX2M U110 ( .A(w_data[3]), .Y(n212) );
  INVX2M U111 ( .A(w_data[4]), .Y(n213) );
  INVX2M U112 ( .A(w_data[5]), .Y(n214) );
  INVX2M U113 ( .A(w_data[6]), .Y(n215) );
  INVX2M U114 ( .A(w_data[7]), .Y(n216) );
  AND2X2M U115 ( .A(w_addr[2]), .B(n218), .Y(n20) );
  AND2X2M U116 ( .A(w_addr[2]), .B(w_addr[1]), .Y(n23) );
  INVX2M U117 ( .A(w_addr[1]), .Y(n218) );
  INVX2M U118 ( .A(w_addr[0]), .Y(n217) );
  OAI2BB2X1M U119 ( .B0(n209), .B1(n27), .A0N(\FIFO_MEM[8][0] ), .A1N(n27), 
        .Y(n102) );
  OAI2BB2X1M U120 ( .B0(n210), .B1(n27), .A0N(\FIFO_MEM[8][1] ), .A1N(n27), 
        .Y(n103) );
  OAI2BB2X1M U121 ( .B0(n211), .B1(n27), .A0N(\FIFO_MEM[8][2] ), .A1N(n27), 
        .Y(n104) );
  OAI2BB2X1M U122 ( .B0(n212), .B1(n27), .A0N(\FIFO_MEM[8][3] ), .A1N(n27), 
        .Y(n105) );
  OAI2BB2X1M U123 ( .B0(n213), .B1(n27), .A0N(\FIFO_MEM[8][4] ), .A1N(n27), 
        .Y(n106) );
  OAI2BB2X1M U124 ( .B0(n214), .B1(n27), .A0N(\FIFO_MEM[8][5] ), .A1N(n27), 
        .Y(n107) );
  OAI2BB2X1M U125 ( .B0(n215), .B1(n27), .A0N(\FIFO_MEM[8][6] ), .A1N(n27), 
        .Y(n108) );
  OAI2BB2X1M U126 ( .B0(n216), .B1(n27), .A0N(\FIFO_MEM[8][7] ), .A1N(n27), 
        .Y(n109) );
  OAI2BB2X1M U127 ( .B0(n209), .B1(n29), .A0N(\FIFO_MEM[9][0] ), .A1N(n29), 
        .Y(n110) );
  OAI2BB2X1M U128 ( .B0(n210), .B1(n29), .A0N(\FIFO_MEM[9][1] ), .A1N(n29), 
        .Y(n111) );
  OAI2BB2X1M U129 ( .B0(n211), .B1(n29), .A0N(\FIFO_MEM[9][2] ), .A1N(n29), 
        .Y(n112) );
  OAI2BB2X1M U130 ( .B0(n212), .B1(n29), .A0N(\FIFO_MEM[9][3] ), .A1N(n29), 
        .Y(n113) );
  OAI2BB2X1M U131 ( .B0(n213), .B1(n29), .A0N(\FIFO_MEM[9][4] ), .A1N(n29), 
        .Y(n114) );
  OAI2BB2X1M U132 ( .B0(n214), .B1(n29), .A0N(\FIFO_MEM[9][5] ), .A1N(n29), 
        .Y(n115) );
  OAI2BB2X1M U133 ( .B0(n215), .B1(n29), .A0N(\FIFO_MEM[9][6] ), .A1N(n29), 
        .Y(n116) );
  OAI2BB2X1M U134 ( .B0(n216), .B1(n29), .A0N(\FIFO_MEM[9][7] ), .A1N(n29), 
        .Y(n117) );
  OAI2BB2X1M U135 ( .B0(n209), .B1(n31), .A0N(\FIFO_MEM[10][0] ), .A1N(n31), 
        .Y(n118) );
  OAI2BB2X1M U136 ( .B0(n210), .B1(n31), .A0N(\FIFO_MEM[10][1] ), .A1N(n31), 
        .Y(n119) );
  OAI2BB2X1M U137 ( .B0(n211), .B1(n31), .A0N(\FIFO_MEM[10][2] ), .A1N(n31), 
        .Y(n120) );
  OAI2BB2X1M U138 ( .B0(n212), .B1(n31), .A0N(\FIFO_MEM[10][3] ), .A1N(n31), 
        .Y(n121) );
  OAI2BB2X1M U139 ( .B0(n213), .B1(n31), .A0N(\FIFO_MEM[10][4] ), .A1N(n31), 
        .Y(n122) );
  OAI2BB2X1M U140 ( .B0(n214), .B1(n31), .A0N(\FIFO_MEM[10][5] ), .A1N(n31), 
        .Y(n123) );
  OAI2BB2X1M U141 ( .B0(n215), .B1(n31), .A0N(\FIFO_MEM[10][6] ), .A1N(n31), 
        .Y(n124) );
  OAI2BB2X1M U142 ( .B0(n216), .B1(n31), .A0N(\FIFO_MEM[10][7] ), .A1N(n31), 
        .Y(n125) );
  OAI2BB2X1M U143 ( .B0(n209), .B1(n32), .A0N(\FIFO_MEM[11][0] ), .A1N(n32), 
        .Y(n126) );
  OAI2BB2X1M U144 ( .B0(n210), .B1(n32), .A0N(\FIFO_MEM[11][1] ), .A1N(n32), 
        .Y(n127) );
  OAI2BB2X1M U145 ( .B0(n211), .B1(n32), .A0N(\FIFO_MEM[11][2] ), .A1N(n32), 
        .Y(n128) );
  OAI2BB2X1M U146 ( .B0(n212), .B1(n32), .A0N(\FIFO_MEM[11][3] ), .A1N(n32), 
        .Y(n129) );
  OAI2BB2X1M U147 ( .B0(n213), .B1(n32), .A0N(\FIFO_MEM[11][4] ), .A1N(n32), 
        .Y(n130) );
  OAI2BB2X1M U148 ( .B0(n214), .B1(n32), .A0N(\FIFO_MEM[11][5] ), .A1N(n32), 
        .Y(n131) );
  OAI2BB2X1M U149 ( .B0(n215), .B1(n32), .A0N(\FIFO_MEM[11][6] ), .A1N(n32), 
        .Y(n132) );
  OAI2BB2X1M U150 ( .B0(n216), .B1(n32), .A0N(\FIFO_MEM[11][7] ), .A1N(n32), 
        .Y(n133) );
  OAI2BB2X1M U151 ( .B0(n209), .B1(n33), .A0N(\FIFO_MEM[12][0] ), .A1N(n33), 
        .Y(n134) );
  OAI2BB2X1M U152 ( .B0(n210), .B1(n33), .A0N(\FIFO_MEM[12][1] ), .A1N(n33), 
        .Y(n135) );
  OAI2BB2X1M U153 ( .B0(n211), .B1(n33), .A0N(\FIFO_MEM[12][2] ), .A1N(n33), 
        .Y(n136) );
  OAI2BB2X1M U154 ( .B0(n212), .B1(n33), .A0N(\FIFO_MEM[12][3] ), .A1N(n33), 
        .Y(n137) );
  OAI2BB2X1M U155 ( .B0(n213), .B1(n33), .A0N(\FIFO_MEM[12][4] ), .A1N(n33), 
        .Y(n138) );
  OAI2BB2X1M U156 ( .B0(n214), .B1(n33), .A0N(\FIFO_MEM[12][5] ), .A1N(n33), 
        .Y(n139) );
  OAI2BB2X1M U157 ( .B0(n215), .B1(n33), .A0N(\FIFO_MEM[12][6] ), .A1N(n33), 
        .Y(n140) );
  OAI2BB2X1M U158 ( .B0(n216), .B1(n33), .A0N(\FIFO_MEM[12][7] ), .A1N(n33), 
        .Y(n141) );
  OAI2BB2X1M U159 ( .B0(n209), .B1(n34), .A0N(\FIFO_MEM[13][0] ), .A1N(n34), 
        .Y(n142) );
  OAI2BB2X1M U160 ( .B0(n210), .B1(n34), .A0N(\FIFO_MEM[13][1] ), .A1N(n34), 
        .Y(n143) );
  OAI2BB2X1M U161 ( .B0(n211), .B1(n34), .A0N(\FIFO_MEM[13][2] ), .A1N(n34), 
        .Y(n144) );
  OAI2BB2X1M U162 ( .B0(n212), .B1(n34), .A0N(\FIFO_MEM[13][3] ), .A1N(n34), 
        .Y(n145) );
  OAI2BB2X1M U163 ( .B0(n213), .B1(n34), .A0N(\FIFO_MEM[13][4] ), .A1N(n34), 
        .Y(n146) );
  OAI2BB2X1M U164 ( .B0(n214), .B1(n34), .A0N(\FIFO_MEM[13][5] ), .A1N(n34), 
        .Y(n147) );
  OAI2BB2X1M U165 ( .B0(n215), .B1(n34), .A0N(\FIFO_MEM[13][6] ), .A1N(n34), 
        .Y(n148) );
  OAI2BB2X1M U166 ( .B0(n216), .B1(n34), .A0N(\FIFO_MEM[13][7] ), .A1N(n34), 
        .Y(n149) );
  OAI2BB2X1M U167 ( .B0(n209), .B1(n35), .A0N(\FIFO_MEM[14][0] ), .A1N(n35), 
        .Y(n150) );
  OAI2BB2X1M U168 ( .B0(n210), .B1(n35), .A0N(\FIFO_MEM[14][1] ), .A1N(n35), 
        .Y(n151) );
  OAI2BB2X1M U169 ( .B0(n211), .B1(n35), .A0N(\FIFO_MEM[14][2] ), .A1N(n35), 
        .Y(n152) );
  OAI2BB2X1M U170 ( .B0(n212), .B1(n35), .A0N(\FIFO_MEM[14][3] ), .A1N(n35), 
        .Y(n153) );
  OAI2BB2X1M U171 ( .B0(n213), .B1(n35), .A0N(\FIFO_MEM[14][4] ), .A1N(n35), 
        .Y(n154) );
  OAI2BB2X1M U172 ( .B0(n214), .B1(n35), .A0N(\FIFO_MEM[14][5] ), .A1N(n35), 
        .Y(n155) );
  OAI2BB2X1M U173 ( .B0(n215), .B1(n35), .A0N(\FIFO_MEM[14][6] ), .A1N(n35), 
        .Y(n156) );
  OAI2BB2X1M U174 ( .B0(n216), .B1(n35), .A0N(\FIFO_MEM[14][7] ), .A1N(n35), 
        .Y(n157) );
  OAI2BB2X1M U175 ( .B0(n209), .B1(n37), .A0N(\FIFO_MEM[15][0] ), .A1N(n37), 
        .Y(n158) );
  OAI2BB2X1M U176 ( .B0(n210), .B1(n37), .A0N(\FIFO_MEM[15][1] ), .A1N(n37), 
        .Y(n159) );
  OAI2BB2X1M U177 ( .B0(n211), .B1(n37), .A0N(\FIFO_MEM[15][2] ), .A1N(n37), 
        .Y(n160) );
  OAI2BB2X1M U178 ( .B0(n212), .B1(n37), .A0N(\FIFO_MEM[15][3] ), .A1N(n37), 
        .Y(n161) );
  OAI2BB2X1M U179 ( .B0(n213), .B1(n37), .A0N(\FIFO_MEM[15][4] ), .A1N(n37), 
        .Y(n162) );
  OAI2BB2X1M U180 ( .B0(n214), .B1(n37), .A0N(\FIFO_MEM[15][5] ), .A1N(n37), 
        .Y(n163) );
  OAI2BB2X1M U181 ( .B0(n215), .B1(n37), .A0N(\FIFO_MEM[15][6] ), .A1N(n37), 
        .Y(n164) );
  OAI2BB2X1M U182 ( .B0(n216), .B1(n37), .A0N(\FIFO_MEM[15][7] ), .A1N(n37), 
        .Y(n165) );
  MX4X1M U183 ( .A(\FIFO_MEM[0][0] ), .B(\FIFO_MEM[1][0] ), .C(
        \FIFO_MEM[2][0] ), .D(\FIFO_MEM[3][0] ), .S0(n193), .S1(N11), .Y(n4)
         );
  MX4X1M U184 ( .A(\FIFO_MEM[0][1] ), .B(\FIFO_MEM[1][1] ), .C(
        \FIFO_MEM[2][1] ), .D(\FIFO_MEM[3][1] ), .S0(N10), .S1(N11), .Y(n8) );
  MX4X1M U185 ( .A(\FIFO_MEM[0][2] ), .B(\FIFO_MEM[1][2] ), .C(
        \FIFO_MEM[2][2] ), .D(\FIFO_MEM[3][2] ), .S0(N10), .S1(n190), .Y(n167)
         );
  MX4X1M U186 ( .A(\FIFO_MEM[0][3] ), .B(\FIFO_MEM[1][3] ), .C(
        \FIFO_MEM[2][3] ), .D(\FIFO_MEM[3][3] ), .S0(N10), .S1(n190), .Y(n171)
         );
  MX4X1M U187 ( .A(\FIFO_MEM[0][4] ), .B(\FIFO_MEM[1][4] ), .C(
        \FIFO_MEM[2][4] ), .D(\FIFO_MEM[3][4] ), .S0(n192), .S1(n190), .Y(n175) );
  MX4X1M U188 ( .A(\FIFO_MEM[0][5] ), .B(\FIFO_MEM[1][5] ), .C(
        \FIFO_MEM[2][5] ), .D(\FIFO_MEM[3][5] ), .S0(n192), .S1(n190), .Y(n179) );
  MX4X1M U189 ( .A(\FIFO_MEM[0][6] ), .B(\FIFO_MEM[1][6] ), .C(
        \FIFO_MEM[2][6] ), .D(\FIFO_MEM[3][6] ), .S0(n192), .S1(N11), .Y(n183)
         );
  MX4X1M U190 ( .A(\FIFO_MEM[0][7] ), .B(\FIFO_MEM[1][7] ), .C(
        \FIFO_MEM[2][7] ), .D(\FIFO_MEM[3][7] ), .S0(n192), .S1(n190), .Y(n187) );
  MX4X1M U191 ( .A(n4), .B(n2), .C(n3), .D(n1), .S0(N13), .S1(N12), .Y(
        r_data[0]) );
  MX4X1M U192 ( .A(\FIFO_MEM[8][0] ), .B(\FIFO_MEM[9][0] ), .C(
        \FIFO_MEM[10][0] ), .D(\FIFO_MEM[11][0] ), .S0(n193), .S1(N11), .Y(n2)
         );
  MX4X1M U193 ( .A(\FIFO_MEM[12][0] ), .B(\FIFO_MEM[13][0] ), .C(
        \FIFO_MEM[14][0] ), .D(\FIFO_MEM[15][0] ), .S0(N10), .S1(N11), .Y(n1)
         );
  MX4X1M U194 ( .A(\FIFO_MEM[4][0] ), .B(\FIFO_MEM[5][0] ), .C(
        \FIFO_MEM[6][0] ), .D(\FIFO_MEM[7][0] ), .S0(N10), .S1(N11), .Y(n3) );
  MX4X1M U195 ( .A(n8), .B(n6), .C(n7), .D(n5), .S0(N13), .S1(N12), .Y(
        r_data[1]) );
  MX4X1M U196 ( .A(\FIFO_MEM[8][1] ), .B(\FIFO_MEM[9][1] ), .C(
        \FIFO_MEM[10][1] ), .D(\FIFO_MEM[11][1] ), .S0(N10), .S1(N11), .Y(n6)
         );
  MX4X1M U197 ( .A(\FIFO_MEM[12][1] ), .B(\FIFO_MEM[13][1] ), .C(
        \FIFO_MEM[14][1] ), .D(\FIFO_MEM[15][1] ), .S0(N10), .S1(N11), .Y(n5)
         );
  MX4X1M U198 ( .A(\FIFO_MEM[4][1] ), .B(\FIFO_MEM[5][1] ), .C(
        \FIFO_MEM[6][1] ), .D(\FIFO_MEM[7][1] ), .S0(n193), .S1(N11), .Y(n7)
         );
  MX4X1M U199 ( .A(n167), .B(n10), .C(n166), .D(n9), .S0(N13), .S1(N12), .Y(
        r_data[2]) );
  MX4X1M U200 ( .A(\FIFO_MEM[8][2] ), .B(\FIFO_MEM[9][2] ), .C(
        \FIFO_MEM[10][2] ), .D(\FIFO_MEM[11][2] ), .S0(n193), .S1(n190), .Y(
        n10) );
  MX4X1M U201 ( .A(\FIFO_MEM[12][2] ), .B(\FIFO_MEM[13][2] ), .C(
        \FIFO_MEM[14][2] ), .D(\FIFO_MEM[15][2] ), .S0(n193), .S1(n190), .Y(n9) );
  MX4X1M U202 ( .A(\FIFO_MEM[4][2] ), .B(\FIFO_MEM[5][2] ), .C(
        \FIFO_MEM[6][2] ), .D(\FIFO_MEM[7][2] ), .S0(n193), .S1(n190), .Y(n166) );
  MX4X1M U203 ( .A(n171), .B(n169), .C(n170), .D(n168), .S0(N13), .S1(N12), 
        .Y(r_data[3]) );
  MX4X1M U204 ( .A(\FIFO_MEM[8][3] ), .B(\FIFO_MEM[9][3] ), .C(
        \FIFO_MEM[10][3] ), .D(\FIFO_MEM[11][3] ), .S0(n193), .S1(n190), .Y(
        n169) );
  MX4X1M U205 ( .A(\FIFO_MEM[12][3] ), .B(\FIFO_MEM[13][3] ), .C(
        \FIFO_MEM[14][3] ), .D(\FIFO_MEM[15][3] ), .S0(n193), .S1(n190), .Y(
        n168) );
  MX4X1M U206 ( .A(\FIFO_MEM[4][3] ), .B(\FIFO_MEM[5][3] ), .C(
        \FIFO_MEM[6][3] ), .D(\FIFO_MEM[7][3] ), .S0(N10), .S1(n190), .Y(n170)
         );
  MX4X1M U207 ( .A(n175), .B(n173), .C(n174), .D(n172), .S0(N13), .S1(N12), 
        .Y(r_data[4]) );
  MX4X1M U208 ( .A(\FIFO_MEM[8][4] ), .B(\FIFO_MEM[9][4] ), .C(
        \FIFO_MEM[10][4] ), .D(\FIFO_MEM[11][4] ), .S0(n193), .S1(n190), .Y(
        n173) );
  MX4X1M U209 ( .A(\FIFO_MEM[12][4] ), .B(\FIFO_MEM[13][4] ), .C(
        \FIFO_MEM[14][4] ), .D(\FIFO_MEM[15][4] ), .S0(n193), .S1(n190), .Y(
        n172) );
  MX4X1M U210 ( .A(\FIFO_MEM[4][4] ), .B(\FIFO_MEM[5][4] ), .C(
        \FIFO_MEM[6][4] ), .D(\FIFO_MEM[7][4] ), .S0(n193), .S1(n190), .Y(n174) );
  MX4X1M U211 ( .A(n179), .B(n177), .C(n178), .D(n176), .S0(N13), .S1(N12), 
        .Y(r_data[5]) );
  MX4X1M U212 ( .A(\FIFO_MEM[8][5] ), .B(\FIFO_MEM[9][5] ), .C(
        \FIFO_MEM[10][5] ), .D(\FIFO_MEM[11][5] ), .S0(n192), .S1(n190), .Y(
        n177) );
  MX4X1M U213 ( .A(\FIFO_MEM[12][5] ), .B(\FIFO_MEM[13][5] ), .C(
        \FIFO_MEM[14][5] ), .D(\FIFO_MEM[15][5] ), .S0(n192), .S1(N11), .Y(
        n176) );
  MX4X1M U214 ( .A(\FIFO_MEM[4][5] ), .B(\FIFO_MEM[5][5] ), .C(
        \FIFO_MEM[6][5] ), .D(\FIFO_MEM[7][5] ), .S0(n192), .S1(N11), .Y(n178)
         );
  MX4X1M U215 ( .A(n183), .B(n181), .C(n182), .D(n180), .S0(N13), .S1(N12), 
        .Y(r_data[6]) );
  MX4X1M U216 ( .A(\FIFO_MEM[8][6] ), .B(\FIFO_MEM[9][6] ), .C(
        \FIFO_MEM[10][6] ), .D(\FIFO_MEM[11][6] ), .S0(n192), .S1(N11), .Y(
        n181) );
  MX4X1M U217 ( .A(\FIFO_MEM[12][6] ), .B(\FIFO_MEM[13][6] ), .C(
        \FIFO_MEM[14][6] ), .D(\FIFO_MEM[15][6] ), .S0(n192), .S1(N11), .Y(
        n180) );
  MX4X1M U218 ( .A(\FIFO_MEM[4][6] ), .B(\FIFO_MEM[5][6] ), .C(
        \FIFO_MEM[6][6] ), .D(\FIFO_MEM[7][6] ), .S0(n192), .S1(n190), .Y(n182) );
  MX4X1M U219 ( .A(n187), .B(n185), .C(n186), .D(n184), .S0(N13), .S1(N12), 
        .Y(r_data[7]) );
  MX4X1M U220 ( .A(\FIFO_MEM[8][7] ), .B(\FIFO_MEM[9][7] ), .C(
        \FIFO_MEM[10][7] ), .D(\FIFO_MEM[11][7] ), .S0(n192), .S1(N11), .Y(
        n185) );
  MX4X1M U221 ( .A(\FIFO_MEM[12][7] ), .B(\FIFO_MEM[13][7] ), .C(
        \FIFO_MEM[14][7] ), .D(\FIFO_MEM[15][7] ), .S0(n192), .S1(N11), .Y(
        n184) );
  MX4X1M U222 ( .A(\FIFO_MEM[4][7] ), .B(\FIFO_MEM[5][7] ), .C(
        \FIFO_MEM[6][7] ), .D(\FIFO_MEM[7][7] ), .S0(n192), .S1(N11), .Y(n186)
         );
  INVX2M U223 ( .A(N11), .Y(n188) );
  INVX2M U224 ( .A(n193), .Y(n191) );
  BUFX2M U225 ( .A(N10), .Y(n193) );
  AND2X2M U226 ( .A(n36), .B(w_addr[0]), .Y(n30) );
  AND2X2M U227 ( .A(w_addr[3]), .B(n26), .Y(n36) );
endmodule


module FIFO_WR_P_SIZE4 ( w_clk, w_inc, w_rst, r2w_ptr, w_ptr, w_addr, full );
  input [3:0] r2w_ptr;
  output [3:0] w_ptr;
  output [3:0] w_addr;
  input w_clk, w_inc, w_rst;
  output full;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
  wire   [3:0] comb_gray_w_ptr;
  assign w_addr[3] = 1'b0;

  DFFRQX2M \w_ptr_reg_reg[3]  ( .D(n12), .CK(w_clk), .RN(w_rst), .Q(
        comb_gray_w_ptr[3]) );
  DFFRX1M \w_ptr_reg_reg[0]  ( .D(n15), .CK(w_clk), .RN(w_rst), .Q(w_addr[0]), 
        .QN(n2) );
  DFFRQX2M \w_ptr_reg_reg[1]  ( .D(n14), .CK(w_clk), .RN(w_rst), .Q(w_addr[1])
         );
  DFFRQX2M \w_ptr_reg_reg[2]  ( .D(n13), .CK(w_clk), .RN(w_rst), .Q(w_addr[2])
         );
  DFFRQX2M \w_ptr_reg[2]  ( .D(comb_gray_w_ptr[2]), .CK(w_clk), .RN(w_rst), 
        .Q(w_ptr[2]) );
  DFFRQX2M \w_ptr_reg[1]  ( .D(comb_gray_w_ptr[1]), .CK(w_clk), .RN(w_rst), 
        .Q(w_ptr[1]) );
  DFFRQX2M \w_ptr_reg[0]  ( .D(comb_gray_w_ptr[0]), .CK(w_clk), .RN(w_rst), 
        .Q(w_ptr[0]) );
  DFFRQX2M \w_ptr_reg[3]  ( .D(comb_gray_w_ptr[3]), .CK(w_clk), .RN(w_rst), 
        .Q(w_ptr[3]) );
  INVX2M U3 ( .A(n7), .Y(full) );
  NAND2X2M U4 ( .A(w_inc), .B(n7), .Y(n6) );
  XNOR2X2M U5 ( .A(n2), .B(w_addr[1]), .Y(comb_gray_w_ptr[0]) );
  NAND4X2M U6 ( .A(n8), .B(n9), .C(n10), .D(n11), .Y(n7) );
  CLKXOR2X2M U7 ( .A(r2w_ptr[3]), .B(comb_gray_w_ptr[3]), .Y(n11) );
  XNOR2X2M U8 ( .A(comb_gray_w_ptr[0]), .B(r2w_ptr[0]), .Y(n9) );
  XNOR2X2M U9 ( .A(comb_gray_w_ptr[1]), .B(r2w_ptr[1]), .Y(n8) );
  CLKXOR2X2M U10 ( .A(comb_gray_w_ptr[3]), .B(w_addr[2]), .Y(
        comb_gray_w_ptr[2]) );
  CLKXOR2X2M U11 ( .A(r2w_ptr[2]), .B(comb_gray_w_ptr[2]), .Y(n10) );
  CLKXOR2X2M U12 ( .A(w_addr[1]), .B(w_addr[2]), .Y(comb_gray_w_ptr[1]) );
  NOR2X2M U13 ( .A(n6), .B(n2), .Y(n5) );
  XNOR2X2M U14 ( .A(w_addr[2]), .B(n4), .Y(n13) );
  XNOR2X2M U15 ( .A(comb_gray_w_ptr[3]), .B(n3), .Y(n12) );
  NAND2BX2M U16 ( .AN(n4), .B(w_addr[2]), .Y(n3) );
  NAND2X2M U17 ( .A(n5), .B(w_addr[1]), .Y(n4) );
  CLKXOR2X2M U18 ( .A(w_addr[1]), .B(n5), .Y(n14) );
  CLKXOR2X2M U19 ( .A(n2), .B(n6), .Y(n15) );
endmodule


module FIFO_RD_P_SIZE4 ( r_clk, r_inc, r_rst, w2r_ptr, r_ptr, r_addr, empty );
  input [3:0] w2r_ptr;
  output [3:0] r_ptr;
  output [3:0] r_addr;
  input r_clk, r_inc, r_rst;
  output empty;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
  wire   [3:0] comb_gray_rd_ptr;
  assign r_addr[3] = 1'b0;

  DFFRQX2M \rd_ptr_reg[3]  ( .D(n12), .CK(r_clk), .RN(r_rst), .Q(
        comb_gray_rd_ptr[3]) );
  DFFRQX2M \rd_ptr_reg[1]  ( .D(n14), .CK(r_clk), .RN(r_rst), .Q(r_addr[1]) );
  DFFRX1M \rd_ptr_reg[0]  ( .D(n15), .CK(r_clk), .RN(r_rst), .Q(r_addr[0]), 
        .QN(n2) );
  DFFRQX2M \rd_ptr_reg[2]  ( .D(n13), .CK(r_clk), .RN(r_rst), .Q(r_addr[2]) );
  DFFRQX2M \r_ptr_reg[3]  ( .D(comb_gray_rd_ptr[3]), .CK(r_clk), .RN(r_rst), 
        .Q(r_ptr[3]) );
  DFFRQX2M \r_ptr_reg[2]  ( .D(comb_gray_rd_ptr[2]), .CK(r_clk), .RN(r_rst), 
        .Q(r_ptr[2]) );
  DFFRQX2M \r_ptr_reg[1]  ( .D(comb_gray_rd_ptr[1]), .CK(r_clk), .RN(r_rst), 
        .Q(r_ptr[1]) );
  DFFRQX2M \r_ptr_reg[0]  ( .D(comb_gray_rd_ptr[0]), .CK(r_clk), .RN(r_rst), 
        .Q(r_ptr[0]) );
  INVX2M U3 ( .A(n7), .Y(empty) );
  XNOR2X2M U4 ( .A(comb_gray_rd_ptr[1]), .B(w2r_ptr[1]), .Y(n8) );
  XNOR2X2M U5 ( .A(n2), .B(r_addr[1]), .Y(comb_gray_rd_ptr[0]) );
  NOR2X2M U6 ( .A(n6), .B(n2), .Y(n5) );
  XNOR2X2M U7 ( .A(comb_gray_rd_ptr[3]), .B(n3), .Y(n12) );
  NAND2BX2M U8 ( .AN(n4), .B(r_addr[2]), .Y(n3) );
  XNOR2X2M U9 ( .A(r_addr[2]), .B(n4), .Y(n13) );
  NAND4X2M U10 ( .A(n8), .B(n9), .C(n10), .D(n11), .Y(n7) );
  XNOR2X2M U11 ( .A(comb_gray_rd_ptr[3]), .B(w2r_ptr[3]), .Y(n10) );
  XNOR2X2M U12 ( .A(comb_gray_rd_ptr[2]), .B(w2r_ptr[2]), .Y(n11) );
  XNOR2X2M U13 ( .A(comb_gray_rd_ptr[0]), .B(w2r_ptr[0]), .Y(n9) );
  NAND2X2M U14 ( .A(r_inc), .B(n7), .Y(n6) );
  NAND2X2M U15 ( .A(n5), .B(r_addr[1]), .Y(n4) );
  CLKXOR2X2M U16 ( .A(r_addr[1]), .B(r_addr[2]), .Y(comb_gray_rd_ptr[1]) );
  CLKXOR2X2M U17 ( .A(comb_gray_rd_ptr[3]), .B(r_addr[2]), .Y(
        comb_gray_rd_ptr[2]) );
  CLKXOR2X2M U18 ( .A(r_addr[1]), .B(n5), .Y(n14) );
  CLKXOR2X2M U19 ( .A(n2), .B(n6), .Y(n15) );
endmodule


module df_sync_BUS_WIDTH4_0 ( clk, rst, unsync, sync );
  input [3:0] unsync;
  output [3:0] sync;
  input clk, rst;

  wire   [3:0] meta_flop;

  DFFRQX2M \sync_reg[3]  ( .D(meta_flop[3]), .CK(clk), .RN(rst), .Q(sync[3])
         );
  DFFRQX2M \sync_reg[2]  ( .D(meta_flop[2]), .CK(clk), .RN(rst), .Q(sync[2])
         );
  DFFRQX2M \sync_reg[1]  ( .D(meta_flop[1]), .CK(clk), .RN(rst), .Q(sync[1])
         );
  DFFRQX2M \sync_reg[0]  ( .D(meta_flop[0]), .CK(clk), .RN(rst), .Q(sync[0])
         );
  DFFRQX2M \meta_flop_reg[3]  ( .D(unsync[3]), .CK(clk), .RN(rst), .Q(
        meta_flop[3]) );
  DFFRQX2M \meta_flop_reg[2]  ( .D(unsync[2]), .CK(clk), .RN(rst), .Q(
        meta_flop[2]) );
  DFFRQX2M \meta_flop_reg[1]  ( .D(unsync[1]), .CK(clk), .RN(rst), .Q(
        meta_flop[1]) );
  DFFRQX2M \meta_flop_reg[0]  ( .D(unsync[0]), .CK(clk), .RN(rst), .Q(
        meta_flop[0]) );
endmodule


module df_sync_BUS_WIDTH4_1 ( clk, rst, unsync, sync );
  input [3:0] unsync;
  output [3:0] sync;
  input clk, rst;

  wire   [3:0] meta_flop;

  DFFRQX2M \sync_reg[1]  ( .D(meta_flop[1]), .CK(clk), .RN(rst), .Q(sync[1])
         );
  DFFRQX2M \sync_reg[0]  ( .D(meta_flop[0]), .CK(clk), .RN(rst), .Q(sync[0])
         );
  DFFRQX2M \sync_reg[3]  ( .D(meta_flop[3]), .CK(clk), .RN(rst), .Q(sync[3])
         );
  DFFRQX2M \sync_reg[2]  ( .D(meta_flop[2]), .CK(clk), .RN(rst), .Q(sync[2])
         );
  DFFRQX2M \meta_flop_reg[3]  ( .D(unsync[3]), .CK(clk), .RN(rst), .Q(
        meta_flop[3]) );
  DFFRQX2M \meta_flop_reg[2]  ( .D(unsync[2]), .CK(clk), .RN(rst), .Q(
        meta_flop[2]) );
  DFFRQX2M \meta_flop_reg[1]  ( .D(unsync[1]), .CK(clk), .RN(rst), .Q(
        meta_flop[1]) );
  DFFRQX2M \meta_flop_reg[0]  ( .D(unsync[0]), .CK(clk), .RN(rst), .Q(
        meta_flop[0]) );
endmodule


module ASYNC_FIFO_DATA_WIDTH8_ADDR_WIDTH4_NUM_OF_STAGE2 ( w_clk, w_rst, w_inc, 
        r_clk, r_rst, r_inc, w_data, r_data, full, empty );
  input [7:0] w_data;
  output [7:0] r_data;
  input w_clk, w_rst, w_inc, r_clk, r_rst, r_inc;
  output full, empty;
  wire   n1, n2;
  wire   [3:0] w_addr;
  wire   [3:0] r_addr;
  wire   [3:0] r2w_ptr;
  wire   [3:0] w_ptr;
  wire   [3:0] w2r_ptr;
  wire   [3:0] r_ptr;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1;

  FIFO_MEM_CNTRL_ADDR_WIDTH4_DATA_WIDTH8 FIFO_MEM_CNTRL_TOP ( .w_inc(w_inc), 
        .full(full), .w_clk(w_clk), .w_rst(n1), .w_data(w_data), .w_addr({1'b0, 
        w_addr[2:0]}), .r_addr({1'b0, r_addr[2:0]}), .r_data(r_data) );
  FIFO_WR_P_SIZE4 FIFO_WR_TOP ( .w_clk(w_clk), .w_inc(w_inc), .w_rst(n1), 
        .r2w_ptr(r2w_ptr), .w_ptr(w_ptr), .w_addr({SYNOPSYS_UNCONNECTED__0, 
        w_addr[2:0]}), .full(full) );
  FIFO_RD_P_SIZE4 FIFO_RD_TOP ( .r_clk(r_clk), .r_inc(r_inc), .r_rst(r_rst), 
        .w2r_ptr(w2r_ptr), .r_ptr(r_ptr), .r_addr({SYNOPSYS_UNCONNECTED__1, 
        r_addr[2:0]}), .empty(empty) );
  df_sync_BUS_WIDTH4_0 bit_sync_w2r_TOP ( .clk(r_clk), .rst(r_rst), .unsync(
        w_ptr), .sync(w2r_ptr) );
  df_sync_BUS_WIDTH4_1 bit_sync_r2w_TOP ( .clk(w_clk), .rst(n1), .unsync(r_ptr), .sync(r2w_ptr) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(w_rst), .Y(n2) );
endmodule


module pulse_gen_0 ( clk, rst, in_sig, puls_sig );
  input clk, rst, in_sig;
  output puls_sig;
  wire   enable_f;

  DFFRQX2M enable_f_reg ( .D(in_sig), .CK(clk), .RN(rst), .Q(enable_f) );
  NOR2BX2M U3 ( .AN(in_sig), .B(enable_f), .Y(puls_sig) );
endmodule


module Clock_gating ( CLK, CLK_EN, GATED_CLK );
  input CLK, CLK_EN;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module ALU_DATA_WIDTH8_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0
 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22;

  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n12), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n16), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n17), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n18), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n18), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n18), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n18), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n18), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n18), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n16), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n15), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n16), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n18), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n17), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n17), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n16), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n17), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n16), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n17), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n17), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n13), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n14), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n15), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n14), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n13), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n15), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n14), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n15), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  INVX2M U1 ( .A(b[0]), .Y(n19) );
  XNOR2X2M U2 ( .A(n19), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U3 ( .A(n19), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U4 ( .A(n19), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U5 ( .A(n19), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U6 ( .A(n19), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U7 ( .A(n19), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  XNOR2X2M U8 ( .A(n19), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  OR2X2M U9 ( .A(n19), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  INVX2M U10 ( .A(b[1]), .Y(n18) );
  INVX2M U11 ( .A(b[4]), .Y(n15) );
  NAND2X2M U12 ( .A(n7), .B(n11), .Y(\u_div/CryTmp[0][1] ) );
  NAND2X2M U13 ( .A(n3), .B(n4), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U14 ( .A(a[5]), .Y(n4) );
  INVX2M U15 ( .A(n19), .Y(n3) );
  NAND2X2M U16 ( .A(n5), .B(n6), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U17 ( .A(a[4]), .Y(n6) );
  INVX2M U18 ( .A(n19), .Y(n5) );
  NAND2X2M U19 ( .A(n7), .B(n8), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U20 ( .A(a[3]), .Y(n8) );
  INVX2M U21 ( .A(n19), .Y(n7) );
  NAND2X2M U22 ( .A(n7), .B(n9), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U23 ( .A(a[2]), .Y(n9) );
  NAND2X2M U24 ( .A(n7), .B(n10), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U25 ( .A(a[1]), .Y(n10) );
  INVX2M U26 ( .A(b[5]), .Y(n14) );
  NAND2X2M U27 ( .A(n1), .B(n2), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U28 ( .A(a[6]), .Y(n2) );
  INVX2M U29 ( .A(n19), .Y(n1) );
  INVX2M U30 ( .A(b[6]), .Y(n13) );
  INVX2M U31 ( .A(b[7]), .Y(n12) );
  INVX2M U32 ( .A(a[0]), .Y(n11) );
  INVX2M U33 ( .A(b[2]), .Y(n17) );
  INVX2M U34 ( .A(b[3]), .Y(n16) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U37 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U38 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U39 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U40 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U41 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U46 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U47 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U51 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U52 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U54 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U55 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U56 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U58 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U59 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U60 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U61 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U62 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U63 ( .A(\u_div/CryTmp[7][1] ), .B(n20), .C(n18), .D(n17), .Y(
        quotient[7]) );
  AND3X1M U64 ( .A(n20), .B(n17), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X1M U65 ( .A(\u_div/CryTmp[5][3] ), .B(n20), .Y(quotient[5]) );
  AND2X1M U66 ( .A(n21), .B(n16), .Y(n20) );
  AND2X1M U67 ( .A(\u_div/CryTmp[4][4] ), .B(n21), .Y(quotient[4]) );
  AND3X1M U68 ( .A(n22), .B(n15), .C(n14), .Y(n21) );
  AND3X1M U69 ( .A(n22), .B(n14), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  AND2X1M U70 ( .A(\u_div/CryTmp[2][6] ), .B(n22), .Y(quotient[2]) );
  NOR2X1M U71 ( .A(b[6]), .B(b[7]), .Y(n22) );
  AND2X1M U72 ( .A(\u_div/CryTmp[1][7] ), .B(n12), .Y(quotient[1]) );
endmodule


module ALU_DATA_WIDTH8_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [9:0] carry;

  ADDFX2M U2_3 ( .A(A[3]), .B(n7), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n8), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_7 ( .A(A[7]), .B(n3), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n9), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n4), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n5), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n6), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  INVX2M U1 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2M U2 ( .A(B[4]), .Y(n6) );
  INVX2M U3 ( .A(B[5]), .Y(n5) );
  INVX2M U4 ( .A(B[6]), .Y(n4) );
  INVX2M U5 ( .A(B[1]), .Y(n9) );
  NAND2X2M U6 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U7 ( .A(A[0]), .Y(n1) );
  INVX2M U8 ( .A(B[7]), .Y(n3) );
  XNOR2X2M U9 ( .A(n10), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U10 ( .A(B[0]), .Y(n10) );
  INVX2M U11 ( .A(B[2]), .Y(n8) );
  INVX2M U12 ( .A(B[3]), .Y(n7) );
endmodule


module ALU_DATA_WIDTH8_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [8:1] carry;

  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  INVX2M U2 ( .A(A[0]), .Y(n2) );
  XNOR2X2M U3 ( .A(B[0]), .B(n2), .Y(SUM[0]) );
endmodule


module ALU_DATA_WIDTH8_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , \A[0] , n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20
;
  assign SUM[6] = A[6];
  assign SUM[5] = \A[5] ;
  assign \A[5]  = A[5];
  assign SUM[4] = \A[4] ;
  assign \A[4]  = A[4];
  assign SUM[3] = \A[3] ;
  assign \A[3]  = A[3];
  assign SUM[2] = \A[2] ;
  assign \A[2]  = A[2];
  assign SUM[1] = \A[1] ;
  assign \A[1]  = A[1];
  assign SUM[0] = \A[0] ;
  assign \A[0]  = A[0];

  AOI21BX2M U2 ( .A0(n11), .A1(A[12]), .B0N(n12), .Y(n1) );
  NAND2X2M U3 ( .A(A[7]), .B(B[7]), .Y(n8) );
  INVX2M U4 ( .A(B[7]), .Y(n2) );
  XNOR2X2M U5 ( .A(A[7]), .B(n2), .Y(SUM[7]) );
  XNOR2X2M U6 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  XNOR2X1M U7 ( .A(n3), .B(n4), .Y(SUM[9]) );
  NOR2X1M U8 ( .A(n5), .B(n6), .Y(n4) );
  CLKXOR2X2M U9 ( .A(n7), .B(n8), .Y(SUM[8]) );
  NAND2BX1M U10 ( .AN(n9), .B(n10), .Y(n7) );
  OAI21X1M U11 ( .A0(A[12]), .A1(n11), .B0(B[12]), .Y(n12) );
  XOR3XLM U12 ( .A(B[12]), .B(A[12]), .C(n11), .Y(SUM[12]) );
  OAI21BX1M U13 ( .A0(n13), .A1(n14), .B0N(n15), .Y(n11) );
  XNOR2X1M U14 ( .A(n14), .B(n16), .Y(SUM[11]) );
  NOR2X1M U15 ( .A(n15), .B(n13), .Y(n16) );
  NOR2X1M U16 ( .A(B[11]), .B(A[11]), .Y(n13) );
  AND2X1M U17 ( .A(B[11]), .B(A[11]), .Y(n15) );
  OA21X1M U18 ( .A0(n17), .A1(n18), .B0(n19), .Y(n14) );
  CLKXOR2X2M U19 ( .A(n20), .B(n18), .Y(SUM[10]) );
  AOI2BB1X1M U20 ( .A0N(n3), .A1N(n6), .B0(n5), .Y(n18) );
  AND2X1M U21 ( .A(B[9]), .B(A[9]), .Y(n5) );
  NOR2X1M U22 ( .A(B[9]), .B(A[9]), .Y(n6) );
  OA21X1M U23 ( .A0(n8), .A1(n9), .B0(n10), .Y(n3) );
  CLKNAND2X2M U24 ( .A(B[8]), .B(A[8]), .Y(n10) );
  NOR2X1M U25 ( .A(B[8]), .B(A[8]), .Y(n9) );
  NAND2BX1M U26 ( .AN(n17), .B(n19), .Y(n20) );
  CLKNAND2X2M U27 ( .A(B[10]), .B(A[10]), .Y(n19) );
  NOR2X1M U28 ( .A(B[10]), .B(A[10]), .Y(n17) );
endmodule


module ALU_DATA_WIDTH8_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  ALU_DATA_WIDTH8_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , 
        \A1[9] , \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , 
        \A1[2] , \A1[1] , \A1[0] }), .B({n12, n10, n11, n16, n14, n13, n15, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(
        PRODUCT[15:2]) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n7), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n6), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n5), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n4), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n9), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n8), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n3), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  AND2X2M U2 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n9) );
  INVX2M U9 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U10 ( .A(\ab[0][5] ), .Y(n21) );
  INVX2M U11 ( .A(\ab[0][6] ), .Y(n22) );
  INVX2M U12 ( .A(\ab[0][7] ), .Y(n23) );
  CLKXOR2X2M U13 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U14 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  AND2X2M U15 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n10) );
  AND2X2M U16 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n11) );
  CLKXOR2X2M U17 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  AND2X2M U18 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n12) );
  CLKXOR2X2M U19 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U20 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  CLKXOR2X2M U21 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  INVX2M U22 ( .A(\ab[0][3] ), .Y(n19) );
  INVX2M U23 ( .A(\ab[0][2] ), .Y(n18) );
  XNOR2X2M U24 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U25 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U26 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  AND2X2M U27 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n13) );
  AND2X2M U28 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n14) );
  AND2X2M U29 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n15) );
  AND2X2M U30 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n16) );
  CLKXOR2X2M U31 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(\A1[6] ) );
  XNOR2X2M U32 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U33 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  XNOR2X2M U34 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U35 ( .A(A[1]), .Y(n38) );
  INVX2M U36 ( .A(B[6]), .Y(n25) );
  INVX2M U37 ( .A(A[0]), .Y(n39) );
  INVX2M U38 ( .A(B[5]), .Y(n26) );
  INVX2M U39 ( .A(B[7]), .Y(n24) );
  INVX2M U40 ( .A(A[2]), .Y(n37) );
  INVX2M U41 ( .A(B[4]), .Y(n27) );
  INVX2M U42 ( .A(B[1]), .Y(n30) );
  INVX2M U43 ( .A(A[3]), .Y(n36) );
  INVX2M U44 ( .A(A[4]), .Y(n35) );
  INVX2M U45 ( .A(A[5]), .Y(n34) );
  XNOR2X2M U46 ( .A(\ab[1][0] ), .B(n17), .Y(PRODUCT[1]) );
  INVX2M U47 ( .A(\ab[0][1] ), .Y(n17) );
  INVX2M U48 ( .A(A[7]), .Y(n32) );
  INVX2M U49 ( .A(A[6]), .Y(n33) );
  INVX2M U50 ( .A(B[3]), .Y(n28) );
  INVX2M U51 ( .A(B[2]), .Y(n29) );
  INVX2M U52 ( .A(B[0]), .Y(n31) );
  NOR2X1M U54 ( .A(n32), .B(n24), .Y(\ab[7][7] ) );
  NOR2X1M U55 ( .A(n32), .B(n25), .Y(\ab[7][6] ) );
  NOR2X1M U56 ( .A(n32), .B(n26), .Y(\ab[7][5] ) );
  NOR2X1M U57 ( .A(n32), .B(n27), .Y(\ab[7][4] ) );
  NOR2X1M U58 ( .A(n32), .B(n28), .Y(\ab[7][3] ) );
  NOR2X1M U59 ( .A(n32), .B(n29), .Y(\ab[7][2] ) );
  NOR2X1M U60 ( .A(n32), .B(n30), .Y(\ab[7][1] ) );
  NOR2X1M U61 ( .A(n32), .B(n31), .Y(\ab[7][0] ) );
  NOR2X1M U62 ( .A(n24), .B(n33), .Y(\ab[6][7] ) );
  NOR2X1M U63 ( .A(n25), .B(n33), .Y(\ab[6][6] ) );
  NOR2X1M U64 ( .A(n26), .B(n33), .Y(\ab[6][5] ) );
  NOR2X1M U65 ( .A(n27), .B(n33), .Y(\ab[6][4] ) );
  NOR2X1M U66 ( .A(n28), .B(n33), .Y(\ab[6][3] ) );
  NOR2X1M U67 ( .A(n29), .B(n33), .Y(\ab[6][2] ) );
  NOR2X1M U68 ( .A(n30), .B(n33), .Y(\ab[6][1] ) );
  NOR2X1M U69 ( .A(n31), .B(n33), .Y(\ab[6][0] ) );
  NOR2X1M U70 ( .A(n24), .B(n34), .Y(\ab[5][7] ) );
  NOR2X1M U71 ( .A(n25), .B(n34), .Y(\ab[5][6] ) );
  NOR2X1M U72 ( .A(n26), .B(n34), .Y(\ab[5][5] ) );
  NOR2X1M U73 ( .A(n27), .B(n34), .Y(\ab[5][4] ) );
  NOR2X1M U74 ( .A(n28), .B(n34), .Y(\ab[5][3] ) );
  NOR2X1M U75 ( .A(n29), .B(n34), .Y(\ab[5][2] ) );
  NOR2X1M U76 ( .A(n30), .B(n34), .Y(\ab[5][1] ) );
  NOR2X1M U77 ( .A(n31), .B(n34), .Y(\ab[5][0] ) );
  NOR2X1M U78 ( .A(n24), .B(n35), .Y(\ab[4][7] ) );
  NOR2X1M U79 ( .A(n25), .B(n35), .Y(\ab[4][6] ) );
  NOR2X1M U80 ( .A(n26), .B(n35), .Y(\ab[4][5] ) );
  NOR2X1M U81 ( .A(n27), .B(n35), .Y(\ab[4][4] ) );
  NOR2X1M U82 ( .A(n28), .B(n35), .Y(\ab[4][3] ) );
  NOR2X1M U83 ( .A(n29), .B(n35), .Y(\ab[4][2] ) );
  NOR2X1M U84 ( .A(n30), .B(n35), .Y(\ab[4][1] ) );
  NOR2X1M U85 ( .A(n31), .B(n35), .Y(\ab[4][0] ) );
  NOR2X1M U86 ( .A(n24), .B(n36), .Y(\ab[3][7] ) );
  NOR2X1M U87 ( .A(n25), .B(n36), .Y(\ab[3][6] ) );
  NOR2X1M U88 ( .A(n26), .B(n36), .Y(\ab[3][5] ) );
  NOR2X1M U89 ( .A(n27), .B(n36), .Y(\ab[3][4] ) );
  NOR2X1M U90 ( .A(n28), .B(n36), .Y(\ab[3][3] ) );
  NOR2X1M U91 ( .A(n29), .B(n36), .Y(\ab[3][2] ) );
  NOR2X1M U92 ( .A(n30), .B(n36), .Y(\ab[3][1] ) );
  NOR2X1M U93 ( .A(n31), .B(n36), .Y(\ab[3][0] ) );
  NOR2X1M U94 ( .A(n24), .B(n37), .Y(\ab[2][7] ) );
  NOR2X1M U95 ( .A(n25), .B(n37), .Y(\ab[2][6] ) );
  NOR2X1M U96 ( .A(n26), .B(n37), .Y(\ab[2][5] ) );
  NOR2X1M U97 ( .A(n27), .B(n37), .Y(\ab[2][4] ) );
  NOR2X1M U98 ( .A(n28), .B(n37), .Y(\ab[2][3] ) );
  NOR2X1M U99 ( .A(n29), .B(n37), .Y(\ab[2][2] ) );
  NOR2X1M U100 ( .A(n30), .B(n37), .Y(\ab[2][1] ) );
  NOR2X1M U101 ( .A(n31), .B(n37), .Y(\ab[2][0] ) );
  NOR2X1M U102 ( .A(n24), .B(n38), .Y(\ab[1][7] ) );
  NOR2X1M U103 ( .A(n25), .B(n38), .Y(\ab[1][6] ) );
  NOR2X1M U104 ( .A(n26), .B(n38), .Y(\ab[1][5] ) );
  NOR2X1M U105 ( .A(n27), .B(n38), .Y(\ab[1][4] ) );
  NOR2X1M U106 ( .A(n28), .B(n38), .Y(\ab[1][3] ) );
  NOR2X1M U107 ( .A(n29), .B(n38), .Y(\ab[1][2] ) );
  NOR2X1M U108 ( .A(n30), .B(n38), .Y(\ab[1][1] ) );
  NOR2X1M U109 ( .A(n31), .B(n38), .Y(\ab[1][0] ) );
  NOR2X1M U110 ( .A(n24), .B(n39), .Y(\ab[0][7] ) );
  NOR2X1M U111 ( .A(n25), .B(n39), .Y(\ab[0][6] ) );
  NOR2X1M U112 ( .A(n26), .B(n39), .Y(\ab[0][5] ) );
  NOR2X1M U113 ( .A(n27), .B(n39), .Y(\ab[0][4] ) );
  NOR2X1M U114 ( .A(n28), .B(n39), .Y(\ab[0][3] ) );
  NOR2X1M U115 ( .A(n29), .B(n39), .Y(\ab[0][2] ) );
  NOR2X1M U116 ( .A(n30), .B(n39), .Y(\ab[0][1] ) );
  NOR2X1M U117 ( .A(n31), .B(n39), .Y(PRODUCT[0]) );
endmodule


module ALU_DATA_WIDTH8 ( A, B, ALU_FUN, CLK, RST, Enable, ALU_OUT, OUT_VALID
 );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [7:0] ALU_OUT;
  input CLK, RST, Enable;
  output OUT_VALID;
  wire   counter, N30, N32, OUT_VALID_reg, N111, N112, N113, N114, N115, N116,
         N117, N118, N119, N120, N121, N122, N123, N124, N125, N126, N127,
         N128, N129, N130, N131, N132, N133, N134, N135, N136, N137, N138,
         N139, N140, N141, N142, N143, N144, N147, N148, N149, N150, N151,
         N152, N153, N154, N187, N188, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185;

  ALU_DATA_WIDTH8_DW_div_uns_0 div_62 ( .a({n16, n15, n14, n13, n12, n11, n10, 
        n9}), .b({n8, n7, n6, n5, B[3:2], n4, B[0]}), .quotient({N154, N153, 
        N152, N151, N150, N149, N148, N147}) );
  ALU_DATA_WIDTH8_DW01_sub_0 sub_54 ( .A({1'b0, n16, n15, n14, n13, n12, n11, 
        n10, n9}), .B({1'b0, n8, n7, n6, n5, B[3:2], n4, B[0]}), .CI(1'b0), 
        .DIFF({N128, N127, N126, N125, N124, N123, N122, N121, N120}) );
  ALU_DATA_WIDTH8_DW01_add_0 add_50 ( .A({1'b0, n16, n15, n14, n13, n12, n11, 
        n10, n9}), .B({1'b0, n8, n7, n6, n5, B[3:2], n4, B[0]}), .CI(1'b0), 
        .SUM({N119, N118, N117, N116, N115, N114, N113, N112, N111}) );
  ALU_DATA_WIDTH8_DW02_mult_0 mult_58 ( .A({n16, n15, n14, n13, n12, n11, n10, 
        n9}), .B({n8, n7, n6, n5, B[3:2], n4, B[0]}), .TC(1'b0), .PRODUCT({
        N144, N143, N142, N141, N140, N139, N138, N137, N136, N135, N134, N133, 
        N132, N131, N130, N129}) );
  DFFRQX2M \ALU_OUT_reg[7]  ( .D(n155), .CK(CLK), .RN(RST), .Q(ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(n156), .CK(CLK), .RN(RST), .Q(ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(n157), .CK(CLK), .RN(RST), .Q(ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(n158), .CK(CLK), .RN(RST), .Q(ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(n159), .CK(CLK), .RN(RST), .Q(ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(n160), .CK(CLK), .RN(RST), .Q(ALU_OUT[2]) );
  DFFRQX2M \ALU_OUT_reg[1]  ( .D(n161), .CK(CLK), .RN(RST), .Q(ALU_OUT[1]) );
  DFFRQX2M \ALU_OUT_reg[0]  ( .D(N32), .CK(CLK), .RN(RST), .Q(ALU_OUT[0]) );
  DFFRQX2M counter_reg ( .D(N30), .CK(CLK), .RN(RST), .Q(counter) );
  DFFRQX2M OUT_VALID_reg_inst ( .D(OUT_VALID_reg), .CK(CLK), .RN(RST), .Q(
        OUT_VALID) );
  BUFX2M U3 ( .A(ALU_FUN[3]), .Y(n3) );
  BUFX2M U4 ( .A(A[7]), .Y(n16) );
  BUFX2M U5 ( .A(A[6]), .Y(n15) );
  INVX2M U8 ( .A(n63), .Y(n165) );
  INVX2M U9 ( .A(n47), .Y(n163) );
  NOR3X2M U10 ( .A(n164), .B(n169), .C(n148), .Y(n47) );
  NAND2X2M U11 ( .A(n140), .B(n139), .Y(n63) );
  NAND2X2M U12 ( .A(n139), .B(n164), .Y(n49) );
  INVX2M U13 ( .A(n69), .Y(n166) );
  NAND3X2M U14 ( .A(n166), .B(n67), .C(n17), .Y(n46) );
  AND2X2M U15 ( .A(n140), .B(n145), .Y(n70) );
  NOR3BX2M U16 ( .AN(n145), .B(ALU_FUN[0]), .C(n3), .Y(n71) );
  NOR3BX2M U17 ( .AN(n145), .B(n164), .C(ALU_FUN[0]), .Y(n65) );
  NOR3X2M U18 ( .A(n169), .B(n3), .C(n148), .Y(n69) );
  NOR3X2M U19 ( .A(ALU_FUN[2]), .B(n3), .C(n148), .Y(n68) );
  AOI222X1M U20 ( .A0(N115), .A1(n71), .B0(N133), .B1(n68), .C0(N124), .C1(n70), .Y(n93) );
  AOI222X1M U21 ( .A0(N116), .A1(n71), .B0(N134), .B1(n68), .C0(N125), .C1(n70), .Y(n84) );
  AOI222X1M U22 ( .A0(N117), .A1(n71), .B0(N135), .B1(n68), .C0(N126), .C1(n70), .Y(n75) );
  OAI222X1M U23 ( .A0(n184), .A1(n50), .B0(n129), .B1(n67), .C0(n185), .C1(
        n163), .Y(n121) );
  OAI222X1M U24 ( .A0(n183), .A1(n50), .B0(n116), .B1(n67), .C0(n149), .C1(
        n163), .Y(n110) );
  OAI222X1M U25 ( .A0(n182), .A1(n50), .B0(n107), .B1(n67), .C0(n184), .C1(
        n163), .Y(n101) );
  OAI222X1M U26 ( .A0(n50), .A1(n181), .B0(n98), .B1(n67), .C0(n183), .C1(n163), .Y(n92) );
  OAI222X1M U27 ( .A0(n50), .A1(n180), .B0(n89), .B1(n67), .C0(n182), .C1(n163), .Y(n83) );
  OAI222X1M U28 ( .A0(n50), .A1(n179), .B0(n80), .B1(n67), .C0(n181), .C1(n163), .Y(n74) );
  NOR2X2M U29 ( .A(n169), .B(ALU_FUN[1]), .Y(n139) );
  INVX2M U30 ( .A(ALU_FUN[2]), .Y(n169) );
  NAND2X2M U31 ( .A(ALU_FUN[1]), .B(n170), .Y(n148) );
  NOR2X2M U32 ( .A(n170), .B(n3), .Y(n140) );
  INVX2M U33 ( .A(ALU_FUN[0]), .Y(n170) );
  NOR3X2M U34 ( .A(n170), .B(ALU_FUN[2]), .C(n164), .Y(n127) );
  NAND2X2M U35 ( .A(n3), .B(n147), .Y(n67) );
  OAI2BB2X1M U36 ( .B0(ALU_FUN[2]), .B1(n148), .A0N(ALU_FUN[0]), .A1N(n145), 
        .Y(n147) );
  NOR2X2M U37 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n145) );
  BUFX2M U38 ( .A(n64), .Y(n17) );
  NAND3X2M U39 ( .A(ALU_FUN[1]), .B(ALU_FUN[2]), .C(n140), .Y(n64) );
  INVX2M U40 ( .A(n3), .Y(n164) );
  AO21XLM U41 ( .A0(N128), .A1(n70), .B0(n46), .Y(n119) );
  OAI222X1M U42 ( .A0(n172), .A1(n48), .B0(n144), .B1(n67), .C0(n149), .C1(n50), .Y(n133) );
  INVX2M U43 ( .A(N188), .Y(n172) );
  AOI22X1M U44 ( .A0(N127), .A1(n70), .B0(N118), .B1(n71), .Y(n56) );
  INVX2M U45 ( .A(n20), .Y(n153) );
  NAND3X2M U46 ( .A(n3), .B(n139), .C(ALU_FUN[0]), .Y(n50) );
  NAND3X2M U47 ( .A(n139), .B(n170), .C(n3), .Y(n48) );
  NOR2X2M U48 ( .A(n44), .B(n171), .Y(OUT_VALID_reg) );
  NOR4X1M U49 ( .A(n45), .B(n46), .C(n47), .D(n169), .Y(n44) );
  NAND3X2M U50 ( .A(n48), .B(n49), .C(n50), .Y(n45) );
  NOR4X1M U51 ( .A(n3), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .D(n171), .Y(N30) );
  CLKXOR2X2M U52 ( .A(n178), .B(n149), .Y(n129) );
  CLKXOR2X2M U53 ( .A(n177), .B(n182), .Y(n98) );
  CLKXOR2X2M U54 ( .A(n176), .B(n181), .Y(n89) );
  CLKXOR2X2M U55 ( .A(n175), .B(n180), .Y(n80) );
  OAI2BB2X1M U56 ( .B0(n131), .B1(n120), .A0N(n52), .A1N(n132), .Y(N32) );
  AOI211X2M U57 ( .A0(N119), .A1(n71), .B0(n146), .C0(n119), .Y(n131) );
  NAND4BX1M U58 ( .AN(n133), .B(n134), .C(n135), .D(n136), .Y(n132) );
  OAI2BB2X1M U59 ( .B0(n179), .B1(n163), .A0N(N137), .A1N(n68), .Y(n146) );
  AOI221XLM U60 ( .A0(n4), .A1(n125), .B0(N148), .B1(n60), .C0(n162), .Y(n124)
         );
  OAI21X2M U61 ( .A0(n49), .A1(n149), .B0(n63), .Y(n125) );
  INVX2M U62 ( .A(n126), .Y(n162) );
  AOI32X1M U63 ( .A0(N187), .A1(ALU_FUN[1]), .A2(n127), .B0(n128), .B1(n178), 
        .Y(n126) );
  INVX2M U64 ( .A(n117), .Y(n161) );
  AOI221XLM U65 ( .A0(n52), .A1(n118), .B0(N138), .B1(n54), .C0(n55), .Y(n117)
         );
  NAND4BX1M U66 ( .AN(n121), .B(n122), .C(n123), .D(n124), .Y(n118) );
  INVX2M U67 ( .A(n108), .Y(n160) );
  AOI221XLM U68 ( .A0(n52), .A1(n109), .B0(N139), .B1(n54), .C0(n55), .Y(n108)
         );
  NAND4BX1M U69 ( .AN(n110), .B(n111), .C(n112), .D(n113), .Y(n109) );
  INVX2M U70 ( .A(n99), .Y(n159) );
  AOI221XLM U71 ( .A0(n52), .A1(n100), .B0(N140), .B1(n54), .C0(n55), .Y(n99)
         );
  NAND4BX1M U72 ( .AN(n101), .B(n102), .C(n103), .D(n104), .Y(n100) );
  AOI222X1M U73 ( .A0(N151), .A1(n60), .B0(n96), .B1(n177), .C0(n5), .C1(n97), 
        .Y(n95) );
  OAI21X2M U74 ( .A0(n49), .A1(n182), .B0(n63), .Y(n97) );
  OAI21X2M U75 ( .A0(n13), .A1(n17), .B0(n166), .Y(n96) );
  INVX2M U76 ( .A(n90), .Y(n158) );
  AOI221XLM U77 ( .A0(n52), .A1(n91), .B0(N141), .B1(n54), .C0(n55), .Y(n90)
         );
  NAND4BX1M U78 ( .AN(n92), .B(n93), .C(n94), .D(n95), .Y(n91) );
  INVX2M U79 ( .A(n72), .Y(n156) );
  AOI221XLM U80 ( .A0(n52), .A1(n73), .B0(N143), .B1(n54), .C0(n55), .Y(n72)
         );
  NAND4BX1M U81 ( .AN(n74), .B(n75), .C(n76), .D(n77), .Y(n73) );
  INVX2M U82 ( .A(n51), .Y(n155) );
  AOI221XLM U83 ( .A0(n52), .A1(n53), .B0(N144), .B1(n54), .C0(n55), .Y(n51)
         );
  NAND4X2M U84 ( .A(n56), .B(n57), .C(n58), .D(n59), .Y(n53) );
  AOI222X1M U85 ( .A0(N152), .A1(n60), .B0(n87), .B1(n176), .C0(n6), .C1(n88), 
        .Y(n86) );
  OAI21X2M U86 ( .A0(n49), .A1(n181), .B0(n63), .Y(n88) );
  OAI21X2M U87 ( .A0(n14), .A1(n17), .B0(n166), .Y(n87) );
  INVX2M U88 ( .A(n81), .Y(n157) );
  AOI221XLM U89 ( .A0(n52), .A1(n82), .B0(N142), .B1(n54), .C0(n55), .Y(n81)
         );
  NAND4BX1M U90 ( .AN(n83), .B(n84), .C(n85), .D(n86), .Y(n82) );
  AOI222X1M U91 ( .A0(N136), .A1(n68), .B0(n69), .B1(n179), .C0(n165), .C1(n16), .Y(n57) );
  AOI222X1M U92 ( .A0(N154), .A1(n60), .B0(n61), .B1(n174), .C0(n8), .C1(n62), 
        .Y(n59) );
  OAI21X2M U93 ( .A0(n49), .A1(n179), .B0(n63), .Y(n62) );
  OAI21X2M U94 ( .A0(n16), .A1(n17), .B0(n166), .Y(n61) );
  AOI222X1M U95 ( .A0(n65), .A1(n66), .B0(n167), .B1(n173), .C0(n15), .C1(n47), 
        .Y(n58) );
  INVX2M U96 ( .A(n66), .Y(n173) );
  XNOR2X2M U97 ( .A(n174), .B(n16), .Y(n66) );
  INVX2M U98 ( .A(n67), .Y(n167) );
  AOI222X1M U99 ( .A0(N112), .A1(n71), .B0(N130), .B1(n68), .C0(N121), .C1(n70), .Y(n122) );
  AOI222X1M U100 ( .A0(N113), .A1(n71), .B0(N131), .B1(n68), .C0(N122), .C1(
        n70), .Y(n111) );
  AOI222X1M U101 ( .A0(N114), .A1(n71), .B0(N132), .B1(n68), .C0(N123), .C1(
        n70), .Y(n102) );
  AOI222X1M U102 ( .A0(N153), .A1(n60), .B0(n78), .B1(n175), .C0(n7), .C1(n79), 
        .Y(n77) );
  OAI21X2M U103 ( .A0(n49), .A1(n180), .B0(n63), .Y(n79) );
  OAI21X2M U104 ( .A0(n15), .A1(n17), .B0(n166), .Y(n78) );
  AOI222X1M U105 ( .A0(n11), .A1(n165), .B0(n65), .B1(n116), .C0(n69), .C1(
        n184), .Y(n112) );
  AOI222X1M U106 ( .A0(n12), .A1(n165), .B0(n65), .B1(n107), .C0(n69), .C1(
        n183), .Y(n103) );
  AOI222X1M U107 ( .A0(n13), .A1(n165), .B0(n65), .B1(n98), .C0(n69), .C1(n182), .Y(n94) );
  AOI222X1M U108 ( .A0(n14), .A1(n165), .B0(n65), .B1(n89), .C0(n69), .C1(n181), .Y(n85) );
  AOI222X1M U109 ( .A0(n165), .A1(n15), .B0(n65), .B1(n80), .C0(n69), .C1(n180), .Y(n76) );
  AOI221XLM U110 ( .A0(N188), .A1(n168), .B0(n65), .B1(n129), .C0(n130), .Y(
        n123) );
  INVX2M U111 ( .A(n48), .Y(n168) );
  OAI22X1M U112 ( .A0(n63), .A1(n149), .B0(n10), .B1(n166), .Y(n130) );
  NOR2BX2M U113 ( .AN(n119), .B(n120), .Y(n55) );
  OAI21X2M U114 ( .A0(n10), .A1(n17), .B0(n166), .Y(n128) );
  AOI222X1M U115 ( .A0(n9), .A1(n165), .B0(n65), .B1(n144), .C0(n69), .C1(n185), .Y(n135) );
  INVX2M U116 ( .A(n27), .Y(n151) );
  NOR2BX2M U117 ( .AN(n68), .B(n120), .Y(n54) );
  INVX2M U118 ( .A(n26), .Y(N187) );
  INVX2M U119 ( .A(n10), .Y(n149) );
  INVX2M U120 ( .A(Enable), .Y(n171) );
  INVX2M U121 ( .A(n11), .Y(n184) );
  INVX2M U122 ( .A(n12), .Y(n183) );
  INVX2M U123 ( .A(n13), .Y(n182) );
  INVX2M U124 ( .A(n14), .Y(n181) );
  INVX2M U125 ( .A(n15), .Y(n180) );
  INVX2M U126 ( .A(n16), .Y(n179) );
  CLKXOR2X2M U127 ( .A(n152), .B(n184), .Y(n116) );
  CLKXOR2X2M U128 ( .A(n154), .B(n183), .Y(n107) );
  INVX2M U129 ( .A(n7), .Y(n175) );
  INVX2M U130 ( .A(n4), .Y(n178) );
  INVX2M U131 ( .A(n6), .Y(n176) );
  INVX2M U132 ( .A(n5), .Y(n177) );
  INVX2M U133 ( .A(n8), .Y(n174) );
  INVX2M U134 ( .A(n9), .Y(n185) );
  CLKXOR2X2M U135 ( .A(n150), .B(n185), .Y(n144) );
  AOI222X1M U136 ( .A0(N147), .A1(n60), .B0(n137), .B1(n150), .C0(B[0]), .C1(
        n138), .Y(n136) );
  OAI21X2M U137 ( .A0(n49), .A1(n185), .B0(n63), .Y(n138) );
  OAI21X2M U138 ( .A0(n9), .A1(n17), .B0(n166), .Y(n137) );
  BUFX2M U139 ( .A(B[6]), .Y(n7) );
  BUFX2M U140 ( .A(B[5]), .Y(n6) );
  BUFX2M U141 ( .A(B[1]), .Y(n4) );
  BUFX2M U142 ( .A(B[7]), .Y(n8) );
  BUFX2M U143 ( .A(B[4]), .Y(n5) );
  BUFX2M U144 ( .A(A[5]), .Y(n14) );
  AOI222X1M U145 ( .A0(N149), .A1(n60), .B0(n114), .B1(n152), .C0(B[2]), .C1(
        n115), .Y(n113) );
  OAI21X2M U146 ( .A0(n49), .A1(n184), .B0(n63), .Y(n115) );
  OAI21X2M U147 ( .A0(n11), .A1(n17), .B0(n166), .Y(n114) );
  BUFX2M U148 ( .A(A[4]), .Y(n13) );
  BUFX2M U149 ( .A(A[3]), .Y(n12) );
  AOI222X1M U150 ( .A0(N150), .A1(n60), .B0(n105), .B1(n154), .C0(B[3]), .C1(
        n106), .Y(n104) );
  OAI21X2M U151 ( .A0(n49), .A1(n183), .B0(n63), .Y(n106) );
  OAI21X2M U152 ( .A0(n12), .A1(n17), .B0(n166), .Y(n105) );
  BUFX2M U153 ( .A(A[2]), .Y(n11) );
  BUFX2M U154 ( .A(A[1]), .Y(n10) );
  BUFX2M U155 ( .A(A[0]), .Y(n9) );
  AND3X2M U156 ( .A(n140), .B(ALU_FUN[1]), .C(n141), .Y(n60) );
  AOI21X2M U157 ( .A0(n142), .A1(n143), .B0(ALU_FUN[2]), .Y(n141) );
  NOR4X1M U158 ( .A(n8), .B(n7), .C(n6), .D(n5), .Y(n143) );
  NOR4X1M U159 ( .A(B[3]), .B(B[2]), .C(n4), .D(B[0]), .Y(n142) );
  AOI222X1M U160 ( .A0(N111), .A1(n71), .B0(N129), .B1(n68), .C0(N120), .C1(
        n70), .Y(n134) );
  INVX2M U161 ( .A(B[0]), .Y(n150) );
  INVX2M U162 ( .A(B[3]), .Y(n154) );
  INVX2M U163 ( .A(B[2]), .Y(n152) );
  NOR2X2M U164 ( .A(n171), .B(counter), .Y(n52) );
  NAND2X2M U165 ( .A(counter), .B(Enable), .Y(n120) );
  CLKNAND2X2M U166 ( .A(n9), .B(n150), .Y(n19) );
  NOR2X1M U167 ( .A(n152), .B(n11), .Y(n32) );
  CLKNAND2X2M U168 ( .A(n11), .B(n152), .Y(n21) );
  NAND2BX1M U169 ( .AN(n32), .B(n21), .Y(n29) );
  OA21X1M U170 ( .A0(n19), .A1(n149), .B0(n4), .Y(n18) );
  AOI211X1M U171 ( .A0(n19), .A1(n149), .B0(n29), .C0(n18), .Y(n20) );
  CLKNAND2X2M U172 ( .A(n12), .B(n154), .Y(n30) );
  NOR2X1M U173 ( .A(n154), .B(n12), .Y(n33) );
  AOI31X1M U174 ( .A0(n153), .A1(n21), .A2(n30), .B0(n33), .Y(n23) );
  NAND2BX1M U175 ( .AN(n5), .B(n13), .Y(n22) );
  NAND2BX1M U176 ( .AN(n13), .B(n5), .Y(n35) );
  CLKNAND2X2M U177 ( .A(n22), .B(n35), .Y(n37) );
  NAND2BX1M U178 ( .AN(n6), .B(n14), .Y(n39) );
  OAI2B11X1M U179 ( .A1N(n23), .A0(n37), .B0(n39), .C0(n22), .Y(n24) );
  NAND2BX1M U180 ( .AN(n14), .B(n6), .Y(n34) );
  XNOR2X1M U181 ( .A(n15), .B(n7), .Y(n38) );
  AOI32X1M U182 ( .A0(n24), .A1(n34), .A2(n38), .B0(n15), .B1(n175), .Y(n25)
         );
  CLKNAND2X2M U183 ( .A(n8), .B(n179), .Y(n41) );
  NOR2X1M U184 ( .A(n179), .B(n8), .Y(n43) );
  AOI2B1X1M U185 ( .A1N(n25), .A0(n41), .B0(n43), .Y(n26) );
  NOR2X1M U186 ( .A(n150), .B(n9), .Y(n27) );
  AOI21X1M U187 ( .A0(n27), .A1(n149), .B0(n4), .Y(n28) );
  AOI211X1M U188 ( .A0(n10), .A1(n151), .B0(n29), .C0(n28), .Y(n31) );
  OAI31X1M U189 ( .A0(n33), .A1(n32), .A2(n31), .B0(n30), .Y(n36) );
  OAI211X1M U190 ( .A0(n37), .A1(n36), .B0(n35), .C0(n34), .Y(n40) );
  AOI32X1M U191 ( .A0(n40), .A1(n39), .A2(n38), .B0(n7), .B1(n180), .Y(n42) );
  OAI21X1M U192 ( .A0(n43), .A1(n42), .B0(n41), .Y(N188) );
endmodule


module FSM_UART_RX ( CLK, RST, RX_IN, PAR_EN, bit_cnt, par_err, strt_glitch, 
        stp_err, data_sample_enable, enable, par_chk_en, strt_chk_en, 
        stp_chk_en, deser_en, data_valid );
  input [3:0] bit_cnt;
  input CLK, RST, RX_IN, PAR_EN, par_err, strt_glitch, stp_err;
  output data_sample_enable, enable, par_chk_en, strt_chk_en, stp_chk_en,
         deser_en, data_valid;
  wire   n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n2, n3, n4, n5, n6, n7,
         n8, n9, n10;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  DFFRX1M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]), .QN(n6) );
  NOR3X2M U3 ( .A(current_state[0]), .B(current_state[2]), .C(n8), .Y(deser_en) );
  NOR3X2M U4 ( .A(n6), .B(current_state[2]), .C(n8), .Y(n16) );
  NOR3X2M U5 ( .A(current_state[1]), .B(current_state[2]), .C(n6), .Y(n21) );
  INVX2M U6 ( .A(n23), .Y(n2) );
  INVX2M U7 ( .A(n20), .Y(par_chk_en) );
  NOR2X2M U8 ( .A(n11), .B(n17), .Y(data_valid) );
  NAND2X2M U9 ( .A(n31), .B(n25), .Y(enable) );
  OAI211X2M U10 ( .A0(n24), .A1(n9), .B0(n25), .C0(n26), .Y(next_state[0]) );
  AOI2BB2XLM U11 ( .B0(deser_en), .B1(n2), .A0N(n29), .A1N(n13), .Y(n24) );
  AOI31X2M U12 ( .A0(n27), .A1(n9), .A2(n5), .B0(n28), .Y(n26) );
  OR2X2M U13 ( .A(strt_chk_en), .B(par_chk_en), .Y(n28) );
  NOR4X1M U14 ( .A(n5), .B(n16), .C(deser_en), .D(n21), .Y(n31) );
  NAND2X2M U15 ( .A(n30), .B(n3), .Y(n23) );
  NOR2BX2M U16 ( .AN(n30), .B(n3), .Y(n27) );
  NAND3X2M U17 ( .A(n2), .B(n9), .C(deser_en), .Y(n12) );
  NAND2BX2M U18 ( .AN(n15), .B(n16), .Y(n20) );
  NAND3X2M U19 ( .A(n13), .B(n12), .C(n14), .Y(next_state[2]) );
  AOI22X1M U20 ( .A0(n15), .A1(n16), .B0(n7), .B1(n17), .Y(n14) );
  INVX2M U21 ( .A(n11), .Y(n7) );
  NAND2X2M U22 ( .A(n31), .B(n11), .Y(data_sample_enable) );
  NOR2BX2M U23 ( .AN(n21), .B(n22), .Y(strt_chk_en) );
  INVX2M U24 ( .A(n13), .Y(n5) );
  OAI21X2M U25 ( .A0(PAR_EN), .A1(n27), .B0(n33), .Y(n17) );
  AOI21X2M U26 ( .A0(PAR_EN), .A1(n29), .B0(stp_err), .Y(n33) );
  AOI32X1M U27 ( .A0(n32), .A1(n6), .A2(n10), .B0(n17), .B1(n7), .Y(n25) );
  NOR2X2M U28 ( .A(current_state[1]), .B(current_state[2]), .Y(n32) );
  INVX2M U29 ( .A(RX_IN), .Y(n10) );
  NOR3BX2M U30 ( .AN(bit_cnt[3]), .B(n4), .C(bit_cnt[2]), .Y(n30) );
  NAND3X2M U31 ( .A(current_state[0]), .B(n8), .C(current_state[2]), .Y(n11)
         );
  INVX2M U32 ( .A(bit_cnt[0]), .Y(n3) );
  NAND4X2M U33 ( .A(bit_cnt[2]), .B(bit_cnt[3]), .C(n3), .D(n4), .Y(n29) );
  NAND2X2M U34 ( .A(n11), .B(n12), .Y(stp_chk_en) );
  NOR2BX2M U35 ( .AN(n27), .B(par_err), .Y(n15) );
  INVX2M U36 ( .A(current_state[1]), .Y(n8) );
  INVX2M U37 ( .A(bit_cnt[1]), .Y(n4) );
  NOR4X1M U38 ( .A(n3), .B(bit_cnt[1]), .C(bit_cnt[2]), .D(bit_cnt[3]), .Y(n22) );
  OAI2B11X2M U39 ( .A1N(deser_en), .A0(n18), .B0(n19), .C0(n20), .Y(
        next_state[1]) );
  NAND3BX2M U40 ( .AN(strt_glitch), .B(n21), .C(n22), .Y(n19) );
  NOR2X2M U41 ( .A(PAR_EN), .B(n23), .Y(n18) );
  NAND3X2M U42 ( .A(n6), .B(n8), .C(current_state[2]), .Y(n13) );
  INVX2M U43 ( .A(PAR_EN), .Y(n9) );
endmodule


module data_sampling ( CLK, RST, edge_cnt, data_sample_enable, RX_IN, Prescale, 
        sampled_bit );
  input [4:0] edge_cnt;
  input [5:0] Prescale;
  input CLK, RST, data_sample_enable, RX_IN;
  output sampled_bit;
  wire   s_bit1, s_bit2, s_bit3, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13;

  DFFRX1M s_bit2_reg ( .D(n63), .CK(CLK), .RN(RST), .Q(s_bit2), .QN(n7) );
  DFFRX1M s_bit1_reg ( .D(n62), .CK(CLK), .RN(RST), .Q(s_bit1), .QN(n8) );
  DFFRQX1M s_bit3_reg ( .D(n61), .CK(CLK), .RN(RST), .Q(s_bit3) );
  DFFRQX1M sampled_bit_reg ( .D(n60), .CK(CLK), .RN(RST), .Q(sampled_bit) );
  NAND4BBX1M U3 ( .AN(Prescale[0]), .BN(Prescale[1]), .C(Prescale[5]), .D(n59), 
        .Y(n38) );
  NAND4BX1M U4 ( .AN(Prescale[3]), .B(Prescale[2]), .C(n57), .D(n13), .Y(n36)
         );
  INVX2M U5 ( .A(data_sample_enable), .Y(n9) );
  NAND2X2M U6 ( .A(RX_IN), .B(data_sample_enable), .Y(n46) );
  NOR2X2M U7 ( .A(n53), .B(n39), .Y(n42) );
  NAND3X2M U8 ( .A(n10), .B(n36), .C(n38), .Y(n39) );
  INVX2M U9 ( .A(n45), .Y(n10) );
  NAND3X2M U10 ( .A(n38), .B(n10), .C(n39), .Y(n34) );
  INVX2M U11 ( .A(n38), .Y(n12) );
  INVX2M U12 ( .A(n36), .Y(n11) );
  OAI2B2X1M U13 ( .A1N(n50), .A0(n46), .B0(n8), .B1(n50), .Y(n62) );
  NAND2X2M U14 ( .A(n51), .B(data_sample_enable), .Y(n50) );
  AOI33X2M U15 ( .A0(n2), .A1(n6), .A2(n42), .B0(edge_cnt[0]), .B1(n52), .B2(
        edge_cnt[1]), .Y(n51) );
  OAI21X2M U16 ( .A0(n53), .A1(n10), .B0(n54), .Y(n52) );
  OAI2B2X1M U17 ( .A1N(n55), .A0(n46), .B0(n7), .B1(n55), .Y(n63) );
  OAI211X2M U18 ( .A0(edge_cnt[0]), .A1(n48), .B0(n56), .C0(data_sample_enable), .Y(n55) );
  NAND3X2M U19 ( .A(edge_cnt[0]), .B(n6), .C(n42), .Y(n56) );
  OAI31X1M U20 ( .A0(n9), .A1(n31), .A2(n32), .B0(n33), .Y(n60) );
  NAND2X2M U21 ( .A(sampled_bit), .B(n31), .Y(n33) );
  AOI2B1X1M U22 ( .A1N(n40), .A0(edge_cnt[1]), .B0(n9), .Y(n31) );
  AOI22X1M U23 ( .A0(n34), .A1(n35), .B0(RX_IN), .B1(n11), .Y(n32) );
  OAI2BB2X1M U24 ( .B0(n1), .B1(n46), .A0N(s_bit3), .A1N(n1), .Y(n61) );
  INVX2M U25 ( .A(n47), .Y(n1) );
  OAI211X2M U26 ( .A0(n2), .A1(n48), .B0(n49), .C0(data_sample_enable), .Y(n47) );
  NAND3X2M U27 ( .A(edge_cnt[1]), .B(n2), .C(n42), .Y(n49) );
  NAND3X2M U28 ( .A(n6), .B(n5), .C(n58), .Y(n48) );
  OAI33X2M U29 ( .A0(n4), .A1(edge_cnt[4]), .A2(n10), .B0(n3), .B1(edge_cnt[3]), .B2(n38), .Y(n58) );
  OAI31X1M U30 ( .A0(n41), .A1(n42), .A2(n43), .B0(edge_cnt[0]), .Y(n40) );
  NOR4X1M U31 ( .A(edge_cnt[4]), .B(edge_cnt[3]), .C(edge_cnt[2]), .D(n36), 
        .Y(n43) );
  NOR3X2M U32 ( .A(n4), .B(n44), .C(n5), .Y(n41) );
  AOI22X1M U33 ( .A0(edge_cnt[4]), .A1(n12), .B0(n45), .B1(n3), .Y(n44) );
  OAI21X2M U34 ( .A0(n8), .A1(n7), .B0(n37), .Y(n35) );
  OAI21X2M U35 ( .A0(s_bit1), .A1(s_bit2), .B0(s_bit3), .Y(n37) );
  NAND4X2M U36 ( .A(edge_cnt[3]), .B(n12), .C(edge_cnt[2]), .D(n3), .Y(n54) );
  NAND3X2M U37 ( .A(n4), .B(n3), .C(edge_cnt[2]), .Y(n53) );
  INVX2M U38 ( .A(edge_cnt[2]), .Y(n5) );
  INVX2M U39 ( .A(edge_cnt[3]), .Y(n4) );
  INVX2M U40 ( .A(edge_cnt[1]), .Y(n6) );
  INVX2M U41 ( .A(edge_cnt[0]), .Y(n2) );
  INVX2M U42 ( .A(edge_cnt[4]), .Y(n3) );
  NOR3X2M U43 ( .A(Prescale[2]), .B(Prescale[4]), .C(Prescale[3]), .Y(n59) );
  NOR4BX1M U44 ( .AN(n57), .B(n13), .C(Prescale[2]), .D(Prescale[3]), .Y(n45)
         );
  NOR3X2M U45 ( .A(Prescale[1]), .B(Prescale[5]), .C(Prescale[0]), .Y(n57) );
  INVX2M U46 ( .A(Prescale[4]), .Y(n13) );
endmodule


module edge_bit_counter ( CLK, RST, enable, Prescale, bit_cnt, edge_cnt );
  input [5:0] Prescale;
  output [3:0] bit_cnt;
  output [4:0] edge_cnt;
  input CLK, RST, enable;
  wire   N37, N39, N49, N50, N51, N53, N54, N55, N56, N57, n6, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, \add_35/carry[4] , \add_35/carry[3] , \add_35/carry[2] , n1, n2,
         n3, n4, n5, n7, n8, n9, n10, n11, n12, n31;
  wire   [4:2] edge_max;

  DFFRX1M \bit_cnt_reg[3]  ( .D(n27), .CK(CLK), .RN(RST), .Q(bit_cnt[3]), .QN(
        n6) );
  DFFRX1M \bit_cnt_reg[0]  ( .D(n30), .CK(CLK), .RN(RST), .Q(bit_cnt[0]), .QN(
        n9) );
  DFFRX1M \bit_cnt_reg[1]  ( .D(n29), .CK(CLK), .RN(RST), .Q(bit_cnt[1]), .QN(
        n10) );
  DFFRX1M \bit_cnt_reg[2]  ( .D(n28), .CK(CLK), .RN(RST), .Q(bit_cnt[2]), .QN(
        n11) );
  DFFRQX1M \edge_cnt_reg[4]  ( .D(N57), .CK(CLK), .RN(RST), .Q(edge_cnt[4]) );
  DFFRQX1M \edge_cnt_reg[0]  ( .D(N53), .CK(CLK), .RN(RST), .Q(edge_cnt[0]) );
  DFFRQX1M \edge_cnt_reg[3]  ( .D(N56), .CK(CLK), .RN(RST), .Q(edge_cnt[3]) );
  DFFRQX1M \edge_cnt_reg[2]  ( .D(N55), .CK(CLK), .RN(RST), .Q(edge_cnt[2]) );
  DFFRQX1M \edge_cnt_reg[1]  ( .D(N54), .CK(CLK), .RN(RST), .Q(edge_cnt[1]) );
  INVX2M U3 ( .A(n17), .Y(n7) );
  NAND2X2M U4 ( .A(enable), .B(N37), .Y(n17) );
  NAND3X2M U5 ( .A(enable), .B(n17), .C(N39), .Y(n21) );
  NOR2BX2M U6 ( .AN(N49), .B(n21), .Y(N54) );
  NOR2BX2M U7 ( .AN(N50), .B(n21), .Y(N55) );
  NOR2BX2M U8 ( .AN(N51), .B(n21), .Y(N56) );
  NOR2X2M U9 ( .A(n10), .B(n9), .Y(n15) );
  OAI22X1M U10 ( .A0(n9), .A1(n21), .B0(bit_cnt[0]), .B1(n17), .Y(n30) );
  OAI21X2M U11 ( .A0(bit_cnt[0]), .A1(n17), .B0(n21), .Y(n20) );
  AOI21X2M U12 ( .A0(bit_cnt[2]), .A1(n15), .B0(n17), .Y(n16) );
  OAI2BB2X1M U13 ( .B0(bit_cnt[1]), .B1(n18), .A0N(n20), .A1N(bit_cnt[1]), .Y(
        n29) );
  NAND2X2M U14 ( .A(n7), .B(bit_cnt[0]), .Y(n18) );
  OAI32X1M U15 ( .A0(n18), .A1(bit_cnt[2]), .A2(n10), .B0(n19), .B1(n11), .Y(
        n28) );
  AOI21X2M U16 ( .A0(n7), .A1(n10), .B0(n20), .Y(n19) );
  OAI21X2M U17 ( .A0(n13), .A1(n6), .B0(n14), .Y(n27) );
  NAND4X2M U18 ( .A(bit_cnt[2]), .B(n7), .C(n15), .D(n6), .Y(n14) );
  AOI31X2M U19 ( .A0(enable), .A1(n8), .A2(N39), .B0(n16), .Y(n13) );
  INVX2M U20 ( .A(N37), .Y(n8) );
  NOR2X2M U21 ( .A(n1), .B(n21), .Y(N57) );
  XNOR2X2M U22 ( .A(\add_35/carry[4] ), .B(edge_cnt[4]), .Y(n1) );
  NOR2X2M U23 ( .A(edge_cnt[0]), .B(n21), .Y(N53) );
  NAND2X2M U24 ( .A(n22), .B(n23), .Y(edge_max[3]) );
  XNOR2X2M U25 ( .A(n22), .B(edge_cnt[4]), .Y(n4) );
  ADDHX1M U26 ( .A(edge_cnt[2]), .B(\add_35/carry[2] ), .CO(\add_35/carry[3] ), 
        .S(N50) );
  ADDHX1M U27 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .CO(\add_35/carry[2] ), .S(
        N49) );
  ADDHX1M U28 ( .A(edge_cnt[3]), .B(\add_35/carry[3] ), .CO(\add_35/carry[4] ), 
        .S(N51) );
  NAND4X2M U29 ( .A(n31), .B(n12), .C(Prescale[5]), .D(n25), .Y(n22) );
  NOR3X2M U30 ( .A(Prescale[2]), .B(Prescale[4]), .C(Prescale[3]), .Y(n25) );
  NAND4X2M U31 ( .A(n31), .B(n12), .C(Prescale[4]), .D(n24), .Y(n23) );
  NOR3X2M U32 ( .A(Prescale[2]), .B(Prescale[5]), .C(Prescale[3]), .Y(n24) );
  INVX2M U33 ( .A(Prescale[0]), .Y(n31) );
  INVX2M U34 ( .A(Prescale[1]), .Y(n12) );
  NAND4X2M U35 ( .A(n31), .B(n12), .C(Prescale[2]), .D(n26), .Y(edge_max[2])
         );
  NOR3X2M U36 ( .A(Prescale[3]), .B(Prescale[5]), .C(Prescale[4]), .Y(n26) );
  XNOR2X1M U37 ( .A(edge_max[3]), .B(edge_cnt[3]), .Y(n3) );
  XNOR2X1M U38 ( .A(edge_max[2]), .B(edge_cnt[2]), .Y(n2) );
  NAND4X1M U39 ( .A(n3), .B(n2), .C(edge_cnt[1]), .D(edge_cnt[0]), .Y(n5) );
  NOR2X1M U40 ( .A(n4), .B(n5), .Y(N37) );
  OR2X1M U41 ( .A(n5), .B(n4), .Y(N39) );
endmodule


module deserializer_WIDTH8 ( CLK, RST, deser_en, sampled_bit, bit_cnt, P_DATA
 );
  input [3:0] bit_cnt;
  output [7:0] P_DATA;
  input CLK, RST, deser_en, sampled_bit;
  wire   n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n1, n2, n3, n4;

  DFFRQX2M \P_DATA_reg[5]  ( .D(n21), .CK(CLK), .RN(RST), .Q(P_DATA[5]) );
  DFFRQX2M \P_DATA_reg[1]  ( .D(n17), .CK(CLK), .RN(RST), .Q(P_DATA[1]) );
  DFFRQX2M \P_DATA_reg[4]  ( .D(n20), .CK(CLK), .RN(RST), .Q(P_DATA[4]) );
  DFFRQX2M \P_DATA_reg[0]  ( .D(n16), .CK(CLK), .RN(RST), .Q(P_DATA[0]) );
  DFFRQX2M \P_DATA_reg[7]  ( .D(n23), .CK(CLK), .RN(RST), .Q(P_DATA[7]) );
  DFFRQX2M \P_DATA_reg[3]  ( .D(n19), .CK(CLK), .RN(RST), .Q(P_DATA[3]) );
  DFFRQX2M \P_DATA_reg[6]  ( .D(n22), .CK(CLK), .RN(RST), .Q(P_DATA[6]) );
  DFFRQX2M \P_DATA_reg[2]  ( .D(n18), .CK(CLK), .RN(RST), .Q(P_DATA[2]) );
  NOR3BX2M U2 ( .AN(deser_en), .B(bit_cnt[3]), .C(n3), .Y(n9) );
  OAI2BB2X1M U3 ( .B0(n4), .B1(n8), .A0N(P_DATA[2]), .A1N(n8), .Y(n18) );
  NAND3X2M U4 ( .A(n1), .B(n2), .C(n9), .Y(n8) );
  OAI2BB2X1M U5 ( .B0(n4), .B1(n10), .A0N(P_DATA[3]), .A1N(n10), .Y(n19) );
  NAND3X2M U6 ( .A(bit_cnt[0]), .B(n2), .C(n9), .Y(n10) );
  OAI2BB2X1M U7 ( .B0(n4), .B1(n11), .A0N(P_DATA[4]), .A1N(n11), .Y(n20) );
  NAND3X2M U8 ( .A(bit_cnt[1]), .B(n1), .C(n9), .Y(n11) );
  OAI2BB2X1M U9 ( .B0(n4), .B1(n12), .A0N(P_DATA[5]), .A1N(n12), .Y(n21) );
  NAND3X2M U10 ( .A(bit_cnt[0]), .B(bit_cnt[1]), .C(n9), .Y(n12) );
  NOR4BX1M U11 ( .AN(deser_en), .B(n2), .C(bit_cnt[2]), .D(bit_cnt[3]), .Y(n6)
         );
  INVX2M U12 ( .A(bit_cnt[0]), .Y(n1) );
  AND4X2M U13 ( .A(bit_cnt[3]), .B(deser_en), .C(n2), .D(n3), .Y(n14) );
  INVX2M U14 ( .A(bit_cnt[1]), .Y(n2) );
  OAI2BB2X1M U15 ( .B0(n4), .B1(n13), .A0N(P_DATA[6]), .A1N(n13), .Y(n22) );
  NAND2X2M U16 ( .A(n14), .B(n1), .Y(n13) );
  OAI2BB2X1M U17 ( .B0(n5), .B1(n4), .A0N(P_DATA[0]), .A1N(n5), .Y(n16) );
  NAND2X2M U18 ( .A(n6), .B(n1), .Y(n5) );
  OAI2BB2X1M U19 ( .B0(n4), .B1(n7), .A0N(P_DATA[1]), .A1N(n7), .Y(n17) );
  NAND2X2M U20 ( .A(bit_cnt[0]), .B(n6), .Y(n7) );
  OAI2BB2X1M U21 ( .B0(n4), .B1(n15), .A0N(P_DATA[7]), .A1N(n15), .Y(n23) );
  NAND2X2M U22 ( .A(n14), .B(bit_cnt[0]), .Y(n15) );
  INVX2M U23 ( .A(bit_cnt[2]), .Y(n3) );
  INVX2M U24 ( .A(sampled_bit), .Y(n4) );
endmodule


module STOP_CHECK ( CLK, RST, stp_chk_en, sampled_bit, stp_err );
  input CLK, RST, stp_chk_en, sampled_bit;
  output stp_err;
  wire   n2, n1;

  DFFRQX2M stp_err_reg ( .D(n2), .CK(CLK), .RN(RST), .Q(stp_err) );
  OAI2BB2X1M U2 ( .B0(sampled_bit), .B1(n1), .A0N(stp_err), .A1N(n1), .Y(n2)
         );
  INVX2M U3 ( .A(stp_chk_en), .Y(n1) );
endmodule


module START_CHECK ( CLK, RST, strt_chk_en, sampled_bit, strt_glitch );
  input CLK, RST, strt_chk_en, sampled_bit;
  output strt_glitch;
  wire   N1;

  DFFRQX2M strt_glitch_reg ( .D(N1), .CK(CLK), .RN(RST), .Q(strt_glitch) );
  AND2X2M U3 ( .A(strt_chk_en), .B(sampled_bit), .Y(N1) );
endmodule


module PARITY_CHECK_WIDTH8 ( CLK, RST, par_chk_en, PAR_TYP, sampled_bit, 
        P_DATA, par_err );
  input [7:0] P_DATA;
  input CLK, RST, par_chk_en, PAR_TYP, sampled_bit;
  output par_err;
  wire   n1, n3, n4, n5, n6, n7, n8, n2;

  DFFRQX2M par_err_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(par_err) );
  OAI2BB2X1M U2 ( .B0(n1), .B1(n2), .A0N(par_err), .A1N(n2), .Y(n8) );
  XOR3XLM U3 ( .A(n3), .B(n4), .C(n5), .Y(n1) );
  INVX2M U4 ( .A(par_chk_en), .Y(n2) );
  XNOR2X2M U5 ( .A(sampled_bit), .B(PAR_TYP), .Y(n5) );
  XOR3XLM U6 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n4) );
  XNOR2X2M U7 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
  XOR3XLM U8 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n7), .Y(n3) );
  XNOR2X2M U9 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n7) );
endmodule


module UART_RX_DATA_WIDTH8 ( RX_IN, Prescale, PAR_EN, PAR_TYP, CLK, RST, 
        P_DATA, par_err, stp_err, data_valid );
  input [5:0] Prescale;
  output [7:0] P_DATA;
  input RX_IN, PAR_EN, PAR_TYP, CLK, RST;
  output par_err, stp_err, data_valid;
  wire   strt_glitch, data_sample_enable, enable, par_chk_en, strt_chk_en,
         stp_chk_en, deser_en, sampled_bit, n1, n2;
  wire   [3:0] bit_cnt;
  wire   [4:0] edge_cnt;

  FSM_UART_RX FSM_UART_RX_TOP ( .CLK(CLK), .RST(n1), .RX_IN(RX_IN), .PAR_EN(
        PAR_EN), .bit_cnt(bit_cnt), .par_err(par_err), .strt_glitch(
        strt_glitch), .stp_err(stp_err), .data_sample_enable(
        data_sample_enable), .enable(enable), .par_chk_en(par_chk_en), 
        .strt_chk_en(strt_chk_en), .stp_chk_en(stp_chk_en), .deser_en(deser_en), .data_valid(data_valid) );
  data_sampling DATA_SAMPLE_TOP ( .CLK(CLK), .RST(n1), .edge_cnt(edge_cnt), 
        .data_sample_enable(data_sample_enable), .RX_IN(RX_IN), .Prescale(
        Prescale), .sampled_bit(sampled_bit) );
  edge_bit_counter EDGE_BIT_COUNTER_TOP ( .CLK(CLK), .RST(n1), .enable(enable), 
        .Prescale(Prescale), .bit_cnt(bit_cnt), .edge_cnt(edge_cnt) );
  deserializer_WIDTH8 DESERIALIZER_TOP ( .CLK(CLK), .RST(n1), .deser_en(
        deser_en), .sampled_bit(sampled_bit), .bit_cnt(bit_cnt), .P_DATA(
        P_DATA) );
  STOP_CHECK STOP_CHECK_TOP ( .CLK(CLK), .RST(n1), .stp_chk_en(stp_chk_en), 
        .sampled_bit(sampled_bit), .stp_err(stp_err) );
  START_CHECK START_CHECK_TOP ( .CLK(CLK), .RST(n1), .strt_chk_en(strt_chk_en), 
        .sampled_bit(sampled_bit), .strt_glitch(strt_glitch) );
  PARITY_CHECK_WIDTH8 PARITY_CHECK_TOP ( .CLK(CLK), .RST(n1), .par_chk_en(
        par_chk_en), .PAR_TYP(PAR_TYP), .sampled_bit(sampled_bit), .P_DATA(
        P_DATA), .par_err(par_err) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module MUX ( Mux_Sel, start_bit, stop_bit, ser_data, par_bit, TX_OUT );
  input [1:0] Mux_Sel;
  input start_bit, stop_bit, ser_data, par_bit;
  output TX_OUT;
  wire   n2, n3, n1;

  INVX2M U1 ( .A(Mux_Sel[0]), .Y(n1) );
  OAI2B2X4M U2 ( .A1N(Mux_Sel[1]), .A0(n2), .B0(Mux_Sel[1]), .B1(n3), .Y(
        TX_OUT) );
  AOI22X1M U3 ( .A0(start_bit), .A1(n1), .B0(stop_bit), .B1(Mux_Sel[0]), .Y(n3) );
  AOI22X1M U4 ( .A0(ser_data), .A1(n1), .B0(par_bit), .B1(Mux_Sel[0]), .Y(n2)
         );
endmodule


module Parity_Calc ( CLK, RST, P_DATA, DATA_VALID, PAR_EN, PAR_TYP, Busy, 
        par_bit );
  input [7:0] P_DATA;
  input CLK, RST, DATA_VALID, PAR_EN, PAR_TYP, Busy;
  output par_bit;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n2
;
  wire   [7:0] P_DATA_V;

  DFFRQX2M \P_DATA_V_reg[1]  ( .D(n10), .CK(CLK), .RN(RST), .Q(P_DATA_V[1]) );
  DFFRQX2M \P_DATA_V_reg[0]  ( .D(n9), .CK(CLK), .RN(RST), .Q(P_DATA_V[0]) );
  DFFRQX2M \P_DATA_V_reg[2]  ( .D(n11), .CK(CLK), .RN(RST), .Q(P_DATA_V[2]) );
  DFFRQX2M \P_DATA_V_reg[3]  ( .D(n12), .CK(CLK), .RN(RST), .Q(P_DATA_V[3]) );
  DFFRQX2M \P_DATA_V_reg[5]  ( .D(n14), .CK(CLK), .RN(RST), .Q(P_DATA_V[5]) );
  DFFRQX2M \P_DATA_V_reg[4]  ( .D(n13), .CK(CLK), .RN(RST), .Q(P_DATA_V[4]) );
  DFFRQX2M \P_DATA_V_reg[6]  ( .D(n15), .CK(CLK), .RN(RST), .Q(P_DATA_V[6]) );
  DFFRQX2M \P_DATA_V_reg[7]  ( .D(n16), .CK(CLK), .RN(RST), .Q(P_DATA_V[7]) );
  DFFRQX2M par_bit_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(par_bit) );
  NOR2BX2M U2 ( .AN(DATA_VALID), .B(Busy), .Y(n7) );
  OAI2BB2X1M U3 ( .B0(n1), .B1(n2), .A0N(par_bit), .A1N(n2), .Y(n8) );
  INVX2M U4 ( .A(PAR_EN), .Y(n2) );
  XOR3XLM U5 ( .A(n3), .B(PAR_TYP), .C(n4), .Y(n1) );
  XOR3XLM U6 ( .A(P_DATA_V[1]), .B(P_DATA_V[0]), .C(n5), .Y(n4) );
  XOR3XLM U7 ( .A(P_DATA_V[5]), .B(P_DATA_V[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U8 ( .A(P_DATA_V[7]), .B(P_DATA_V[6]), .Y(n6) );
  AO2B2X2M U9 ( .B0(P_DATA[0]), .B1(n7), .A0(P_DATA_V[0]), .A1N(n7), .Y(n9) );
  AO2B2X2M U10 ( .B0(P_DATA[1]), .B1(n7), .A0(P_DATA_V[1]), .A1N(n7), .Y(n10)
         );
  AO2B2X2M U11 ( .B0(P_DATA[2]), .B1(n7), .A0(P_DATA_V[2]), .A1N(n7), .Y(n11)
         );
  AO2B2X2M U12 ( .B0(P_DATA[3]), .B1(n7), .A0(P_DATA_V[3]), .A1N(n7), .Y(n12)
         );
  AO2B2X2M U13 ( .B0(P_DATA[4]), .B1(n7), .A0(P_DATA_V[4]), .A1N(n7), .Y(n13)
         );
  AO2B2X2M U14 ( .B0(P_DATA[5]), .B1(n7), .A0(P_DATA_V[5]), .A1N(n7), .Y(n14)
         );
  AO2B2X2M U15 ( .B0(P_DATA[6]), .B1(n7), .A0(P_DATA_V[6]), .A1N(n7), .Y(n15)
         );
  AO2B2X2M U16 ( .B0(P_DATA[7]), .B1(n7), .A0(P_DATA_V[7]), .A1N(n7), .Y(n16)
         );
  XNOR2X2M U17 ( .A(P_DATA_V[2]), .B(P_DATA_V[3]), .Y(n5) );
endmodule


module serializer ( CLK, RST, P_DATA, ser_en, ser_done, ser_data );
  input [7:0] P_DATA;
  input CLK, RST, ser_en;
  output ser_done, ser_data;
  wire   load, N26, N29, N30, N32, n2, n3, n5, n6, n7, n8, n9, n10, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n1, n4,
         n11, n26;
  wire   [7:0] shift_reg;
  wire   [2:0] bit_counter;

  DFFRQX2M ser_done_reg ( .D(N29), .CK(CLK), .RN(RST), .Q(ser_done) );
  DFFRQX2M \shift_reg_reg[7]  ( .D(n24), .CK(CLK), .RN(RST), .Q(shift_reg[7])
         );
  DFFRQX2M \shift_reg_reg[6]  ( .D(n23), .CK(CLK), .RN(RST), .Q(shift_reg[6])
         );
  DFFRQX2M \shift_reg_reg[5]  ( .D(n22), .CK(CLK), .RN(RST), .Q(shift_reg[5])
         );
  DFFRQX2M \shift_reg_reg[4]  ( .D(n21), .CK(CLK), .RN(RST), .Q(shift_reg[4])
         );
  DFFRQX2M \shift_reg_reg[3]  ( .D(n20), .CK(CLK), .RN(RST), .Q(shift_reg[3])
         );
  DFFRQX2M \shift_reg_reg[2]  ( .D(n19), .CK(CLK), .RN(RST), .Q(shift_reg[2])
         );
  DFFRQX2M \shift_reg_reg[1]  ( .D(n18), .CK(CLK), .RN(RST), .Q(shift_reg[1])
         );
  DFFSQX2M load_reg ( .D(n25), .CK(CLK), .SN(RST), .Q(load) );
  DFFRQX2M \shift_reg_reg[0]  ( .D(n17), .CK(CLK), .RN(RST), .Q(shift_reg[0])
         );
  DFFRQX2M \bit_counter_reg[1]  ( .D(n1), .CK(CLK), .RN(RST), .Q(
        bit_counter[1]) );
  DFFRQX2M \bit_counter_reg[0]  ( .D(N30), .CK(CLK), .RN(RST), .Q(
        bit_counter[0]) );
  DFFSQX2M ser_data_reg ( .D(N26), .CK(CLK), .SN(RST), .Q(ser_data) );
  DFFRQX1M \bit_counter_reg[2]  ( .D(N32), .CK(CLK), .RN(RST), .Q(n16) );
  NOR3X2M U3 ( .A(n11), .B(n13), .C(n12), .Y(N29) );
  INVX2M U4 ( .A(n13), .Y(n4) );
  NAND2X2M U5 ( .A(n4), .B(n26), .Y(N26) );
  OAI31X1M U6 ( .A0(n11), .A1(load), .A2(n12), .B0(ser_en), .Y(n25) );
  NAND2BX2M U7 ( .AN(load), .B(ser_en), .Y(n13) );
  OAI2B1X2M U8 ( .A1N(shift_reg[1]), .A0(ser_en), .B0(n5), .Y(n18) );
  AOI22X1M U9 ( .A0(P_DATA[1]), .A1(n3), .B0(shift_reg[2]), .B1(n4), .Y(n5) );
  OAI2B1X2M U10 ( .A1N(shift_reg[2]), .A0(ser_en), .B0(n6), .Y(n19) );
  AOI22X1M U11 ( .A0(P_DATA[2]), .A1(n3), .B0(shift_reg[3]), .B1(n4), .Y(n6)
         );
  OAI2B1X2M U12 ( .A1N(shift_reg[3]), .A0(ser_en), .B0(n7), .Y(n20) );
  AOI22X1M U13 ( .A0(P_DATA[3]), .A1(n3), .B0(shift_reg[4]), .B1(n4), .Y(n7)
         );
  OAI2B1X2M U14 ( .A1N(shift_reg[4]), .A0(ser_en), .B0(n8), .Y(n21) );
  AOI22X1M U15 ( .A0(P_DATA[4]), .A1(n3), .B0(shift_reg[5]), .B1(n4), .Y(n8)
         );
  OAI2B1X2M U16 ( .A1N(shift_reg[5]), .A0(ser_en), .B0(n9), .Y(n22) );
  AOI22X1M U17 ( .A0(P_DATA[5]), .A1(n3), .B0(shift_reg[6]), .B1(n4), .Y(n9)
         );
  OAI2B1X2M U18 ( .A1N(shift_reg[6]), .A0(ser_en), .B0(n10), .Y(n23) );
  AOI22X1M U19 ( .A0(P_DATA[6]), .A1(n3), .B0(shift_reg[7]), .B1(n4), .Y(n10)
         );
  OAI32X1M U20 ( .A0(n12), .A1(n16), .A2(n13), .B0(n14), .B1(n11), .Y(N32) );
  AOI2B1X1M U21 ( .A1N(bit_counter[1]), .A0(n4), .B0(N30), .Y(n14) );
  OAI21X2M U22 ( .A0(ser_en), .A1(n26), .B0(n2), .Y(n17) );
  AOI22X1M U23 ( .A0(P_DATA[0]), .A1(n3), .B0(shift_reg[1]), .B1(n4), .Y(n2)
         );
  NOR2X2M U24 ( .A(n13), .B(bit_counter[0]), .Y(N30) );
  AND2X2M U25 ( .A(ser_en), .B(load), .Y(n3) );
  AO2B2X2M U26 ( .B0(P_DATA[7]), .B1(n3), .A0(shift_reg[7]), .A1N(ser_en), .Y(
        n24) );
  INVX2M U27 ( .A(n15), .Y(n1) );
  OAI211X2M U28 ( .A0(bit_counter[0]), .A1(bit_counter[1]), .B0(n4), .C0(n12), 
        .Y(n15) );
  NAND2X2M U29 ( .A(bit_counter[1]), .B(bit_counter[0]), .Y(n12) );
  INVX2M U30 ( .A(n16), .Y(n11) );
  INVX2M U31 ( .A(shift_reg[0]), .Y(n26) );
endmodule


module FSM_UART_TX ( CLK, RST, PAR_EN, DATA_VALID, ser_done, ser_en, Mux_Sel, 
        Busy );
  output [1:0] Mux_Sel;
  input CLK, RST, PAR_EN, DATA_VALID, ser_done;
  output ser_en, Busy;
  wire   n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n1, n2,
         n4, n5, n6;
  wire   [2:0] current_state;

  DFFRQX2M \current_state_reg[2]  ( .D(n17), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  DFFRQX2M \current_state_reg[0]  ( .D(n19), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  DFFRQX2M \current_state_reg[1]  ( .D(n18), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  CLKXOR2X2M U3 ( .A(n4), .B(n6), .Y(n8) );
  NAND2X2M U4 ( .A(n8), .B(n5), .Y(Mux_Sel[0]) );
  INVX2M U5 ( .A(n15), .Y(n1) );
  OAI221X1M U6 ( .A0(n4), .A1(n13), .B0(n2), .B1(n6), .C0(n14), .Y(n18) );
  INVX2M U7 ( .A(n7), .Y(ser_en) );
  OAI211X2M U8 ( .A0(n8), .A1(DATA_VALID), .B0(n5), .C0(n9), .Y(n7) );
  INVX2M U9 ( .A(n11), .Y(n2) );
  NAND3X2M U10 ( .A(n6), .B(n5), .C(n2), .Y(n13) );
  OR2X2M U11 ( .A(n12), .B(n1), .Y(Mux_Sel[1]) );
  NOR2X2M U12 ( .A(n9), .B(current_state[2]), .Y(n12) );
  NAND2X2M U13 ( .A(current_state[1]), .B(current_state[0]), .Y(n9) );
  NAND3X2M U14 ( .A(n4), .B(n5), .C(current_state[1]), .Y(n15) );
  INVX2M U15 ( .A(current_state[2]), .Y(n5) );
  INVX2M U16 ( .A(current_state[1]), .Y(n6) );
  INVX2M U17 ( .A(current_state[0]), .Y(n4) );
  OAI32X1M U18 ( .A0(DATA_VALID), .A1(current_state[1]), .A2(current_state[0]), 
        .B0(ser_done), .B1(n15), .Y(n11) );
  OAI2BB2X1M U19 ( .B0(n16), .B1(n8), .A0N(n5), .A1N(n8), .Y(Busy) );
  AOI21X2M U20 ( .A0(current_state[2]), .A1(n9), .B0(n12), .Y(n16) );
  NOR2X2M U21 ( .A(n10), .B(n11), .Y(n17) );
  AOI2B1X1M U22 ( .A1N(PAR_EN), .A0(n1), .B0(n12), .Y(n10) );
  OAI21X2M U23 ( .A0(current_state[0]), .A1(n13), .B0(n14), .Y(n19) );
  NAND3X2M U24 ( .A(n2), .B(n1), .C(PAR_EN), .Y(n14) );
endmodule


module UART_TX_DATA_WIDTH8 ( CLK, RST, PAR_TYP, PAR_EN, P_DATA, DATA_VALID, 
        TX_OUT, Busy );
  input [7:0] P_DATA;
  input CLK, RST, PAR_TYP, PAR_EN, DATA_VALID;
  output TX_OUT, Busy;
  wire   ser_data, par_bit, ser_en, ser_done, n1, n2;
  wire   [1:0] Mux_Sel;

  MUX MUX_TOP ( .Mux_Sel(Mux_Sel), .start_bit(1'b0), .stop_bit(1'b1), 
        .ser_data(ser_data), .par_bit(par_bit), .TX_OUT(TX_OUT) );
  Parity_Calc Parity_Calc_TOP ( .CLK(CLK), .RST(n1), .P_DATA(P_DATA), 
        .DATA_VALID(DATA_VALID), .PAR_EN(PAR_EN), .PAR_TYP(PAR_TYP), .Busy(
        Busy), .par_bit(par_bit) );
  serializer serializer_TOP ( .CLK(CLK), .RST(n1), .P_DATA(P_DATA), .ser_en(
        ser_en), .ser_done(ser_done), .ser_data(ser_data) );
  FSM_UART_TX FSM_UART_TX_TOP ( .CLK(CLK), .RST(n1), .PAR_EN(PAR_EN), 
        .DATA_VALID(DATA_VALID), .ser_done(ser_done), .ser_en(ser_en), 
        .Mux_Sel(Mux_Sel), .Busy(Busy) );
  INVX2M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(RST), .Y(n2) );
endmodule


module UART_DATA_WIDTH8 ( RX_IN, Prescale, RX_CLK, RST, RX_OUT_P, RX_OUT_V, 
        PAR_EN, PAR_TYP, par_err, stp_err, TX_CLK, TX_IN_P, TX_IN_V, TX_OUT_S, 
        Busy );
  input [5:0] Prescale;
  output [7:0] RX_OUT_P;
  input [7:0] TX_IN_P;
  input RX_IN, RX_CLK, RST, PAR_EN, PAR_TYP, TX_CLK, TX_IN_V;
  output RX_OUT_V, par_err, stp_err, TX_OUT_S, Busy;


  UART_RX_DATA_WIDTH8 UART_TOP_RX ( .RX_IN(RX_IN), .Prescale(Prescale), 
        .PAR_EN(PAR_EN), .PAR_TYP(PAR_TYP), .CLK(RX_CLK), .RST(RST), .P_DATA(
        RX_OUT_P), .par_err(par_err), .stp_err(stp_err), .data_valid(RX_OUT_V)
         );
  UART_TX_DATA_WIDTH8 UART_TOP_TX ( .CLK(TX_CLK), .RST(RST), .PAR_TYP(PAR_TYP), 
        .PAR_EN(PAR_EN), .P_DATA(TX_IN_P), .DATA_VALID(TX_IN_V), .TX_OUT(
        TX_OUT_S), .Busy(Busy) );
endmodule


module pulse_gen_1 ( clk, rst, in_sig, puls_sig );
  input clk, rst, in_sig;
  output puls_sig;
  wire   enable_f;

  DFFRQX2M enable_f_reg ( .D(in_sig), .CK(clk), .RN(rst), .Q(enable_f) );
  NOR2BX2M U3 ( .AN(in_sig), .B(enable_f), .Y(puls_sig) );
endmodule


module bit_sync_BUS_WIDTH8_NUM_OF_STAGE2 ( clk, rst, ASYNC, SYNC );
  input clk, rst, ASYNC;
  output SYNC;

  wire   [1:0] sync_reg;

  DFFRQX2M SYNC_reg ( .D(sync_reg[1]), .CK(clk), .RN(rst), .Q(SYNC) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(ASYNC), .CK(clk), .RN(rst), .Q(sync_reg[0])
         );
  DFFRQX2M \sync_reg_reg[1]  ( .D(sync_reg[0]), .CK(clk), .RN(rst), .Q(
        sync_reg[1]) );
endmodule


module DATA_SYNC_BUS_WIDTH8_NUM_OF_STAGE2 ( unsync_bus, bus_enable, clk, rst, 
        sync_bus, enable_puls );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input bus_enable, clk, rst;
  output enable_puls;
  wire   pulse_enable_sync, enable_pulse_d, n1, n2, n3;
  wire   [7:0] sync_bus_c;
  wire   [7:0] unsync_bus_c;

  pulse_gen_1 pulse_gen_TOP ( .clk(clk), .rst(n1), .in_sig(pulse_enable_sync), 
        .puls_sig(enable_pulse_d) );
  bit_sync_BUS_WIDTH8_NUM_OF_STAGE2 bit_sync_TOP ( .clk(clk), .rst(n1), 
        .ASYNC(bus_enable), .SYNC(pulse_enable_sync) );
  DFFRQX2M \unsync_bus_c_reg[7]  ( .D(unsync_bus[7]), .CK(clk), .RN(n1), .Q(
        unsync_bus_c[7]) );
  DFFRQX2M \unsync_bus_c_reg[6]  ( .D(unsync_bus[6]), .CK(clk), .RN(n1), .Q(
        unsync_bus_c[6]) );
  DFFRQX2M \unsync_bus_c_reg[5]  ( .D(unsync_bus[5]), .CK(clk), .RN(n1), .Q(
        unsync_bus_c[5]) );
  DFFRQX2M \unsync_bus_c_reg[4]  ( .D(unsync_bus[4]), .CK(clk), .RN(n1), .Q(
        unsync_bus_c[4]) );
  DFFRQX2M \unsync_bus_c_reg[3]  ( .D(unsync_bus[3]), .CK(clk), .RN(n1), .Q(
        unsync_bus_c[3]) );
  DFFRQX2M \unsync_bus_c_reg[2]  ( .D(unsync_bus[2]), .CK(clk), .RN(n1), .Q(
        unsync_bus_c[2]) );
  DFFRQX2M \unsync_bus_c_reg[1]  ( .D(unsync_bus[1]), .CK(clk), .RN(n1), .Q(
        unsync_bus_c[1]) );
  DFFRQX2M \unsync_bus_c_reg[0]  ( .D(unsync_bus[0]), .CK(clk), .RN(n1), .Q(
        unsync_bus_c[0]) );
  DFFRQX2M \sync_bus_reg[7]  ( .D(sync_bus_c[7]), .CK(clk), .RN(n1), .Q(
        sync_bus[7]) );
  DFFRQX2M \sync_bus_reg[5]  ( .D(sync_bus_c[5]), .CK(clk), .RN(n1), .Q(
        sync_bus[5]) );
  DFFRQX2M \sync_bus_reg[6]  ( .D(sync_bus_c[6]), .CK(clk), .RN(n1), .Q(
        sync_bus[6]) );
  DFFRQX2M \sync_bus_reg[4]  ( .D(sync_bus_c[4]), .CK(clk), .RN(n1), .Q(
        sync_bus[4]) );
  DFFRQX2M \sync_bus_reg[3]  ( .D(sync_bus_c[3]), .CK(clk), .RN(n1), .Q(
        sync_bus[3]) );
  DFFRQX2M \sync_bus_reg[0]  ( .D(sync_bus_c[0]), .CK(clk), .RN(n1), .Q(
        sync_bus[0]) );
  DFFRQX2M \sync_bus_reg[2]  ( .D(sync_bus_c[2]), .CK(clk), .RN(n1), .Q(
        sync_bus[2]) );
  DFFRQX2M \sync_bus_reg[1]  ( .D(sync_bus_c[1]), .CK(clk), .RN(n1), .Q(
        sync_bus[1]) );
  DFFRQX2M enable_puls_reg ( .D(enable_pulse_d), .CK(clk), .RN(n1), .Q(
        enable_puls) );
  INVX2M U3 ( .A(enable_pulse_d), .Y(n3) );
  INVX2M U4 ( .A(n2), .Y(n1) );
  INVX2M U5 ( .A(rst), .Y(n2) );
  AO22X1M U6 ( .A0(unsync_bus_c[0]), .A1(enable_pulse_d), .B0(sync_bus[0]), 
        .B1(n3), .Y(sync_bus_c[0]) );
  AO22X1M U7 ( .A0(unsync_bus_c[1]), .A1(enable_pulse_d), .B0(sync_bus[1]), 
        .B1(n3), .Y(sync_bus_c[1]) );
  AO22X1M U8 ( .A0(unsync_bus_c[2]), .A1(enable_pulse_d), .B0(sync_bus[2]), 
        .B1(n3), .Y(sync_bus_c[2]) );
  AO22X1M U9 ( .A0(unsync_bus_c[3]), .A1(enable_pulse_d), .B0(sync_bus[3]), 
        .B1(n3), .Y(sync_bus_c[3]) );
  AO22X1M U10 ( .A0(unsync_bus_c[4]), .A1(enable_pulse_d), .B0(sync_bus[4]), 
        .B1(n3), .Y(sync_bus_c[4]) );
  AO22X1M U11 ( .A0(unsync_bus_c[5]), .A1(enable_pulse_d), .B0(sync_bus[5]), 
        .B1(n3), .Y(sync_bus_c[5]) );
  AO22X1M U12 ( .A0(unsync_bus_c[6]), .A1(enable_pulse_d), .B0(sync_bus[6]), 
        .B1(n3), .Y(sync_bus_c[6]) );
  AO22X1M U13 ( .A0(unsync_bus_c[7]), .A1(enable_pulse_d), .B0(sync_bus[7]), 
        .B1(n3), .Y(sync_bus_c[7]) );
endmodule


module SYS_CTRL_DATA_WIDTH8_ADDR_WIDTH4 ( CLK, RST, RdData_Valid, RdData, 
        RX_D_VLD, RX_P_DATA, FIFO_FULL, OUT_VALID, ALU_OUT, ALU_EN, ALU_FUN, 
        CLK_EN, Address, WrEn, RdEn, WrData, TX_P_DATA, TX_D_VLD, CLK_DIV_EN
 );
  input [7:0] RdData;
  input [7:0] RX_P_DATA;
  input [7:0] ALU_OUT;
  output [3:0] ALU_FUN;
  output [3:0] Address;
  output [7:0] WrData;
  output [7:0] TX_P_DATA;
  input CLK, RST, RdData_Valid, RX_D_VLD, FIFO_FULL, OUT_VALID;
  output ALU_EN, CLK_EN, WrEn, RdEn, TX_D_VLD, CLK_DIV_EN;
  wire   n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n1, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n100
;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  wire   [2:0] internal_current_state;
  assign CLK_DIV_EN = 1'b1;

  DFFRQX2M \Address_reg[1]  ( .D(n94), .CK(CLK), .RN(RST), .Q(Address[1]) );
  DFFRQX2M \Address_reg[2]  ( .D(n95), .CK(CLK), .RN(RST), .Q(Address[2]) );
  DFFRQX2M \Address_reg[3]  ( .D(n96), .CK(CLK), .RN(RST), .Q(Address[3]) );
  DFFRQX2M \Address_reg[0]  ( .D(n93), .CK(CLK), .RN(RST), .Q(Address[0]) );
  DFFRQX2M \internal_current_state_reg[2]  ( .D(n98), .CK(CLK), .RN(RST), .Q(
        internal_current_state[2]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  DFFRQX2M \internal_current_state_reg[1]  ( .D(n97), .CK(CLK), .RN(RST), .Q(
        internal_current_state[1]) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  DFFRQX2M \internal_current_state_reg[0]  ( .D(n99), .CK(CLK), .RN(RST), .Q(
        internal_current_state[0]) );
  OAI22X1M U3 ( .A0(n7), .A1(n25), .B0(n90), .B1(n26), .Y(ALU_FUN[2]) );
  OAI22X1M U4 ( .A0(n7), .A1(n27), .B0(n90), .B1(n28), .Y(ALU_FUN[1]) );
  OAI22X1M U5 ( .A0(n7), .A1(n29), .B0(n90), .B1(n30), .Y(ALU_FUN[0]) );
  AOI2BB2XLM U6 ( .B0(n12), .B1(n64), .A0N(n53), .A1N(n58), .Y(n85) );
  NOR3X2M U7 ( .A(current_state[0]), .B(current_state[1]), .C(n17), .Y(n89) );
  NOR3X2M U8 ( .A(current_state[0]), .B(current_state[2]), .C(n18), .Y(RdEn)
         );
  NAND2X2M U9 ( .A(n12), .B(n70), .Y(n60) );
  INVX2M U10 ( .A(n70), .Y(n3) );
  INVX2M U11 ( .A(n91), .Y(n7) );
  INVX2M U12 ( .A(n63), .Y(n29) );
  INVX2M U13 ( .A(n49), .Y(n23) );
  INVX2M U14 ( .A(n68), .Y(n25) );
  INVX2M U15 ( .A(n66), .Y(n27) );
  NOR2X2M U16 ( .A(n85), .B(n29), .Y(WrData[0]) );
  NOR2X2M U17 ( .A(n85), .B(n27), .Y(WrData[1]) );
  NOR2X2M U18 ( .A(n85), .B(n25), .Y(WrData[2]) );
  NOR2X2M U19 ( .A(n85), .B(n23), .Y(WrData[3]) );
  INVX2M U20 ( .A(WrEn), .Y(n4) );
  NAND3X2M U21 ( .A(n16), .B(n12), .C(n56), .Y(n70) );
  INVX2M U22 ( .A(n83), .Y(n12) );
  OAI21X2M U23 ( .A0(n52), .A1(n58), .B0(n33), .Y(n91) );
  NAND2X2M U24 ( .A(n82), .B(n89), .Y(n33) );
  OA21X2M U25 ( .A0(n7), .A1(n73), .B0(n79), .Y(n90) );
  NAND2X2M U26 ( .A(n89), .B(n10), .Y(n35) );
  OA21X2M U27 ( .A0(n58), .A1(n54), .B0(n35), .Y(n79) );
  OAI22X1M U28 ( .A0(n7), .A1(n23), .B0(n90), .B1(n24), .Y(ALU_FUN[3]) );
  OAI22X1M U29 ( .A0(n7), .A1(n73), .B0(n79), .B1(n100), .Y(n86) );
  INVX2M U30 ( .A(n88), .Y(TX_D_VLD) );
  AOI211X2M U31 ( .A0(n89), .A1(n6), .B0(n1), .C0(n86), .Y(n88) );
  NOR2X2M U32 ( .A(n24), .B(n31), .Y(n49) );
  NAND2X2M U33 ( .A(n12), .B(RdEn), .Y(n39) );
  NOR2X2M U34 ( .A(n26), .B(n31), .Y(n68) );
  NOR2X2M U35 ( .A(n28), .B(n31), .Y(n66) );
  NOR2X2M U36 ( .A(n30), .B(n31), .Y(n63) );
  INVX2M U37 ( .A(n57), .Y(n10) );
  BUFX2M U38 ( .A(n87), .Y(n1) );
  NOR3BX2M U39 ( .AN(n38), .B(n39), .C(n9), .Y(n87) );
  OAI31X1M U40 ( .A0(n58), .A1(n53), .A2(n31), .B0(n70), .Y(WrEn) );
  NOR2X2M U41 ( .A(n4), .B(n22), .Y(WrData[4]) );
  NOR2X2M U42 ( .A(n4), .B(n21), .Y(WrData[5]) );
  NOR2X2M U43 ( .A(n4), .B(n20), .Y(WrData[6]) );
  NOR2X2M U44 ( .A(n4), .B(n19), .Y(WrData[7]) );
  NOR2X2M U45 ( .A(n78), .B(n73), .Y(n74) );
  NOR2X2M U46 ( .A(n82), .B(n10), .Y(n53) );
  NOR2X2M U47 ( .A(n31), .B(n9), .Y(n56) );
  NAND3X2M U48 ( .A(n26), .B(n24), .C(n30), .Y(n78) );
  NAND2X2M U49 ( .A(n14), .B(n13), .Y(n83) );
  INVX2M U50 ( .A(n80), .Y(n16) );
  INVX2M U51 ( .A(n52), .Y(n6) );
  INVX2M U52 ( .A(n44), .Y(n11) );
  OAI32X1M U53 ( .A0(n54), .A1(n100), .A2(n58), .B0(n71), .B1(n13), .Y(n98) );
  NOR2X2M U54 ( .A(n80), .B(n9), .Y(n64) );
  NOR2X2M U55 ( .A(n73), .B(n74), .Y(n32) );
  OAI211X2M U56 ( .A0(n32), .A1(n33), .B0(n34), .C0(n35), .Y(next_state[2]) );
  NAND4X2M U57 ( .A(n28), .B(n21), .C(n36), .D(n37), .Y(n34) );
  NOR3X2M U58 ( .A(n22), .B(n29), .C(n24), .Y(n37) );
  AND4X2M U59 ( .A(n51), .B(n26), .C(n49), .D(n55), .Y(n42) );
  NOR2X2M U60 ( .A(n28), .B(n21), .Y(n55) );
  NAND2BX2M U61 ( .AN(n89), .B(n58), .Y(CLK_EN) );
  NAND3X2M U62 ( .A(n45), .B(n46), .C(n40), .Y(next_state[0]) );
  NAND3BX2M U63 ( .AN(n56), .B(n12), .C(n16), .Y(n45) );
  NAND4X2M U64 ( .A(n42), .B(n30), .C(n22), .D(n20), .Y(n46) );
  INVX2M U65 ( .A(n58), .Y(n15) );
  NOR3X2M U66 ( .A(internal_current_state[1]), .B(internal_current_state[2]), 
        .C(internal_current_state[0]), .Y(n82) );
  NAND3X2M U67 ( .A(current_state[1]), .B(n17), .C(current_state[0]), .Y(n58)
         );
  NAND3X2M U68 ( .A(n9), .B(n13), .C(internal_current_state[1]), .Y(n52) );
  INVX2M U69 ( .A(internal_current_state[0]), .Y(n9) );
  INVX2M U70 ( .A(current_state[2]), .Y(n17) );
  INVX2M U71 ( .A(RX_D_VLD), .Y(n31) );
  NAND2X2M U72 ( .A(OUT_VALID), .B(n31), .Y(n73) );
  NOR2BX2M U73 ( .AN(RdData_Valid), .B(FIFO_FULL), .Y(n38) );
  INVX2M U74 ( .A(RX_P_DATA[0]), .Y(n30) );
  NAND3X2M U75 ( .A(internal_current_state[0]), .B(n13), .C(
        internal_current_state[1]), .Y(n54) );
  NAND3X2M U76 ( .A(n14), .B(n13), .C(internal_current_state[0]), .Y(n57) );
  INVX2M U77 ( .A(internal_current_state[2]), .Y(n13) );
  INVX2M U78 ( .A(RX_P_DATA[1]), .Y(n28) );
  INVX2M U79 ( .A(current_state[1]), .Y(n18) );
  INVX2M U80 ( .A(RX_P_DATA[3]), .Y(n24) );
  INVX2M U81 ( .A(internal_current_state[1]), .Y(n14) );
  INVX2M U82 ( .A(RX_P_DATA[2]), .Y(n26) );
  AOI222X1M U83 ( .A0(n31), .A1(n10), .B0(n6), .B1(n74), .C0(RX_D_VLD), .C1(
        n82), .Y(n81) );
  OAI33X2M U84 ( .A0(n39), .A1(n38), .A2(n9), .B0(n33), .B1(RX_D_VLD), .B2(n78), .Y(n77) );
  OAI2B2X1M U85 ( .A1N(n71), .A0(n75), .B0(n9), .B1(n71), .Y(n99) );
  AOI211X2M U86 ( .A0(n15), .A1(n5), .B0(n76), .C0(n77), .Y(n75) );
  OAI222X1M U87 ( .A0(OUT_VALID), .A1(n79), .B0(n31), .B1(n11), .C0(
        internal_current_state[0]), .C1(n80), .Y(n76) );
  INVX2M U88 ( .A(n81), .Y(n5) );
  NOR2X2M U89 ( .A(n39), .B(internal_current_state[0]), .Y(n44) );
  NAND3X2M U90 ( .A(n18), .B(n17), .C(current_state[0]), .Y(n80) );
  AO22X1M U91 ( .A0(ALU_OUT[0]), .A1(n86), .B0(RdData[0]), .B1(n1), .Y(
        TX_P_DATA[0]) );
  AO22X1M U92 ( .A0(ALU_OUT[1]), .A1(n86), .B0(RdData[1]), .B1(n1), .Y(
        TX_P_DATA[1]) );
  AO22X1M U93 ( .A0(ALU_OUT[2]), .A1(n86), .B0(RdData[2]), .B1(n1), .Y(
        TX_P_DATA[2]) );
  AO22X1M U94 ( .A0(ALU_OUT[3]), .A1(n86), .B0(RdData[3]), .B1(n1), .Y(
        TX_P_DATA[3]) );
  AO22X1M U95 ( .A0(ALU_OUT[4]), .A1(n86), .B0(RdData[4]), .B1(n1), .Y(
        TX_P_DATA[4]) );
  AO22X1M U96 ( .A0(ALU_OUT[5]), .A1(n86), .B0(RdData[5]), .B1(n1), .Y(
        TX_P_DATA[5]) );
  AO22X1M U97 ( .A0(ALU_OUT[6]), .A1(n86), .B0(RdData[6]), .B1(n1), .Y(
        TX_P_DATA[6]) );
  AO22X1M U98 ( .A0(ALU_OUT[7]), .A1(n86), .B0(RdData[7]), .B1(n1), .Y(
        TX_P_DATA[7]) );
  NAND2X2M U99 ( .A(n79), .B(n92), .Y(ALU_EN) );
  OAI21X2M U100 ( .A0(n74), .A1(RX_D_VLD), .B0(n91), .Y(n92) );
  INVX2M U101 ( .A(OUT_VALID), .Y(n100) );
  OAI222X1M U102 ( .A0(n8), .A1(n58), .B0(n100), .B1(n35), .C0(n14), .C1(n71), 
        .Y(n97) );
  INVX2M U103 ( .A(n72), .Y(n8) );
  OAI222X1M U104 ( .A0(n31), .A1(n57), .B0(n52), .B1(n32), .C0(n54), .C1(
        OUT_VALID), .Y(n72) );
  OAI221X1M U105 ( .A0(n57), .A1(n58), .B0(n59), .B1(n60), .C0(n61), .Y(n93)
         );
  NAND2X2M U106 ( .A(Address[0]), .B(n3), .Y(n61) );
  AOI22X1M U107 ( .A0(n62), .A1(n63), .B0(n64), .B1(RX_P_DATA[0]), .Y(n59) );
  NOR4X1M U108 ( .A(n19), .B(current_state[0]), .C(current_state[1]), .D(
        current_state[2]), .Y(n51) );
  AOI2BB1X2M U109 ( .A0N(RdEn), .A1N(n16), .B0(internal_current_state[0]), .Y(
        n62) );
  OAI211X2M U110 ( .A0(n38), .A1(n39), .B0(n40), .C0(n41), .Y(next_state[1])
         );
  AOI31X2M U111 ( .A0(n42), .A1(RX_P_DATA[4]), .A2(n43), .B0(n44), .Y(n41) );
  NOR2X2M U112 ( .A(RX_P_DATA[6]), .B(n30), .Y(n43) );
  AND3X2M U113 ( .A(n51), .B(RX_P_DATA[2]), .C(RX_P_DATA[6]), .Y(n36) );
  OAI2BB2X1M U114 ( .B0(n69), .B1(n60), .A0N(Address[3]), .A1N(n3), .Y(n96) );
  AOI22X1M U115 ( .A0(n62), .A1(n49), .B0(n64), .B1(RX_P_DATA[3]), .Y(n69) );
  OAI2BB2X1M U116 ( .B0(n67), .B1(n60), .A0N(Address[2]), .A1N(n3), .Y(n95) );
  AOI22X1M U117 ( .A0(n68), .A1(n62), .B0(n64), .B1(RX_P_DATA[2]), .Y(n67) );
  OAI2BB2X1M U118 ( .B0(n65), .B1(n60), .A0N(Address[1]), .A1N(n3), .Y(n94) );
  AOI22X1M U119 ( .A0(n66), .A1(n62), .B0(n64), .B1(RX_P_DATA[1]), .Y(n65) );
  OAI22X1M U120 ( .A0(n31), .A1(n83), .B0(n16), .B1(n84), .Y(n71) );
  NOR2X2M U121 ( .A(OUT_VALID), .B(n33), .Y(n84) );
  AOI21BX2M U122 ( .A0(n47), .A1(n15), .B0N(n48), .Y(n40) );
  NAND4X2M U123 ( .A(n36), .B(n30), .C(n49), .D(n50), .Y(n48) );
  OAI211X2M U124 ( .A0(n52), .A1(n32), .B0(n53), .C0(n54), .Y(n47) );
  NOR3X2M U125 ( .A(RX_P_DATA[1]), .B(RX_P_DATA[5]), .C(RX_P_DATA[4]), .Y(n50)
         );
  INVX2M U126 ( .A(RX_P_DATA[4]), .Y(n22) );
  INVX2M U127 ( .A(RX_P_DATA[5]), .Y(n21) );
  INVX2M U128 ( .A(RX_P_DATA[6]), .Y(n20) );
  INVX2M U129 ( .A(RX_P_DATA[7]), .Y(n19) );
endmodule


module SYS_TOP ( RST_N, UART_CLK, REF_CLK, UART_RX_IN, UART_TX_O, parity_error, 
        framing_error );
  input RST_N, UART_CLK, REF_CLK, UART_RX_IN;
  output UART_TX_O, parity_error, framing_error;
  wire   TX_CLK, RX_CLK, WrEn, RdEn, SYNC_REF_RST, RdData_Valid, SYNC_UART_RST,
         TX_D_VLD, r_inc, FIFO_FULL, empty, Busy, CLK_EN, ALU_CLK, ALU_EN,
         OUT_VALID, RX_OUT_V, RX_D_VLD, n2, n3;
  wire   [7:0] REG3;
  wire   [5:0] div_ratio_RX;
  wire   [7:0] REG2;
  wire   [7:0] WrData;
  wire   [3:0] Address;
  wire   [7:0] RdData;
  wire   [7:0] REG0;
  wire   [7:0] REG1;
  wire   [7:0] TX_P_DATA;
  wire   [7:0] FIFO_RdData;
  wire   [3:0] ALU_FUN;
  wire   [7:0] ALU_OUT;
  wire   [7:0] ASYNC_RX_P_DATA;
  wire   [7:0] RX_P_DATA;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4;

  CLK_DIV_0 CLK_DIV_TX ( .i_ref_clk(UART_CLK), .i_rst_n(RST_N), .i_clk_en(1'b1), .i_div_ratio(REG3[5:0]), .o_div_clk(TX_CLK) );
  CLK_DIV_1 CLK_DIV_RX ( .i_ref_clk(UART_CLK), .i_rst_n(RST_N), .i_clk_en(1'b1), .i_div_ratio({1'b0, 1'b0, div_ratio_RX[3:2], 1'b0, div_ratio_RX[0]}), 
        .o_div_clk(RX_CLK) );
  Prescale_DATA_WIDTH8 Pre_RX ( .IN_PRE(REG2[7:2]), .div_ratio_RX({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, div_ratio_RX[3:2], 
        SYNOPSYS_UNCONNECTED__2, div_ratio_RX[0]}) );
  Reg_File_DATA_WIDTH8_ADDR_WIDTH4_DEPTH16 Reg_File_SYS_TOP ( .WrData(WrData), 
        .Address({Address[3:1], n2}), .WrEn(WrEn), .RdEn(RdEn), .CLK(REF_CLK), 
        .RST(SYNC_REF_RST), .RdData_Valid(RdData_Valid), .RdData(RdData), 
        .REG0(REG0), .REG1(REG1), .REG2(REG2), .REG3({SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, REG3[5:0]}) );
  RST_SYNC_NUM_OF_STAGE2_0 RST_SYNC_REG_FILE ( .clk(REF_CLK), .rst(RST_N), 
        .sync_rst(SYNC_REF_RST) );
  RST_SYNC_NUM_OF_STAGE2_1 RST_SYNC_ASYNC_FIFO ( .clk(UART_CLK), .rst(RST_N), 
        .sync_rst(SYNC_UART_RST) );
  ASYNC_FIFO_DATA_WIDTH8_ADDR_WIDTH4_NUM_OF_STAGE2 ASYNC_FIFO_SYS_TOP ( 
        .w_clk(REF_CLK), .w_rst(SYNC_REF_RST), .w_inc(TX_D_VLD), .r_clk(TX_CLK), .r_rst(SYNC_UART_RST), .r_inc(r_inc), .w_data(TX_P_DATA), .r_data(
        FIFO_RdData), .full(FIFO_FULL), .empty(empty) );
  pulse_gen_0 pulse_gen_SYS_TOP ( .clk(TX_CLK), .rst(SYNC_UART_RST), .in_sig(
        Busy), .puls_sig(r_inc) );
  Clock_gating Clock_gating_SYS_TOP ( .CLK(REF_CLK), .CLK_EN(CLK_EN), 
        .GATED_CLK(ALU_CLK) );
  ALU_DATA_WIDTH8 ALU_SYS_TOP ( .A(REG0), .B(REG1), .ALU_FUN(ALU_FUN), .CLK(
        ALU_CLK), .RST(SYNC_REF_RST), .Enable(ALU_EN), .ALU_OUT(ALU_OUT), 
        .OUT_VALID(OUT_VALID) );
  UART_DATA_WIDTH8 UART_SYS_TOP ( .RX_IN(UART_RX_IN), .Prescale(REG2[7:2]), 
        .RX_CLK(RX_CLK), .RST(SYNC_UART_RST), .RX_OUT_P(ASYNC_RX_P_DATA), 
        .RX_OUT_V(RX_OUT_V), .PAR_EN(REG2[0]), .PAR_TYP(REG2[1]), .par_err(
        parity_error), .stp_err(framing_error), .TX_CLK(TX_CLK), .TX_IN_P(
        FIFO_RdData), .TX_IN_V(n3), .TX_OUT_S(UART_TX_O), .Busy(Busy) );
  DATA_SYNC_BUS_WIDTH8_NUM_OF_STAGE2 DATA_SYNC_SYS_TOP ( .unsync_bus(
        ASYNC_RX_P_DATA), .bus_enable(RX_OUT_V), .clk(REF_CLK), .rst(
        SYNC_REF_RST), .sync_bus(RX_P_DATA), .enable_puls(RX_D_VLD) );
  SYS_CTRL_DATA_WIDTH8_ADDR_WIDTH4 SYS_CTRL_SYS_TOP ( .CLK(REF_CLK), .RST(
        SYNC_REF_RST), .RdData_Valid(RdData_Valid), .RdData(RdData), 
        .RX_D_VLD(RX_D_VLD), .RX_P_DATA(RX_P_DATA), .FIFO_FULL(FIFO_FULL), 
        .OUT_VALID(OUT_VALID), .ALU_OUT(ALU_OUT), .ALU_EN(ALU_EN), .ALU_FUN(
        ALU_FUN), .CLK_EN(CLK_EN), .Address(Address), .WrEn(WrEn), .RdEn(RdEn), 
        .WrData(WrData), .TX_P_DATA(TX_P_DATA), .TX_D_VLD(TX_D_VLD) );
  INVX2M U2 ( .A(empty), .Y(n3) );
  BUFX2M U3 ( .A(Address[0]), .Y(n2) );
endmodule

