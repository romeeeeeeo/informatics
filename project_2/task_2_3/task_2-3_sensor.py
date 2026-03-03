operator_name = input("Введите имя оператора: ")
meaning = input("Введите значение датчика: ")
on = operator_name.upper()
mng = meaning.upper()
with open("log.txt", "w", encoding = "utf-8") as file:
    file.write(f"{on}\t{mng}")
print("Данные успешно сохранены в sensor_log.txt")