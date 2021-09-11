defmodule Route.Behaviour do
  @type color_hex() :: <<_::56>>

  @callback id() :: binary()
  @callback type() :: :alltag | :freizeit | :rsw
  @callback color() :: color_hex()
  @callback name() :: binary()
  @callback article() :: binary()
  @callback osm_relation_ref() :: binary() | nil
  @callback tracks() :: [Video.Track.t()]
end
