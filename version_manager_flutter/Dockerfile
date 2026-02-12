# Этап 1: Сборка Flutter web
FROM ghcr.io/cirruslabs/flutter:stable AS build

WORKDIR /app

# Копируем весь проект (включая version_manager_client)
COPY . .

# Переходим в директорию Flutter приложения
WORKDIR /app/version_manager_flutter

# Получаем зависимости
RUN flutter pub get

# Собираем Flutter web приложение БЕЗ base-href
RUN flutter build web --release \
    --dart-define-from-file="lib/.env.json"

# Этап 2: Nginx для раздачи статики
FROM nginx:alpine

# Копируем собранное приложение
COPY --from=build /app/version_manager_flutter/build/web /usr/share/nginx/html

# Копируем кастомную конфигурацию nginx
COPY version_manager_flutter/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
