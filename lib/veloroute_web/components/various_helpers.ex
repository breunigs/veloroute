defmodule VelorouteWeb.VariousHelpers do
  use Phoenix.HTML
  import Guards
  import Phoenix.Component

  def display_route(nil), do: nil

  def display_route(%VelorouteWeb.Live.VideoState{} = state) do
    %Video.Track{parent_ref: ref, text: text} = VelorouteWeb.Live.VideoState.current_track(state)

    cond do
      is_module(ref) ->
        assigns = %{
          href: Article.Decorators.path(ref),
          title: "Du folgst: #{ref.title()} #{text}",
          icon: route_icon(ref),
          text: text
        }

        # Phoenix.Component.link([icon, " ", text],
        #   patch: Article.Decorators.path(ref),
        #   title: "Du folgst: #{ref.title()} #{text}",
        #   id: "videoRoute"
        # )

        ~H"""
        <.link patch={@href} title={@title} id="videoRoute">
          <%= @icon %> <%= @text %>
        </.link>
        """

      true ->
        nil
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
      content_tag(:span, id,
        style: "background: #{article.color()}",
        class: "icon #{article.route_group()}"
      )
    else
      ""
    end
  end

  def to_string_center_zoom(bounds) do
    cz = Geo.CheapRuler.bounds_to_center_zoom(bounds)
    Enum.join([cz.lon, cz.lat, round(cz.zoom)], ",")
  end

  def to_string_bounds(bounds) when is_binary(bounds) and bounds != "" do
    bounds
  end

  def to_string_bounds([[minLon, minLat], [maxLon, maxLat]]),
    do: "#{r(minLon)},#{r(minLat)},#{r(maxLon)},#{r(maxLat)}"

  def to_string_bounds([minLon, minLat, maxLon, maxLat]),
    do: "#{r(minLon)},#{r(minLat)},#{r(maxLon)},#{r(maxLat)}"

  def to_string_bounds(%{
        minLat: minLat,
        minLon: minLon,
        maxLat: maxLat,
        maxLon: maxLon
      }),
      do: "#{r(minLon)},#{r(minLat)},#{r(maxLon)},#{r(maxLat)}"

  @precision 6
  defp r(float), do: Float.round(float, @precision)
end
