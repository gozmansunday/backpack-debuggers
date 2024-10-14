FROM node:20-alpine as base

RUN apk add --no-cache imagemagick
WORKDIR /app

# Install dependencies based on the preferred package manager
COPY package*.json ./

# Placed above `COPY . .` to prevent running `npm ci` if any file changes.
# Will only run if `packaeg*.json` changes.
RUN npm install

# Dev Stage
FROM base as dev
COPY . .

# This can be added either here or in docker-compose.yml as `command: npm run dev`
# CMD [ "npm", "run", "dev" ]

# Build Stage
FROM dev as build
RUN npm run build

# Prod Stage
FROM base as prod
COPY --from=build /app/dist /app