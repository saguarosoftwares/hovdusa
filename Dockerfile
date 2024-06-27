
FROM node:17.1.0

WORKDIR /app/medusa

COPY package.json .

RUN apt-get update

RUN apt-get install -y python

RUN npm install -g npm@8.1.2

RUN npm install -g @medusajs/medusa-cli@latest

RUN npm install --legacy-peer-deps

COPY . .

# Ensure the docker-entrypoint.sh script has executable permissions
RUN chmod +x /app/medusa/docker-entrypoint.sh

EXPOSE 9000
ENTRYPOINT ["/app/medusa/docker-entrypoint.sh", "start"]
