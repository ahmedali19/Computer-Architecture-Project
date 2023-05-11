import os
fin = open("MachineCode.hex", "r")
fout = open("InstMemory.v", "w")

inst = [i.strip() for i in fin.readlines()]
new_inst = []
for i in inst:
    new_inst.append(i[6:8])
    new_inst.append(i[4:6])
    new_inst.append(i[2:4])
    new_inst.append(i[0:2])
x = len(new_inst)
verilog_code = []
verilog_code.extend([
    "module InstMemory(",
    "    input [63:0] inst_addr,",
    "    output reg [31:0] inst",
    ");",
    "",
    f"reg [7:0] IMEM [{x-1}:0];",
    "integer i;",
    "initial begin",
])
for i in range(len(new_inst)):
    verilog_code.append(f"    IMEM[{i}] = 8'h{new_inst[i]};")
verilog_code.extend([
    "end",
    "",
    "always @(*) begin",
    "	inst = {",
    "		IMEM[inst_addr + 3],",
    "		IMEM[inst_addr + 2],",
    "		IMEM[inst_addr + 1],",
    "		IMEM[inst_addr]",
    "	};",
    "end",
    "",
    "endmodule"
])
for i in verilog_code:
    fout.write(i + "\n")
fin.close()
fout.close()
# os.system('copy /Y "InstMemory.v" "RISCV-Processor\\RISCV-Processor.srcs\\sources_1\\imports\\Final\\InstMemory.v">nul 2>&1')
