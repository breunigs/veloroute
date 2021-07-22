defmodule VelorouteWeb.VariousHelpers do
  use Phoenix.HTML
  alias VelorouteWeb.Router.Helpers, as: Routes

  def display_route(nil), do: nil

  def display_route(%VelorouteWeb.Live.VideoState{} = state) do
    %Video.Track{parent_ref: ref, text: text} = VelorouteWeb.Live.VideoState.current_track(state)

    cond do
      is_binary(ref) ->
        content_tag(:span, text,
          title: "Du folgst: #{text} (aus: #{ref})",
          class: "curRoute"
        )

      is_atom(ref) and not is_nil(ref) ->
        icon = route_icon(ref.id(), ref.color())

        Phoenix.LiveView.Helpers.live_patch([icon, " ", text],
          to: Routes.page_path(VelorouteWeb.Endpoint, VelorouteWeb.FrameLive, ref.id()),
          title: "Du folgst: #{ref.name()} #{text}",
          class: "curRoute"
        )

      true ->
        nil
    end
  end

  def display_route({id, rest}) do
    cond do
      route = Route.from_id(id) ->
        icon = route_icon(route.id(), route.color())
        name = route.name()

        Phoenix.LiveView.Helpers.live_patch([icon, " ", rest],
          to: Routes.page_path(VelorouteWeb.Endpoint, VelorouteWeb.FrameLive, id),
          title: "Du folgst: #{name} #{rest}",
          class: "curRoute"
        )

      true ->
        nil
    end
  end

  @spec article_search(binary | nil) :: [SearchResult.t()]
  def article_search(query) do
    Cache.Articles.get()
    |> Enum.into(%{}, fn {key, art} ->
      {key, Map.put(art, :url, article_path(art))}
    end)
    |> Article.Search.search(query)
  end

  def article_path(%Article{name: name}) do
    case String.split(name, "/") do
      ["0000-00-00-" <> name] ->
        Routes.page_path(VelorouteWeb.Endpoint, VelorouteWeb.FrameLive, name)

      [subdir, "0000-00-00-" <> name] ->
        Routes.subdir_path(VelorouteWeb.Endpoint, VelorouteWeb.FrameLive, subdir, name)

      [name] ->
        Routes.article_path(VelorouteWeb.Endpoint, VelorouteWeb.FrameLive, name)
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

  def route_icon(%Map.Relation{id: id, tags: tags}) do
    route_icon(id, Map.get(tags, :color))
  end

  def route_icon(id) when is_binary(id) do
    route = Route.from_id(id)
    if route, do: route_icon(id, route.color())
  end

  def route_icon(id, color) do
    if color do
      content_tag(:span, id, style: "background: #{color}", class: "icon")
    else
      Phoenix.HTML.html_escape(id)
    end
  end

  def parse_bounds(%{
        "maxlat" => maxLat,
        "maxlon" => maxLon,
        "minlat" => minLat,
        "minlon" => minLon
      }) do
    %Geo.BoundingBox{
      minLon: minLon,
      minLat: minLat,
      maxLon: maxLon,
      maxLat: maxLat
    }
  end

  def parse_bounds(%{maxLat: maxLat, maxLon: maxLon, minLat: minLat, minLon: minLon}) do
    %Geo.BoundingBox{minLon: minLon, minLat: minLat, maxLon: maxLon, maxLat: maxLat}
  end

  def parse_bounds([[minLon, minLat], [maxLon, maxLat]]) do
    %Geo.BoundingBox{minLon: minLon, minLat: minLat, maxLon: maxLon, maxLat: maxLat}
  end

  def parse_bounds([minLon, minLat, maxLon, maxLat]) do
    %Geo.BoundingBox{minLon: minLon, minLat: minLat, maxLon: maxLon, maxLat: maxLat}
  end

  def parse_bounds(bounds) when is_binary(bounds) do
    with [minLon, minLat, maxLon, maxLat] <- String.split(bounds, ","),
         {minLon, ""} <- Float.parse(minLon),
         {minLat, ""} <- Float.parse(minLat),
         {maxLon, ""} <- Float.parse(maxLon),
         {maxLat, ""} <- Float.parse(maxLat) do
      %Geo.BoundingBox{
        minLon: minLon,
        minLat: minLat,
        maxLon: maxLon,
        maxLat: maxLat
      }
    else
      _ -> nil
    end
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
