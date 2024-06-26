
FROM node:17.1.0

WORKDIR /app/medusa

COPY package.json .

# RUN apk update

RUN apt-get update

RUN apt-get install -y python
#RUN apk add --no-cache python3

RUN npm install -g npm@8.1.2

RUN npm install -g @medusajs/medusa-cli@latest

RUN npm install --legacy-peer-deps

COPY . .
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

EXPOSE 9000
ENTRYPOINT ["/bin/sh", "/docker-entrypoint.sh"]
