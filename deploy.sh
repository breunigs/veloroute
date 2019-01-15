#!/bin/sh

if [ $(id -u) -ne 0 ]; then
  echo "Must be root"
  exit 1
fi

set -e

cd $(dirname $0)
sudo -u www-data git pull

# warmup cache
sudo -u www-data bundle install --path /tmp/veloroute-gems --deployment
bundle exec ./routes/update_relations.rb

systemctl reload nginx

KEEP=yes PRODUCTION=yes TEST=yes ./build.sh
chown -R www-data:www-data build/
