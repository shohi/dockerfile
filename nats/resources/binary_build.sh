#! /bin/sh -x

GOBIN=$GOPATH/bin

# go get github.com/nats-io/gnatsd
# cd $GOPATH/src/github.com/nats-io/gnatsd
mkdir -p $GOPATH/src/github.com/nats-io
cd $GOPATH/src/github.com/nats-io
git clone https://github.com/nats-io/gnatsd.git
cd gnatsd

version=${NATS_VERSION:-'1.4.1'}
git pull --all
git checkout tags/v${version} -b v${version}

#CGO_ENABLED=0 go install -v -a -tags netgo -installsuffix netgo -ldflags "-s -w -X github.com/nats-io/gnatsd/server.gitCommit=`git rev-parse --short HEAD`"

CGO_ENABLED=0 GOOS=linux GOARCH=arm GOARM=6 go build -v -a -tags netgo -installsuffix netgo -ldflags "-s -w -X github.com/nats-io/gnatsd/server.gitCommit=`git rev-parse --short HEAD`" -o $GOPATH/pkg/linux-arm6/gnatsd
CGO_ENABLED=0 GOOS=linux GOARCH=arm GOARM=7 go build -v -a -tags netgo -installsuffix netgo -ldflags "-s -w -X github.com/nats-io/gnatsd/server.gitCommit=`git rev-parse --short HEAD`" -o $GOPATH/pkg/linux-arm7/gnatsd
CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -v -a -tags netgo -installsuffix netgo -ldflags "-s -w -X github.com/nats-io/gnatsd/server.gitCommit=`git rev-parse --short HEAD`" -o $GOPATH/pkg/linux-arm64/gnatsd

CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -v -a -tags netgo -installsuffix netgo -ldflags "-s -w -X github.com/nats-io/gnatsd/server.gitCommit=`git rev-parse --short HEAD`" -o $GOPATH/pkg/linux-amd64/gnatsd
CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -v -a -tags netgo -installsuffix netgo -ldflags "-s -w -X github.com/nats-io/gnatsd/server.gitCommit=`git rev-parse --short HEAD`" -o $GOPATH/pkg/win-amd64/gnatsd
CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -v -a -tags netgo -installsuffix netgo -ldflags "-s -w -X github.com/nats-io/gnatsd/server.gitCommit=`git rev-parse --short HEAD`" -o $GOPATH/pkg/darwin-amd64/gnatsd

cp $GOPATH/pkg/linux-amd64/gnatsd /app/resources/gnatsd-linux.v${version}
cp $GOPATH/pkg/darwin-amd64/gnatsd /app/resources/gnatsd-darwin.v${version}

# cp $GOBIN/gnatsd /app/resources/gnatsd.v${version}
