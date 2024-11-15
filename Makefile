#!/usr/bin/make
SHELL = /bin/bash

# Убедитесь, что этот шаг запускается с правами администратора
.PHONY:
init_scripts:
	# Установим права на исполнение для всех скриптов в папке sh
	chmod +x ./sh/*.sh

.PHONY: init_env
init_env:
	# Выполним скрипт для инициализации директорий Docker
	./sh/init_env.sh

.PHONY: init_docker_dirs
init_docker_dirs:
	# Выполним скрипт для инициализации директорий Docker
	./sh/init_docker_dirs.sh

.PHONY: init_tls
init_tls:
	# Выполним скрипт для генерации сертификатов
	./sh/init_tls.sh

# Команды для очистки
.PHONY: clear_data
clear_data:
	# Выполним скрипт для очистки данных
	./sh/clear_data.sh

.PHONY: clear_certs
clear_certs:
	# Зачистим сертификаты
	./sh/clear_certs.sh

.PHONY: clear_logs
clear_logs:
	# Зачистим логи
	./sh/clear_logs.sh

.PHONY: clear_all
clear_all: clear_data clear_certs clear_logs
	@echo "Все указанные папки очищены."

# Цель для старта проекта
.PHONY: start_project
start_project: init_scripts init_env init_docker_dirs
	@echo "Проект успешно инициализирован и готов к запуску"

.PHONY: up
up:
	docker compose up -d

.PHONY: down
down:
	docker compose down

.PHONY: down-v
down:
	docker compose down -v

.PHONY: rebuild
rebuild:
	docker compose up --build -d

# Делегирование команды по умолчанию на start_project
.DEFAULT_GOAL := start_project
