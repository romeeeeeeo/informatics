#!/bin/bash


echo "========================================="
echo "   ЗАДАНИЕ 5: АНАЛИЗ ЛОГ-ФАЙЛА"
echo "========================================="
echo

if [ ! -f "log.txt" ]; then
    echo "❌ Ошибка: файл log.txt не найден!"
    exit 1
fi


echo "📄 Содержимое файла log.txt:"
echo "----------------------------------------"
cat log.txt
echo

echo "🔹 1. Только ошибки (ERROR):"
echo "----------------------------------------"
awk '$2 == "ERROR" {print "❌ " $0}' log.txt
echo

echo "🔹 2. Только предупреждения (WARN):"
echo "----------------------------------------"
awk '$2 == "WARN" {print "⚠️  " $0}' log.txt
echo

echo "🔹 3. Статистика по типам событий:"
echo "----------------------------------------"
awk '{
    count[$2]++
}
END {
    print "Тип события | Количество"
    print "--------------------"
    for (type in count) {
        printf "%-11s | %d\n", type, count[type]
    }
}' log.txt
echo


echo "🔹 4. События после 10:01:00:"
echo "----------------------------------------"
awk '$1 > "10:01:00" {print $0}' log.txt
echo

echo "🔹 5. Время и сообщение (без уровня):"
echo "----------------------------------------"
awk '{print $1, substr($0, index($0,$3))}' log.txt
echo

echo "🔹 6. Средняя длина сообщения:"
echo "----------------------------------------"
awk '{
    total_length += length($0)
    count++
}
END {
    print "Всего строк: " count
    print "Средняя длина: " total_length/count
}' log.txt
echo

echo "🔹 7. События, содержащие 'соединен':"
echo "----------------------------------------"
awk '/соединен/ {print "🔍 " $0}' log.txt
echo

echo "🔹 8. Полный анализ лога:"
echo "----------------------------------------"
awk '
BEGIN {
    print "========== АНАЛИЗ ЛОГ-ФАЙЛА =========="
    print ""
}
{
    lines[NR] = $0
    level = $2
    count_level[level]++
    
        if (NR == 1) first_time = $1
    last_time = $1
}
END {
    print "📊 ОБЩАЯ СТАТИСТИКА:"
    print "   Всего записей: " NR
    print "   Временной диапазон: " first_time " - " last_time
    print ""
    
    print "📋 РАСПРЕДЕЛЕНИЕ ПО УРОВНЯМ:"
    for (level in count_level) {
        printf "   %-6s: %d (%.1f%%)\n", level, count_level[level], (count_level[level]/NR)*100
    }
    
        print ""
    print "🕒 ПОСЛЕДНИЕ 3 ЗАПИСИ:"
    for (i = NR-2; i <= NR; i++) {
        if (i > 0) print "   " lines[i]
    }
}' log.txt

echo
echo "========================================="
echo "        ЗАДАНИЕ 5 ВЫПОЛНЕНО"
echo "========================================="
