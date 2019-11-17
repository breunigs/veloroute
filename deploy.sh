#!/bin/sh

if [ $(id -u) -ne 0 ]; then
  echo "Must be root"
  exit 1
fi

set -e

cd $(dirname $0)
sudo -u www-data git pull

# build to warmup cache and for uploading
sudo -u www-data bundle install --path /tmp/veloroute-gems --deployment
bundle exec ./routes/update_relations.rb

# upload to mapbox
./tools/upload_routes.rb
echo "Sleeping 5 minutes to give Mapbox a chance to pick up new data"
sleep 300

# render & apply
systemctl reload nginx
KEEP=yes PRODUCTION=yes TEST=yes ./build.sh
chown -R www-data:www-data build/
