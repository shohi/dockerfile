#! /bin/bash -x
start=`date +%s`

docker run \
       --privileged=true --rm \
       -v /var/run/docker.sock:/var/run/docker.sock \
       -v $(pwd):/app \
       --entrypoint /bin/sh \
       golang:1.11.5 \
       -c "/app/resources/binary_build.sh"

end=`date +%s`
runtime=$((end-start))

echo "Duration: $runtime second"
