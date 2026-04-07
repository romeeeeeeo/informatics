array = input().split(', ')
counter = 0
sum = 0

for i in range(1, len(array), 2):
    sum += int(array[i])
    counter += 1

mean = sum // counter
print(mean)