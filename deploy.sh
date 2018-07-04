#!/bin/sh

if [ $(id -u) -ne 0 ]; then
  echo "Must be root"
  exit 1
fi

cd $(dirname $0)
sudo -u www-data git pull
systemctl reload nginx

COMPRESS=yes TEST=yes ./build.sh
chown -R www-data:www-data build/
