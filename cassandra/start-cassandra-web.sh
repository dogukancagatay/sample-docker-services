#!/usr/bin/env bash


docker run --rm -d \
    --name cassandra-web \
    --network cassandra_default \
    -p 3000:3000 \
    -e CASSANDRA_HOST_IP=$(docker inspect --format '{{.NetworkSettings.Networks.cassandra_default.IPAddress}}' cassandra) \
    -e CASSANDRA_PORT=9042 \
    delermando/docker-cassandra-web:v0.4.0

