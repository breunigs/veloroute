#!/bin/sh

cd "$(dirname "$0")"

docker build -t veloroute:latest .

img=$(docker create veloroute)
docker cp $img:/artifacts build/
docker rm $img
