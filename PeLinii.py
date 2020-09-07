with open("codmasina.txt", "r") as f:
    fout = open("codmasinalinii.txt", "w")
    text = str(f.read())
    for i in range(31):
        fout.write(text[(i*15):((i+1)*15)] + "\n")
    fout.close()