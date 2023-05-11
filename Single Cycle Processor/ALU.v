module ALU
(
	input [3:0] ALUOp,
	input [63:0] in1, in2,
	output reg [63:0] out,
	output reg zero,less
);

localparam [3:0]
AND = 4'b0000,
OR  = 4'b0001,
ADD = 4'b0010,
SUB = 4'b0110,
SLL = 4'b1100;

//assign zero = (out == 0);	
//assign less = (out[63] == 1);

always @(*) begin
	case (ALUOp)
		AND: out = in1 & in2;
		OR:	 out = in1 | in2;
		ADD: out = in1 + in2;
		SUB: out = in1 - in2;
		SLL: out = in1 << in2;
		default: out = 0;
	endcase
	if (ALUOp == SUB) begin
	   zero = (out == 0);
	   less = (out[63] == 1);
	end
	else begin
	   zero = 0;
	   less = 0;
	end
end

endmodule 