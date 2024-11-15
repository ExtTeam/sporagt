#!/bin/bash

echo "Очистка сертификатов Traefik..."

# Очистка папки с сертификатами
clear_directory() {
  if [ -d "$1" ]; then
    rm -rf "$1"/*
    echo "Папка очищена: $1"
  else
    echo "Папка не существует: $1"
  fi
}

clear_directory "./docker/traefik/certs"

echo "Папка сертификатов очищена."