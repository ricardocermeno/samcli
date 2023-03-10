FROM python:alpine3.16

RUN apk add --no-cache \
    gcc \
    libc-dev \
    groff \
    git \
    npm

RUN pip3 install --upgrade pip \
    && pip3 --no-cache-dir install awscli aws-sam-cli

RUN npm i -g esbuild
