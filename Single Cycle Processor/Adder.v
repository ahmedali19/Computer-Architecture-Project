module Adder
(
	input [63:0] in1,in2,
	output reg [63:0] out
);

always @(*) out = in1 + in2;

endmodule