FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#copying the output from that alpine build
FROM nginx
COPY --from=builder /app/build /usr/share/nginx
