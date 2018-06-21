#!/bin/sh

cd "$(dirname "$0")"

set -ex

docker build \
  --build-arg "COMPRESS=${COMPRESS:-yes}" \
  -t veloroute:latest .

img=$(docker create veloroute)
docker cp $img:/artifacts/ build_new
docker rm $img&

rm -rf build/*
mv build_new/* build/

rmdir build_new
wait
