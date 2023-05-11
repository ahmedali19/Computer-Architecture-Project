module Pipelined_Processor
(
    input CLK,
    input RST,
    output [63:0] x_data_mem0,
    output [63:0] x_data_mem1,
    output [63:0] x_data_mem2,
    output [63:0] x_data_mem3,
    output [63:0] x_data_mem4,
    output [63:0] x_data_mem5,
    output [63:0] x_data_mem6,
    output [63:0] x_data_mem7,
    output [63:0] x_data_mem8,
    output [63:0] x_data_mem9
);

wire [63:0] pc_wire,
            next_addr,
            inst_addr_IF,
            inst_addr_ID,
            inst_addr_EX,
            branch_addr_EX,
            branch_addr_MEM,
            read_data1_ID,
            read_data2_ID,
            read_data1_EX,
            read_data2_EX,
            read_data2_MEM,
            imm_ID,
            imm_EX,
            alu_result_EX,
            alu_result_MEM,
            alu_result_WB,
            alu_in2,
            data_read_MEM,
            data_read_WB,
            WB_data;
wire [31:0] inst_IF,
            inst_ID;
wire [6:0]  opcode,
            funct7;
wire [4:0]  rs1,
            rs2,
            rd_ID,
            rd_EX,
            rd_MEM,
            rd_WB,
            EX_control_ID,
            EX_control_EX;
wire [3:0]  cu_ALUOp,
            use_ALUOp;
wire [2:0]  funct3_ID,
            funct3_EX,
            funct3_MEM,
            MEM_control_ID,
            MEM_control_EX,
            MEM_control_MEM;
wire [1:0]  WB_control_ID,
            WB_control_EX,
            WB_control_MEM,
            WB_control_WB;
wire        cu_Branch,
            use_Branch,
            cu_MemRead,
            use_MemRead,
            cu_MemWrite,
            use_MemWrite,
            cu_MemToReg,
            use_MemToReg,
            cu_RegWrite,
            use_RegWrite,
            cu_ALUSrc,
            use_ALUSrc,
            zero_EX,
            zero_MEM,
            less_EX,
            less_MEM,
            PCSrc;

wire [63:0] four;
assign four = 64'd4;

Mux2x1 M0 (
    .in1(next_addr),
    .in2(branch_addr_MEM),
    .sel(PCSrc),
    .out(pc_wire)
);

ProgramCounter PC (
    .CLK(CLK),
    .RST(RST),
    .pc_in(pc_wire),
    .pc_out(inst_addr_IF)
);

InstMemory IM (
    .inst_addr(inst_addr_IF),
    .inst(inst_IF)
);

Adder A1 (
    .in1(inst_addr_IF),
    .in2(four),
    .out(next_addr)
);

Register_IF_ID RII (
    .inst_addr_IF(inst_addr_IF),
    .inst_IF(inst_IF),
    .inst_addr_ID(inst_addr_ID),
    .inst_ID(inst_ID)
);

InstParser IP (
    .inst(inst_ID),
    .opcode(opcode),
    .funct7(funct7),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd_ID),
    .funct3(funct3_ID)
);

RegisterFile RF (
    .CLK(CLK),
    .RST(RST),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd_WB),
    .read_data1(read_data1_ID),
    .read_data2(read_data2_ID),
    .write_data(WB_data),
    .RegWrite(use_RegWrite)
);

ImmGen IG (
    .inst(inst_ID),
    .imm(imm_ID)
);

ControlUnit CU (
    .opcode(opcode),
    .funct3(funct3_ID),
    .Branch(cu_Branch),
    .MemRead(cu_MemRead),
    .MemWrite(cu_MemWrite),
    .MemToReg(cu_MemToReg),
    .RegWrite(cu_RegWrite),
    .ALUSrc(cu_ALUSrc),
    .ALUOp(cu_ALUOp)
);

assign WB_control_ID = {cu_RegWrite,cu_MemToReg};
assign MEM_control_ID = {cu_Branch,cu_MemRead,cu_MemWrite};
assign EX_control_ID = {cu_ALUOp,cu_ALUSrc};

