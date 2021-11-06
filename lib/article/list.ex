defmodule Article.List do
  @module_name 'Elixir.Data.Article.'
  @known_types ['Blog', 'Static']

  @type t :: Enumerable.t()
  @typep article :: module()

  import Guards

  @spec all :: t
  def all() do
    :code.all_available()
    |> Stream.map(&elem(&1, 0))
    |> Stream.filter(&List.starts_with?(&1, @module_name))
    |> Stream.map(&List.to_atom/1)
  end

  @spec category(charlist()) :: t
  def category(type) when type in @known_types do
    :code.all_available()
    |> Stream.map(&elem(&1, 0))
    |> Stream.filter(&List.starts_with?(&1, @module_name ++ type))
    |> Stream.map(&List.to_atom/1)
  end

  def recent(), do: recent(_min_arts = 4, _max_arts = 20, _max_days = 14)

  def recent(arts \\ category('Blog'), min, max, days) do
    arts = Enum.sort_by(arts, & &1.updated_at(), {:desc, Date})
    always = Stream.take(arts, min)

    extra =
      arts
      |> Stream.drop(min)
      |> Stream.take(max - min)
      |> Stream.take_while(fn art ->
        Article.Decorators.updated_n_days_ago(art) <= days
      end)

    Stream.concat(always, extra)
  end

  # TODO: this func should be moved somewhere else
  def has_type?(art, type) when type in @known_types do
    art |> Atom.to_charlist() |> List.starts_with?(@module_name ++ type)
  end

  @spec find_exact(t, binary | article | nil) :: article | nil
  def find_exact(_list, nil), do: nil

  def find_exact(list, art) when is_atom(art) do
    if Enum.member?(list, art), do: art, else: nil
  end

  def find_exact(list, key) when is_binary(key) do
    list
    |> filter(key, false)
    |> Enum.at(0)
  end

  def find_exact(_list, _key), do: nil

  @spec find_exact(binary | nil | article) :: article | nil
  def find_exact(key), do: find_exact(all(), key)

  @spec find_with_tags(t, binary | nil) :: article | nil
  def find_with_tags(_list, nil), do: nil

  def find_with_tags(list, key) when is_binary(key) do
    list
    |> filter(key, true)
    |> Enum.at(0)
  end

  @spec find_with_tags(binary | nil) :: article | nil
  def find_with_tags(key), do: find_with_tags(all(), key)

  @spec filter(t, binary, bool) :: t
  def filter(list, key, search_tags \\ false) when is_binary(key) do
    key = keyify(key)

    exact =
      Stream.filter(list, fn art ->
        keyify(art.id()) == key || art.name() == key || to_string(art) == key
      end)

    loose = if search_tags, do: Stream.filter(list, fn art -> has_tag?(art, key) end), else: []

    Stream.concat(exact, loose)
    |> Stream.uniq()
  end

  @spec filter(binary) :: t
  def filter(key), do: filter(all(), key)

  @doc """
  Returns only articles that have videos
  """
  @spec with_tracks(t) :: t
  def with_tracks(list) do
    Stream.filter(list, fn art -> art.tracks() != [] end)
  end

  @doc """
  Finds articles related to the given one. The given article is not part of the
  results.
  """
  @spec related(t, article) :: t
  def related(list, art) when is_module(art) do
    tags = art.tags()

    list
    |> Stream.reject(fn other -> other == art end)
    |> Stream.filter(fn other -> Util.overlap?(tags, other.tags()) end)
  end

  @spec related(article) :: t
  def related(art), do: related(all(), art)

  @doc """
  Find an Article that contains a video with exactly the given resources
  """
  @spec find_by_sources(Video.Track.plain()) :: article() | nil
  def find_by_sources(sources) do
    all()
    |> Enum.find(fn art ->
      Enum.any?(art.tracks(), fn %{videos: videos} -> videos == sources end)
    end)
  end

  defp has_tag?(art, tag) when is_binary(tag) do
    downtags = Enum.map(art.tags(), &String.downcase/1)
    Enum.member?(downtags, tag)
  end

  @typep sorter() :: :desc | :asc
  @spec sort(t(), sorter(), atom) :: t()
  def sort(list, sorter \\ :desc, by \\ :updated_at)

  def sort(list, sorter, :updated_at) do
    list |> Enum.sort() |> Enum.sort_by(& &1.updated_at(), {sorter, Date})
  end

  def sort(list, sorter, :start) do
    list |> Enum.sort() |> Enum.sort_by(& &1.start(), {sorter, Data.RoughDate})
  end

  def sort(list, sorter, :stop) do
    list
    |> Enum.sort()
    |> sort(sorter, :start)
    |> Enum.sort_by(& &1.stop(), {sorter, Data.RoughDate})
  end

  # def sort(list, sorter, fun) do
  #   Enum.sort_by(list, &apply(&1, fun, []), sorter)
  # end

  defp keyify(nil), do: nil
  defp keyify(str) when is_binary(str), do: str |> String.replace(" ", "-") |> String.downcase()
end
