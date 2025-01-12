#!/bin/sh

set -eu

export GDAL_NUM_THREADS=ALL_CPUS

outname=$1
shift

echo
echo "combining all input images"
gdalbuildvrt mosaic.vrt "$@"

echo
echo "converting to MBTiles"
gdal_translate \
  -co TILE_FORMAT=WEBP \
  -co BLOCKSIZE=1024 \
  -co RESAMPLING=cubic \
  -co QUALITY=60 \
  -of MBTILES \
  mosaic.vrt \
  output.mbtiles

echo
echo "adding lower resolutions"
gdaladdo \
  -r cubic \
  -minsize 1024 \
  -oo TILE_FORMAT=WEBP \
  -oo QUALITY=60 \
  output.mbtiles

echo
echo "converting to PMTiles"
/go-pmtiles convert output.mbtiles "/output/${outname}"
