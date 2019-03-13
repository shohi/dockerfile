#! /bin/sh -x
GOBIN=$GOPATH/bin

# go get github.com/nats-io/nats-streaming-server
# cd $GOPATH/src/github.com/nats-io/nats-streaming-server
mkdir -p $GOPATH/src/github.com/nats-io
cd $GOPATH/src/github.com/nats-io
git clone https://github.com/nats-io/nats-streaming-server.git
cd nats-streaming-server

commit=${STAN_COMMIT:-'8cc84d6'}
version=${STAN_VERSION:-'0.12.1_1'}

git pull --all
git checkout ${commit} -b v${version}
#git checkout tags/v${version} -b v${version}

# Set the NATS Server git commit based on the rev that
# we actually vendor. This can be found in the
# vendor/manifest file.
NATS_GIT_COMMIT=3e64f0b
NATS_GIT_PATH=github.com/nats-io/nats-streaming-server/vendor/github.com/nats-io/gnatsd/server.gitCommit

STAN_GIT_COMMIT=`git rev-parse --short HEAD`

# CGO_ENABLED=0 go install -v -a -tags netgo -installsuffix netgo -ldflags "-s -w -X github.com/nats-io/nats-streaming-server/server.gitCommit=${STAN_GIT_COMMIT} -X ${NATS_GIT_PATH}=${NATS_GIT_COMMIT}"

# CGO_ENABLED=0 GOOS=linux   GOARCH=arm   GOARM=6 go build -v -a -tags netgo -installsuffix netgo -ldflags "-s -w -X github.com/nats-io/nats-streaming-server/server.gitCommit=${STAN_GIT_COMMIT} -X ${NATS_GIT_PATH}=${NATS_GIT_COMMIT}" -o $GOPATH/pkg/linux-arm6/nats-streaming-server
# CGO_ENABLED=0 GOOS=linux   GOARCH=arm   GOARM=7 go build -v -a -tags netgo -installsuffix netgo -ldflags "-s -w -X github.com/nats-io/nats-streaming-server/server.gitCommit=${STAN_GIT_COMMIT} -X ${NATS_GIT_PATH}=${NATS_GIT_COMMIT}" -o $GOPATH/pkg/linux-arm7/nats-streaming-server
# CGO_ENABLED=0 GOOS=linux   GOARCH=arm64         go build -v -a -tags netgo -installsuffix netgo -ldflags "-s -w -X github.com/nats-io/nats-streaming-server/server.gitCommit=${STAN_GIT_COMMIT} -X ${NATS_GIT_PATH}=${NATS_GIT_COMMIT}" -o $GOPATH/pkg/linux-arm64/nats-streaming-server

CGO_ENABLED=0 GOOS=linux   GOARCH=amd64  go build -v -a -tags netgo -installsuffix netgo -ldflags "-s -w -X github.com/nats-io/nats-streaming-server/server.gitCommit=${STAN_GIT_COMMIT} -X ${NATS_GIT_PATH}=${NATS_GIT_COMMIT}" -o $GOPATH/pkg/linux-amd64/nats-streaming-server
# CGO_ENABLED=0 GOOS=windows GOARCH=amd64  go build -v -a -tags netgo -installsuffix netgo -ldflags "-s -w -X github.com/nats-io/nats-streaming-server/server.gitCommit=${STAN_GIT_COMMIT} -X ${NATS_GIT_PATH}=${NATS_GIT_COMMIT}" -o $GOPATH/pkg/pkg/win-amd64/nats-streaming-server.exe
CGO_ENABLED=0 GOOS=darwin  GOARCH=amd64  go build -v -a -tags netgo -installsuffix netgo -ldflags "-s -w -X github.com/nats-io/nats-streaming-server/server.gitCommit=${STAN_GIT_COMMIT} -X ${NATS_GIT_PATH}=${NATS_GIT_COMMIT}" -o $GOPATH/pkg/darwin-amd64/nats-streaming-server

cp $GOPATH/pkg/linux-amd64/nats-streaming-server /app/resources/nats-streaming-server.v${version}
cp $GOPATH/pkg/darwin-amd64/nats-streaming-server /app/resources/nats-streaming-server-darwin.v${version}

# cp $GOBIN/nats-streaming-server /app/resources/nats-streaming-server.v${version}
