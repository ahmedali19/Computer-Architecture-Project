module Single_Cycle_Processor
(
    input CLK,RST,
    output reg [63:0]   x_inst_addr,
                        x_write_data,
                        x_read_data1,
                        x_read_data2,
                        x_immediate,
                        x_next_pc1,
                        x_next_pc2,
                        x_alu_result,
                        x_data_read,
    output [63:0]       x_data_mem0,
                        x_data_mem1,
                        x_data_mem2,
                        x_data_mem3,
                        x_data_mem4,
                        x_data_mem5,
                        x_data_mem6,
                        x_data_mem7,
                        x_data_mem8,
                        x_data_mem9,
    output reg [31:0]   x_inst,
    output reg [4:0]    x_rs1,
                        x_rs2,
                        x_rd,
    output reg          x_BrCtrl,
                        x_Branch,
                        x_MemRead,
                        x_MemWrite,
                        x_MemToReg,
                        x_ALUSrc,
                        x_RegWrite,
                        x_zero,
                        x_less
);

wire [63:0] pc_wire,
            inst_addr,
            write_data,
            read_data1,
            read_data2,
            immediate,
            alu_in2,
            alu_result,
            next_pc1,
            next_pc2,
            four,
            data_read;
wire [31:0] instruction;
wire [6:0]  opcode,
            funct7;
wire [4:0]  rs1,
            rs2,
            rd;
wire [3:0]  ALUOp;
wire [2:0]  funct3;
wire        Branch,
            BrCtrl,
            MemRead,
            MemToReg,
            MemWrite,
            ALUSrc,
            RegWrite,
            zero,
            less;

assign four = 64'd4;

ProgramCounter PC (
    .CLK(CLK),
    .RST(RST),
    .pc_in(pc_wire),
    .pc_out(inst_addr)
);
InstMemory IM (
    .inst_addr(inst_addr),
    .inst(instruction)
);
InstParser IP (
    .inst(instruction),
    .opcode(opcode),
    .funct7(funct7),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .funct3(funct3)
);
ControlUnit CU (
    .opcode(opcode),
    .funct3(funct3),
    .funct7(funct7),
    .ALUOp(ALUOp),
    .Branch(Branch),
    .MemRead(MemRead),
    .MemToReg(MemToReg),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite)
);
RegisterFile RF (
    .CLK(CLK),
    .RST(RST),
    .RegWrite(RegWrite),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .write_data(write_data),
    .read_data1(read_data1),
    .read_data2(read_data2)
);
ImmGen IG (
    .inst(instruction),
    .imm(immediate)
);
Mux2x1 MUX1 (
    .sel(ALUSrc),
    .in1(read_data2),
    .in2(immediate),
    .out(alu_in2)
);
ALU ALUX (
    .ALUOp(ALUOp),
    .in1(read_data1),
    .in2(alu_in2),
    .out(alu_result),
    .zero(zero),
    .less(less)
);
Adder ADD1 (
    .in1(inst_addr),
    .in2(four),
    .out(next_pc1)
);
Adder ADD2 (
    .in1(inst_addr),
    .in2(immediate),
    .out(next_pc2)
);
BranchControl BC (
    .Branch(Branch),
    .zero(zero),
    .less(less),
    .funct3(funct3),
    .BrCtrl(BrCtrl)
);
Mux2x1 MUX2 (
    .sel(BrCtrl),
    .in1(next_pc1),
    .in2(next_pc2),
    .out(pc_wire)
);
DataMemory DM (
    .CLK(CLK),
    .MemWrite(MemWrite),
    .MemRead(MemRead),
    .mem_addr(alu_result),
    .write_data(read_data2),
    .read_data(data_read),
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
Mux2x1 MUX3 (
    .sel(MemToReg),
    .in1(alu_result),
    .in2(data_read),
    .out(write_data)
);

always @(*) begin
    x_inst_addr = inst_addr;
    x_write_data = write_data;
    x_read_data1 = read_data1;
    x_read_data2 = read_data2;
    x_immediate = immediate;
    x_alu_result = alu_result;
    x_inst = instruction;
    x_data_read = data_read;
    x_rs1 = rs1;
    x_rs2 = rs2;
    x_rd = rd;
    x_BrCtrl = BrCtrl;
    x_Branch = Branch;
    x_MemRead = MemRead;
    x_MemWrite = MemWrite;
    x_MemToReg = MemToReg;
    x_ALUSrc = ALUSrc;
    x_RegWrite = RegWrite;
    x_zero = zero;
    x_less = less;
    x_next_pc1 = next_pc1;
    x_next_pc2 = next_pc2;
end

endmodule
