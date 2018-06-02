#!/bin/sh

if [ $(id -u) -ne 0 ]; then
  echo "Must be root"
  exit 1
fi

apt-get update -qq
apt-get install -qq --yes brotli gdal-bin

cd $(dirname $0)

sudo -u www-data crontab -l | grep "veloroute"
if [ $? -ne 0 ]; then
  (sudo -u www-data crontab -l ; echo "  5 5 * * 3 $(pwd)/update_relations.rb") | sudo -u www-data crontab -
fi

ln -s "$(pwd)/nginx-veloroute" /etc/nginx/sites-enabled/veloroute

exec ./deploy.sh
