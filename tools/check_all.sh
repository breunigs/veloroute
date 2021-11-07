#!/bin/bash

cd "${0%/*}"

echo "Baustellen:"
mix velo.feeds.bauweiser

echo "LSBG:"
./lsbg_check_updates.rb

echo "e-vergabe:"
./evergabe_check_updates.rb

echo "viabus:"
./viabus_check_updates.rb

echo "Sitzungsdienst:"
./sitzungsdienst_check_updates.rb

echo ""
echo "manuell:"
echo "* https://www.steg-hamburg.de/veloroute-altona.html"
echo "* https://www.hamburg.de/harburg/pressemeldungen/"

cd ..
mix list_potentially_outdated
