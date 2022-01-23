#!/bin/bash

set -euo pipefail

echo "Tiling PBF for valhalla…"
valhalla_build_tiles -c /build/valhalla.json "${@:2}"
echo "Exporting tiles to polylines…"
valhalla_export_edges --ferries --config /build/valhalla.json > "$1"
