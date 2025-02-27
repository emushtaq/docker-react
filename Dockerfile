FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# Needed to port map incomming traffic to EBS
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html