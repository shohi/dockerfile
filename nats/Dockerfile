ARG GO_VERSION=1.11.5
FROM golang:${GO_VERSION} AS intermediate

ARG NATS_VERSION=1.4.1

ENV GOBIN=$GOPATH/bin

RUN go get github.com/nats-io/gnatsd && \
    cd $GOPATH/src/github.com/nats-io/gnatsd && \
    git pull --all && \
    git checkout tags/v${NATS_VERSION} -b v${NATS_VERSION} && \
    CGO_ENABLED=0 go build -v -a -tags netgo -installsuffix netgo -ldflags "-s -w -X github.com/nats-io/gnatsd/server.gitCommit=`git rev-parse --short HEAD`"

# final stage
FROM ubuntu:18.10 as builder
LABEL maintainer="Shohi Wang <oshohi@gmail.com>"

# install curl and vim
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y vim && \
    apt-get install -y tree && \
    apt-get install -y iftop

# copy gnatsd
COPY --from=intermediate /go/src/github.com/nats-io/gnatsd/gnatsd /gnatsd
RUN chmod +x /gnatsd

# add gnatsd.conf
ADD ./resources/gnatsd.conf /gnatsd.conf

# Expose client, management, and cluster ports
EXPOSE 4222 8222 6222

# Run via the configuration file
ENTRYPOINT ["/gnatsd"]
CMD ["-c", "gnatsd.conf"]
