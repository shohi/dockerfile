FROM ubuntu:18.04
LABEL maintainer="Shohi Wang <oshohi@gmail.com>"

ARG GO_VERSION=1.12.5

# install graphviz
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y graphviz

# install latest go
RUN cd /tmp && \
    curl -OL https://dl.google.com/go/go$GO_VERSION.linux-amd64.tar.gz && \
    tar -xf go$GO_VERSION.linux-amd64.tar.gz && \
    mv go / && \
    rm -rf /tmp/*

# setup go env
ENV GOPATH=/go
ENV GOBIN=/go/bin

ENV PATH=$GOBIN:$PATH

VOLUME /pprof
WORKDIR /pprof
