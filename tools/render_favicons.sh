#!/bin/sh

cd $(dirname $0)
cd ..

inkscape -z -e assets/static/favicons/16.png -w 16 -h 16 data/images/favicon.svg&
inkscape -z -e assets/static/favicons/32.png -w 32 -h 32 data/images/favicon.svg&
inkscape -z -e assets/static/favicons/36.png -w 36 -h 36 data/images/favicon.svg&
inkscape -z -e assets/static/favicons/48.png -w 48 -h 48 data/images/favicon.svg&
inkscape -z -e assets/static/favicons/57.png -w 57 -h 57 data/images/favicon.svg&
inkscape -z -e assets/static/favicons/72.png -w 72 -h 72 data/images/favicon.svg&
inkscape -z -e assets/static/favicons/96.png -w 96 -h 96 data/images/favicon.svg&
inkscape -z -e assets/static/favicons/144.png -w 144 -h 144 data/images/favicon.svg&
inkscape -z -e assets/static/favicons/152.png -w 152 -h 152 data/images/favicon.svg&
inkscape -z -e assets/static/favicons/167.png -w 167 -h 167 data/images/favicon.svg&
inkscape -z -e assets/static/favicons/180.png -w 180 -h 180 data/images/favicon.svg&
inkscape -z -e assets/static/favicons/192.png -w 192 -h 192 data/images/favicon.svg&
wait
