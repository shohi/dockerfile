#! /bin/bash -x
start=`date +%s`

docker build -t golang:graphviz .

end=`date +%s`
runtime=$((end-start))

echo "Duration: $runtime second"
