#!/bin/sh

sassc -m -t compressed base.scss base.css

brotli -f --best *.js *.css *.html&
gzip -f -k --best *.js *.css *.html&

wait
