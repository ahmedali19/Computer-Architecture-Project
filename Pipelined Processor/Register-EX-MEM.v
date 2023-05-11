module Register_EX_MEM
(
    input [1:0] WB_control_EX,
    input [2:0] MEM_control_EX,
    input [63:0] branch_addr_EX,
    input [63:0] alu_result_EX,
    input zero_EX, less_EX,
    input [63:0] read_data2_EX,
    input [4:0] rd_EX,
    input [2:0] funct3_EX,
    output reg [1:0] WB_control_MEM,
    output reg [2:0] MEM_control_MEM,
    output reg [63:0] branch_addr_MEM,
    output reg [63:0] alu_result_MEM,
    output reg zero_MEM, less_MEM,
    output reg [63:0] read_data2_MEM,
    output reg [4:0] rd_MEM,
    output reg [2:0] funct3_MEM
);

always @(*) begin
    WB_control_MEM = WB_control_EX;
    MEM_control_MEM = MEM_control_EX;
    branch_addr_MEM = branch_addr_EX;
    alu_result_MEM = alu_result_EX;
    zero_MEM = zero_EX;
    less_MEM = less_EX;
    read_data2_MEM = read_data2_EX;
    rd_MEM = rd_EX;
    funct3_MEM = funct3_EX;
end

endmodule
