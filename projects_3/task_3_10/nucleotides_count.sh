#!/bin/bash


echo "================================================"
echo "        ПОДСЧЁТ НУКЛЕОТИДОВ В FASTA-ФАЙЛАХ"
echo "================================================"
echo

fasta_files=(*.fasta)
if [ ${#fasta_files[@]} -eq 0 ] || [ ! -f "${fasta_files[0]}" ]; then
    echo "❌ В текущей папке нет файлов с расширением .fasta"
    exit 1
fi

printf "%-20s %-8s %-8s %-8s %-8s %-8s\n" "Файл" "A" "T" "G" "C" "Всего"
printf "%-20s %-8s %-8s %-8s %-8s %-8s\n" "--------------------" "--------" "--------" "--------" "--------" "--------"

total_files=0
processed_files=0
skipped_files=0

for file in *.fasta; do
    
        if [ ! -f "$file" ]; then
        continue
    fi
    
    total_files=$((total_files + 1))
    
       if [ ! -s "$file" ]; then
        printf "%-20s %-8s %-8s %-8s %-8s %-8s\n" "$file" "пуст" "пуст" "пуст" "пуст" "0"
        skipped_files=$((skipped_files + 1))
        continue
    fi
    
    echo "🔍 Обрабатывается: $file" >&2
    
        sequence=$(grep -v "^>" "$file" | tr -d ' \t\n\r')
    
       if [ -z "$sequence" ]; then
        printf "%-20s %-8s %-8s %-8s %-8s %-8s\n" "$file" "нет" "нет" "нет" "нет" "0"
        skipped_files=$((skipped_files + 1))
        continue
    fi
    
       count_A=$(echo "$sequence" | grep -o "A" | wc -l)
    count_T=$(echo "$sequence" | grep -o "T" | wc -l)
    count_G=$(echo "$sequence" | grep -o "G" | wc -l)
    count_C=$(echo "$sequence" | grep -o "C" | wc -l)
    
       total=$((count_A + count_T + count_G + count_C))
    
        printf "%-20s %-8s %-8s %-8s %-8s %-8s\n" "$file" "$count_A" "$count_T" "$count_G" "$count_C" "$total"
    
    processed_files=$((processed_files + 1))
    
        
done

echo
echo "================================================"
echo "📊 СТАТИСТИКА ОБРАБОТКИ:"
echo "   Всего файлов .fasta: $total_files"
echo "   Обработано: $processed_files"
echo "   Пропущено (пустых или без данных): $skipped_files"
echo "================================================"
