#!/bin/sh

cd "$(dirname "$0")"

set -ex

docker build \
  --build-arg "PRODUCTION=${PRODUCTION:-no}" \
  --build-arg "TEST=${TEST:-no}" \
  -t veloroute:latest .

img=$(docker create veloroute)
mkdir -p build_new/
docker cp $img:/artifacts/. build_new/
docker rm $img&

mkdir -p build/
if [ -d "build" -a ! -L "build" ]; then
  if [ "$KEEP" = "yes" ]; then
    cp -RT build_new/ build/
    rm -rf build_new/
  else
    rm -rf build/*
    mv build_new/* build/
    rmdir build_new
  fi
else
  echo "./build/ is not a directory, so left artifacts in ./build_new/"
fi

wait
