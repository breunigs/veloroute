defmodule VelorouteWeb.VariousHelpers do
  use Phoenix.HTML
  import Guards
  alias VelorouteWeb.Router.Helpers, as: Routes

  def display_route(nil), do: nil

  def display_route(%VelorouteWeb.Live.VideoState{} = state) do
    %Video.Track{parent_ref: ref, text: text} = VelorouteWeb.Live.VideoState.current_track(state)

    cond do
      is_binary(ref) ->
        IO.warn("legacy call to route with binary")

        content_tag(:span, text,
          title: "Du folgst: #{text} (aus: #{ref})",
          class: "curRoute"
        )

      is_module(ref) ->
        icon = route_icon(ref)

        Phoenix.LiveView.Helpers.live_patch([icon, " ", text],
          to: Routes.page_path(VelorouteWeb.Endpoint, VelorouteWeb.FrameLive, ref.path()),
          title: "Du folgst: #{text}",
          class: "curRoute"
        )

      true ->
        nil
    end
  end

  def display_route({id, rest}) do
    cond do
      route = Route.from_id(id) ->
        icon = route_icon(route)
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
      {key, Map.put(art, :url, art.path())}
    end)
    |> Article.Search.search(query)
  end

  # def article_path(%Article{name: name}) do
  #   case String.split(name, "/") do
  #     ["0000-00-00-" <> name] ->
  #       Routes.page_path(VelorouteWeb.Endpoint, VelorouteWeb.FrameLive, name)

  #     [subdir, "0000-00-00-" <> name] ->
  #       Routes.subdir_path(VelorouteWeb.Endpoint, VelorouteWeb.FrameLive, subdir, name)

  #     [name] ->
  #       Routes.article_path(VelorouteWeb.Endpoint, VelorouteWeb.FrameLive, name)
  #   end
  # end

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

  def route_icon(article) when is_module(article) do
    if article.id() do
      content_tag(:span, article.id(),
        style: "background: #{article.color()}",
        class: "icon #{article.route_group()}"
      )
    else
      ""
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
