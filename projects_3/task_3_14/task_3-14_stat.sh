#!/bin/bash


echo "========================================="
echo "   ЗАДАНИЕ 3: СТАТИСТИКА ОЦЕНОК"
echo "========================================="
echo

if [ ! -f "students.txt" ]; then
    echo "❌ Ошибка: файл students.txt не найден!"
    exit 1
fi


echo "📄 Содержимое файла students.txt:"
echo "----------------------------------------"
cat students.txt
echo


echo "🧮 1. Сумма всех оценок:"
echo "----------------------------------------"
# Первый способ: через awk
sum=$(awk '{sum += $2} END {print sum}' students.txt)
echo "   Сумма (awk): $sum"


echo "📊 2. Средняя оценка:"
echo "----------------------------------------"
average=$(awk '{sum += $2; count++} END {print sum/count}' students.txt)
echo "   Средняя оценка: $average"
echo


echo "📈 3. Минимальная и максимальная оценка:"
echo "----------------------------------------"
min=$(awk 'NR == 1 {min = $2} $2 < min {min = $2} END {print min}' students.txt)
max=$(awk 'NR == 1 {max = $2} $2 > max {max = $2} END {print max}' students.txt)
echo "   Минимальная оценка: $min"
echo "   Максимальная оценка: $max"
echo


echo "📋 4. Полная статистика (через один awk):"
echo "----------------------------------------"
awk '
BEGIN {
    print "--- Анализ успеваемости ---"
    print "Имя\tОценка"
    print "----------------"
}
{
    print $1 "\t" $2
    sum += $2
    count++
    if (NR == 1) {
        min = $2
        max = $2
    } else {
        if ($2 < min) min = $2
        if ($2 > max) max = $2
    }
}
END {
    print "----------------"
    print "Всего студентов: " count
    print "Сумма баллов: " sum
    print "Средний балл: " sum/count
    print "Минимум: " min
    print "Максимум: " max
    print "Размах: " max - min
}' students.txt

echo
echo "========================================="
echo "        ЗАДАНИЕ 3 ВЫПОЛНЕНО"
echo "========================================="
