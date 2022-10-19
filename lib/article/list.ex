defmodule Article.List do
  @type t :: Enumerable.t()
  import Guards

  @spec all :: t
  def all() do
    Util.modules_with_prefix(Article.module_name())
  end

  @spec category(binary()) :: t
  @known_categories Article.known_categories()
  def category(type) when type in @known_categories do
    Util.modules_with_prefix(Article.module_name() <> type <> ".")
  end

  def recent(), do: recent(_min_arts = 4, _max_arts = 20, _max_days = 14)

  def recent(arts \\ category("Blog"), min, max, days) do
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

  @spec find_exact(t, binary | Article.t() | nil) :: Article.t() | nil
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

  @spec find_exact(binary | nil | Article.t()) :: Article.t() | nil
  def find_exact(key), do: find_exact(all(), key)

  @spec find_with_tags(t, binary | nil) :: Article.t() | nil
  def find_with_tags(_list, nil), do: nil

  def find_with_tags(list, key) when is_binary(key) do
    list
    |> filter(key, true)
    |> Enum.at(0)
  end

  @spec find_with_tags(binary | nil) :: Article.t() | nil
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
  Finds articles related to the given one using tag based comparison. The given
  article is not part of the results.
  """
  @spec related(t, Article.t()) :: t
  def related(list, art) when is_module(art) do
    tags = art.tags()

    list
    |> Stream.reject(fn other -> other == art end)
    |> Stream.filter(fn other -> Util.overlap?(tags, other.tags()) end)
  end

  @spec related(Article.t()) :: t()
  def related(art), do: related(all(), art)

  @doc """
  Returns true if the given articles share at least one tag and not both
  have videos.
  """
  def related?(art1, art2) when is_module(art1) and is_module(art2) do
    has_tracks1 = length(art1.tracks()) > 0
    has_tracks2 = length(art2.tracks()) > 0
    (!has_tracks1 || !has_tracks2) && Util.overlap?(art1.tags(), art2.tags())
  end

  @doc """
  Returns true if the two articles overlap.
  """
  @spec overlap?(Article.t(), Article.t()) :: boolean()
  def overlap?(art1, art2) do
    overlap([art1], art2)
    |> case do
      [_art] -> true
      [] -> false
    end
  end

  @doc """
  Finds articles that overlap with their own bounding boxes (i.e. ignoring
  anything derived from matching tags to other articles).
  """
  @spec overlap(t, Article.t()) :: t
  def overlap(list, art) when is_module(art) do
    bbox_art = Article.Decorators.bbox_point_of_interest(art) || Article.Decorators.bbox_self(art)

    Enum.filter(list, fn other ->
      bbox_other =
        Article.Decorators.bbox_point_of_interest(other) || Article.Decorators.bbox_self(other)

      Geo.CheapRuler.overlap?(bbox_art, bbox_other)
    end)
  end

  @doc """
  Find an Article that contains a video with exactly the given resources
  """
  @spec find_by_sources(Video.Track.plain()) :: Article.t() | nil
  def find_by_sources(sources) do
    all()
    |> Enum.find(fn art ->
      Enum.any?(art.tracks(), fn %{videos: videos} -> videos == sources end)
    end)
  end

  defp has_tag?(art, tag) when is_binary(tag) do
    try do
      downtags = Enum.map(art.tags(), &String.downcase/1)
      Enum.member?(downtags, tag)
    rescue
      FunctionClauseError ->
        raise("not all tags of #{art} are strings: #{inspect(art.tags())}")
    end
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

  def sort(list, sorter, :title) do
    list |> Enum.sort_by(& &1.title(), {sorter, NaturalOrder})
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
