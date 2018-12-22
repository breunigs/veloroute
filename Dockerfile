##############################################################
# copy fresh data from OSM / Mapillary                       #
##############################################################

FROM debian:unstable-slim as geodata
RUN \
  apt-get -qq update && \
  apt-get -yq install --no-install-recommends \
    build-essential ruby ruby-dev ruby-json ruby-bundler ruby-nokogiri ruby-geos libgeos-dev zip

WORKDIR /app

COPY Gemfile Gemfile.lock /app/
RUN bundle install

COPY routes.json *.yaml /app/
COPY routes/ /app/routes/
COPY spec/ /app/spec/

ARG TEST
RUN if [ "$TEST" = "yes" ]; then \
  bundle exec rspec; \
fi

ARG PRODUCTION
RUN /app/routes/update_relations.rb

##############################################################
# Build the frontend                                         #
##############################################################

FROM node:slim as webpack

RUN \
  apt-get -qq update && \
  apt-get -yq install --no-install-recommends \
    python make g++

WORKDIR /app

COPY yarn.lock package.json /app/
RUN yarn install
ENV PATH="/app/node_modules/.bin:${PATH}"

ARG PRODUCTION
COPY --from=geodata /app/routes/geo routes/geo/

RUN if [ "$PRODUCTION" = "yes" ]; then svgo routes/geo/*.svg; fi

COPY . /app

RUN \
  if [ "$PRODUCTION" = "yes" ]; then \
    webpack --mode production --output-path /bundled/ ; \
  else \
    webpack --output-path /bundled/ ; \
  fi

# ensure we're linking the correct file from the checker. Unfortunately Webpack
# doesn't expose filenames within dependencies, it allows only to "import" them.
# That uses a Promise however, which we don't have at this point. So the name
# is simply hardcoded.
WORKDIR /bundled
RUN sed -i "s/POLYFILL_LOADER_FILENAME/$(ls -1 bundle.polyfillLoader.*js)/" bundle.polyfillChecker.*.js

##############################################################
# COMBINING AND FINISHING TOUCHES                            #
##############################################################

FROM debian:unstable-slim
RUN \
  apt-get -qq update && \
  apt-get -yq install --no-install-recommends \
    brotli inkscape optipng

WORKDIR /artifacts

COPY favicons/ favicons/
RUN favicons/render.sh

COPY --from=webpack /app/routes/geo routes/geo/
COPY --from=webpack /bundled .

ARG PRODUCTION
RUN if [ "$PRODUCTION" = "yes" ]; then optipng -q -o7 favicons/*.png; fi
RUN if [ "$PRODUCTION" = "yes" ]; then \
    FILES=$(find . -type f -not -iname '*.png'); \
    echo "Compressing these files:\n${FILES}"; \
    brotli -f --best $FILES & \
    gzip -f -k --best $FILES & \
    wait; \
  fi
