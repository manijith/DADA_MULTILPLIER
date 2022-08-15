`timescale 1ns / 1ps
module dadda_multiplier(input [15:0] multpr,multpcd,output [31:0] product);


//for partial products internal wires
wire [15:0] pt_prdct [15:0];

//for second layer internal wires
wire [18:13] seclay_1;
wire [19:14] seclay_2;
wire [17:14] seclay_3;
wire [18:15] seclay_4;
wire [16:15] seclay_5;
wire [17:16] seclay_6;

//for third layer internal wires
wire [22:9] trdlay_1;
wire [23:10] trdlay_2;
wire [21:10] trdlay_3;
wire [22:11] trdlay_4;
wire [20:11] trdlay_5;
wire [21:12] trdlay_6;
wire [19:12] trdlay_7;
wire [20:13] trdlay_8;

//for frthly layer internal wires

wire [25:6] frthlay_1;
wire [26:7] frthlay_2;
wire [24:7] frthlay_3;
wire [25:8] frthlay_4;
wire [23:8] frthlay_5;
wire [24:9] frthlay_6;

//for fthly layer internal wires
wire [27:4] fthlay_1;
wire [28:5] fthlay_2;
wire [26:5] fthlay_3;
wire [27:6] fthlay_4;


//for sxthly layer internal wires
wire [28:3] sxthlay_1;
wire [29:4] sxthlay_2;
//for svntly layer internal wires
wire [31:0] svntlay_1,svntlay_2;


genvar i;

generate
for(i=0;i<16;i=i+1) begin:partial_products
and_g p1 (multpr[i],multpcd[0],pt_prdct[0][i]);
and_g p2(multpr[i],multpcd[1],pt_prdct[1][i]);
and_g p3(multpr[i],multpcd[2],pt_prdct[2][i]);
and_g p4(multpr[i],multpcd[3],pt_prdct[3][i]);
and_g p5(multpr[i],multpcd[4],pt_prdct[4][i]);
and_g p6(multpr[i],multpcd[5],pt_prdct[5][i]);
and_g p7(multpr[i],multpcd[6],pt_prdct[6][i]);
and_g p8(multpr[i],multpcd[7],pt_prdct[7][i]);
and_g p9(multpr[i],multpcd[8],pt_prdct[8][i]);
and_g p10(multpr[i],multpcd[9],pt_prdct[9][i]);
and_g p11(multpr[i],multpcd[10],pt_prdct[10][i]);
and_g p12(multpr[i],multpcd[11],pt_prdct[11][i]);
and_g p13(multpr[i],multpcd[12],pt_prdct[12][i]);
and_g p14(multpr[i],multpcd[13],pt_prdct[13][i]);
and_g p15(multpr[i],multpcd[14],pt_prdct[14][i]);
and_g p16(multpr[i],multpcd[15],pt_prdct[15][i]);

end
endgenerate

// first stage reduction
half_adder h1(pt_prdct[0][13],pt_prdct[1][12],seclay_1[13],seclay_2[14]);
half_adder h2(pt_prdct[3][11],pt_prdct[4][10],seclay_3[14],seclay_4[15]);
full_adder f1(pt_prdct[0][14],pt_prdct[1][13],pt_prdct[2][12],seclay_1[14],seclay_2[15]);
full_adder f2(pt_prdct[0][15],pt_prdct[1][14],pt_prdct[2][13],seclay_1[15],seclay_2[16]);
full_adder f3(pt_prdct[3][12],pt_prdct[4][11],pt_prdct[5][10],seclay_3[15],seclay_4[16]);
half_adder h3(pt_prdct[6][9],pt_prdct[7][8],seclay_5[15],seclay_6[16]);
full_adder f4(pt_prdct[1][15],pt_prdct[2][14],pt_prdct[3][13],seclay_1[16],seclay_2[17]);
full_adder f5(pt_prdct[4][12],pt_prdct[5][11],pt_prdct[6][10],seclay_3[16],seclay_4[17]);
half_adder h4(pt_prdct[7][9],pt_prdct[8][8],seclay_5[16],seclay_6[17]);
full_adder f8(pt_prdct[2][15],pt_prdct[3][14],pt_prdct[4][13],seclay_1[17],seclay_2[18]);
full_adder f6(pt_prdct[5][12],pt_prdct[6][11],pt_prdct[7][10],seclay_3[17],seclay_4[18]);
full_adder f7(pt_prdct[3][15],pt_prdct[4][14],pt_prdct[5][13],seclay_1[18],seclay_2[19]);

// seclayond stage reduction

half_adder h6(pt_prdct[0][9],pt_prdct[1][8],trdlay_1[9],trdlay_2[10]);
full_adder f9(pt_prdct[0][10],pt_prdct[1][9],pt_prdct[2][8],trdlay_1[10],trdlay_2[11]);
half_adder h5(pt_prdct[3][7],pt_prdct[4][6],trdlay_3[10],trdlay_4[11]);

full_adder f10(pt_prdct[0][11],pt_prdct[1][10],pt_prdct[2][9],trdlay_1[11],trdlay_2[12]);
full_adder f11(pt_prdct[3][8],pt_prdct[4][7],pt_prdct[5][6],trdlay_3[11],trdlay_4[12]);
half_adder h7(pt_prdct[6][5],pt_prdct[7][4],trdlay_5[11],trdlay_6[12]);

full_adder f12(pt_prdct[0][12],pt_prdct[1][11],pt_prdct[2][10],trdlay_1[12],trdlay_2[13]);
full_adder f13(pt_prdct[3][9],pt_prdct[4][8],pt_prdct[5][7],trdlay_3[12],trdlay_4[13]);
full_adder f14(pt_prdct[6][6],pt_prdct[7][5],pt_prdct[8][4],trdlay_5[12],trdlay_6[13]);
half_adder h8(pt_prdct[9][3],pt_prdct[10][2],trdlay_7[12],trdlay_8[13]);


full_adder f15(pt_prdct[2][11],pt_prdct[3][10],pt_prdct[4][9],trdlay_1[13],trdlay_2[14]);
full_adder f16(pt_prdct[5][8],pt_prdct[6][7],pt_prdct[7][6],trdlay_3[13],trdlay_4[14]);
full_adder f17(pt_prdct[8][5],pt_prdct[9][4],pt_prdct[10][3],trdlay_5[13],trdlay_6[14]);
full_adder f18(pt_prdct[11][2],pt_prdct[12][1],pt_prdct[13][0],trdlay_7[13],trdlay_8[14]);

full_adder f19(pt_prdct[5][9],seclay_1[14],seclay_3[14],trdlay_1[14],trdlay_2[15]);
full_adder f20(pt_prdct[6][8],pt_prdct[7][7],pt_prdct[8][6],trdlay_3[14],trdlay_4[15]);
full_adder f21(pt_prdct[9][5],pt_prdct[10][4],pt_prdct[11][3],trdlay_5[14],trdlay_6[15]);
full_adder f22(pt_prdct[13][1],pt_prdct[14][0],pt_prdct[12][2],trdlay_7[14],trdlay_8[15]);

full_adder f23(seclay_1[15],seclay_2[15],seclay_3[15],trdlay_1[15],trdlay_2[16]);
full_adder f24(pt_prdct[8][7],pt_prdct[9][6],seclay_5[15],trdlay_3[15],trdlay_4[16]);
full_adder f25(pt_prdct[10][5],pt_prdct[11][4],pt_prdct[12][3],trdlay_5[15],trdlay_6[16]);
full_adder f26(pt_prdct[13][2],pt_prdct[14][1],pt_prdct[15][0],trdlay_7[15],trdlay_8[16]);


full_adder f27(seclay_1[16],seclay_2[16],seclay_3[16],trdlay_1[16],trdlay_2[17]);
full_adder f28(pt_prdct[9][7],seclay_5[16],seclay_6[16],trdlay_3[16],trdlay_4[17]);
full_adder f29(pt_prdct[10][6],pt_prdct[11][5],pt_prdct[12][4],trdlay_5[16],trdlay_6[17]);
full_adder f30(pt_prdct[13][3],pt_prdct[14][2],pt_prdct[15][1],trdlay_7[16],trdlay_8[17]);

full_adder f31(seclay_1[17],seclay_2[17],seclay_3[17],trdlay_1[17],trdlay_2[18]);
full_adder f32(pt_prdct[9][8],pt_prdct[8][9],seclay_6[17],trdlay_3[17],trdlay_4[18]);
full_adder f33(pt_prdct[10][7],pt_prdct[11][6],pt_prdct[12][5],trdlay_5[17],trdlay_6[18]);
full_adder f34(pt_prdct[13][4],pt_prdct[14][3],pt_prdct[15][2],trdlay_7[17],trdlay_8[18]);


full_adder f35(seclay_1[18],seclay_2[18],pt_prdct[6][12],trdlay_1[18],trdlay_2[19]);
full_adder f36(pt_prdct[9][9],pt_prdct[8][10],pt_prdct[7][11],trdlay_3[18],trdlay_4[19]);
full_adder f37(pt_prdct[10][8],pt_prdct[11][7],pt_prdct[12][6],trdlay_5[18],trdlay_6[19]);
full_adder f38(pt_prdct[13][5],pt_prdct[14][4],pt_prdct[15][3],trdlay_7[18],trdlay_8[19]);


full_adder f39(pt_prdct[4][15],pt_prdct[5][14],pt_prdct[6][13],trdlay_1[19],trdlay_2[20]);
full_adder f40(pt_prdct[7][12],pt_prdct[8][11],pt_prdct[9][10],trdlay_3[19],trdlay_4[20]);
full_adder f41(pt_prdct[10][9],pt_prdct[11][8],pt_prdct[12][7],trdlay_5[19],trdlay_6[20]);
full_adder f42(pt_prdct[13][6],pt_prdct[14][5],pt_prdct[15][4],trdlay_7[19],trdlay_8[20]);


full_adder f420(pt_prdct[5][15],pt_prdct[6][14],pt_prdct[7][13],trdlay_1[20],trdlay_2[21]);
full_adder f43(pt_prdct[8][12],pt_prdct[9][11],pt_prdct[10][10],trdlay_3[20],trdlay_4[21]);
full_adder f44(pt_prdct[11][9],pt_prdct[12][8],pt_prdct[13][7],trdlay_5[20],trdlay_6[21]);
full_adder f45(pt_prdct[6][15],pt_prdct[7][14],pt_prdct[8][13],trdlay_1[21],trdlay_2[22]);
full_adder f46(pt_prdct[9][12],pt_prdct[10][11],pt_prdct[11][10],trdlay_3[21],trdlay_4[22]);
full_adder f47(pt_prdct[7][15],pt_prdct[8][14],pt_prdct[9][13],trdlay_1[22],trdlay_2[23]);



// trdlay stage reduction
half_adder h9 (pt_prdct[0][6],pt_prdct[1][5],frthlay_1[6],frthlay_2[7]);
full_adder f48 (pt_prdct[0][7],pt_prdct[1][6],pt_prdct[2][5],frthlay_1[7],frthlay_2[8]);
half_adder h10 (pt_prdct[3][4],pt_prdct[4][3],frthlay_3[7],frthlay_4[8]);
full_adder f49 (pt_prdct[0][8],pt_prdct[1][7],pt_prdct[2][6],frthlay_1[8],frthlay_2[9]);
full_adder f50 (pt_prdct[3][5],pt_prdct[4][4],pt_prdct[5][3],frthlay_3[8],frthlay_4[9]);
half_adder h11 (pt_prdct[6][2],pt_prdct[7][1],frthlay_5[8],frthlay_6[9]);



full_adder f51 (pt_prdct[2][7],pt_prdct[3][6],trdlay_1[9],frthlay_1[9],frthlay_2[10]);
full_adder f52 (pt_prdct[4][5],pt_prdct[5][4],pt_prdct[6][3],frthlay_3[9],frthlay_4[10]);
full_adder f53 (pt_prdct[7][2],pt_prdct[8][1],pt_prdct[9][0],frthlay_5[9],frthlay_6[10]);


full_adder f54 (trdlay_1[10],trdlay_2[10],trdlay_3[10],frthlay_1[10],frthlay_2[11]);
full_adder f55 (pt_prdct[5][5],pt_prdct[6][4],pt_prdct[7][3],frthlay_3[10],frthlay_4[11]);
full_adder f56 (pt_prdct[8][2],pt_prdct[9][1],pt_prdct[10][0],frthlay_5[10],frthlay_6[11]);


full_adder f57 (trdlay_1[11],trdlay_2[11],trdlay_3[11],frthlay_1[11],frthlay_2[12]);
full_adder f58 (trdlay_4[11],trdlay_5[11],pt_prdct[8][3],frthlay_3[11],frthlay_4[12]);
full_adder f59 (pt_prdct[11][0],pt_prdct[9][2],pt_prdct[10][1],frthlay_5[11],frthlay_6[12]);


full_adder f60 (trdlay_1[12],trdlay_2[12],trdlay_3[12],frthlay_1[12],frthlay_2[13]);
full_adder f61 (trdlay_4[12],trdlay_5[12],trdlay_6[12],frthlay_3[12],frthlay_4[13]);
full_adder f62 (trdlay_7[12],pt_prdct[11][1],pt_prdct[12][0],frthlay_5[12],frthlay_6[13]);
full_adder f63 (trdlay_1[13],trdlay_2[13],trdlay_3[13],frthlay_1[13],frthlay_2[14]);
full_adder f64 (trdlay_4[13],trdlay_5[13],trdlay_6[13],frthlay_3[13],frthlay_4[14]);
full_adder f65 (trdlay_7[13],trdlay_8[13],seclay_1[13],frthlay_5[13],frthlay_6[14]);



full_adder f66 (trdlay_1[14],trdlay_2[14],trdlay_3[14],frthlay_1[14],frthlay_2[15]);
full_adder f67 (trdlay_4[14],trdlay_5[14],trdlay_6[14],frthlay_3[14],frthlay_4[15]);
full_adder f68 (trdlay_7[14],trdlay_8[14],seclay_2[14],frthlay_5[14],frthlay_6[15]);
full_adder f69 (trdlay_1[15],trdlay_2[15],trdlay_3[15],frthlay_1[15],frthlay_2[16]);
full_adder f70 (trdlay_4[15],trdlay_5[15],trdlay_6[15],frthlay_3[15],frthlay_4[16]);
full_adder f71 (trdlay_7[15],trdlay_8[15],seclay_4[15],frthlay_5[15],frthlay_6[16]);



full_adder f72 (trdlay_1[16],trdlay_2[16],trdlay_3[16],frthlay_1[16],frthlay_2[17]);
full_adder f73 (trdlay_4[16],trdlay_5[16],trdlay_6[16],frthlay_3[16],frthlay_4[17]);
full_adder f74 (trdlay_7[16],trdlay_8[16],seclay_4[16],frthlay_5[16],frthlay_6[17]);
full_adder f75 (trdlay_1[17],trdlay_2[17],trdlay_3[17],frthlay_1[17],frthlay_2[18]);
full_adder f76 (trdlay_4[17],trdlay_5[17],trdlay_6[17],frthlay_3[17],frthlay_4[18]);
full_adder f77 (trdlay_7[17],trdlay_8[17],seclay_4[17],frthlay_5[17],frthlay_6[18]);

full_adder f78 (trdlay_1[18],trdlay_2[18],trdlay_3[18],frthlay_1[18],frthlay_2[19]);
full_adder f79 (trdlay_4[18],trdlay_5[18],trdlay_6[18],frthlay_3[18],frthlay_4[19]);
full_adder f80 (trdlay_7[18],trdlay_8[18],seclay_4[18],frthlay_5[18],frthlay_6[19]);
full_adder f81 (trdlay_1[19],trdlay_2[19],trdlay_3[19],frthlay_1[19],frthlay_2[20]);
full_adder f82 (trdlay_4[19],trdlay_5[19],trdlay_6[19],frthlay_3[19],frthlay_4[20]);
full_adder f83 (trdlay_7[19],trdlay_8[19],seclay_2[19],frthlay_5[19],frthlay_6[20]);


full_adder f84 (trdlay_1[20],trdlay_2[20],trdlay_3[20],frthlay_1[20],frthlay_2[21]);
full_adder f85 (trdlay_4[20],trdlay_5[20],trdlay_6[20],frthlay_3[20],frthlay_4[21]);
full_adder f86 (trdlay_8[20],pt_prdct[15][5],pt_prdct[14][6],frthlay_5[20],frthlay_6[21]);
full_adder f87 (trdlay_1[21],trdlay_2[21],trdlay_3[21],frthlay_1[21],frthlay_2[22]);
full_adder f88 (trdlay_4[21],trdlay_6[21],pt_prdct[12][9],frthlay_3[21],frthlay_4[22]);
full_adder f89 (pt_prdct[13][8],pt_prdct[15][6],pt_prdct[14][7],frthlay_5[21],frthlay_6[22]);




full_adder f90 (trdlay_1[22],trdlay_2[22],pt_prdct[10][12],frthlay_1[22],frthlay_2[23]);
full_adder f91 (trdlay_4[22],pt_prdct[11][11],pt_prdct[12][10],frthlay_3[22],frthlay_4[23]);
full_adder f92 (pt_prdct[13][9],pt_prdct[14][8],pt_prdct[15][7],frthlay_5[22],frthlay_6[23]);
full_adder f93 (trdlay_2[23],pt_prdct[8][15],pt_prdct[9][14],frthlay_1[23],frthlay_2[24]);
full_adder f94 (pt_prdct[10][13],pt_prdct[11][12],pt_prdct[12][11],frthlay_3[23],frthlay_4[24]);
full_adder f95 (pt_prdct[13][10],pt_prdct[14][9],pt_prdct[15][8],frthlay_5[23],frthlay_6[24]);



full_adder f96 (pt_prdct[9][15],pt_prdct[10][14],pt_prdct[11][13],frthlay_1[24],frthlay_2[25]);
full_adder f97 (pt_prdct[12][12],pt_prdct[13][11],pt_prdct[14][10],frthlay_3[24],frthlay_4[25]);/////doubt
full_adder f98 (pt_prdct[10][15],pt_prdct[11][14],pt_prdct[12][13],frthlay_1[25],frthlay_2[26]);




// frthlay stage reduction

half_adder h50 (pt_prdct[0][4],pt_prdct[1][3],fthlay_1[4],fthlay_2[5]);
full_adder f99(pt_prdct[0][5],pt_prdct[1][4],pt_prdct[2][3],fthlay_1[5],fthlay_2[6]);
half_adder h51 (pt_prdct[3][2],pt_prdct[4][1],fthlay_3[5],fthlay_4[6]);

full_adder f100(frthlay_1[6],pt_prdct[2][4],pt_prdct[3][3],fthlay_1[6],fthlay_2[7]);
full_adder f101(pt_prdct[4][2],pt_prdct[5][1],pt_prdct[6][0],fthlay_3[6],fthlay_4[7]);

full_adder f102 (frthlay_1[7],frthlay_2[7],frthlay_3[7],fthlay_1[7],fthlay_2[8]);
full_adder f103(pt_prdct[5][2],pt_prdct[6][1],pt_prdct[7][0],fthlay_3[7],fthlay_4[8]);




full_adder f104 (frthlay_1[8],frthlay_2[8],frthlay_3[8],fthlay_1[8],fthlay_2[9]);
full_adder f105 (frthlay_4[8],frthlay_5[8],pt_prdct[8][0],fthlay_3[8],fthlay_4[9]);


generate
for(i=9;i<=23;i=i+1) begin:frthlay_stage
full_adder f106 (frthlay_1[i],frthlay_2[i],frthlay_3[i],fthlay_1[i],fthlay_2[i+1]);
full_adder f107 (frthlay_4[i],frthlay_5[i],frthlay_6[i],fthlay_3[i],fthlay_4[i+1]);
end
endgenerate


full_adder f108 (frthlay_1[24],frthlay_2[24],frthlay_3[24],fthlay_1[24],fthlay_2[25]);
full_adder f109 (frthlay_4[24],pt_prdct[15][9],frthlay_6[24],fthlay_3[24],fthlay_4[25]);


full_adder f110 (frthlay_1[25],frthlay_2[25],pt_prdct[13][12],fthlay_1[25],fthlay_2[26]);
full_adder f111 (frthlay_4[25],pt_prdct[14][11],pt_prdct[15][10],fthlay_3[25],fthlay_4[26]);



full_adder f112 (frthlay_2[26],pt_prdct[11][15],pt_prdct[12][14],fthlay_1[26],fthlay_2[27]);
full_adder f113 (pt_prdct[13][13],pt_prdct[14][12],pt_prdct[15][11],fthlay_3[26],fthlay_4[27]);
full_adder f114 (pt_prdct[12][15],pt_prdct[13][14],pt_prdct[14][13],fthlay_1[27],fthlay_2[28]);









//fthlay stage reduction

half_adder h60 (pt_prdct[0][3],pt_prdct[1][2],sxthlay_1[3],sxthlay_2[4]);
full_adder f115 (pt_prdct[2][2],pt_prdct[3][1],pt_prdct[4][0],sxthlay_1[4],sxthlay_2[5]);
full_adder f116 (fthlay_2[5],fthlay_3[5],pt_prdct[5][0],sxthlay_1[5],sxthlay_2[6]);

generate
for(i=6;i<=26;i=i+1) begin:fthlay_stage
full_adder f117 (fthlay_1[i],fthlay_2[i],fthlay_3[i],sxthlay_1[i],sxthlay_2[i+1]);
end
endgenerate
full_adder f118 (fthlay_1[27],fthlay_2[27],pt_prdct[15][12],sxthlay_1[27],sxthlay_2[28]);
full_adder f119 (fthlay_2[28],pt_prdct[13][15],pt_prdct[14][14],sxthlay_1[28],sxthlay_2[29]);


//sxthlay stage reduction


half_adder h61 (pt_prdct[0][2],pt_prdct[1][1],svntlay_1[2],svntlay_2[3]);
full_adder f620 (sxthlay_1[3],pt_prdct[2][1],pt_prdct[3][0],svntlay_1[3],svntlay_2[4]);
generate
for(i=4;i<=5;i=i+1) begin:last_stage
full_adder f120 (sxthlay_1[i],sxthlay_2[i],fthlay_1[i],svntlay_1[i],svntlay_2[i+1]);
end
endgenerate

generate
for(i=6;i<=27;i=i+1) begin:last_stage_2
full_adder f121 (sxthlay_1[i],sxthlay_2[i],fthlay_4[i],svntlay_1[i],svntlay_2[i+1]);
end
endgenerate




full_adder f122 (sxthlay_1[28],sxthlay_2[28],pt_prdct[15][13],svntlay_1[28],svntlay_2[29]);
full_adder f123 (pt_prdct[14][15],sxthlay_2[29],pt_prdct[15][14],svntlay_1[29],svntlay_2[30]);




assign svntlay_1[0]=pt_prdct[0][0];
assign svntlay_2[0]=0;
assign svntlay_1[1]=pt_prdct[0][1];
assign svntlay_2[1]=pt_prdct[1][0];
assign svntlay_2[2]=pt_prdct[2][0];
assign svntlay_1[30]=pt_prdct[15][15];
assign svntlay_1[31]=0;
assign svntlay_2[31]=0;
wire [0:0] cin;

brentkung_adder b1 (svntlay_1,svntlay_2,product,0,cin);

endmodule



// half adder
module half_adder(input a,b,output sum,cout);
assign sum=a^b;
assign cout=a & b;
endmodule

// Full adder
module full_adder(input a,b,cin,output sum,cout);
assign sum=a^b^cin;
assign cout=a & b | (cin &(a | b));
endmodule

// Brent Kung Adder
module brentkung_adder(input [31:0] a,b,output [31:0] sum,input cin,output cout);
wire [31:0] gen_1,prop_1;
wire [15:0] gen_2,prop_2;
wire [7:0] gen_3,prop_3;
wire [3:0] gen_4,prop_4;
wire [1:0] gen_5,prop_5;
wire  gen_6,prop_6;
wire [31:0] carry;
assign carry[0]=cin;
genvar i;

generate
for(i=0;i<32;i=i+1) begin:first_order
assign gen_1[i]=a[i] & b[i];
assign prop_1[i]=a[i] ^ b[i];
end
endgenerate

generate
for(i=0;i<16;i=i+1) begin:seclayond_order
generation g2 (gen_1[2*i+1],prop_1[2*i+1],gen_1[2*i],gen_2[i]);
and_g p2 (prop_1[2*i+1],prop_1[2*i],prop_2[i]);
end
endgenerate

generate
for(i=0;i<8;i=i+1) begin:trdlay_order
generation g3 (gen_2[2*i+1],prop_2[2*i+1],gen_2[2*i],gen_3[i]);
and_g p3 (prop_2[2*i+1],prop_2[2*i],prop_3[i]);
end
endgenerate

generate
for(i=0;i<4;i=i+1) begin:frthlay_order
generation g4 (gen_3[2*i+1],prop_3[2*i+1],gen_3[2*i],gen_4[i]);
and_g p4 (prop_3[2*i+1],prop_3[2*i],prop_4[i]);
end
endgenerate

generate
for(i=0;i<2;i=i+1) begin:fthlay_order
generation g5 (gen_4[2*i+1],prop_4[2*i+1],gen_4[2*i],gen_5[i]);
and_g p5 (prop_4[2*i+1],prop_4[2*i],prop_5[i]);
end
endgenerate

generate
for(i=0;i<16;i=i+1) begin:carry1
generation g7 (gen_1[2*i],prop_1[2*i],carry[2*i],carry[2*i+1]);
end
endgenerate

generate
for(i=0;i<8;i=i+1) begin:carry2
generation g8 (gen_2[2*i],prop_2[2*i],carry[4*i],carry[4*i+2]);
end
endgenerate

generate
for(i=0;i<4;i=i+1) begin:carry3
generation g9 (gen_3[2*i],prop_3[2*i],carry[8*i],carry[8*i+4]);
end
endgenerate
generate
generation g6 (gen_5[1],prop_5[1],gen_5[0],gen_6);
and_g p6 (prop_5[1],prop_5[0],prop_6);

generation g10 (gen_4[0],prop_4[0],carry[0],carry[8]);

generation g11 (gen_5[0],prop_5[0],carry[0],carry[16]);

generation g12 (gen_4[2],prop_4[2],carry[16],carry[24]);

generation g13 (gen_6,prop_6,carry[0],cout);
endgenerate
generate
for(i=0;i<32;i=i+1) begin:sum_final
assign sum[i]=prop_1[i] ^ carry[i];
end
endgenerate
endmodule

module generation(input a,b,c,output out);
assign out=a |(b & c);
endmodule

module and_g(input a,b,output c);
assign c=a & b;
endmodule
