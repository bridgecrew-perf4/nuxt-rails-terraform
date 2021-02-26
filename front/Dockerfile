FROM node:14.4.0-alpine

ARG WORKDIR="app"
ARG CONTAINER_PORT


WORKDIR ${WORKDIR}

COPY package*.json ./

RUN apk update && \
  apk upgrade && \
  apk add --no-cache make gcc g++ python && \
  yarn install && \
  rm -rf /var/cache/apk/*

COPY . .

# RUN yarn run build

EXPOSE ${CONTAINER_PORT}
