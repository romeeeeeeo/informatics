#!/bin/bash


echo "========================================="
echo "   ЗАМЕНА ПРОБЕЛОВ НА ТАБУЛЯЦИЮ"
echo "========================================="
echo

echo "📄 Исходный файл sequences.txt:"
echo "----------------------------------------"
cat sequences.txt
echo

echo "🔄 Выполняем команду: sed -i 's/ /\t/g' sequences.txt"
sed -i 's/ /\t/g' sequences.txt

echo
echo "📄 Изменённый файл sequences.txt:"
echo "----------------------------------------"
cat sequences.txt
echo

echo "🔍 Просмотр с отображением табуляции (cat -T):"
echo "----------------------------------------"
cat -T sequences.txt
echo

echo "🔄 Восстанавливаем исходный файл для следующего запуска..."
cat > sequences.txt << 'EOF'
>seq1 ATGCGTACGTTAG
>seq2 GGCATGCTAGCTA
>seq3 TTAGCGATCGTAC
>seq4 CCGTATGCTAGGA
EOF

echo
echo "✅ Задание выполнено!"
echo "========================================="
