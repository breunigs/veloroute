defmodule Data.Article do
  alias __MODULE__
  require Logger
  # XXX: otherwise it fails on compile, as if the dependency detection is broken?
  require Data.RoughDate

  @known_params [
    :type,
    :title,
    :name,
    :images,
    :hide_from_map,
    :tags,
    :text,
    :start,
    :end,
    :date,
    :range,
    :no_auto_title,
    :hide_footer
  ]

  defstruct @known_params

  @required_params [:type, :title, :text, :date, :name]
  def required_params, do: @required_params

  def load(path) do
    {:ok, parsed} = YamlElixir.read_from_file(path)

    parsed = Enum.into(parsed, %{}, fn {k, v} -> {String.to_existing_atom(k), v} end)

    name = Path.basename(path, ".yaml")

    {:ok, date} =
      Map.get(parsed, :updated, name)
      |> String.slice(0..9)
      |> case do
        "0000-00-00" -> {:ok, nil}
        x -> Date.from_iso8601(x)
      end

    tags = Map.get(parsed, :tags, []) |> Enum.map(&to_string/1)

    data =
      Map.merge(parsed, %{
        name: name,
        date: date,
        text: String.trim(parsed.text),
        tags: tags,
        start: parsed |> Map.get(:start) |> Data.RoughDate.parse(),
        end: parsed |> Map.get(:end) |> Data.RoughDate.parse()
      })

    struct(Data.Article, data)
  end

  def load_all(path) do
    File.ls!(path)
    |> Task.async_stream(fn filename ->
      load(Path.join([path, filename]))
    end)
    |> Enum.into(%{}, fn {:ok, art} ->
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
      &Data.RoughDate.compare(&1, &2)
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
    Data.RoughDate.range(from, to)
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

  def full_title(%{title: t, type: type}) do
    if String.contains?(t, ":") do
      t
    else
      case type do
        "construction" -> "Baustelle: #{t}"
        "planned-construction" -> "Planung: #{t}"
        "changed-routing" -> "Routenänderung: #{t}"
        "bettelampel" -> "Bettelampel: #{t}"
        "intent" -> "Vorhaben: #{t}"
        "issue" -> "Problemstelle: #{t}"
        "finished" -> "Abgeschlossen: #{t}"
        _ -> t
      end
    end
  end

  def full_title(%{title: t}), do: t
end

defmodule Data.ArticleCache do
  @article_path "data/articles/"
  @glob_path @article_path <> "*.yaml"

  paths = Path.wildcard(@glob_path)
  paths_hash = :erlang.md5(paths)

  for path <- paths do
    @external_resource path
  end

  def __phoenix_recompile__?() do
    Path.wildcard(@glob_path) |> :erlang.md5() != unquote(paths_hash)
  end

  @get Benchmark.measure("loading articles", fn -> Data.Article.load_all(@article_path) end)
  def get, do: @get
end
