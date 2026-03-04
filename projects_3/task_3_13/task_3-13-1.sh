#!/bin/bash


echo "========================================="
echo "   ЗАМЕНА ПУТИ К БАЗЕ ДАННЫХ В SETTINGS.PHP"
echo "========================================="
echo


if [ ! -f "settings.php" ]; then
    echo "❌ Ошибка: файл settings.php не найден!"
    exit 1
fi

echo "📄 Исходный файл settings.php:"
echo "----------------------------------------"
cat settings.php
echo

OLD_PATH="/var/lib/mysql/data"
NEW_PATH="/mnt/ssd/mysql"

echo "🔄 Заменяем: $OLD_PATH → $NEW_PATH"
echo

echo "🔧 Выполняем команду: sed -i 's|$OLD_PATH|$NEW_PATH|g' settings.php"
sed -i "s|$OLD_PATH|$NEW_PATH|g" settings.php

echo
echo "📄 Изменённый файл settings.php:"
echo "----------------------------------------"
cat settings.php
echo

if grep -q "$NEW_PATH" settings.php; then
    echo "✅ Замена успешно выполнена! Новый путь найден в файле."
else
    echo "❌ Ошибка: новый путь не найден в файле."
fi

echo
echo "========================================="
echo "        ЗАДАНИЕ ВЫПОЛНЕНО"
echo "========================================="
