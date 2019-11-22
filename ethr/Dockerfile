ARG GO_VERSION=1.13
FROM golang:${GO_VERSION} AS intermediate

WORKDIR /app
RUN git clone https://github.com/microsoft/ethr.git && \
    mkdir -p /out && \
    cd /app/ethr && \
    make build-docker

# final stage
FROM ubuntu:20.04 as builder

# copy ethr
COPY --from=intermediate /out/ethr /ethr
RUN chmod +x /ethr

# install curl and vim
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y vim && \
    apt-get install -y tree && \
    apt-get install -y iftop

# Final stage
# TCP Bw/Conn/Latency
EXPOSE 9999 9998 9996

# HTTP/HTTPS/HTTP Latency
EXPOSE 9899 9799 9896

# Control plane
EXPOSE 8888

ENTRYPOINT ["/ethr"]
CMD ["-s", "-4"]
