defmodule Article.Behaviour do
  @type t() :: atom()
  @type color_hex() :: <<_::56>> | nil
  @type route_group() :: :alltag | :freizeit | :rsw

  @type assigns() :: %{:type => :html | :feed, optional(atom) => any}
  @type link() :: {binary(), binary()} | Phoenix.LiveView.Rendered.t()

  @callback id() :: binary() | nil
  @callback route_group() :: route_group() | nil
  @callback color() :: color_hex()
  @callback name() :: binary()
  @callback path(nil | map()) :: binary()
  @callback icon() :: :nocargo | :stau | nil

  @callback created_at() :: Date.t() | nil
  @callback updated_at() :: Date.t() | nil

  @callback type() ::
              :construction
              | :planned
              | :finished
              | :intent
              | :changed_routing
              | :issue
              | :ampel
              | nil
  @callback start() :: RoughDate.t()
  @callback stop() :: RoughDate.t()
  @callback construction_site_id_hh() :: [integer()]

  @callback title() :: binary()
  @callback summary() :: binary()
  @callback tags() :: [binary()]

  @callback tracks() :: [Video.Track.t()]

  @callback text(assigns()) :: Phoenix.LiveView.Rendered.t()
  @callback links(assigns()) :: [link()]
end
