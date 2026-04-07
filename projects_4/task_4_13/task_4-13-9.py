array = input().split(', ')
sum = 0

for i in array:
    if int(i) % 2 != 0:
        sum += int(i)

print(sum)