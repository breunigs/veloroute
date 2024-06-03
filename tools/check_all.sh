#!/bin/bash

cd "${0%/*}"

set -euo pipefail

echo "e-vergabe:"
./evergabe_check_updates.rb

echo "viabus:"
./viabus_check_updates.rb

echo
echo "Baustellen & Sitzungsdienst:"
(cd .. && mix do velo.feeds.bauweiser, velo.feeds.sitzungsdienst, velo.feeds.lsbg)

cd ..
mix list_potentially_outdated
