FROM node:20-alpine

RUN apk add --no-cache imagemagick

WORKDIR /app

COPY . .

RUN npm install

# This can be added either here or in docker-compose.yml as `command: npm run dev`
# CMD [ "npm", "run", "dev" ]