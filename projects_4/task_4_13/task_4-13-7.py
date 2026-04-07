array = input().split(', ')
sum = 0

for i in array:
    sum += int(i)

mean = sum // len(array)

print(mean)