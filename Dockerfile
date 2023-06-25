FROM node:lts-alpine3.18 as build
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app/
RUN npm install
COPY . /app/
RUN npm run build --prod
FROM nginx:stable-alpine3.17-perl
COPY --from=build /app/dist/helpdesk /usr/share/nginx/html
