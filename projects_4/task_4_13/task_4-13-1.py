a, b, c, d = float(input()), float(input()), float(input()), float(input())

min_ab = 0
min_cd = 0
min = 0

if a < b:
    min_ab = a
else:
    min_ab = b

if c < d:
    min_cd = c
else:
    min_cd = d

if min_ab < min_cd:
    min = min_ab
else:
    min = min_cd

print(min)