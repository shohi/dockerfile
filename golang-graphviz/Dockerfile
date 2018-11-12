FROM ubuntu:18.04
LABEL maintainer="Shohi Wang <oshohi@gmail.com>"


# install graphviz
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y graphviz


# install latest go
ENV GO_INSTALL_VERSION 1.11.1
RUN cd /tmp && \
    curl -OL https://dl.google.com/go/go$GO_INSTALL_VERSION.linux-amd64.tar.gz && \
    tar -xf go$GO_INSTALL_VERSION.linux-amd64.tar.gz && \
    mv go /usr/local && \
    mkdir -p $HOME/go/src $HOME/go/bin $HOME/go/pkg

# setup go env
ENV GOROOT=/usr/local/go
ENV GOPATH=$HOME/go
ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH
