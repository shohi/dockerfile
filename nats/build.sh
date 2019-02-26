#! /bin/bash -x
start=`date +%s`

docker build -t shohik/nats:1.4.1 .

end=`date +%s`
runtime=$((end-start))

echo "Duration: $runtime second"
