FROM node:10.13-alpine as builder



WORKDIR /app

COPY package.json .
RUN npm install
COPY . .

EXPOSE 3000

RUN npm run build



FROM nginx


COPY --from=builder /app/build /usr/share/nginx/html

