module ProgramCounter
(
	input CLK,RST,
	input [63:0] pc_in,
	output reg [63:0] pc_out
);

initial pc_out = 64'd0;

always @(posedge CLK or posedge RST)
begin
	if(RST) pc_out = 64'd0;
	else pc_out = pc_in;
end

endmodule
