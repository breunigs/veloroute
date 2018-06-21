# Live Version

You can find the live version at [veloroute.breunig.xyz](https://veloroute.breunig.xyz). It is updated once per week.

# Building

Building this projects has two steps:
1. the frontend, using yarn/webpack
2. fetching fresh Geodata from OSM, using a Ruby script

Refer to `Dockerfile` on how each steps work exactly and which dependencies are required.

The quickest way to a working copy is to run

```bash
./build.sh

# or skipping brotli/gzip static compression
COMPRESS=no ./build.sh
```

and have all artifacts be statically compiled into `build/`, which can then be served a webserver of your choice.
