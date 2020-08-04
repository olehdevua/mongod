#FROM ubuntu:focal
FROM debian:bullseye-slim

RUN apt update && apt upgrade -y
RUN apt install -y curl
RUN mkdir /var/run/mongodb /var/lib/mongodb /var/log/mongodb && \
  useradd --system --no-create-home mongodb && \
  chown mongodb:mongodb /var/lib/mongodb && \
  chown mongodb:mongodb /var/log/mongodb && \
  chown mongodb:mongodb /var/run/mongodb

USER mongodb

COPY ./mongod.conf /etc/mongod.conf
COPY ./mongod /usr/bin/mongod

CMD ["/usr/bin/mongod", "--config", "/etc/mongod.conf"]
