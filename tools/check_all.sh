#!/bin/bash

cd "${0%/*}"

echo "LSBG:"
./lsbg_check_updates.rb
echo "viabus:"
./viabus_check_updates.rb
echo "Sitzungsdienst:"
./sitzungsdienst_check_updates.rb
