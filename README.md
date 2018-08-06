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

# or with brotli/gzip static compression
COMPRESS=yes ./build.sh

# or running all test suites
TEST=yes ./build.sh
```

and have all artifacts be statically compiled into `build/`, which can then be served a webserver of your choice.

# Frontend Coding

To get live reload, first build the dependencies as shown above. If you have setup Ruby locally, you can instead:

```bash
./routes/update_relations.rb
cp -r ./routes/ ./build/
```

Webpack is configured to serve static assets from the build directory. To run a development server, use:

```bash
npm run start:dev
```
