array = input().split(', ')
counter = 0

for i in array:
    if int(i) > 0:
        counter += 1

print(counter)