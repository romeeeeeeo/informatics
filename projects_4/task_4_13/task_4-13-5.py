data = input()
numbers = data.split(', ')
max = numbers[0]

for num in numbers:
    if max < num:
        max = num

print(max)