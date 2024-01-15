#!/bin/bash
# post install Docker setup

# Setup volumes and network
docker volume create uptime-kuma-data
docker volume create grafana-data
docker volume create prometheus-data
docker volume create influxdb-data

docker network create monitoring
