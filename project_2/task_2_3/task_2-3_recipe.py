nutrient_medium = input("Введите название питетельной среды: ")
nm = nutrient_medium.upper()
agar_concentration = input("Введите концентрацию агара (%): ")
sterilization_tenperature = input("Введите температуру стерилизации: ")
with open("recipe.txt", "w", encoding = "utf-8") as file:
    file.write(f"{nutrient_medium}")
print(f"{nm}\n\n{agar_concentration}\n{sterilization_tenperature}")
print("Файл 'recipe.txt' успешно сформирован")