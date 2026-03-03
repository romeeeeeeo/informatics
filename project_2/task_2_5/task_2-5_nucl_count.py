dna = input("Введите последвательность нуклеотидов ДНК: ")
dna_u = dna.upper()
count_A = dna_u.count("A")
count_T = dna_u.count("T")
count_G = dna_u.count("G")
count_C = dna_u.count("C")
print(f"Введите последвательность нуклеотидов ДНК: {dna}")
print (dna.upper())
print(f"A:\t{count_A}\nT:\t{count_T}\nG:\t{count_G}\nC:\t{count_C}")
lenght = len(dna_u)
part_A = count_A / lenght * 100
part_T = count_T / lenght * 100
part_G = count_G / lenght * 100
part_C = count_C / lenght * 100
print (f"A:\t{part_A}\nT:\t{part_T}\nG:\t{part_G}\nC:\t{part_C}")