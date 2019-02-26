FROM golang:1.11.5 AS intermediate

ENV GOBIN=$GOPATH/bin

RUN go get github.com/nats-io/gnatsd && \
    cd $GOPATH/src/github.com/nats-io/gnatsd && \
    git pull --all && \
    git checkout tags/v1.4.1 -b v1.4.1 && \
    go build -o gnatsd main.go

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