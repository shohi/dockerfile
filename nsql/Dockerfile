FROM ubuntu:18.04
LABEL maintainer="Shohi Wang <oshohi@gmail.com>"

# install MySQL
RUN apt-get update && \
    apt-get install -y mysql-server && \
    apt-get install -y supervisor

# install nats-streaming server
COPY --from=nats-streaming:0.11.2 /nats-streaming-server /nats-streaming-server

# expose client and management ports
EXPOSE 4222 8222

#
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# run with default memory based store
# ENTRYPOINT ["/nats-streaming-server"]
CMD ["/usr/bin/supervisord"]

