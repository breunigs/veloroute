defmodule Article.Behaviour do
  @type t() :: atom()

  @typep heex() :: Phoenix.LiveView.Rendered.t()
  @type assigns() :: %{:type => :html | :feed, optional(atom) => any}

  @callback name() :: binary()

  @callback created_at() :: Date.t()
  @callback updated_at() :: Date.t()

  @callback type() :: atom()
  @callback start() :: RoughDate.t()
  @callback stop() :: RoughDate.t()
  @callback construction_site_id_hh() :: [integer()]

  @callback title() :: binary()
  @callback summary() :: binary()
  @callback text(assigns()) :: heex()
  @callback tags() :: [binary()]

  @callback tracks() :: [Video.Track.t()]
end
