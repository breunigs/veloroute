# defmodule Article do
#   require Logger

#   @type t :: %__MODULE__{
#           date: Date.t() | nil,
#           end: Data.RoughDate.t() | nil,
#           full_title: binary() | nil,
#           hide_footer: boolean() | nil,
#           name: binary(),
#           no_auto_title: boolean() | nil,
#           start: Data.RoughDate.t() | nil,
#           text: binary(),
#           title: binary() | nil,
#           summary: binary() | nil,
#           type: binary() | nil,
#           tracks: [Video.Track.t()]
#         }
#   @type collection() :: %{binary() => t()}

#   @known_params [
#     :bbox,
#     :construction_site_id_hh,
#     :date,
#     :dynamic,
#     :end,
#     :full_title,
#     :hide_footer,
#     :icon,
#     :name,
#     :no_auto_title,
#     :range,
#     :search_text,
#     :search_title,
#     :start,
#     :summary,
#     :tags,
#     :text,
#     :title,
#     :type,
#     :tracks
#   ]

#   defstruct @known_params

#   @enforce_keys [:type, :title, :full_title, :text, :date, :name]
#   def required_params, do: @enforce_keys

#   def age_in_days(%__MODULE__{date: date}) do
#     Date.diff(Date.utc_today(), date)
#   end

#   @spec article_ways(Map.Parsed.t()) :: [Map.Way.t()]
#   def article_ways(%Map.Parsed{} = map) do
#     Map.Element.filter_by_tag(map.ways, :type, "article")
#   end

#   @spec enrich_with_map(t(), [Map.Way.t()], %{binary() => Geo.BoundingBox.t()}) :: t()
#   def enrich_with_map(%__MODULE__{} = art, article_ways, tag_bboxes)
#       when is_list(article_ways) and is_map(tag_bboxes) do
#     ways = Map.Element.filter_by_tag(article_ways, :name, art.name)

#     bbox =
#       Map.Element.bbox(ways) ||
#         Enum.find_value(art.tags, fn tag ->
#           if is_map_key(tag_bboxes, tag), do: tag_bboxes[tag], else: nil
#         end)

#     %{art | bbox: bbox}
#   end

#   @doc ~S"""
#   Filters down a list or map of articles. The filter is a keyword list with the
#   keys being fields to filter on. The values are regular lists to denote
#   acceptable values.

#   ## Examples

#       iex> %{
#       ...>   "a" => ArticleTest.example_article(),
#       ...>   "b" => ArticleTest.example_article() |> Map.delete(:tags),
#       ...> }
#       ...> |> Article.filter([tags: ["7"]])
#       %{"a" => ArticleTest.example_article()}

#       iex> %{"a" => ArticleTest.example_article()}
#       ...> |> Article.filter([tags: ["7"], unknown_key: ["7"]])
#       {:error, "Unknown filter key(s) unknown_key"}

#       iex> %{"a" => ArticleTest.example_article(date: nil)}
#       ...> |> Article.filter([date: [nil]])
#       %{"a" => ArticleTest.example_article(date: nil)}
#   """
#   def filter(all, filter) when is_list(filter) do
#     find_invalid_keys(filter)
#     |> case do
#       [] ->
#         all
#         |> Enum.filter(fn {_name, art} ->
#           Enum.all?(filter, fn {key, allowed_values} ->
#             allowed = MapSet.new(allowed_values)
#             have = Map.get(art, key) |> Kernel.||([nil]) |> List.wrap() |> MapSet.new()
#             matches = MapSet.intersection(allowed, have)

#             MapSet.size(matches) > 0
#           end)
#         end)
#         |> Enum.into(%{})

#       invalid ->
#         {:error, "Unknown filter key(s) #{invalid |> Enum.join(", ")}"}
#     end
#   end

#   defp find_invalid_keys(filter) do
#     Enum.reject(filter, fn {key, _vals} ->
#       Enum.member?(@known_params, key)
#     end)
#     |> Keyword.keys()
#   end

#   def ordered(various, key) when is_binary(key),
#     do: ordered(various, String.to_existing_atom(key))

#   def ordered(various, key) do
#     case key do
#       :start -> ordered_by_start(various)
#       :date -> ordered_by_date(various)
#       nil -> ordered_by_date(various)
#     end
#   end

#   def ordered_by_start(various) do
#     various
#     |> orderable_only()
#     |> Enum.sort_by(
#       fn art -> art.start end,
#       &Data.RoughDate.compare(&1, &2)
#     )
#   end

#   def ordered_by_date(various) do
#     various
#     |> orderable_only()
#     |> Enum.sort_by(fn
#       %__MODULE__{date: %Date{} = d} -> {d.year, d.month, d.day}
#     end)
#   end

#   def related(_all, %__MODULE__{tags: nil}), do: %{}
#   def related(_all, %__MODULE__{tags: []}), do: %{}

#   def related(all, %__MODULE__{name: name, tags: tags}) when is_list(tags) do
#     filter(all, tags: tags)
#     |> Map.delete(name)
#   end

#   def range(%__MODULE__{start: from, end: to}) do
#     Data.RoughDate.range(from, to)
#   end

#   def orderable_only(map) when is_map(map),
#     do: map |> Map.values() |> orderable_only()

#   def orderable_only([{name, %__MODULE__{name: name}} | _rest] = list),
#     do: list |> Enum.map(&elem(&1, 1)) |> orderable_only()

#   def orderable_only(list) when is_list(list) do
#     list
#     |> Enum.reject(fn
#       %__MODULE__{date: nil} -> true
#       _ -> false
#     end)
#   end

#   @spec related_routes(t()) :: [Route.t()]
#   def related_routes(art) do
#     Enum.filter(Route.all(), &Route.has_group?(&1, art.tags))
#   end

#   @spec related_route(t()) :: Route.t() | nil
#   def related_route(art) do
#     Enum.find(Route.all(), &Route.has_group?(&1, art.tags))
#   end

#   @doc """
#   Find a track that is related to this article. If the article has own tracks,
#   it will prefer those. Otherwise it uses the tags to find related routes and
#   pick the first track for the first route matched.
#   """
#   @spec related_track(t()) :: Video.Track.t() | nil
#   def related_track(%{tracks: [track | _rest]}), do: track

#   def related_track(art) do
#     route = related_route(art)
#     if route, do: hd(route.tracks())
#   end

#   @doc """
#   Tries to find a picture of a related video track around the center of the
#   article's bbox.
#   """
#   @spec start_image_path(t()) :: binary() | nil
#   def start_image_path(%{bbox: bbox} = art) when is_map(bbox) do
#     rendered = art |> related_track() |> Video.Rendered.get()

#     if rendered do
#       center = Geo.CheapRuler.center(bbox)

#       %{point: %{time_offset_ms: ms}} =
#         Geo.CheapRuler.closest_point_on_line(rendered.coords(), center)

#       VelorouteWeb.Router.Helpers.image_extract_path(
#         VelorouteWeb.Endpoint,
#         :image,
#         rendered.hash(),
#         ms
#       )
#     end
#   end

#   def start_image_path(_art), do: nil

#   @spec path(t()) :: binary()
#   def path(%__MODULE__{name: "0000-00-00-" <> page_name}), do: "/#{page_name}"
#   def path(%__MODULE__{name: page_name}), do: "/article/#{page_name}"
# end
