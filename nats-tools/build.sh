#! /bin/bash -x
start=`date +%s`

docker build -t shohik/nats-tools:0.1.0 .

end=`date +%s`
runtime=$((end-start))

echo "Duration: $runtime second"
