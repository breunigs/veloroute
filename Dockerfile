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

COPY routes.json /app/
COPY routes/ /app/routes/
RUN /app/routes/update_relations.rb

##############################################################
# Build the frontend                                         #
##############################################################

FROM node:slim as webpack

WORKDIR /app

COPY yarn.lock package.json /app/
RUN yarn install
ENV PATH="/app/node_modules/.bin:${PATH}"

COPY . /app
COPY --from=geodata /app/routes/geo routes/geo/
RUN webpack --output-path /bundled/


##############################################################
# Compress                                                   #
##############################################################

FROM debian:unstable-slim
RUN \
  apt-get -qq update && \
  apt-get -yq install --no-install-recommends brotli

WORKDIR /artifacts

ARG COMPRESS

COPY --from=webpack /bundled .
COPY --from=geodata /app/routes/geo routes/geo/

RUN \
  if [ "$COMPRESS" = "yes" ]; then \
    FILES=$(find . -type f) && \
    brotli -f --best $FILES && \
    gzip -f -k --best $FILES ; \
  fi
