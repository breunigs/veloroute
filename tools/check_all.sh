#!/bin/bash

cd "${0%/*}"

set -euo pipefail

echo "LSBG:"
./lsbg_check_updates.rb

echo "e-vergabe:"
./evergabe_check_updates.rb

echo "viabus:"
./viabus_check_updates.rb

echo
echo "Baustellen & Sitzungsdienst:"
(cd .. && mix do velo.feeds.bauweiser, velo.feeds.sitzungsdienst)

echo ""
echo "manuell:"
echo "* https://www.steg-hamburg.de/veloroute-altona.html"

cd ..
mix list_potentially_outdated
