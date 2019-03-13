#! /bin/bash -x
start=`date +%s`

GO_VERSION=1.11.5

STAN_COMMIT='8cc84d6'
STAN_VERSION='0.12.1_1'

docker run \
       --privileged=true --rm \
       -v /var/run/docker.sock:/var/run/docker.sock \
       -v $(pwd):/app \
       -e STAN_COMMIT=${STAN_COMMIT} \
       -e STAN_VERSION=${STAN_VERSION} \
       --entrypoint /bin/sh \
       golang:${GO_VERSION} \
       -c "/app/resources/binary_build.sh"

end=`date +%s`
runtime=$((end-start))

echo "Duration: $runtime second"
