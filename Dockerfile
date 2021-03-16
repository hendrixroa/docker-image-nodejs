FROM node:15-alpine
WORKDIR /usr/src/app
ARG NODE_ENV=production

RUN apk update && apk upgrade && \
    apk --no-cache --virtual build-dependencies add \
    bash \
    g++ \
    make \
    curl \ 
    python && \
    rm -rf /var/cache/apk/*
    
RUN apk add --no-cache \
        python3 \
        py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install \
        awscli \
    && rm -rf /var/cache/apk/*

# Memory limit
ENV NODE_OPTIONS="--max-old-space-size=8192"
