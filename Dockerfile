FROM alpine:latest

RUN apk add --no-cache \
    curl \
    gcc \
    libc-dev \
    make

RUN curl -O https://www.noip.com/client/linux/noip-duc-linux.tar.gz && \
    tar xf noip-duc-linux.tar.gz && \
    cd noip-2* && \
    make

COPY bootstrap.sh bootstrap.sh

ENTRYPOINT ./bootstrap.sh
