#! /bin/bash -x
start=`date +%s`

docker build -t shohik/nats-streaming:0.12.1 .

end=`date +%s`
runtime=$((end-start))

echo "Duration: $runtime second"
