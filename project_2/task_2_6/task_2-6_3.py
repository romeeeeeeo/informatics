phenotype_d = input("Введите группу крови донора: (I, II, III, IV) ").strip().lower()
phenotype_r = input("Введите группу крови реципиента: (I, II, III, IV) ").strip().lower()
if phenotype_d == phenotype_r or phenotype_d == "i":
    print("Переливание возможно")

else:
    print("Переливание невозможно, так как ваша группа крови не совпадает с группой крови донора или не является первой. Найдите подходящего для вас донора")