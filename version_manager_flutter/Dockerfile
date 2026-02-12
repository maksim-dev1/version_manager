# Этап 1: Сборка Flutter web
FROM ghcr.io/cirruslabs/flutter:stable AS build

WORKDIR /app

# Копируем файлы проекта
COPY pubspec.* ./
RUN flutter pub get

COPY . .

# Собираем Flutter web приложение
RUN flutter build web --release --web-renderer canvaskit --base-href /app/

# Этап 2: Nginx для раздачи статики
FROM nginx:alpine

# Копируем собранное приложение
COPY --from=build /app/build/web /usr/share/nginx/html

# Копируем кастомную конфигурацию nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
