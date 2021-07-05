defmodule Article do
  require Logger

  @type t :: %__MODULE__{
          date: Date.t() | nil,
          end: Data.RoughDate.t() | nil,
          full_title: binary() | nil,
          hide_footer: boolean() | nil,
          name: binary(),
          no_auto_title: boolean() | nil,
          start_image: Mapillary.Types.ref() | nil,
          start: Data.RoughDate.t() | nil,
          text: binary(),
          title: binary() | nil,
          type: binary() | nil,
          tracks: [Video.Track.t()]
        }
  @type collection() :: %{binary() => t()}

  import Mapillary.Types, only: [is_ref: 1]

  @known_params [
    :bbox,
    :construction_site_id_hh,
    :date,
    :dynamic,
    :end,
    :full_title,
    :hide_footer,
    :icon,
    :images,
    :name,
    :no_auto_title,
    :range,
    :search_text,
    :search_title,
    :start_image,
    :start_position,
    :start,
    :tags,
    :text,
    :title,
    :type,
    :tracks
  ]

  defstruct @known_params

  @enforce_keys [:type, :title, :full_title, :text, :date, :name]
  def required_params, do: @enforce_keys

  def age_in_days(%__MODULE__{date: date}) do
    Date.diff(Date.utc_today(), date)
  end

  defp start_image(various_img_or_route, bbox)
  defp start_image(nil, _bbox), do: nil
  defp start_image([img | _rest], _bbox) when is_ref(img), do: img
  defp start_image(_, nil), do: nil

  defp start_image(route_ids, bbox) do
    route_ids
    |> List.wrap()
    |> Enum.map(&to_string/1)
    |> Route.List.by_tags()
    |> Route.List.find_within(bbox, 150)
    |> get_in([:img])
  end

  @spec article_ways(Map.Parsed.t()) :: [Map.Way.t()]
  def article_ways(%Map.Parsed{} = map) do
    Map.Element.filter_by_tag(map.ways, :type, "article")
  end

  @spec enrich_with_map(t(), [Map.Way.t()], %{binary() => Geo.BoundingBox.t()}) :: t()
  def enrich_with_map(%__MODULE__{} = art, article_ways, tag_bboxes)
      when is_list(article_ways) and is_map(tag_bboxes) do
    ways = Map.Element.filter_by_tag(article_ways, :name, art.name)

    bbox =
      Map.Element.bbox(ways) ||
        Enum.find_value(art.tags, fn tag ->
          if is_map_key(tag_bboxes, tag), do: tag_bboxes[tag], else: nil
        end)

    start_img = art.start_image || start_image(art.images || art.tags, bbox)

    %{art | start_image: start_img, bbox: bbox}
    |> set_start_position
  end

  @doc ~S"""
  Filters down a list or map of articles. The filter is a keyword list with the
  keys being fields to filter on. The values are regular lists to denote
  acceptable values.

  ## Examples

      iex> %{
      ...>   "a" => ArticleTest.example_article(),
      ...>   "b" => ArticleTest.example_article() |> Map.delete(:tags),
      ...> }
      ...> |> Article.filter([tags: ["7"]])
      %{"a" => ArticleTest.example_article()}

      iex> %{"a" => ArticleTest.example_article()}
      ...> |> Article.filter([tags: ["7"], unknown_key: ["7"]])
      {:error, "Unknown filter key(s) unknown_key"}

      iex> %{"a" => ArticleTest.example_article(date: nil)}
      ...> |> Article.filter([date: [nil]])
      %{"a" => ArticleTest.example_article(date: nil)}
  """
  def filter(all, filter) when is_list(filter) do
    find_invalid_keys(filter)
    |> case do
      [] ->
        all
        |> Enum.filter(fn {_name, art} ->
          Enum.all?(filter, fn {key, allowed_values} ->
            allowed = MapSet.new(allowed_values)
            have = Map.get(art, key) |> Kernel.||([nil]) |> List.wrap() |> MapSet.new()
            matches = MapSet.intersection(allowed, have)

            MapSet.size(matches) > 0
          end)
        end)
        |> Enum.into(%{})

      invalid ->
        {:error, "Unknown filter key(s) #{invalid |> Enum.join(", ")}"}
    end
  end

  defp find_invalid_keys(filter) do
    Enum.reject(filter, fn {key, _vals} ->
      Enum.member?(@known_params, key)
    end)
    |> Keyword.keys()
  end

  def ordered(various, key) when is_binary(key),
    do: ordered(various, String.to_existing_atom(key))

  def ordered(various, key) do
    case key do
      :start -> ordered_by_start(various)
      :date -> ordered_by_date(various)
      nil -> ordered_by_date(various)
    end
  end

  def ordered_by_start(various) do
    various
    |> orderable_only()
    |> Enum.sort_by(
      fn art -> art.start end,
      &Data.RoughDate.compare(&1, &2)
    )
  end

  def ordered_by_date(various) do
    various
    |> orderable_only()
    |> Enum.sort_by(fn
      %__MODULE__{date: %Date{} = d} -> {d.year, d.month, d.day}
    end)
  end

  def related(_all, %__MODULE__{tags: nil}), do: %{}
  def related(_all, %__MODULE__{tags: []}), do: %{}

  def related(all, %__MODULE__{name: name, tags: tags}) when is_list(tags) do
    filter(all, tags: tags)
    |> Map.delete(name)
  end

  def range(%__MODULE__{start: from, end: to}) do
    Data.RoughDate.range(from, to)
  end

  def orderable_only(map) when is_map(map),
    do: map |> Map.values() |> orderable_only()

  def orderable_only([{name, %__MODULE__{name: name}} | _rest] = list),
    do: list |> Enum.map(&elem(&1, 1)) |> orderable_only()

  def orderable_only(list) when is_list(list) do
    list
    |> Enum.reject(fn
      %__MODULE__{date: nil} -> true
      _ -> false
    end)
  end

  defp set_start_position(%{start_image: nil} = art), do: art

  defp set_start_position(%{start_image: img, tags: tags} = art)
       when is_ref(img) and is_list(tags) do
    route_pos =
      Route.List.by_tags(tags)
      |> Route.List.find_close_to(img)
      |> case do
        {_sequence, route_name, img, _route_pos} ->
          {route_name, img}

        _ ->
          0
      end

    Map.put(art, :start_position, route_pos)
  end
end
