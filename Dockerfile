##############################################################
# Build the frontend                                         #
##############################################################

FROM debian:unstable-slim as webpack
RUN \
  apt-get -qq update && \
  apt-get -yq install --no-install-recommends gnupg && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN apt-key adv --keyserver eu.pool.sks-keyservers.net --recv 9D41F3C3

RUN \
  echo "deb http://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list && \
  apt-get -qq update && \
  apt-get -yq install \
    yarn nodejs curl

WORKDIR /app

COPY yarn.lock package.json /app/
RUN yarn install
ENV PATH="/app/node_modules/.bin:${PATH}"

COPY . /app
RUN webpack --output-path /bundled/


##############################################################
# copy fresh data from OSM                                   #
##############################################################

FROM debian:unstable-slim as geodata
RUN \
  apt-get -qq update && \
  apt-get -yq install --no-install-recommends \
    gdal-bin \
    jq \
    ruby ruby-json


WORKDIR /app

COPY . /app
RUN /app/update_relations.rb


##############################################################
# Compress                                                   #
##############################################################

FROM debian:unstable-slim
RUN \
  apt-get -qq update && \
  apt-get -yq install --no-install-recommends brotli

WORKDIR /artifacts

COPY --from=webpack /bundled .
COPY --from=geodata /app/geo geo/

RUN \
  FILES=$(find . -type f) && \
  brotli -f --best $FILES && \
  gzip -f -k --best $FILES
