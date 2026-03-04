#!/bin/bash


script_name=$0

if [ $# -lt 2 ]; then
    echo "Ошибка: недостаточно аргументов!" >&2
    echo "Использование: $script_name <имя_гена> <уровень_экспрессии>" >&2
    echo "Пример: $script_name BRCA1 150" >&2
    exit 1
fi

if ! [[ $2 =~ ^[0-9]+$ ]]; then
    echo "Ошибка: уровень экспрессии должен быть целым числом!" >&2
    exit 1
fi

gene_name=$1
expression_level=$2

echo "Экспрессия гена [$gene_name] составляет [$expression_level] единиц"
