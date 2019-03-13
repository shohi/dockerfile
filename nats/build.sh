#! /bin/bash -x
start=`date +%s`

NATS_VERSION=1.4.1
GO_VERSION=1.12

docker build \
    -t shohik/nats:${NATS_VERSION} \
    --build-arg NATS_VERSION=${NATS_VERSION} \
    --build-arg GO_VERSION=${GO_VERSION} \
    .

end=`date +%s`
runtime=$((end-start))

echo "Duration: $runtime second"
