def registerCode(registerName):
    name = registerName.lower()
    if name == "printreg" or name == "reg0" or name == "printregister":
        return "000"
    elif name == "reg1":
        return "001"
    elif name == "reg2":
        return "010"
    elif name == "reg3":
        return "011"
    elif name == "reg4":
        return "100"
    elif name == "reg5":
        return "101"
    elif name == "reg6":
        return "110"
    elif name == "reg7":
        return "111"
    else:
        return "--1"
registre = ["000", "001", "010", "011", "100", "101", "110", "111"]
with open("main.tud", "r") as f:
    ROM = ""
    count = 0
    for codeLine in f:
        instruction = codeLine.lower().split()
        if instruction[0] == "block" or instruction[0] == "bloc" or instruction[0] == "blk":
            ROM = ROM + "0"*15
            break
        elif instruction[0] == "mov":
            if len(instruction) != 3:
                exit(-1)
            reg1 = registerCode(instruction[1])
            reg2 = registerCode(instruction[2])
            if reg2 == "--1" and instruction[2].isnumeric() and reg1 in registre:
                number = "{0:b}".format(int(instruction[2])%256)
                while len(number) < 8:
                    number = "0" + number
                ROM += "0010" + reg1 + number
            elif reg2 in registre and reg1 in registre:
                ROM += "0001" + reg1 + reg2 + "0"*5
            else:
                exit(-1)
        elif instruction[0] == "sub" or instruction[0] == "subb":
            if len(instruction) != 3:
                exit(-2)
            reg1 = registerCode(instruction[1])
            reg2 = registerCode(instruction[2])
            if reg1 in registre and reg2 in registre:
                ROM += "0011" + reg1 + reg2 + 5*"0"
            else:
                exit(-2)
        elif instruction[0] == "add" or instruction[0] == "ad":
            if len(instruction) != 3:
                exit(-3)
            reg1 = registerCode(instruction[1])
            reg2 = registerCode(instruction[2])
            if reg1 in registre and reg2 in registre:
                ROM += "0100" + reg1 + reg2 + 5*"0"
            else:
                exit(-3)
        elif instruction[0] == "mul" or instruction[0] == "mull":
            if len(instruction) != 3:
                exit(-4)
            reg1 = registerCode(instruction[1])
            reg2 = registerCode(instruction[2])
            if reg1 in registre and reg2 in registre:
                ROM += "0101" + reg1 + reg2 + 5*"0"
            else:
                exit(-4)
        elif instruction[0] == "sll" or instruction[0] == "sl":
            if len(instruction) != 2:
                exit(-5)
            reg1 = registerCode(instruction[1])
            if reg1 in registre:
                ROM += "0110" + reg1 + 8*"0"
            else:
                exit(-5)
        elif instruction[0] == "slr" or instruction[0] == "sr":
            if len(instruction) != 2:
                exit(-6)
            reg1 = registerCode(instruction[1])
            if reg1 in registre:
                ROM += "0111" + reg1 + 8*"0"
            else:
                exit(-6)
        elif instruction[0] == "inv" or instruction[0] == "not" or instruction[0] == "no" or instruction[0] == "!":
            if  len(instruction) != 2:
                exit(-7)
            reg1 = registerCode(instruction[1])
            if reg1 in registre and reg2 in registre:
                ROM += "1000" + reg1 + 8*"0"
            else:
                exit(-7)
        elif instruction[0] == "and" or instruction[0] == "&":
            if len(instruction) != 3:
                exit(-8)
            reg1 = registerCode(instruction[1])
            reg2 = registerCode(instruction[2])
            if reg1 in registre and reg2 in registre:
                ROM += "1001" + reg1 + reg2 + 5*"0"
            else:
                exit(-8)
        elif instruction[0] == "or" or instruction[0] == "|":
            if len(instruction) != 3:
                exit(-9)
            reg1 = registerCode(instruction[1])
            reg2 = registerCode(instruction[2])
            if reg1 in registre and reg2 in registre:
                ROM += "1010" + reg1 + reg2 + 5*"0"
            else:
                exit(-9)
        elif instruction[0] == "xor" or instruction[0] == "^":
            if len(instruction) != 3:
                exit(-10)
            reg1 = registerCode(instruction[1])
            reg2 = registerCode(instruction[2])
            if reg1 in registre and reg2 in registre:
                ROM += "1011" + reg1 + reg2 + 5*"0"
            else:
                exit(-10)
        elif instruction[0] == "xnor":
            if len(instruction) != 3:
                exit(-11)
            reg1 = registerCode(instruction[1])
            reg2 = registerCode(instruction[2])
            if reg1 in registre and reg2 in registre:
                ROM += "1100" + reg1 + reg2 + 5*"0"
            else:
                exit(-11)
        elif instruction[0] == "jmp" or instruction[0] == "jump":
            if len(instruction) != 2 and not instruction[1].isnumeric():
                exit(-12)
            adresa = int(instruction[1]) % 32
            adresa = "{0:b}".format(adresa)
            while len(adresa) < 5:
                adresa = "0" + adresa
            ROM += "1101" + adresa + 6*"0"
        elif instruction[0] == "jz" or instruction[0] == "jumpz" or instruction[0] == "jumpzero" or instruction[0] == "jzero":
            if len(instruction) != 2 and not instruction[1].isnumeric():
                exit(-12)
            adresa = int(instruction[1]) % 32
            adresa = "{0:b}".format(adresa)
            while len(adresa) < 5:
                adresa = "0" + adresa
            ROM += "1110" + adresa + 6*"0"
        else:
            exit(-16)
        count += 1
        if count == 31:
            break
    nr_zero = 480 - len(ROM)
    ROM += nr_zero*"0"
    outt = open("codmasina.txt", "w")

    outt.write(ROM)

    outt.close()