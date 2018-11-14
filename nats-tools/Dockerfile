FROM golang:1.11.2 AS intermediate
LABEL maintainer="Shohi Wang<oshohi@gmail.com>"

ENV GOBIN=$GOPATH/bin

RUN go get github.com/nats-io/go-nats-streaming && \
    go get github.com/nats-io/go-nats && \
    # install tools for nats
    go install github.com/nats-io/go-nats/examples/nats-bench && \
    go install github.com/nats-io/go-nats/examples/nats-echo && \
    go install github.com/nats-io/go-nats/examples/nats-pub && \
    go install github.com/nats-io/go-nats/examples/nats-sub && \
    go install github.com/nats-io/go-nats/examples/nats-qsub && \
    go install github.com/nats-io/go-nats/examples/nats-req && \
    go install github.com/nats-io/go-nats/examples/nats-rply && \
    # install tools for nats streaming server
    go install github.com/nats-io/go-nats-streaming/examples/stan-bench && \
    go install github.com/nats-io/go-nats-streaming/examples/stan-pub && \
    go install github.com/nats-io/go-nats-streaming/examples/stan-sub

# final stage
FROM ubuntu:18.10 as builder

# install curl and vim
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y vim

# copy tools for nats server
COPY --from=intermediate /go/bin/nats-bench /app/nats-bench
COPY --from=intermediate /go/bin/nats-echo /app/nats-echo
COPY --from=intermediate /go/bin/nats-pub /app/nats-pub
COPY --from=intermediate /go/bin/nats-sub /app/nats-sub
COPY --from=intermediate /go/bin/nats-qsub /app/nats-qsub
COPY --from=intermediate /go/bin/nats-req /app/nats-req
COPY --from=intermediate /go/bin/nats-rply /app/nats-rply

# copy tools for nats streaming server
COPY --from=intermediate /go/bin/stan-bench /app/stan-bench
COPY --from=intermediate /go/bin/stan-pub /app/stan-pub
COPY --from=intermediate /go/bin/stan-sub /app/stan-sub

WORKDIR /app

# keep container running, which is useful when deployed in k8s
CMD tail -f /dev/null
