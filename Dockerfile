##############################################################
# copy fresh data from OSM                                   #
##############################################################

FROM debian:unstable-slim as geodata
RUN \
  apt-get -qq update && \
  apt-get -yq install --no-install-recommends \
    gdal-bin \
    jq \
    ruby ruby-json ruby-bundler

WORKDIR /app

COPY Gemfile Gemfile.lock /app/
RUN bundle install

COPY routes.json /app/
COPY routes/ /app/routes/
COPY spec/ /app/spec/

ARG TEST
RUN if [ "$TEST" = "yes" ]; then bundle exec rspec; fi

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

COPY --from=webpack /bundled .
COPY --from=geodata /app/routes/geo routes/geo/

ARG COMPRESS
RUN \
  if [ "$COMPRESS" = "yes" ]; then \
    FILES=$(find . -type f) && \
    brotli -f --best $FILES && \
    gzip -f -k --best $FILES ; \
  fi
