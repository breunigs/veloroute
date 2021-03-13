#!/usr/bin/zsh

cd "$(dirname "$(readlink -f "$0")")"
cd ..
pwd
sed --regexp-extended -i 's| (http[^ ]+)?bounds=([0-9.]+)%2C([0-9.]+)%2C([0-9.]+)%2C([0-9.]+)&img=([a-z0-9A-Z_-]{22})[^> ]+| bounds="\2,\3,\4,\5" img="\6"|g' data/articles/**/*.yaml
sed --regexp-extended -i 's| (http[^ ]+)?bounds=([0-9.]+)%2C([0-9.]+)%2C([0-9.]+)%2C([0-9.]+)[^> ]+| bounds="\2,\3,\4,\5"|g' data/articles/**/*.yaml
