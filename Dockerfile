FROM node:18.16.0-slim

ENV TZ=Asia/Tokyo
ENV LANG=ja_JP.UTF-8

WORKDIR /app

COPY package*.json /app

RUN chown -R node:node /app

USER node

# development
CMD ["/bin/bash", "-c", "npm install && npm run dev"]

# production
# CMD ["/bin/bash", "-c", "npm install && npm run build && npm run start"]