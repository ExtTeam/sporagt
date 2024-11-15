#!/bin/bash

# Функция для создания папки, если она не существует
create_directory() {
  if [ ! -d "$1" ]; then
    mkdir -p "$1"
    echo "Папка создана: $1"
  else
    echo "Папка уже существует: $1"
  fi
}

# Создание папок для данных
create_directory "./docker/traefik/certs"
create_directory "./docker/postgres/data"
create_directory "./docker/minio/data"
create_directory "./docker/redis/data"

# Создание папок для логов
create_directory "./docker/logs/directus"
create_directory "./docker/logs/nuxt"
create_directory "./docker/logs/traefik"
create_directory "./docker/logs/postgres"
create_directory "./docker/logs/minio"
create_directory "./docker/logs/redis"

echo "Все указанные папки созданы или уже существовали."