module InstMemory(
    input [63:0] inst_addr,
    output reg [31:0] inst
);

reg [7:0] IMEM [671:0];
integer i;
initial begin
    IMEM[0] = 8'h13;
    IMEM[1] = 8'h00;
    IMEM[2] = 8'h00;
    IMEM[3] = 8'h00;
    IMEM[4] = 8'h13;
    IMEM[5] = 8'h00;
    IMEM[6] = 8'h00;
    IMEM[7] = 8'h00;
    IMEM[8] = 8'h13;
    IMEM[9] = 8'h00;
    IMEM[10] = 8'h00;
    IMEM[11] = 8'h00;
    IMEM[12] = 8'h13;
    IMEM[13] = 8'h00;
    IMEM[14] = 8'h00;
    IMEM[15] = 8'h00;
    IMEM[16] = 8'h13;
    IMEM[17] = 8'h04;
    IMEM[18] = 8'h90;
    IMEM[19] = 8'h00;
    IMEM[20] = 8'h13;
    IMEM[21] = 8'h00;
    IMEM[22] = 8'h00;
    IMEM[23] = 8'h00;
    IMEM[24] = 8'h13;
    IMEM[25] = 8'h00;
    IMEM[26] = 8'h00;
    IMEM[27] = 8'h00;
    IMEM[28] = 8'h13;
    IMEM[29] = 8'h00;
    IMEM[30] = 8'h00;
    IMEM[31] = 8'h00;
    IMEM[32] = 8'h93;
    IMEM[33] = 8'h04;
    IMEM[34] = 8'h00;
    IMEM[35] = 8'h00;
    IMEM[36] = 8'h13;
    IMEM[37] = 8'h00;
    IMEM[38] = 8'h00;
    IMEM[39] = 8'h00;
    IMEM[40] = 8'h13;
    IMEM[41] = 8'h00;
    IMEM[42] = 8'h00;
    IMEM[43] = 8'h00;
    IMEM[44] = 8'h13;
    IMEM[45] = 8'h00;
    IMEM[46] = 8'h00;
    IMEM[47] = 8'h00;
    IMEM[48] = 8'h93;
    IMEM[49] = 8'h02;
    IMEM[50] = 8'h80;
    IMEM[51] = 8'h00;
    IMEM[52] = 8'h13;
    IMEM[53] = 8'h00;
    IMEM[54] = 8'h00;
    IMEM[55] = 8'h00;
    IMEM[56] = 8'h13;
    IMEM[57] = 8'h00;
    IMEM[58] = 8'h00;
    IMEM[59] = 8'h00;
    IMEM[60] = 8'h13;
    IMEM[61] = 8'h00;
    IMEM[62] = 8'h00;
    IMEM[63] = 8'h00;
    IMEM[64] = 8'h23;
    IMEM[65] = 8'hb0;
    IMEM[66] = 8'h54;
    IMEM[67] = 8'h00;
    IMEM[68] = 8'h13;
    IMEM[69] = 8'h00;
    IMEM[70] = 8'h00;
    IMEM[71] = 8'h00;
    IMEM[72] = 8'h13;
    IMEM[73] = 8'h00;
    IMEM[74] = 8'h00;
    IMEM[75] = 8'h00;
    IMEM[76] = 8'h13;
    IMEM[77] = 8'h00;
    IMEM[78] = 8'h00;
    IMEM[79] = 8'h00;
    IMEM[80] = 8'h93;
    IMEM[81] = 8'h02;
    IMEM[82] = 8'h20;
    IMEM[83] = 8'h00;
    IMEM[84] = 8'h13;
    IMEM[85] = 8'h00;
    IMEM[86] = 8'h00;
    IMEM[87] = 8'h00;
    IMEM[88] = 8'h13;
    IMEM[89] = 8'h00;
    IMEM[90] = 8'h00;
    IMEM[91] = 8'h00;
    IMEM[92] = 8'h13;
    IMEM[93] = 8'h00;
    IMEM[94] = 8'h00;
    IMEM[95] = 8'h00;
    IMEM[96] = 8'h23;
    IMEM[97] = 8'hb4;
    IMEM[98] = 8'h54;
    IMEM[99] = 8'h00;
    IMEM[100] = 8'h13;
    IMEM[101] = 8'h00;
    IMEM[102] = 8'h00;
    IMEM[103] = 8'h00;
    IMEM[104] = 8'h13;
    IMEM[105] = 8'h00;
    IMEM[106] = 8'h00;
    IMEM[107] = 8'h00;
    IMEM[108] = 8'h13;
    IMEM[109] = 8'h00;
    IMEM[110] = 8'h00;
    IMEM[111] = 8'h00;
    IMEM[112] = 8'h93;
    IMEM[113] = 8'h02;
    IMEM[114] = 8'h40;
    IMEM[115] = 8'h00;
    IMEM[116] = 8'h13;
    IMEM[117] = 8'h00;
    IMEM[118] = 8'h00;
    IMEM[119] = 8'h00;
    IMEM[120] = 8'h13;
    IMEM[121] = 8'h00;
    IMEM[122] = 8'h00;
    IMEM[123] = 8'h00;
    IMEM[124] = 8'h13;
    IMEM[125] = 8'h00;
    IMEM[126] = 8'h00;
    IMEM[127] = 8'h00;
    IMEM[128] = 8'h23;
    IMEM[129] = 8'hb8;
    IMEM[130] = 8'h54;
    IMEM[131] = 8'h00;
    IMEM[132] = 8'h13;
    IMEM[133] = 8'h00;
    IMEM[134] = 8'h00;
    IMEM[135] = 8'h00;
    IMEM[136] = 8'h13;
    IMEM[137] = 8'h00;
    IMEM[138] = 8'h00;
    IMEM[139] = 8'h00;
    IMEM[140] = 8'h13;
    IMEM[141] = 8'h00;
    IMEM[142] = 8'h00;
    IMEM[143] = 8'h00;
    IMEM[144] = 8'h93;
    IMEM[145] = 8'h02;
    IMEM[146] = 8'h90;
    IMEM[147] = 8'h00;
    IMEM[148] = 8'h13;
    IMEM[149] = 8'h00;
    IMEM[150] = 8'h00;
    IMEM[151] = 8'h00;
    IMEM[152] = 8'h13;
    IMEM[153] = 8'h00;
    IMEM[154] = 8'h00;
    IMEM[155] = 8'h00;
    IMEM[156] = 8'h13;
    IMEM[157] = 8'h00;
    IMEM[158] = 8'h00;
    IMEM[159] = 8'h00;
    IMEM[160] = 8'h23;
    IMEM[161] = 8'hbc;
    IMEM[162] = 8'h54;
    IMEM[163] = 8'h00;
    IMEM[164] = 8'h13;
    IMEM[165] = 8'h00;
    IMEM[166] = 8'h00;
    IMEM[167] = 8'h00;
    IMEM[168] = 8'h13;
    IMEM[169] = 8'h00;
    IMEM[170] = 8'h00;
    IMEM[171] = 8'h00;
    IMEM[172] = 8'h13;
    IMEM[173] = 8'h00;
    IMEM[174] = 8'h00;
    IMEM[175] = 8'h00;
    IMEM[176] = 8'h93;
    IMEM[177] = 8'h02;
    IMEM[178] = 8'h30;
    IMEM[179] = 8'h00;
    IMEM[180] = 8'h13;
    IMEM[181] = 8'h00;
    IMEM[182] = 8'h00;
    IMEM[183] = 8'h00;
    IMEM[184] = 8'h13;
    IMEM[185] = 8'h00;
    IMEM[186] = 8'h00;
    IMEM[187] = 8'h00;
    IMEM[188] = 8'h13;
    IMEM[189] = 8'h00;
    IMEM[190] = 8'h00;
    IMEM[191] = 8'h00;
    IMEM[192] = 8'h23;
    IMEM[193] = 8'hb0;
    IMEM[194] = 8'h54;
    IMEM[195] = 8'h02;
    IMEM[196] = 8'h13;
    IMEM[197] = 8'h00;
    IMEM[198] = 8'h00;
    IMEM[199] = 8'h00;
    IMEM[200] = 8'h13;
    IMEM[201] = 8'h00;
    IMEM[202] = 8'h00;
    IMEM[203] = 8'h00;
    IMEM[204] = 8'h13;
    IMEM[205] = 8'h00;
    IMEM[206] = 8'h00;
    IMEM[207] = 8'h00;
    IMEM[208] = 8'h93;
    IMEM[209] = 8'h02;
    IMEM[210] = 8'h10;
    IMEM[211] = 8'h00;
    IMEM[212] = 8'h13;
    IMEM[213] = 8'h00;
    IMEM[214] = 8'h00;
    IMEM[215] = 8'h00;
    IMEM[216] = 8'h13;
    IMEM[217] = 8'h00;
    IMEM[218] = 8'h00;
    IMEM[219] = 8'h00;
    IMEM[220] = 8'h13;
    IMEM[221] = 8'h00;
    IMEM[222] = 8'h00;
    IMEM[223] = 8'h00;
    IMEM[224] = 8'h23;
    IMEM[225] = 8'hb4;
    IMEM[226] = 8'h54;
    IMEM[227] = 8'h02;
    IMEM[228] = 8'h13;
    IMEM[229] = 8'h00;
    IMEM[230] = 8'h00;
    IMEM[231] = 8'h00;
    IMEM[232] = 8'h13;
    IMEM[233] = 8'h00;
    IMEM[234] = 8'h00;
    IMEM[235] = 8'h00;
    IMEM[236] = 8'h13;
    IMEM[237] = 8'h00;
    IMEM[238] = 8'h00;
    IMEM[239] = 8'h00;
    IMEM[240] = 8'h93;
    IMEM[241] = 8'h02;
    IMEM[242] = 8'h60;
    IMEM[243] = 8'h00;
    IMEM[244] = 8'h13;
    IMEM[245] = 8'h00;
    IMEM[246] = 8'h00;
    IMEM[247] = 8'h00;
    IMEM[248] = 8'h13;
    IMEM[249] = 8'h00;
    IMEM[250] = 8'h00;
    IMEM[251] = 8'h00;
    IMEM[252] = 8'h13;
    IMEM[253] = 8'h00;
    IMEM[254] = 8'h00;
    IMEM[255] = 8'h00;
    IMEM[256] = 8'h23;
    IMEM[257] = 8'hb8;
    IMEM[258] = 8'h54;
    IMEM[259] = 8'h02;
    IMEM[260] = 8'h13;
    IMEM[261] = 8'h00;
    IMEM[262] = 8'h00;
    IMEM[263] = 8'h00;
    IMEM[264] = 8'h13;
    IMEM[265] = 8'h00;
    IMEM[266] = 8'h00;
    IMEM[267] = 8'h00;
    IMEM[268] = 8'h13;
    IMEM[269] = 8'h00;
    IMEM[270] = 8'h00;
    IMEM[271] = 8'h00;
    IMEM[272] = 8'h93;
    IMEM[273] = 8'h02;
    IMEM[274] = 8'h50;
    IMEM[275] = 8'h00;
    IMEM[276] = 8'h13;
    IMEM[277] = 8'h00;
    IMEM[278] = 8'h00;
    IMEM[279] = 8'h00;
    IMEM[280] = 8'h13;
    IMEM[281] = 8'h00;
    IMEM[282] = 8'h00;
    IMEM[283] = 8'h00;
    IMEM[284] = 8'h13;
    IMEM[285] = 8'h00;
    IMEM[286] = 8'h00;
    IMEM[287] = 8'h00;
    IMEM[288] = 8'h23;
    IMEM[289] = 8'hbc;
    IMEM[290] = 8'h54;
    IMEM[291] = 8'h02;
    IMEM[292] = 8'h13;
    IMEM[293] = 8'h00;
    IMEM[294] = 8'h00;
    IMEM[295] = 8'h00;
    IMEM[296] = 8'h13;
    IMEM[297] = 8'h00;
    IMEM[298] = 8'h00;
    IMEM[299] = 8'h00;
    IMEM[300] = 8'h13;
    IMEM[301] = 8'h00;
    IMEM[302] = 8'h00;
    IMEM[303] = 8'h00;
    IMEM[304] = 8'h93;
    IMEM[305] = 8'h02;
    IMEM[306] = 8'h00;
    IMEM[307] = 8'h00;
    IMEM[308] = 8'h13;
    IMEM[309] = 8'h00;
    IMEM[310] = 8'h00;
    IMEM[311] = 8'h00;
    IMEM[312] = 8'h13;
    IMEM[313] = 8'h00;
    IMEM[314] = 8'h00;
    IMEM[315] = 8'h00;
    IMEM[316] = 8'h13;
    IMEM[317] = 8'h00;
    IMEM[318] = 8'h00;
    IMEM[319] = 8'h00;
    IMEM[320] = 8'h23;
    IMEM[321] = 8'hb0;
    IMEM[322] = 8'h54;
    IMEM[323] = 8'h04;
    IMEM[324] = 8'h13;
    IMEM[325] = 8'h00;
    IMEM[326] = 8'h00;
    IMEM[327] = 8'h00;
    IMEM[328] = 8'h13;
    IMEM[329] = 8'h00;
    IMEM[330] = 8'h00;
    IMEM[331] = 8'h00;
    IMEM[332] = 8'h13;
    IMEM[333] = 8'h00;
    IMEM[334] = 8'h00;
    IMEM[335] = 8'h00;
    IMEM[336] = 8'h93;
    IMEM[337] = 8'h02;
    IMEM[338] = 8'h70;
    IMEM[339] = 8'h00;
    IMEM[340] = 8'h13;
    IMEM[341] = 8'h00;
    IMEM[342] = 8'h00;
    IMEM[343] = 8'h00;
    IMEM[344] = 8'h13;
    IMEM[345] = 8'h00;
    IMEM[346] = 8'h00;
    IMEM[347] = 8'h00;
    IMEM[348] = 8'h13;
    IMEM[349] = 8'h00;
    IMEM[350] = 8'h00;
    IMEM[351] = 8'h00;
    IMEM[352] = 8'h23;
    IMEM[353] = 8'hb4;
    IMEM[354] = 8'h54;
    IMEM[355] = 8'h04;
    IMEM[356] = 8'h13;
    IMEM[357] = 8'h00;
    IMEM[358] = 8'h00;
    IMEM[359] = 8'h00;
    IMEM[360] = 8'h13;
    IMEM[361] = 8'h00;
    IMEM[362] = 8'h00;
    IMEM[363] = 8'h00;
    IMEM[364] = 8'h13;
    IMEM[365] = 8'h00;
    IMEM[366] = 8'h00;
    IMEM[367] = 8'h00;
    IMEM[368] = 8'h13;
    IMEM[369] = 8'h09;
    IMEM[370] = 8'h00;
    IMEM[371] = 8'h00;
    IMEM[372] = 8'h13;
    IMEM[373] = 8'h00;
    IMEM[374] = 8'h00;
    IMEM[375] = 8'h00;
    IMEM[376] = 8'h13;
    IMEM[377] = 8'h00;
    IMEM[378] = 8'h00;
    IMEM[379] = 8'h00;
    IMEM[380] = 8'h13;
    IMEM[381] = 8'h00;
    IMEM[382] = 8'h00;
    IMEM[383] = 8'h00;
    IMEM[384] = 8'h63;
    IMEM[385] = 8'h02;
    IMEM[386] = 8'h89;
    IMEM[387] = 8'h04;
    IMEM[388] = 8'h13;
    IMEM[389] = 8'h00;
    IMEM[390] = 8'h00;
    IMEM[391] = 8'h00;
    IMEM[392] = 8'h13;
    IMEM[393] = 8'h00;
    IMEM[394] = 8'h00;
    IMEM[395] = 8'h00;
    IMEM[396] = 8'h13;
    IMEM[397] = 8'h00;
    IMEM[398] = 8'h00;
    IMEM[399] = 8'h00;
    IMEM[400] = 8'h93;
    IMEM[401] = 8'h09;
    IMEM[402] = 8'h00;
    IMEM[403] = 8'h00;
    IMEM[404] = 8'h13;
    IMEM[405] = 8'h00;
    IMEM[406] = 8'h00;
    IMEM[407] = 8'h00;
    IMEM[408] = 8'h13;
    IMEM[409] = 8'h00;
    IMEM[410] = 8'h00;
    IMEM[411] = 8'h00;
    IMEM[412] = 8'h13;
    IMEM[413] = 8'h00;
    IMEM[414] = 8'h00;
    IMEM[415] = 8'h00;
    IMEM[416] = 8'hb3;
    IMEM[417] = 8'h02;
    IMEM[418] = 8'h24;
    IMEM[419] = 8'h41;
    IMEM[420] = 8'h13;
    IMEM[421] = 8'h00;
    IMEM[422] = 8'h00;
    IMEM[423] = 8'h00;
    IMEM[424] = 8'h13;
    IMEM[425] = 8'h00;
    IMEM[426] = 8'h00;
    IMEM[427] = 8'h00;
    IMEM[428] = 8'h13;
    IMEM[429] = 8'h00;
    IMEM[430] = 8'h00;
    IMEM[431] = 8'h00;
    IMEM[432] = 8'h63;
    IMEM[433] = 8'h88;
    IMEM[434] = 8'h59;
    IMEM[435] = 8'h02;
    IMEM[436] = 8'h13;
    IMEM[437] = 8'h00;
    IMEM[438] = 8'h00;
    IMEM[439] = 8'h00;
    IMEM[440] = 8'h13;
    IMEM[441] = 8'h00;
    IMEM[442] = 8'h00;
    IMEM[443] = 8'h00;
    IMEM[444] = 8'h13;
    IMEM[445] = 8'h00;
    IMEM[446] = 8'h00;
    IMEM[447] = 8'h00;
    IMEM[448] = 8'h93;
    IMEM[449] = 8'h92;
    IMEM[450] = 8'h39;
    IMEM[451] = 8'h00;
    IMEM[452] = 8'h13;
    IMEM[453] = 8'h00;
    IMEM[454] = 8'h00;
    IMEM[455] = 8'h00;
    IMEM[456] = 8'h13;
    IMEM[457] = 8'h00;
    IMEM[458] = 8'h00;
    IMEM[459] = 8'h00;
    IMEM[460] = 8'h13;
    IMEM[461] = 8'h00;
    IMEM[462] = 8'h00;
    IMEM[463] = 8'h00;
    IMEM[464] = 8'hb3;
    IMEM[465] = 8'h82;
    IMEM[466] = 8'h92;
    IMEM[467] = 8'h00;
    IMEM[468] = 8'h13;
    IMEM[469] = 8'h00;
    IMEM[470] = 8'h00;
    IMEM[471] = 8'h00;
    IMEM[472] = 8'h13;
    IMEM[473] = 8'h00;
    IMEM[474] = 8'h00;
    IMEM[475] = 8'h00;
    IMEM[476] = 8'h13;
    IMEM[477] = 8'h00;
    IMEM[478] = 8'h00;
    IMEM[479] = 8'h00;
    IMEM[480] = 8'h13;
    IMEM[481] = 8'h03;
    IMEM[482] = 8'h80;
    IMEM[483] = 8'h00;
    IMEM[484] = 8'h13;
    IMEM[485] = 8'h00;
    IMEM[486] = 8'h00;
    IMEM[487] = 8'h00;
    IMEM[488] = 8'h13;
    IMEM[489] = 8'h00;
    IMEM[490] = 8'h00;
    IMEM[491] = 8'h00;
    IMEM[492] = 8'h13;
    IMEM[493] = 8'h00;
    IMEM[494] = 8'h00;
    IMEM[495] = 8'h00;
    IMEM[496] = 8'h33;
    IMEM[497] = 8'h03;
    IMEM[498] = 8'h53;
    IMEM[499] = 8'h00;
    IMEM[500] = 8'h13;
    IMEM[501] = 8'h00;
    IMEM[502] = 8'h00;
    IMEM[503] = 8'h00;
    IMEM[504] = 8'h13;
    IMEM[505] = 8'h00;
    IMEM[506] = 8'h00;
    IMEM[507] = 8'h00;
    IMEM[508] = 8'h13;
    IMEM[509] = 8'h00;
    IMEM[510] = 8'h00;
    IMEM[511] = 8'h00;
    IMEM[512] = 8'h83;
    IMEM[513] = 8'hb3;
    IMEM[514] = 8'h02;
    IMEM[515] = 8'h00;
    IMEM[516] = 8'h13;
    IMEM[517] = 8'h00;
    IMEM[518] = 8'h00;
    IMEM[519] = 8'h00;
    IMEM[520] = 8'h13;
    IMEM[521] = 8'h00;
    IMEM[522] = 8'h00;
    IMEM[523] = 8'h00;
    IMEM[524] = 8'h13;
    IMEM[525] = 8'h00;
    IMEM[526] = 8'h00;
    IMEM[527] = 8'h00;
    IMEM[528] = 8'h03;
    IMEM[529] = 8'h3e;
    IMEM[530] = 8'h03;
    IMEM[531] = 8'h00;
    IMEM[532] = 8'h13;
    IMEM[533] = 8'h00;
    IMEM[534] = 8'h00;
    IMEM[535] = 8'h00;
    IMEM[536] = 8'h13;
    IMEM[537] = 8'h00;
    IMEM[538] = 8'h00;
    IMEM[539] = 8'h00;
    IMEM[540] = 8'h13;
    IMEM[541] = 8'h00;
    IMEM[542] = 8'h00;
    IMEM[543] = 8'h00;
    IMEM[544] = 8'h63;
    IMEM[545] = 8'h56;
    IMEM[546] = 8'h7e;
    IMEM[547] = 8'h00;
    IMEM[548] = 8'h13;
    IMEM[549] = 8'h00;
    IMEM[550] = 8'h00;
    IMEM[551] = 8'h00;
    IMEM[552] = 8'h13;
    IMEM[553] = 8'h00;
    IMEM[554] = 8'h00;
    IMEM[555] = 8'h00;
    IMEM[556] = 8'h13;
    IMEM[557] = 8'h00;
    IMEM[558] = 8'h00;
    IMEM[559] = 8'h00;
    IMEM[560] = 8'h23;
    IMEM[561] = 8'hb0;
    IMEM[562] = 8'hc2;
    IMEM[563] = 8'h01;
    IMEM[564] = 8'h13;
    IMEM[565] = 8'h00;
    IMEM[566] = 8'h00;
    IMEM[567] = 8'h00;
    IMEM[568] = 8'h13;
    IMEM[569] = 8'h00;
    IMEM[570] = 8'h00;
    IMEM[571] = 8'h00;
    IMEM[572] = 8'h13;
    IMEM[573] = 8'h00;
    IMEM[574] = 8'h00;
    IMEM[575] = 8'h00;
    IMEM[576] = 8'h23;
    IMEM[577] = 8'h30;
    IMEM[578] = 8'h73;
    IMEM[579] = 8'h00;
    IMEM[580] = 8'h13;
    IMEM[581] = 8'h00;
    IMEM[582] = 8'h00;
    IMEM[583] = 8'h00;
    IMEM[584] = 8'h13;
    IMEM[585] = 8'h00;
    IMEM[586] = 8'h00;
    IMEM[587] = 8'h00;
    IMEM[588] = 8'h13;
    IMEM[589] = 8'h00;
    IMEM[590] = 8'h00;
    IMEM[591] = 8'h00;
    IMEM[592] = 8'h93;
    IMEM[593] = 8'h89;
    IMEM[594] = 8'h19;
    IMEM[595] = 8'h00;
    IMEM[596] = 8'h13;
    IMEM[597] = 8'h00;
    IMEM[598] = 8'h00;
    IMEM[599] = 8'h00;
    IMEM[600] = 8'h13;
    IMEM[601] = 8'h00;
    IMEM[602] = 8'h00;
    IMEM[603] = 8'h00;
    IMEM[604] = 8'h13;
    IMEM[605] = 8'h00;
    IMEM[606] = 8'h00;
    IMEM[607] = 8'h00;
    IMEM[608] = 8'he3;
    IMEM[609] = 8'h08;
    IMEM[610] = 8'h00;
    IMEM[611] = 8'hfc;
    IMEM[612] = 8'h13;
    IMEM[613] = 8'h00;
    IMEM[614] = 8'h00;
    IMEM[615] = 8'h00;
    IMEM[616] = 8'h13;
    IMEM[617] = 8'h00;
    IMEM[618] = 8'h00;
    IMEM[619] = 8'h00;
    IMEM[620] = 8'h13;
    IMEM[621] = 8'h00;
    IMEM[622] = 8'h00;
    IMEM[623] = 8'h00;
    IMEM[624] = 8'h13;
    IMEM[625] = 8'h09;
    IMEM[626] = 8'h19;
    IMEM[627] = 8'h00;
    IMEM[628] = 8'h13;
    IMEM[629] = 8'h00;
    IMEM[630] = 8'h00;
    IMEM[631] = 8'h00;
    IMEM[632] = 8'h13;
    IMEM[633] = 8'h00;
    IMEM[634] = 8'h00;
    IMEM[635] = 8'h00;
    IMEM[636] = 8'h13;
    IMEM[637] = 8'h00;
    IMEM[638] = 8'h00;
    IMEM[639] = 8'h00;
    IMEM[640] = 8'he3;
    IMEM[641] = 8'h00;
    IMEM[642] = 8'h00;
    IMEM[643] = 8'hfc;
    IMEM[644] = 8'h13;
    IMEM[645] = 8'h00;
    IMEM[646] = 8'h00;
    IMEM[647] = 8'h00;
    IMEM[648] = 8'h13;
    IMEM[649] = 8'h00;
    IMEM[650] = 8'h00;
    IMEM[651] = 8'h00;
    IMEM[652] = 8'h13;
    IMEM[653] = 8'h00;
    IMEM[654] = 8'h00;
    IMEM[655] = 8'h00;
    IMEM[656] = 8'h13;
    IMEM[657] = 8'h00;
    IMEM[658] = 8'h00;
    IMEM[659] = 8'h00;
    IMEM[660] = 8'h13;
    IMEM[661] = 8'h00;
    IMEM[662] = 8'h00;
    IMEM[663] = 8'h00;
    IMEM[664] = 8'h13;
    IMEM[665] = 8'h00;
    IMEM[666] = 8'h00;
    IMEM[667] = 8'h00;
    IMEM[668] = 8'h13;
    IMEM[669] = 8'h00;
    IMEM[670] = 8'h00;
    IMEM[671] = 8'h00;
end

always @(*) begin
	inst = {
		IMEM[inst_addr + 3],
		IMEM[inst_addr + 2],
		IMEM[inst_addr + 1],
		IMEM[inst_addr]
	};
end

endmodule
