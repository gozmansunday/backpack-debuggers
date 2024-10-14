FROM node:20-alpine

RUN apk add --no-cache imagemagick

WORKDIR /app

COPY . .

RUN npm install

CMD [ "npm", "run", "dev" ]