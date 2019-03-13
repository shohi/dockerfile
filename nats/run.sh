#! /bin/bash -x
start=`date +%s`

GO_VERSION=1.11.5
NATS_VERSION=1.4.1

docker run \
       --privileged=true --rm \
       -v /var/run/docker.sock:/var/run/docker.sock \
       -v $(pwd):/app \
       -e NATS_VERSION=${NATS_VERSION} \
       --entrypoint /bin/sh \
       golang:${GO_VERSION} \
       -c "/app/resources/binary_build.sh"

end=`date +%s`
runtime=$((end-start))

echo "Duration: $runtime second"
