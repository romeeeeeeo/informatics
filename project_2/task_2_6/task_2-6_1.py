pH = float(input("Введите уровень pH: "))
if pH < 7:
    print("Кислая среда")
elif pH > 7:
    print("Щелочная среда")
else:
    print("Нейтральная среда")