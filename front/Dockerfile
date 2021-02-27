FROM node:14.4.0-alpine

ARG WORKDIR
ARG CONTAINER_PORT


ENV HOME=/${WORKDIR} \
  LANG=C.UTF-8 \
  TZ=Asia/Tokyo \
  HOST=0.0.0.0

# ENV check（このRUN命令は確認のためなので無くても良い）
RUN echo ${HOME}
RUN echo ${CONTAINER_PORT}

WORKDIR ${HOME}

COPY package*.json ./
RUN yarn install

COPY . .

# RUN yarn run build

EXPOSE ${CONTAINER_PORT}
