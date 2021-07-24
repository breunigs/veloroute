#!/usr/bin/zsh

cd "$(dirname "$(readlink -f "$0")")"
cd ..
pwd
sed --regexp-extended -i 's| (http[^ ]+)?bounds=([0-9.]+)%2C([0-9.]+)%2C([0-9.]+)%2C([0-9.]+)[^> ]*?| bounds="\2,\3,\4,\5"|g' data/articles/**/*.yaml
sed --regexp-extended -i 's| (https://www.openstreetmap.org/[^ ]+)?mlat=([0-9.]+)&mlon=([0-9.]+)[^> ]*?| lat="\2" lon="\3"|g' data/articles/**/*.yaml
