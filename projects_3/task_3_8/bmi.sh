#!/bin/bash

echo "=== Анализатор метаболического индекса (ИМТ) ==="
echo

read -p "Введите вашу массу (в кг): " weight

read -p "Введите ваш рост (в метрах, например 1.75): " height

if [[ -z "$weight" || -z "$height" ]]; then
    echo "Ошибка: оба значения должны быть заполнены!"
    exit 1
fi

bmi=$(echo "scale=0; $weight / ($height * $height)" | bc)

echo
echo "Ваш индекс массы тела (ИМТ): $bmi"


echo -n "Интерпретация: "
if (( $(echo "$bmi < 16" | bc) )); then
    echo "Выраженный дефицит массы тела"
elif (( $(echo "$bmi >= 16 && $bmi < 18.5" | bc) )); then
    echo "Недостаточная масса тела (дефицит)"
elif (( $(echo "$bmi >= 18.5 && $bmi < 25" | bc) )); then
    echo "Нормальная масса тела"
elif (( $(echo "$bmi >= 25 && $bmi < 30" | bc) )); then
    echo "Избыточная масса тела (предожирение)"
elif (( $(echo "$bmi >= 30 && $bmi < 35" | bc) )); then
    echo "Ожирение I степени"
elif (( $(echo "$bmi >= 35 && $bmi < 40" | bc) )); then
    echo "Ожирение II степени"
else
    echo "Ожирение III степени (морбидное)"
fi

echo
echo "Расчет завершен."
