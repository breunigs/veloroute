#!/bin/sh

cd "$(dirname "$0")"

set -ex

docker build \
  --build-arg "COMPRESS=${COMPRESS:-no}" \
  --build-arg "TEST=${TEST:-no}" \
  -t veloroute:latest .

img=$(docker create veloroute)
docker cp $img:/artifacts/ build_new
docker rm $img&

mkdir -p build/
rm -rf build/*
mv build_new/* build/

rmdir build_new
wait
