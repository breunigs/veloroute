#!/bin/bash

cd "${0%/*}"

echo "LSBG:"
./lsbg_check_updates.rb

echo "viabus:"
./viabus_check_updates.rb

echo "Sitzungsdienst:"
./sitzungsdienst_check_updates.rb

echo "Baustellen:"
./baustellen.rb

echo "manuell: https://www.steg-hamburg.de/veloroute-altona.html"
