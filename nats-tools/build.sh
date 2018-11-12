#! /bin/bash -x
start=`date +%s`

docker build -t shohik/nats-tools:latest .

end=`date +%s`
runtime=$((end-start))

echo "Duration: $runtime second"
