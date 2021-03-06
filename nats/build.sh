#!/usr/bin/env bash -x

function dockerize() {
  NATS_VERSION=1.4.1
  GO_VERSION=1.12

  docker build \
    -t shohik/nats:${NATS_VERSION} \
    --build-arg NATS_VERSION=${NATS_VERSION} \
    --build-arg GO_VERSION=${GO_VERSION} \
    .

}

#######################################################################
#                             main entry                              #
#######################################################################
function main() {
  local start=$(date '+%s')

  case "$1" in
    "docker")
      shift
      dockerize $@
      ;;
    *)
      echo "Unknown command"
      ;;
  esac

  local end=$(date '+%s')
  local runtime=$((end - start))
  echo "processing time: ${runtime}  second"
}

main $@
