##############################################################
# copy fresh data from OSM                                   #
##############################################################

FROM debian:unstable-slim as geodata
RUN \
  apt-get -qq update && \
  apt-get -yq install --no-install-recommends \
    ruby ruby-json ruby-bundler ruby-nokogiri zip

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

ARG COMPRESS
RUN \
  if [ "$COMPRESS" = "yes" ]; then \
    svgo favicon.svg routes/geo/*.svg ; \
    webpack --env.production --output-path /bundled/ ; \
  else \
    webpack --output-path /bundled/ ; \
  fi
RUN cp favicon.svg /bundled/


##############################################################
# Compress                                                   #
##############################################################

FROM debian:unstable-slim
RUN \
  apt-get -qq update && \
  apt-get -yq install --no-install-recommends \
    brotli imagemagick librsvg2-bin

WORKDIR /artifacts

COPY --from=webpack /bundled .
COPY --from=webpack /app/routes/geo routes/geo/

RUN convert -density 384 favicon.svg -define icon:auto-resize favicon.ico

ARG COMPRESS
RUN \
  if [ "$COMPRESS" = "yes" ]; then \
    FILES=$(find . -type f) && \
    brotli -f --best $FILES && \
    gzip -f -k --best $FILES ; \
  fi
