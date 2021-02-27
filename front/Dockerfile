FROM node:14.4.0-alpine

ARG WORKDIR="/app"
ARG CONTAINER_PORT

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
ENV HOST=0.0.0.0

WORKDIR ${WORKDIR}

COPY package*.json ./
RUN apk update && \
  apk upgrade && \
  apk add --no-cache make gcc g++ python && \
  yarn install && \
  rm -rf /var/cache/apk/*

ADD . /app

# RUN yarn run build

EXPOSE ${CONTAINER_PORT}
