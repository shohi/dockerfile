#! /bin/bash -x
start=`date +%s`

ALPINE_VERSION=latest

docker build \
    -t shohik/alpine:${ALPINE_VERSION} \
    --build-arg ALPINE_VERSION=${ALPINE_VERSION} \
    .

end=`date +%s`
runtime=$((end-start))

echo "Duration: $runtime second"
