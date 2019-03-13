#! /bin/bash -x
start=`date +%s`

STAN_VERSION='0.12.1_1'

docker build \
    -t shohik/nats-streaming:${STAN_VERSION} \
    --build-arg STAN_VERSION=${STAN_VERSION} \
    .

end=`date +%s`
runtime=$((end-start))

echo "Duration: $runtime second"
