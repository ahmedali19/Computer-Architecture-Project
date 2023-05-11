`timescale 1ns / 1ps
module TB_Single_Cycle_Processor();
reg CLK,RST;
wire [63:0]	x_inst_addr,
            x_write_data,
 	 		x_read_data1,
  			x_read_data2,
  			x_immediate,
            x_next_pc1,
            x_next_pc2,
  			x_alu_result,
  			x_data_read,
            x_data_mem0,
            x_data_mem1,
            x_data_mem2,
            x_data_mem3,
            x_data_mem4,
            x_data_mem5,
            x_data_mem6,
            x_data_mem7,
            x_data_mem8,
            x_data_mem9;
wire [31:0] x_inst;
wire [4:0]  x_rd,
            x_rs1,
            x_rs2;
wire        x_BrCtrl,
            x_Branch,
            x_MemRead,
            x_MemWrite,
            x_MemToReg,
            x_RegWrite,
            x_ALUSrc,
            x_zero,
            x_less;
  
Single_Cycle_Processor SCP (
    .CLK(CLK),
    .RST(RST),
    .x_inst_addr(x_inst_addr),
    .x_write_data(x_write_data),
    .x_read_data1(x_read_data1),
    .x_read_data2(x_read_data2),
    .x_immediate(x_immediate),
    .x_alu_result(x_alu_result),
    .x_inst(x_inst),
    .x_data_read(x_data_read),
    .x_rd(x_rd),
    .x_rs1(x_rs1),
    .x_rs2(x_rs2),
    .x_BrCtrl(x_BrCtrl),
    .x_Branch(x_Branch),
    .x_MemRead(x_MemRead),
    .x_MemWrite(x_MemWrite),
    .x_MemToReg(x_MemToReg),
    .x_RegWrite(x_RegWrite),
    .x_ALUSrc(x_ALUSrc),
    .x_zero(x_zero),
    .x_less(x_less),
    .x_data_mem0(x_data_mem0),
    .x_data_mem1(x_data_mem1),
    .x_data_mem2(x_data_mem2),
    .x_data_mem3(x_data_mem3),
    .x_data_mem4(x_data_mem4),
    .x_data_mem5(x_data_mem5),
    .x_data_mem6(x_data_mem6),
    .x_data_mem7(x_data_mem7),
    .x_data_mem8(x_data_mem8),
    .x_data_mem9(x_data_mem9),
    .x_next_pc1(x_next_pc1),
    .x_next_pc2(x_next_pc2)
);
  
initial begin
	CLK = 1'b0;
  	RST = 1'b0;
end

always #5 CLK = ~CLK;

endmodule