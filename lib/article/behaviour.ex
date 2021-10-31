defmodule Article.Behaviour do
  @type t() :: atom()
  @type color_hex() :: <<_::56>> | nil
  @type route_group() :: :alltag | :freizeit | :rsw

  @typep heex() :: Phoenix.LiveView.Rendered.t()
  @type assigns() :: %{:type => :html | :feed, optional(atom) => any}
  @type link() :: {binary(), binary()} | Phoenix.LiveView.Rendered.t()

  @callback id() :: binary() | nil
  @callback route_group() :: route_group() | nil
  @callback color() :: color_hex()
  @callback name() :: binary()
  @callback path() :: binary()
  @callback icon() :: :nocargo | nil

  @callback created_at() :: Date.t() | nil
  @callback updated_at() :: Date.t() | nil

  @callback type() :: :construction | :planned | :finished | :intent | :changed_routing
  @callback start() :: RoughDate.t()
  @callback stop() :: RoughDate.t()
  @callback construction_site_id_hh() :: [integer()]

  @callback title() :: binary()
  @callback summary() :: binary()
  @callback text(assigns()) :: heex()
  @callback tags() :: [binary()]

  @callback tracks() :: [Video.Track.t()]
  @callback links() :: [link()]
end
