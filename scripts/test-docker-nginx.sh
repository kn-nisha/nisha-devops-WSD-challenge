#!/bin/bash
cd ../02-docker-kubernetes/docker-compose
docker-compose up -d
sleep 5
docker-compose ps
curl -s http://localhost | head -n 5
docker-compose logs nginx | tail -n 10
