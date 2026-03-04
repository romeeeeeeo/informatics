#!/bin/bash

read -p "Введите год вашего рождения: " birth_year

current_year=$(date +%Y)

age=$((current_year - birth_year))


echo "Вам примерно $age лет."


readonly CURRENT_YEAR=$current_year
echo "Текущий год зафиксирован (readonly): $CURRENT_YEAR"
