ARG ALPINE_VERSION=latest
FROM alpine:${ALPINE_VERSION}
LABEL maintainer="oshohi@gmail.com"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk update && \
    apk add ca-certificates

ENTRYPOINT []
WORKDIR /
