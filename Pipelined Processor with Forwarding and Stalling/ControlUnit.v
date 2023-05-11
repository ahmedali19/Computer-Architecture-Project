module ControlUnit
(
	input [6:0] opcode,funct7,
	input [2:0] funct3,
	output reg Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite,
	output reg [3:0] ALUOp
);

localparam [6:0]
R = 7'b0110011,
I = 7'b0010011,
L = 7'b0000011,
S = 7'b0100011,
B = 7'b1100011;

localparam [2:0]
ADDI = 3'b000,
SLLI = 3'b001,
ADD = 3'b000,
OR = 3'b110,
AND = 3'b111;

always @(*) begin
	case(opcode)
		R: begin
			Branch = 0;
			MemRead = 0;
			MemToReg = 0;
			MemWrite = 0;
			ALUSrc = 0;
			RegWrite = 1;
			case(funct3)
				AND: ALUOp = 4'b0000;
				OR: ALUOp = 4'b0001;
				ADD: ALUOp = funct7[5] ? 4'b0110 : 4'b0010;
			endcase
		end
		I: begin
			Branch = 0;
			MemRead = 0;
			MemToReg = 0;
			MemWrite = 0;
			ALUSrc = 1;
			RegWrite = 1;
			case(funct3)
				ADDI: ALUOp = 4'b0010;
				SLLI: ALUOp = 4'b1100;
			endcase
		end
		L: begin
			Branch = 0;
			MemRead = 1;
			MemToReg = 1;
			MemWrite = 0;
			ALUSrc = 1;
			RegWrite = 1;
			ALUOp = 4'b0010;
		end
		S: begin
			Branch = 0;
			MemRead = 0;
			MemToReg = 0;
			MemWrite = 1;
			ALUSrc = 1;
			RegWrite = 0;
			ALUOp = 4'b0010;
		end
		B: begin
			Branch = 1;
			MemRead = 0;
			MemToReg = 0;
			MemWrite = 0;
			ALUSrc = 0;
			RegWrite = 0;
			ALUOp = 4'b0110;
		end
	endcase
end

endmodule 