FROM node:alpine as build
WORKDIR /app
COPY package.json package-lock.json 
RUN npm install -g npm@11.2.0
COPY . .
RUN npm run build

FROM nginx:stable-alpine

COPY --from=build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]