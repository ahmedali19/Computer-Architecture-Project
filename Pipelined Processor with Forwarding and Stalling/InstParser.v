module InstParser
(
	input [31:0] inst,
	output reg [6:0] opcode,funct7,
	output reg [4:0] rs1,rs2,rd,
	output reg [2:0] funct3	
);

always @(*) begin
	opcode = inst[6:0];
	rd = inst[11:7];
	funct3 = inst[14:12];
	rs1 = inst[19:15];
	rs2 = inst[24:20];
	funct7 = inst[31:25];
end

endmodule 