Register_ID_EX RIE (
    .WB_control_ID(WB_control_ID),
    .MEM_control_ID(MEM_control_ID),
    .EX_control_ID(EX_control_ID),
    .inst_addr_ID(inst_addr_ID),
    .read_data1_ID(read_data1_ID),
    .read_data2_ID(read_data2_ID),
    .imm_ID(imm_ID),
    .rd_ID(rd_ID),
    .funct3_ID(funct3_ID),
    .WB_control_EX(WB_control_EX),
    .MEM_control_EX(MEM_control_EX),
    .EX_control_EX(EX_control_EX),
    .inst_addr_EX(inst_addr_EX),
    .read_data1_EX(read_data1_EX),
    .read_data2_EX(read_data2_EX),
    .imm_EX(imm_EX),
    .rd_EX(rd_EX),
    .funct3_EX(funct3_EX)
);

assign use_ALUOp = EX_control_EX[4:1];
assign use_ALUSrc = EX_control_EX[0];

Mux2x1 M1 (
    .in1(read_data2_EX),
    .in2(imm_EX),
    .sel(use_ALUSrc),
    .out(alu_in2)
);

ALU ALU1 (
    .in1(read_data1_EX),
    .in2(alu_in2),
    .ALUOp(use_ALUOp),
    .zero(zero_EX),
    .less(less_EX),
    .out(alu_result_EX)
);

Adder A2 (
    .in1(inst_addr_EX),
    .in2(imm_EX),
    .out(branch_addr_EX)
);

Register_EX_MEM REM (
    .WB_control_EX(WB_control_EX),
    .MEM_control_EX(MEM_control_EX),
    .branch_addr_EX(branch_addr_EX),
    .alu_result_EX(alu_result_EX),
    .zero_EX(zero_EX),
    .less_EX(less_EX),
    .read_data2_EX(read_data2_EX),
    .rd_EX(rd_EX),
    .funct3_EX(funct3_EX),
    .WB_control_MEM(WB_control_MEM),
    .MEM_control_MEM(MEM_control_MEM),
    .branch_addr_MEM(branch_addr_MEM),
    .alu_result_MEM(alu_result_MEM),
    .zero_MEM(zero_MEM),
    .less_MEM(less_MEM),
    .read_data2_MEM(read_data2_MEM),
    .rd_MEM(rd_MEM),
    .funct3_MEM(funct3_MEM)
);

assign use_Branch = MEM_control_MEM[2];
assign use_MemRead = MEM_control_MEM[1];
assign use_MemWrite = MEM_control_MEM[0];

BranchControl BC (
    .Branch(use_Branch),
    .zero(zero_MEM),
    .less(less_MEM),
    .funct3(funct3_MEM),
    .BrCtrl(PCSrc)
);

DataMemory DM (
    .CLK(CLK),
    .MemWrite(use_MemWrite),
    .MemRead(use_MemRead),
    .write_data(read_data2_MEM),
    .mem_addr(alu_result_MEM),
    .read_data(data_read_MEM),
    .data_mem0(x_data_mem0),
    .data_mem1(x_data_mem1),
    .data_mem2(x_data_mem2),
    .data_mem3(x_data_mem3),
    .data_mem4(x_data_mem4),
    .data_mem5(x_data_mem5),
    .data_mem6(x_data_mem6),
    .data_mem7(x_data_mem7),
    .data_mem8(x_data_mem8),
    .data_mem9(x_data_mem9)
);

Register_MEM_WB RMW (
    .WB_control_MEM(WB_control_MEM),
    .data_read_MEM(data_read_MEM),
    .alu_result_MEM(alu_result_MEM),
    .rd_MEM(rd_MEM),
    .WB_control_WB(WB_control_WB),
    .data_read_WB(data_read_WB),
    .alu_result_WB(alu_result_WB),
    .rd_WB(rd_WB)
);

assign use_RegWrite = WB_control_WB[1];
assign use_MemToReg = WB_control_WB[0];

Mux2x1 M2 (
    .in1(alu_result_WB),
    .in2(data_read_WB),
    .sel(use_MemToReg),
    .out(WB_data)
);

endmodule