defmodule VelorouteWeb.VariousHelpers do
  use VelorouteWeb, :verified_routes
  import Guards
  use Phoenix.Component

  attr :article, :any, required: true
  attr :text, :string, required: true
  attr :rest, :global

  def display_route(%{article: nil} = assigns), do: ~H{}

  def display_route(%{article: ref, text: text} = assigns) do
    assigns =
      assign(assigns, %{
        href: ref.path(),
        title: "Du folgst: #{ref.title()} #{text}",
        icon: route_icon(ref)
      })

    ~H"""
    <.link patch={@href} title={@title} id="videoRoute">
      <%= @icon %> <%= @text %>
    </.link>
    """
  end

  def route_icon(id) when is_binary(id) do
    ref =
      Article.List.find_exact(id) ||
        raise("Tried to find route icon for #{id}, but there is no such article")

    route_icon(ref)
  end

  def route_icon(nil), do: nil

  @max_route_icon_chars 5
  def route_icon(article) when is_module(article) do
    id = article.display_id()

    if id && String.length(id) <= @max_route_icon_chars do
      assigns = %{
        id: id,
        color: article.color(),
        route_group: article.route_group()
      }

      ~H"""
      <span style={"background: #{@color}"} class={"icon #{@route_group}"}>
        <%= @id %>
      </span>
      """
    else
      ""
    end
  end

  @doc """
  Converts the given bounds into a center-zoom variant suitable for bounds
  fitting, suitable for URL inclusion.
  """
  def to_string_center_zoom(bounds) do
    %{lat: lat, lon: lon, zoom: zoom} = Geo.CheapRuler.bounds_to_center_zoom_limited(bounds)
    Enum.join([lon, lat, zoom], ",")
  end
end
