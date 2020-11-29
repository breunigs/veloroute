#!/bin/bash

cd "$(dirname "$(readlink -f "$0")")"
cd ..
sed --regexp-extended -i 's| bounds=([0-9.]+)%2C([0-9.]+)%2C([0-9.]+)%2C([0-9.]+)&img=([a-z0-9A-Z_-]{22})| bounds="\1,\2,\3,\4" img="\5"|g' data/articles/*.yaml
