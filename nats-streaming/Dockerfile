FROM ubuntu:18.10
LABEL maintainer="Shohi Wang <oshohi@gmail.com>"

# install curl and vim
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y vim && \
    apt-get install -y tree && \
    apt-get install -y iftop

# add nats-streaming-server
ARG STAN_VERSION=0.12.1_1
ADD ./resources/nats-streaming-server.v${STAN_VERSION} /nats-streaming-server

RUN chmod +x /nats-streaming-server

# Expose client and management ports
EXPOSE 4222 8222

# Run with default memory based store
ENTRYPOINT ["/nats-streaming-server"]
CMD ["-m", "8222"]


