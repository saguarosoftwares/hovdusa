FROM node:16

WORKDIR /app/medusa

COPY package.json .
COPY yarn.lock .


RUN apt-get update

RUN apt-get install -y python

# RUN npm install -g yarn

RUN yarn global add @medusajs/medusa-cli@latest

RUN yarn install --legacy-peer-deps

COPY . .

# Ensure the docker-entrypoint.sh script has executable permissions
RUN chmod 755 ./docker-entrypoint.sh

EXPOSE 9000
ENTRYPOINT ["./docker-entrypoint.sh", "start"]