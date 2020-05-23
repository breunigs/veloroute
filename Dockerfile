# syntax=docker/dockerfile:experimental

# run like this: DOCKER_BUILDKIT=1 docker build .

FROM elixir:1.10.2-alpine AS elixirbase
WORKDIR /build

RUN apk add --no-cache build-base && \
    mix local.hex --force && \
    mix local.rebar --force

COPY mix.* /build/
RUN \
  --mount=type=cache,target=/plt-cache/ \
  mkdir -p /build/_build/test/ && \
  cp -r /plt-cache/. /build/_build/test/ && \
  MIX_ENV=test mix do deps.get, dialyzer --plt && \
  cp -r /build/_build/test/*.plt /plt-cache/


COPY config/ /build/config/
COPY data/phoenix_credentials.exs data/settings.ex /build/data/
RUN --network=none \
  MIX_ENV=test mix deps.compile& \
  MIX_ENV=prod mix deps.compile& \
  wait

COPY ./ /build/
RUN --mount=type=cache,target=/data-cache/ \
  mkdir -p /build/data/cache/ && \
  cp -r /data-cache/. /build/data/cache/ && \
  MIX_ENV=test mix do compile, warm_caches && \
  cp -r /build/data/cache/. /data-cache/


FROM elixirbase as test
RUN --network=none \
  MIX_ENV=test mix do test && \
  echo ok > /__test

FROM elixirbase as dialyzer
RUN \
  --network=none \
  --mount=target=/build/priv/plts/,type=cache \
  MIX_ENV=test mix dialyzer && \
  echo ok > /__dialyzerrun


FROM elixirbase as js
RUN apk add --no-cache nodejs npm
RUN --mount=type=cache,target=/build/assets/node_modules \
  npm install --prefix ./assets && \
  npm run deploy --prefix ./assets && \
  MIX_ENV=prod mix phx.digest


FROM elixirbase as build
COPY --from=js /build/priv/static/ /build/priv/static/
RUN --network=none \
  mkdir -p /build/rel/overlays/data/cache/ && \
  cp /build/data/cache/*.dets /build/rel/overlays/data/cache/ && \
  MIX_ENV=prod mix release
# ensure they succeeded
COPY --from=test /__test /
COPY --from=dialyzer /__dialyzerrun /

FROM alpine:3.11
RUN apk add --no-cache ncurses-libs

RUN mkdir -p app/
WORKDIR app/
COPY --from=build /build/_build/prod/rel/veloroute .
EXPOSE 4000
CMD ["bin/veloroute", "start"]
