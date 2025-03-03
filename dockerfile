# Используем официальный образ Node.js
FROM node:21-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем package.json и package-lock.json (если есть)
COPY package.json package-lock.json ./

# Копируем все файлы проекта
COPY . .

# Устанавливаем зависимости
RUN npm install --frozen-lockfile

# Собираем проект
RUN npm run build

# Используем минимальный образ Nginx для сервера
FROM nginx:stable-alpine

# Копируем собранные файлы React-приложения в папку, которую обслуживает Nginx
COPY --from=build /app/build /usr/share/nginx/html

# Копируем кастомный конфиг для Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Открываем порт 80
EXPOSE 80

# Запускаем Nginx
CMD ["nginx", "-g", "daemon off;"]