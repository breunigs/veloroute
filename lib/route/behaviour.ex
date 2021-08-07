defmodule Route.Behaviour do
  @type color_hex() :: <<_::56>>

  @callback id() :: binary()
  @callback type() :: :alltag | :freizeit
  @callback color() :: color_hex()
  @callback name() :: binary()
  @callback article() :: binary()
  @callback osm_relation_ref() :: binary()
  @callback tracks() :: [Video.Track.t()]
end
