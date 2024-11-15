#!/bin/sh

# Путь к директории, где находится скрипт
SCRIPT_DIR=$(dirname "$0")
# Корневая директория проекта (предполагая, что .env находится на уровень выше, чем скрипт)
PROJECT_ROOT="$SCRIPT_DIR/.."

# Загружаем переменные из файла .env
if [ -f "$PROJECT_ROOT/.env" ]; then
  set -o allexport
  source "$PROJECT_ROOT/.env"
  set -o allexport -
fi

# Проверка, установлена ли переменная окружения COMPOSE_PROJECT_NAME
if [ -z "$COMPOSE_PROJECT_NAME" ]; then
  echo "Ошибка: переменная окружения COMPOSE_PROJECT_NAME не установлена."
  exit 1
fi

# Генерация сертификатов с mkcert
mkcert -cert-file .docker/traefik/certs/local-cert.pem -key-file .docker/traefik/certs/local-key.pem "${COMPOSE_PROJECT_NAME}.localhost" "*.${COMPOSE_PROJECT_NAME}.localhost" && mkcert -install