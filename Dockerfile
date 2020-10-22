FROM node:14-alpine
WORKDIR /usr/src/app
ARG NODE_ENV=production

RUN apk update && apk upgrade && \
    apk --no-cache --virtual build-dependencies add \
    bash \
    g++ \
    make \
    python && \
    rm -rf /var/cache/apk/*

# Memory limit
ENV NODE_OPTIONS="--max-old-space-size=4096"
