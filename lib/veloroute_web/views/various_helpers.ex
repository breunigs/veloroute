defmodule VelorouteWeb.VariousHelpers do
  use Phoenix.HTML

  def display_route(nil), do: nil

  def display_route({id, rest}) do
    rel = relation_by_id(id)
    full_name = Map.get(rel.tags, :name, id)

    content_tag(:div, [route_icon(id), " ", rest], title: "Du folgst: #{full_name} #{rest}")
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

  def route_icon(%Data.Map.Relation{id: id, tags: tags}) do
    route_icon(id, Map.get(tags, :color))
  end

  def route_icon(id) when is_binary(id) do
    rel = relation_by_id(id)
    color = Map.get(rel.tags, :color)
    route_icon(id, color)
  end

  def route_icon(id, color) do
    if color do
      content_tag(:span, id, style: "background: #{color}", class: "icon")
    else
      Phoenix.HTML.html_escape(id)
    end
  end

  def relation_by_id(id) do
    Data.MapCache.relations() |> Data.Map.find_relation_by_tag(:id, id)
  end

  def parse_bounds(%{
        "maxlat" => maxLat,
        "maxlon" => maxLon,
        "minlat" => minLat,
        "minlon" => minLon
      }) do
    %{
      minLon: minLon,
      minLat: minLat,
      maxLon: maxLon,
      maxLat: maxLat
    }
  end

  def parse_bounds(bounds) when is_binary(bounds) do
    with [minLon, minLat, maxLon, maxLat] <- String.split(bounds, ","),
         {minLon, ""} <- Float.parse(minLon),
         {minLat, ""} <- Float.parse(minLat),
         {maxLon, ""} <- Float.parse(maxLon),
         {maxLat, ""} <- Float.parse(maxLat) do
      %{
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

  def to_string_bounds(%{minLat: minLat, minLon: minLon, maxLat: maxLat, maxLon: maxLon}),
    do: "#{r(minLon)},#{r(minLat)},#{r(maxLon)},#{r(maxLat)}"

  @precision 6
  defp r(float), do: Float.round(float, @precision)
end
