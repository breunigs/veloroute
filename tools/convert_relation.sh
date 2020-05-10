#!/bin/bash

set -euo pipefail

relation="${1}"
name="${2:-$1}"

cd /out

echo "Downloading relation ${relation} (saving as ${name})"
curl -s "http://overpass-api.de/api/interpreter?data=relation%28${relation}%29%3Bout%20geom%3B" > "${name}.osm"
# curl -s "https://www.openstreetmap.org/api/0.6/relation/${relation}/full" > "${name}.osm"

osmtogeojson "${name}.osm" > "${name}.geojson"
tokml "${name}.geojson" > "${name}.kml"&
togpx "${name}.geojson" > "${name}.gpx"&
wait
