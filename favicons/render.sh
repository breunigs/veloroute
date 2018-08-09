#!/bin/sh

cd $(dirname $0)

inkscape -z -e favicon-16.png -w 16 -h 16 favicon.svg&
inkscape -z -e favicon-32.png -w 32 -h 32 favicon.svg&
inkscape -z -e favicon-36.png -w 36 -h 36 favicon.svg&
inkscape -z -e favicon-48.png -w 48 -h 48 favicon.svg&
inkscape -z -e favicon-57.png -w 57 -h 57 favicon.svg&
inkscape -z -e favicon-72.png -w 72 -h 72 favicon.svg&
inkscape -z -e favicon-96.png -w 96 -h 96 favicon.svg&
inkscape -z -e favicon-144.png -w 144 -h 144 favicon.svg&
inkscape -z -e favicon-152.png -w 152 -h 152 favicon.svg&
inkscape -z -e favicon-167.png -w 167 -h 167 favicon.svg&
inkscape -z -e favicon-180.png -w 180 -h 180 favicon.svg&
inkscape -z -e favicon-192.png -w 192 -h 192 favicon.svg&
wait
