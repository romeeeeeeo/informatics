print(f"--- Расчёт рецепта растовра поваренной соли при 25°C ---\n")

def count_recipe():

    salt_density: float = 2.161
    max_solution_saturation: float = 0.357
    max_mass_fraction = 0.2631

    solution_volume = float(input("Введите нужный объем раствора (мл): "))
    req_salt_сonc = float(input("Введите нужную концентрацию раствора по массе (%): ")) / 100

    if solution_volume < 0 or 1 < req_salt_сonc < 0:
        print(f"\nПроверьте запрос.")
        return count_recipe()
    
    required_salt_mass = solution_volume * ( (req_salt_сonc * salt_density) / (salt_density * (1 - req_salt_сonc) + req_salt_сonc) )
    water_volume = required_salt_mass * (1 - req_salt_сonc) / req_salt_сonc

    if required_salt_mass / water_volume > max_solution_saturation:
        print(f"\n!!! Ваш раствор перенасыщен (максимум {max_mass_fraction*100:.1f}%) !!!")
        print(f"\n!!! Возможно, стоит изменить исходные данные !!!")

    return solution_volume, required_salt_mass, water_volume

recipe = count_recipe()
print(f"\nОТЧЕТ ПО ПРИГОТОВЛЕНИЮ:\n-----------------------\nОбщий объем:\t{recipe[0]:.2f}\nМасса соли:\t{recipe[1]:.2f}\nОбъем воды:\t{recipe[2]:.2f}")

with open("C:\\Users\\roman\\Documents\\vorobev_rg\\projects_2\\task_2_4\\recipe.txt", "w", encoding="utf-8") as file:

    file.write(f"ОТЧЕТ ПО ПРИГОТОВЛЕНИЮ:\n-----------------------\nОбщий объем:\t{recipe[0]:.2f}\nМасса соли:\t{recipe[1]:.2f}\nОбъем воды:\t{recipe[2]:.2f}")

# растворимость NaCl при 25°С равна 35.7 г соли на 100 г воды