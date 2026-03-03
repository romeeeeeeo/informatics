reagent_name = input("Введите название реагента: ")
quanity = input("Введите количество: ")
print(f"Реактив {reagent_name}, поступил на склад в количестве {quanity} шт")

f = open("inventory.txt", "w", encoding="utf-8")
print(f"Реактив {reagent_name} поступил на склад в количестве {quanity} шт.", file=f)
f.close()