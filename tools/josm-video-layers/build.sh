#!/bin/sh
# Builds the JOSM plugin into the given jar path against the installed JOSM.
set -eu

out=$(realpath -m "$1")
cd "$(dirname "$0")"
josm_jar=${JOSM_PATH:-/usr/share/josm/josm.jar}
build=$(mktemp -d)
trap 'rm -rf "$build"' EXIT

javac --release 17 -nowarn -cp "$josm_jar" -d "$build" $(find src -name '*.java')
cat > "$build/MANIFEST.MF" <<EOF
Plugin-Class: hamburg.veloroute.josm.VideoLayersPlugin
Plugin-Version: 1
Plugin-Mainversion: 19000
Plugin-Description: Loads the veloroute video index layers in the background
EOF
mkdir -p "$(dirname "$out")"
jar --create --file "$out" --manifest "$build/MANIFEST.MF" -C "$build" hamburg
