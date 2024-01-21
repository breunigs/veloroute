defmodule VelorouteWeb.VariousHelpers do
  use VelorouteWeb, :verified_routes
  require Logger
  import Guards
  import Phoenix.Component

  def display_route(nil), do: nil

  def display_route(%VelorouteWeb.Live.VideoState{} = state) do
    %Video.Track{parent_ref: ref, text: text} = VelorouteWeb.Live.VideoState.current_track(state)

    if is_module(ref) do
      assigns = %{
        href: Article.Decorators.path(ref),
        title: "Du folgst: #{ref.title()} #{text}",
        icon: route_icon(ref),
        text: text
      }

      ~H"""
      <.link patch={@href} title={@title} id="videoRoute">
        <%= @icon %> <%= @text %>
      </.link>
      """
    end
  end

  @short_month_names [
    "Jan",
    "Feb",
    "Mär",
    "Apr",
    "Mai",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Okt",
    "Nov",
    "Dez"
  ]

  # TODO: unify with RoughDate?
  @long_month_names [
    "Januar",
    "Februrar",
    "März",
    "April",
    "Mai",
    "Juni",
    "Juli",
    "August",
    "September",
    "Oktober",
    "November",
    "Dezember"
  ]
  def short_date(%Date{day: day, month: month}) do
    "#{day}. #{Enum.at(@short_month_names, month - 1)}"
  end

  def long_date(%Date{day: day, month: month, year: year}) do
    "#{day}. #{Enum.at(@long_month_names, month - 1)} #{year}"
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
  fitting.
  """
  def to_string_center_zoom(bounds) do
    cz = Geo.CheapRuler.bounds_to_center_zoom(bounds)

    zoom =
      round(cz.zoom)
      |> max(Basemap.Constants.min_zoom())
      |> min(Basemap.Constants.bounds_fitting_max_zoom())

    Enum.join([cz.lon, cz.lat, zoom], ",")
  end
end
