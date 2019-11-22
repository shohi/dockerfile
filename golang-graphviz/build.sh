#! /bin/bash -x
start=$(date '+%s')

GO_VERSION=1.12.5

docker build -t golang:graphviz .
docker build \
  -t golang:graphviz \
  --build-arg GO_VERSION=${GO_VERSION} \
  .

end=$(date '+%s')
runtime=$((end - start))

echo "Duration: $runtime second"
