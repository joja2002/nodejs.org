FROM node:18

ENV NODE_ENV='development'

WORKDIR /node

COPY package.json ./
COPY package-lock.json ./


RUN npm ci

COPY . .


USER root


RUN chown -R node:node /node

RUN chmod -R 777 /node/public 

USER node

EXPOSE 3000

CMD [ "npx", "turbo", "serve" ]
