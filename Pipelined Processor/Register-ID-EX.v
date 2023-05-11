module Register_ID_EX
(
    input [1:0] WB_control_ID,
    input [2:0] MEM_control_ID,
    input [4:0] EX_control_ID,
    input [63:0] inst_addr_ID,
    input [63:0] read_data1_ID,
    input [63:0] read_data2_ID,
    input [63:0] imm_ID,
    input [4:0] rd_ID,
    input [3:0] funct3_ID,
    output reg [1:0] WB_control_EX,
    output reg [2:0] MEM_control_EX,
    output reg [4:0] EX_control_EX,
    output reg [63:0] inst_addr_EX,
    output reg [63:0] read_data1_EX,
    output reg [63:0] read_data2_EX,
    output reg [63:0] imm_EX,
    output reg [4:0] rd_EX,
    output reg [3:0] funct3_EX
);

always @(*) begin
    WB_control_EX = WB_control_ID;
    MEM_control_EX = MEM_control_ID;
    EX_control_EX = EX_control_ID;
    inst_addr_EX = inst_addr_ID;
    read_data1_EX = read_data1_ID;
    read_data2_EX = read_data2_ID;
    imm_EX = imm_ID;
    rd_EX = rd_ID;
    funct3_EX = funct3_ID;
end

endmodule
