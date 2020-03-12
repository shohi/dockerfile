#!/usr/bin/env bash -x

# build docker image
function dockerize() {
  local ver=${1:-"0.1.0"}
  local gover=${2:-"1.13"}

  docker build \
    -t shohik/ethr:${ver} \
    --build-arg GO_VERSION=${gover} \
    .
}

# push docker image to docker hub
function deploy() {
  local ver=${1:-"0.1.0"}
  docker push shohik/ethr:${ver}
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
    "deploy")
      shift
      deploy $@
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
