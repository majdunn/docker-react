FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# creates /app/build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html