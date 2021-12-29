#!/bin/bash

set -euo pipefail

/usr/bin/osmconvert $@

if [ "${OWNER_GROUP_FIX:-}" != "" ]; then
  chown "${OWNER_GROUP_FIX}" /workdir/*.pbf
fi
