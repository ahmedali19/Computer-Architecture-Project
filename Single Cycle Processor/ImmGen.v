module ImmGen
(
    input [31:0] inst,
    output reg [63:0] imm
);

wire [1:0] op;
assign op = inst[6:5];

localparam [6:0]
I = 2'b00,
S = 2'b01,
B = 2'b11;

always @(*) begin
    case(op)
        I: imm = { {52{inst[31]}}, inst[31:20] };
        S: imm = { {52{inst[31]}}, inst[31:25], inst[11:7] };
        B: imm = { {51{inst[31]}}, inst[31], inst[7], inst[30:25], inst[11:8], 1'b0 };
        default: imm = 64'b0;
    endcase
end

endmodule