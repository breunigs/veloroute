defmodule Article.Behaviour do
  @type t() :: atom()

  @typep heex() :: Phoenix.LiveView.Rendered.t()
  @type assigns() :: %{:type => :html | :feed, optional(atom) => any}
  @type link() :: {binary(), binary()} | Phoenix.LiveView.Rendered.t()

  @callback name() :: binary()
  @callback path() :: binary()

  @callback created_at() :: Date.t() | nil
  @callback updated_at() :: Date.t() | nil

  @callback type() :: atom()
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
