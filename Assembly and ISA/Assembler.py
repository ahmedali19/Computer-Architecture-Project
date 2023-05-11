import sys
fout = open("MachineCode.hex", "w")

opcode = {
    # I-type
    'ld':   '0000011',
    'addi': '0010011',
    'slli': '0010011',
    # S-type
    'sd':   '0100011',
    # R-type
    'add':  '0110011',
    'sub':  '0110011',
    'or':   '0110011',
    'and':  '0110011',
    # SB-type
    'beq':  '1100011',
    'bne':  '1100011',
    'blt':  '1100011',
    'bge':  '1100011'
}

funct3 = {
    # I-type
    'ld':   '011',
    'addi': '000',
    'slli': '001',
    # S-type
    'sd':   '011',
    # R-type
    'add':  '000',
    'sub':  '000',
    'or':   '110',
    'and':  '111',
    # SB-type
    'beq':  '000',
    'bne':  '001',
    'blt':  '100',
    'bge':  '101'
}

funct7 = {
    # R-type
    'add':  '0000000',
    'sub':  '0100000',
    'or':   '0000000',
    'and':  '0000000'
}

registers = {
    'zero': 'x0',
    'ra':   'x1',
    'sp':   'x2',
    'gp':   'x3',
    'tp':   'x4',
    't0':   'x5',
    't1':   'x6',
    't2':   'x7',
    'fp':   'x8',
    's0':   'x8',
    's1':   'x9',
    'a0':   'x10',
    'a1':   'x11',
    'a2':   'x12',
    'a3':   'x13',
    'a4':   'x14',
    'a5':   'x15',
    'a6':   'x16',
    'a7':   'x17',
    's2':   'x18',
    's3':   'x19',
    's4':   'x20',
    's5':   'x21',
    's6':   'x22',
    's7':   'x23',
    's8':   'x24',
    's9':   'x25',
    's10':  'x26',
    's11':  'x27',
    't3':   'x28',
    't4':   'x29',
    't5':   'x30',
    't6':   'x31'
}


def clean(assembly):
    # remove comments, and all white spaces
    assembly = [i.strip() for i in assembly if i != '']
    assembly = [i for i in assembly if i[0] != '#']
    return assembly


def standardize(assembly):
    labels = {}
    new_assembly = []
    k = 0
    for i, line in enumerate(assembly):
        # clearing all symbols and creating field list
        instruction = line.replace(',', ' ').replace(
            '(', ' ').replace(')', ' ').split()
        # psuedo instruction handling
        if instruction[0] == 'li':
            instruction = ['addi', instruction[1], 'x0', instruction[2]]
        elif instruction[0] == 'nop':
            instruction = ['addi', 'x0', 'x0', '0']
        elif instruction[0] == 'j':
            instruction = ['beq', 'x0', 'x0', instruction[1]]
        elif instruction[0] == 'bgt':
            instruction = ['blt', instruction[2],
                           instruction[1], instruction[3]]
        elif instruction[0] == 'ble':
            instruction = ['bge', instruction[2],
                           instruction[1], instruction[3]]
        if ':' in instruction[0]:
            labels[instruction[0][:-1]] = i - k
            k += 1
        else:
            new_assembly.append(instruction)

    for i, instruction in enumerate(new_assembly):
        if instruction[0] in ['beq', 'bne', 'blt', 'bge']:
            try:
                x = int(instruction[3])
            except:
                new_assembly[i][3] = str((labels[instruction[3]]-i)*4)
    return new_assembly


def convert(s, op, is_branch=False):
    if op == 'reg':
        if s in registers:
            s = registers[s]
        return str(bin(int(s[1:]))[2:].zfill(5))
    elif op == 'imm':
        x = int(s) if not is_branch else int(s)//2
        if x >= 0:
            return str(bin(x)[2:].zfill(12))
        else:
            return str(bin(2**12 + x)[2:].zfill(12))


def main():
    assembly = open(sys.argv[1], 'r').readlines()
    assembly = standardize(clean(assembly))
    for instruction in assembly:
        key = instruction[0]
        if key in ['add', 'sub', 'or', 'and']:
            rd = convert(instruction[1], 'reg')
            rs1 = convert(instruction[2], 'reg')
            rs2 = convert(instruction[3], 'reg')
            binary = funct7[key] + rs2 + rs1 + funct3[key] + rd + opcode[key]
        elif key in ['ld', 'addi', 'slli']:
            rd = convert(instruction[1], 'reg')
            if key == 'ld':
                rs1 = convert(instruction[3], 'reg')
                imm = convert(instruction[2], 'imm')
            else:
                rs1 = convert(instruction[2], 'reg')
                imm = convert(instruction[3], 'imm')
            binary = imm + rs1 + funct3[key] + rd + opcode[key]
        elif key in ['sd']:
            rs2 = convert(instruction[1], 'reg')
            rs1 = convert(instruction[3], 'reg')
            imm = convert(instruction[2], 'imm')
            binary = imm[:7] + rs2 + rs1 + funct3[key] + imm[7:] + opcode[key]
        elif key in ['beq', 'bne', 'blt', 'bge']:
            rs1 = convert(instruction[1], 'reg')
            rs2 = convert(instruction[2], 'reg')
            imm = convert(instruction[3], 'imm', True)
            binary = imm[0] + imm[2:8] + rs2 + rs1 + \
                funct3[key] + imm[8:] + imm[1] + opcode[key]
        hexadecimal = hex(int(binary, 2))[2:].zfill(8)
        fout.write(hexadecimal + "\n")
        if sys.argv[2]:
            fout.write("00000013" + "\n" + "00000013" +
                       "\n" + "00000013" + "\n")


if __name__ == '__main__':
    main()
