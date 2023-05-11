module Register_MEM_WB
(
    input [1:0] WB_control_MEM,
    input [63:0] data_read_MEM,
    input [63:0] alu_result_MEM,
    input [63:0] rd_MEM,
    output reg [1:0] WB_control_WB,
    output reg [63:0] data_read_WB,
    output reg [63:0] alu_result_WB,
    output reg [63:0] rd_WB    
);

always @(*) begin
    WB_control_WB = WB_control_MEM;
    data_read_WB = data_read_MEM;
    alu_result_WB = alu_result_MEM;
    rd_WB = rd_MEM;
end

endmodule
