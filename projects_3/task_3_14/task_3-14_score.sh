#!/bin/bash



echo "========================================="
echo "   ЗАДАНИЕ 2: ФИЛЬТРАЦИЯ ПО ОЦЕНКАМ"
echo "========================================="
echo

# Проверяем, существует ли файл
if [ ! -f "students.txt" ]; then
    echo "❌ Ошибка: файл students.txt не найден!"
    exit 1
fi


echo "📄 Содержимое файла students.txt:"
echo "----------------------------------------"
cat students.txt
echo


echo "🌟 1. Студенты с оценкой ВЫШЕ 80:"
echo "----------------------------------------"
awk '$2 > 80 {print "✅ " $1 " - " $2 " баллов"}' students.txt

count_above=$(awk '$2 > 80 {count++} END {print count+0}' students.txt)
echo "   Всего: $count_above студентов"
echo


echo "📚 2. Студенты с оценкой НИЖЕ 70:"
echo "----------------------------------------"
awk '$2 < 70 {print "⚠️ " $1 " - " $2 " баллов"}' students.txt
count_below=$(awk '$2 < 70 {count++} END {print count+0}' students.txt)
echo "   Всего: $count_below студентов"
echo


echo "🥇 3. Первая строка файла:"
echo "----------------------------------------"
awk 'NR == 1 {print "Имя: " $1 ", Оценка: " $2}' students.txt
echo

echo "📊 Градации оценок:"
echo "----------------------------------------"
awk '{
    if ($2 >= 90) grade = "Отлично"
    else if ($2 >= 75) grade = "Хорошо"
    else if ($2 >= 60) grade = "Удовлетворительно"
    else grade = "Неудовлетворительно"
    print $1 ": " $2 " баллов - " grade
}' students.txt

echo
echo "========================================="
echo "        ЗАДАНИЕ 2 ВЫПОЛНЕНО"
echo "========================================="
