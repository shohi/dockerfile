#! /bin/bash -x
start=`date +%s`

docker build -t nsql .

end=`date +%s`
runtime=$((end-start))

echo "Duration: $runtime second"
