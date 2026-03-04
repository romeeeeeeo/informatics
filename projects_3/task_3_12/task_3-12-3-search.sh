#!/bin/bash


echo "========================================="
echo "   ПОИСК ИЗОБРАЖЕНИЙ В СПИСКЕ ФАЙЛОВ"
echo "========================================="
echo

echo "📋 Содержимое файла files_list.txt:"
echo "----------------------------------------"
cat files_list.txt
echo

echo "🔍 Поиск изображений (jpg, png, gif):"
echo "----------------------------------------"
echo "Команда: grep -E \"\\.(jpg|png|gif)$\" files_list.txt"
echo

grep -E "\.(jpg|png|gif)$" files_list.txt

count=$(grep -Ec "\.(jpg|png|gif)$" files_list.txt)
echo
echo "✅ Найдено изображений: $count"
echo
echo "========================================="
echo "📸 Сделайте скриншот этого вывода!"
echo "========================================="
