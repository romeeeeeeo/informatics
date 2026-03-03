capsules = int(input("Сколько капсул произвели: "))
capacity = int(input("Вместимость одной упаковки: "))
full_pack = capsules // capacity
remains = capsules % capacity

print(f"---Отчёт фасовочного цеха---\nПолных упаковок:\t{full_pack}\nОстаток капсул:\t{remains}")
