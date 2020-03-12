# ethr

Dockerfile of `ethr` image.

## Usage

```bash
# start as server
# NOTE: control plane port must be exposed.
docker run --rm -it -p 9999:9999 -p 8888:8888 shohik/ethr:0.1.0

# run client
docker run --rm -it shohik/ethr:0.1.0 -c $HOSTIP

```

## Reference

1. ethr, <https://github.com/microsoft/ethr>
