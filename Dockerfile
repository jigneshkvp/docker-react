FROM node:10.13-alpine as builder

ENV HTTP_PROXY "http://proxyseso.scania.com:8080/"
ENV HTTPS_PROXY "http://proxyseso.scania.com:8080/"

WORKDIR /app

COPY package.json .
RUN npm install
COPY . .

EXPOSE 3000

RUN npm run build



FROM nginx

ENV HTTP_PROXY "http://proxyseso.scania.com:8080/"
ENV HTTPS_PROXY "http://proxyseso.scania.com:8080/"

COPY --from=builder /app/build /usr/share/nginx/html

