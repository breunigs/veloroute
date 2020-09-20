defmodule Data.Article do
  alias __MODULE__
  require Logger

  Code.ensure_compiled(Data.RoughDate)
  alias Data.RoughDate

  Code.ensure_compiled(Data.MapCache)
  alias Data.MapCache

  alias Data.ImageCache

  import Mapillary, only: [is_ref: 1]

  alias Data.Image

  @known_params [
    :type,
    :title,
    :name,
    :images,
    :tags,
    :text,
    :dynamic,
    :start,
    :icon,
    :end,
    :date,
    :range,
    :no_auto_title,
    :hide_footer,
    :bbox,
    :start_image,
    :start_position,
    :search_title,
    :search_text
  ]

  defstruct @known_params

  @enforce_keys [:type, :title, :text, :date, :name]
  def required_params, do: @enforce_keys

  def load(path, article_dir \\ "data/articles") do
    try do
      {:ok, parsed} = YamlElixir.read_from_file(path)

      parsed = Enum.into(parsed, %{}, fn {k, v} -> {String.to_existing_atom(k), v} end)

      name = Path.relative_to(path, article_dir) |> String.replace_trailing(".yaml", "")

      {:ok, date} =
        Map.get(parsed, :updated, name)
        |> Path.basename()
        |> String.slice(0..9)
        |> case do
          "0000-00-00" -> {:ok, nil}
          x -> Date.from_iso8601(x)
        end

      tags = Map.get(parsed, :tags, []) |> Enum.map(&to_string/1)

      bbox = find_bbox(name, tags)
      simg = parsed[:start_image] || start_image(parsed[:images] || List.first(tags), bbox)

      data =
        Map.merge(parsed, %{
          name: name,
          date: date,
          text: String.trim(parsed[:text] || ""),
          tags: tags,
          start: parsed |> Map.get(:start) |> RoughDate.parse(),
          end: parsed |> Map.get(:end) |> RoughDate.parse(),
          bbox: bbox,
          start_image: simg
        })
        |> set_start_position
        |> search_preprocess_title
        |> search_preprocess_text

      struct(Data.Article, data)
    rescue
      err ->
        IO.puts("Failed to parse #{path}:")
        require IEx
        IEx.pry()
        raise err
    end
  end

  defp search_preprocess_title(art) do
    t =
      art
      |> full_title()
      |> Kernel.||("")
      |> word_and_num_only()
      |> FuzzyCompare.Preprocessor.process()

    Map.put(art, :search_title, t)
  end

  defp search_preprocess_text(%{text: t} = art) when is_binary(t) do
    t =
      t
      |> Floki.parse_fragment!()
      |> Floki.text()
      |> word_and_num_only()
      |> FuzzyCompare.Preprocessor.process()

    Map.put(art, :search_text, t)
  end

  defp word_and_num_only(str) do
    Regex.replace(~r/[^\p{L}\p{N}]+/u, str, " ")
  end

  defp start_image(various_img_or_route, bbox)
  defp start_image(nil, _bbox), do: nil
  defp start_image([img | _rest], _bbox) when is_ref(img), do: img
  defp start_image(_, nil), do: nil

  defp start_image(route_id, bbox) when is_binary(route_id) or is_integer(route_id) do
    stream = ImageCache.images_stream(route_id: "#{route_id}")
    buffered_bbox = CheapRuler.buffer_bbox(150, bbox)

    img = Image.find_close(stream, bbox) || Image.find_close(stream, buffered_bbox)

    get_in(img, [:img])
  end

  # finds bbox for article if present in map, alternatively falls back to bbox
  # of referenced tags
  defp find_bbox(name, tags) do
    MapCache.bboxes()[name] ||
      Enum.map(tags, &Data.Map.find_relation_by_tag(Data.MapCache.relations(), :id, &1))
      |> Enum.reject(&is_nil/1)
      |> Enum.map(&Map.get(&1, :bbox))
      |> case do
        [] -> nil
        bboxes -> Enum.reduce(bboxes, &CheapRuler.union/2)
      end
  end

  def load_all(files) do
    files
    |> Enum.map(&load/1)
    |> Enum.into(%{}, fn art ->
      {art.name, art}
    end)
  end

  @doc ~S"""
  Filters down a list or map of articles. The filter is a keyword list with the
  keys being fields to filter on. The values are regular lists to denote
  acceptable values.

  ## Examples

      iex> %{
      ...>   "a" => Data.ArticleTest.example_article(),
      ...>   "b" => Data.ArticleTest.example_article() |> Map.delete(:tags),
      ...> }
      ...> |> Data.Article.filter([tags: ["7"]])
      %{"a" => Data.ArticleTest.example_article()}

      iex> %{"a" => Data.ArticleTest.example_article()}
      ...> |> Data.Article.filter([tags: ["7"], unknown_key: ["7"]])
      {:error, "Unknown filter key(s) unknown_key"}

      iex> %{"a" => Data.ArticleTest.example_article(date: nil)}
      ...> |> Data.Article.filter([date: [nil]])
      %{"a" => Data.ArticleTest.example_article(date: nil)}
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
      &RoughDate.compare(&1, &2)
    )
  end

  def ordered_by_date(various) do
    various
    |> orderable_only()
    |> Enum.sort_by(fn
      %Data.Article{date: %Date{} = d} -> {d.year, d.month, d.day}
    end)
  end

  def related(_all, %Article{tags: nil}), do: %{}
  def related(_all, %Article{tags: []}), do: %{}

  def related(all, %Article{name: name, tags: tags}) when is_list(tags) do
    Article.filter(all, tags: tags)
    |> Map.delete(name)
  end

  def range(%Data.Article{start: from, end: to}) do
    RoughDate.range(from, to)
  end

  def orderable_only(map) when is_map(map),
    do: map |> Map.values() |> orderable_only()

  def orderable_only([{name, %Data.Article{name: name}} | _rest] = list),
    do: list |> Enum.map(&elem(&1, 1)) |> orderable_only()

  def orderable_only(list) when is_list(list) do
    list
    |> Enum.reject(fn
      %Data.Article{date: nil} -> true
      _ -> false
    end)
  end

  def full_title(article)

  def full_title(a = %{title: t}) do
    tn = type_name(a)

    cond do
      String.contains?(t, ":") -> t
      tn != nil -> "#{tn}: #{t}"
      true -> t
    end
  end

  def full_title(_), do: nil

  def type_name(%{type: type}) do
    case type do
      "construction" -> "Baustelle"
      "planned-construction" -> "Planung"
      "changed-routing" -> "Routenänderung"
      "ampel" -> "Unfaire Ampel"
      "intent" -> "Vorhaben"
      "issue" -> "Problemstelle"
      "finished" -> "Abgeschlossen"
      _ -> nil
    end
  end

  def type_name(_), do: nil

  defp set_start_position(%{start_image: nil} = art), do: art

  defp set_start_position(%{start_image: img, tags: tags} = art)
       when is_ref(img) and is_list(tags) do
    route_pos =
      ImageCache.images(route_id: tags)
      |> Image.associated_route(ImageCache.sequences(), img)
      |> Kernel.||(0)

    Map.put(art, :start_position, route_pos)
  end
end
