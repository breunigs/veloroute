#!/bin/sh

cd "$(dirname "$0")"

set -ex

docker build \
  --build-arg "PRODUCTION=${PRODUCTION:-no}" \
  --build-arg "TEST=${TEST:-no}" \
  -t veloroute:latest .

img=$(docker create veloroute)
docker cp $img:/artifacts/ build_new
docker rm $img&

mkdir -p build/
if [ -d "build" -a ! -L "build" ]; then
  rm -rf build/*
  mv build_new/* build/

  rmdir build_new
else
  echo "./build/ is not a directory, so left artifacts in ./build_new/"
fi

wait
