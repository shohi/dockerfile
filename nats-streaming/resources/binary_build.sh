#! /bin/sh -x

GOBIN=$GOPATH/bin

go get github.com/nats-io/nats-streaming-server
cd $GOPATH/src/github.com/nats-io/nats-streaming-server

git pull --all
git checkout 7e7bd7a -b v0.12.1
go build -o nats-streaming-server nats-streaming-server.go

cp nats-streaming-server /app/resources/nats-streaming-server.v0.12.1