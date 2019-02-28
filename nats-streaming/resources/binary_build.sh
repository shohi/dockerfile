#! /bin/sh -x

GOBIN=$GOPATH/bin

# go get github.com/nats-io/nats-streaming-server
# cd $GOPATH/src/github.com/nats-io/nats-streaming-server
mkdir -p $GOPATH/src/github.com/nats-io
cd $GOPATH/src/github.com/nats-io
git clone https://github.com/nats-io/nats-streaming-server.git
cd nats-streaming-server

git pull --all
git checkout 5baec0d -b v0.12.1

CGO_ENABLED=0 go install -v -a -tags netgo -installsuffix netgo -ldflags "-s -w -X github.com/nats-io/nats-streaming-server/version.GITCOMMIT=`git rev-parse --short HEAD`"

# CGO_ENABLED=0 GOOS=linux   GOARCH=amd64         go build -v -a -tags netgo -installsuffix netgo -ldflags "-s -w -X github.com/nats-io/nats-streaming-server/version.GITCOMMIT=`git rev-parse --short HEAD`" -o pkg/linux-amd64/nats-streaming-server
# CGO_ENABLED=0 GOOS=linux   GOARCH=arm   GOARM=6 go build -v -a -tags netgo -installsuffix netgo -ldflags "-s -w -X github.com/nats-io/nats-streaming-server/version.GITCOMMIT=`git rev-parse --short HEAD`" -o pkg/linux-arm6/nats-streaming-server
# CGO_ENABLED=0 GOOS=linux   GOARCH=arm   GOARM=7 go build -v -a -tags netgo -installsuffix netgo -ldflags "-s -w -X github.com/nats-io/nats-streaming-server/version.GITCOMMIT=`git rev-parse --short HEAD`" -o pkg/linux-arm7/nats-streaming-server
# CGO_ENABLED=0 GOOS=linux   GOARCH=arm64         go build -v -a -tags netgo -installsuffix netgo -ldflags "-s -w -X github.com/nats-io/nats-streaming-server/version.GITCOMMIT=`git rev-parse --short HEAD`" -o pkg/linux-arm64/nats-streaming-server
# CGO_ENABLED=0 GOOS=windows GOARCH=amd64         go build -v -a -tags netgo -installsuffix netgo -ldflags "-s -w -X github.com/nats-io/nats-streaming-server/version.GITCOMMIT=`git rev-parse --short HEAD`" -o pkg/win-amd64/nats-streaming-server.exe

cp $GOBIN/nats-streaming-server /app/resources/nats-streaming-server.v0.12.1