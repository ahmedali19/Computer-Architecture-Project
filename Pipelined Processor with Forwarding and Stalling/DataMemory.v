module DataMemory
(
	input CLK, MemWrite, MemRead,
	input [63:0] mem_addr,
	input [63:0] write_data,
	output reg [63:0] read_data,
	output reg [63:0] 	data_mem0,
						data_mem1,
						data_mem2,
						data_mem3,
						data_mem4,
						data_mem5,
						data_mem6,
						data_mem7,
						data_mem8,
						data_mem9
);

reg [7:0] DMEM [127:0]; //128-Byte Memory
integer i;
initial begin
	for (i = 0; i < 128; i = i + 1)
		DMEM[i] = 0;
end

always @(*) begin
	if (MemRead) begin
		read_data = {
			DMEM[mem_addr+7],
			DMEM[mem_addr+6],
			DMEM[mem_addr+5],
			DMEM[mem_addr+4],
			DMEM[mem_addr+3],
			DMEM[mem_addr+2],
			DMEM[mem_addr+1],
			DMEM[mem_addr]
		};
	end
end

always @(posedge CLK) begin
	if (MemWrite) begin
		DMEM[mem_addr] = write_data[7:0];
		DMEM[mem_addr+1] = write_data[15:8];
		DMEM[mem_addr+2] = write_data[23:16];
		DMEM[mem_addr+3] = write_data[31:24];
		DMEM[mem_addr+4] = write_data[39:32];
		DMEM[mem_addr+5] = write_data[47:40];
		DMEM[mem_addr+6] = write_data[55:48];
		DMEM[mem_addr+7] = write_data[63:56];
	end
end

always @(posedge CLK) begin
	data_mem0 = {DMEM[7], DMEM[6], DMEM[5], DMEM[4], DMEM[3], DMEM[2], DMEM[1], DMEM[0]};
	data_mem1 = {DMEM[15], DMEM[14], DMEM[13], DMEM[12], DMEM[11], DMEM[10], DMEM[9], DMEM[8]};
	data_mem2 = {DMEM[23], DMEM[22], DMEM[21], DMEM[20], DMEM[19], DMEM[18], DMEM[17], DMEM[16]};
	data_mem3 = {DMEM[31], DMEM[30], DMEM[29], DMEM[28], DMEM[27], DMEM[26], DMEM[25], DMEM[24]};
	data_mem4 = {DMEM[39], DMEM[38], DMEM[37], DMEM[36], DMEM[35], DMEM[34], DMEM[33], DMEM[32]};
	data_mem5 = {DMEM[47], DMEM[46], DMEM[45], DMEM[44], DMEM[43], DMEM[42], DMEM[41], DMEM[40]};
	data_mem6 = {DMEM[55], DMEM[54], DMEM[53], DMEM[52], DMEM[51], DMEM[50], DMEM[49], DMEM[48]};
	data_mem7 = {DMEM[63], DMEM[62], DMEM[61], DMEM[60], DMEM[59], DMEM[58], DMEM[57], DMEM[56]};
	data_mem8 = {DMEM[71], DMEM[70], DMEM[69], DMEM[68], DMEM[67], DMEM[66], DMEM[65], DMEM[64]};
	data_mem9 = {DMEM[79], DMEM[78], DMEM[77], DMEM[76], DMEM[75], DMEM[74], DMEM[73], DMEM[72]};
end
	
endmodule