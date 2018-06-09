#!/bin/sh

if [ $(id -u) -ne 0 ]; then
  echo "Must be root"
  exit 1
fi

cd $(dirname $0)
sudo -u www-data git pull
systemctl reload nginx

sudo -u www-data ./update_relations.rb
sudo -u www-data ./build.sh
