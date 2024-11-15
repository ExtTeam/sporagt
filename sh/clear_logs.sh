#!/bin/bash

echo "Очистка логов Directus, Nuxt, Traefik, PostgreSQL, MinIO и Redis..."

# Очистка папок с логами
clear_directory() {
  if [ -d "$1" ]; then
    rm -rf "$1"/*
    echo "Папка очищена: $1"
  else
    echo "Папка не существует: $1"
  fi
}

clear_directory "./docker/logs/directus"
clear_directory "./docker/logs/nuxt"
clear_directory "./docker/logs/traefik"
clear_directory "./docker/logs/postgres"
clear_directory "./docker/logs/minio"
clear_directory "./docker/logs/redis"

echo "Все указанные папки с логами очищены."