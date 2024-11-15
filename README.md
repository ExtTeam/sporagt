# Стартовый проект Directus + Nuxt

## Описание проекта

Этот стартовый проект представляет собой приложение, состоящее из двух основных компонентов: Nuxt.js и Directus. Проект
разработан для быстрого создания современных веб-приложений с гибким пользовательским интерфейсом и мощной
административной панелью на основе данных. Весь проект управляется с помощью Docker Compose, что упрощает развертывание
и настройку.

## Сервисы проекта

- **Nuxt**:  Отвечает за клиентскую часть приложения, построенную на фреймворке Nuxt.js.
- **Directus**: Обеспечивает функциональность бэкенда и управление контентом.
- **Postgres**: База данных для хранения данных приложения. Образ основан на PostGIS для работы с геоданными.
- **MinIO**: Локальное хранилище для медиафайлов. Предоставляет S3-совместимый API.
- **Redis**: Используется для кэширования и повышения производительности.
- **Traefik**: Обеспечивает проксирование запросов и управление SSL-сертификатами.

## Подготовка к работе

### Шаг 1: Клонирование репозитория и добавление субмодулей

1. Клонируйте основной репозиторий [directus-nuxt-starter](https://github.com/ExtTeam/directus-nuxt-starter.git):
   ```sh
   git clone https://github.com/ExtTeam/directus-nuxt-starter.git
   cd directus-nuxt-starter
   ```

2. Добавьте субмодуль для Nuxt.js, основанный на [nuxt-starter](https://github.com/ExtTeam/nuxt-starter):
   ```sh
   git submodule add https://github.com/ExtTeam/nuxt-starter.git nuxt
   ```

3. Добавьте субмодуль для Directus, основанный на [directus-starter](https://github.com/ExtTeam/directus-starter):
   ```sh
   git submodule add https://github.com/ExtTeam/directus-starter.git directus
   ```

4. Инициализируйте и обновите все субмодуль:
   ```sh
   git submodule update --init --recursive
   ```

### Шаг 2: Инициализация и запуск проекта

- Подготовьте проект запустив команду:

   ```sh
   make
   ```

Эта команда по умолчанию выполнит цель start_project, которая:

- Даст права на исполнение всем скриптам в папке `sh`.
- Создаст `.env` файлы из образцов.
- Инициализирует необходимые директории для `Docker`.
- Сгенерирует SSL-сертификаты для `Traefik`.

### Шаг 3: Настройка окружения

Настройте переменные окружения:

В каждом из созданных `.env` файлов заполните необходимые переменные:

**Примечание:** В файле `.env` переменная `COMPOSE_PROJECT_NAME` задаёт домен в формате `{COMPOSE_PROJECT_NAME}.localhost` <br> и используется для именования контейнеров Docker.

- `.env` — основные настройки Docker Compose.
- `.env.nuxt` — конфигурация для Nuxt.js.
- `.env.directus` — конфигурация для Directus.
- `.env.postgres` — конфигурация для PostgreSQL.
- `.env.minio` — конфигурация для MinIO.
- `.env.redis` — конфигурация для Redis.

### Шаг 4: Генерация SSL сертификатов

- Для работы с https необходимо сгенерировать сертификаты

    ```sh
    make init_tls
    ```

### Шаг 5: Сборка проекта
- Для сборки всех сервисов используйте следующую команду:
    ```sh
    make build
    ```

### Шаг 6: Запуск проекта
- Для запуска всех сервисов используйте следующую команду:
    ```sh
    make up
    ```

Это поднимет все необходимые сервисы:

`Traefik`, `Nuxt.js`, `Directus`, `PostgreSQL`, `MinIO` и `Redis`.

### Шаг 6: Итог
- Доступны доменные имена
    - `{COMPOSE_PROJECT_NAME}.localhost`
    - `directus.{COMPOSE_PROJECT_NAME}.localhost`
    - `s3.{COMPOSE_PROJECT_NAME}.localhost`

**Примечание:** Переменная `COMPOSE_PROJECT_NAME` устанавливается в файле `.env`

- Доступны порты для `Postgres` и `Redis`

### Остановка проекта

- Остановите все сервисы:

   ```sh
   make down
   ```

- Остановите сервисы и удалите volumes:

    ```sh
    make down-v
    ```

## Полезные команды

- Обновить субмодули до последних версий:
  ```sh
  git submodule update --remote
  ```

- Пересобрать контейнеры после изменения конфигурации:
  ```sh
  make rebuild
  ```

## Структура проекта

- `./.docker` - файлы для работы Docker Compose
    - `./.docker/logs` - логи сервисов
    - `./.docker/minio` - minio
        - `./.docker/minio/data` - данные
    - `./.docker/postgres` - postgres
        - `./.docker/postgres/data` - данные
    - `./.docker/redis` - redis
        - `./.docker/redis/data` - данные
    - `./.docker/traefik` - traefik
        - `./.docker/traefik/certs` - ssl сертификаты
        - `./.docker/traefik/configuration` - конфигурации
    - `./.docker/nuxt` - nuxt
        - `./.docker/nuxt/Dockerfile` - Dockerfile
- `./directus` - Directus
    - `./directus/extensions` - Расширения
    - `./directus/templates` - Шаблоны Email
    - `./directus/migrations` - Миграции
- `./nuxt` - Nuxt
- `./sh` - sh скрипты для запуска и обслуживания проекта
- `./http` - запросы для jb http client

## Поддержка

Если у вас возникли вопросы или проблемы с проектом, пожалуйста, создайте issue
в [репозитории GitHub](https://github.com/ExtTeam/directus-nuxt-starter/issues).
