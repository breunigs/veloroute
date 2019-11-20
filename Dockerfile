FROM debian:buster-slim as builder
RUN \
  apt-get -qq update && \
  apt-get -yq install --no-install-recommends \
    build-essential ruby ruby-dev ruby-json ruby-bundler ruby-nokogiri \
    ruby-geos libgeos-dev zip zlib1g-dev nodejs python make g++ yarnpkg

WORKDIR /app

# Dependencies 1
COPY yarn.lock package.json /app/
RUN yarnpkg install
ENV PATH="/app/node_modules/.bin:${PATH}"

# Dependencies 2
COPY Gemfile Gemfile.lock /app/
RUN bundle install

# Build Ruby parts
COPY routes.json *.yaml /app/
COPY routes/ /app/routes/
COPY spec/ /app/spec/
COPY blog/ /app/blog/

ARG TEST
RUN if [ "$TEST" = "yes" ]; then \
  bundle exec rspec; \
fi

ARG PRODUCTION
RUN /app/routes/update_relations.rb

# Build JS parts
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

FROM debian:buster-slim
RUN \
  apt-get -qq update && \
  apt-get -yq install --no-install-recommends \
    brotli inkscape optipng

WORKDIR /artifacts

COPY favicons/ favicons/
RUN favicons/render.sh

COPY --from=builder /app/routes/geo routes/geo/
COPY --from=builder /bundled .

ARG PRODUCTION
RUN if [ "$PRODUCTION" = "yes" ]; then optipng -q -o7 favicons/*.png; fi
RUN if [ "$PRODUCTION" = "yes" ]; then \
    FILES=$(find . -type f -not -iname '*.png'); \
    echo "Compressing these files:\n${FILES}"; \
    brotli -f --best $FILES & \
    gzip -f -k --best $FILES & \
    wait; \
  fi
