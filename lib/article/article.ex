defmodule Article do
  @type t() :: module()
  @type color_hex() :: <<_::56>> | nil
  @type route_group() :: :alltag | :freizeit | :rsw
  @type article_type() ::
          :construction
          | :planned
          | :finished
          | :intent
          | :changed_routing
          | :issue
          | :ampel
          | nil

  @type assigns() :: %{:render_target => :html | :feed, optional(atom) => any}
  @type link() :: {binary(), binary()} | Phoenix.LiveView.Rendered.t()

  @callback id() :: binary() | nil
  @callback route_group() :: route_group() | nil
  @callback color() :: color_hex()
  @callback name() :: binary()
  @callback icon() :: :nocargo | :stau | :issue

  @callback created_at() :: Date.t() | nil
  @callback updated_at() :: Date.t() | nil

  @callback type() :: article_type()

  @callback start() :: Data.RoughDate.t()
  @callback stop() :: Data.RoughDate.t()
  @callback construction_site_id_hh() :: [integer()]

  @callback title() :: binary()
  @callback summary() :: binary()
  @callback tags() :: [binary()]

  @callback tracks() :: [Video.Track.t()]

  @callback text(assigns()) :: Phoenix.LiveView.Rendered.t()
  @callback links(assigns()) :: [link()]

  def module_name, do: "Elixir.Data.Article."
  def known_categories, do: ~w/Blog Static/
end
