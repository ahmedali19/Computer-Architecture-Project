module Register_IF_ID
(
    input [63:0] inst_addr_IF,
    input [31:0] inst_IF,
    output reg [63:0] inst_addr_ID,
    output reg [31:0] inst_ID
);

always @(*) begin
    inst_addr_ID = inst_addr_IF;
    inst_ID = inst_IF;
end

endmodule
