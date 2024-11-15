#!/bin/bash

echo "Очистка данных PostgreSQL, MinIO и Redis..."

# Функция для очистки указанных директорий
clear_directory() {
  if [ -d "$1" ]; then
    rm -rf "$1"/*
    echo "Папка очищена: $1"
  else
    echo "Папка не существует: $1"
  fi
}

# Очистка данных
clear_directory "./docker/postgres/data"
clear_directory "./docker/minio/data"
clear_directory "./docker/redis/data"

echo "Все указанные папки данных очищены."