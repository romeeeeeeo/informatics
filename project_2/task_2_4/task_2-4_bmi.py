weight = float(input("Введите вашу массу (кг): "))
height = float(input("Введите ваш рост (см): "))
bmi = (weight / (height ** 2/10000))
print(f"---Отчёт о состоянии здоровья ---\nРост\t{height} см\nВес:\t{weight} кг\nИндекс массы тела:\t{bmi:.2f}")