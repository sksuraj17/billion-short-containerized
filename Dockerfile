FROM cgr.dev/chainguard/node:latest-dev AS build

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM cgr.dev/chainguard/nginx:latest

COPY --from=build /app/build/ /usr/share/nginx/html

EXPOSE 8080