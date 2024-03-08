FROM node:14-alpine as node_builder
WORKDIR /usr/app
COPY ./package.json .
RUN npm i
COPY ./ .
RUN npm run build

FROM nginx
copy --from=node_builder /usr/app/build /usr/share/nginx/html