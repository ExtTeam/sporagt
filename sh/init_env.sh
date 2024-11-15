#!/bin/bash

# Ищем и обрабатываем все файлы .env.*.sample и .env.sample
for sample_file in .env*.sample; do
  if [ -e "$sample_file" ]; then
    new_file="${sample_file%.sample}"
    if [ -f "$new_file" ]; then
      echo "Файл $new_file уже существует. Пропуск..."
    else
      cp "$sample_file" "$new_file"
      echo "Создан файл $new_file из $sample_file"
    fi
  fi
done