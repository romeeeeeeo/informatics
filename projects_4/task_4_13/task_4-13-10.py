array = input().split(', ')
sum = 0

for i in range(0, len(array), 2):
    sum += int(array[i])

print(sum)