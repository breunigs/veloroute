defmodule Article.List do
  @module_name 'Elixir.Data.Article.'

  @typep article_list :: list(module())
  @typep article :: module()

  @spec all :: article_list
  def all() do
    :code.all_available()
    |> Enum.map(&elem(&1, 0))
    |> Enum.filter(&List.starts_with?(&1, @module_name))
    |> Enum.map(&List.to_atom/1)
    |> Enum.sort()
  end

  @spec category(charlist()) :: article_list
  def category(type) when type == 'Blog' do
    :code.all_available()
    |> Enum.map(&elem(&1, 0))
    |> Enum.filter(&List.starts_with?(&1, @module_name ++ type))
    |> Enum.map(&List.to_atom/1)
    |> Enum.sort()
  end

  @spec find_exact(article_list, binary | nil) :: article | nil
  def find_exact(_list, nil), do: nil

  def find_exact(list, key) when is_list(list) and is_binary(key) do
    list
    |> filter(key, false)
    |> Enum.at(0)
  end

  @spec find_exact(binary | nil) :: article | nil
  def find_exact(key), do: find_exact(all(), key)

  @spec find_with_tags(article_list, binary | nil) :: article | nil
  def find_with_tags(_list, nil), do: nil

  def find_with_tags(list, key) when is_list(list) and is_binary(key) do
    list
    |> filter(key, true)
    |> Enum.at(0)
  end

  @spec find_with_tags(binary | nil) :: article | nil
  def find_with_tags(key), do: find_with_tags(all(), key)

  @spec filter(article_list, binary) :: Enumerable.t()
  def filter(list, key, search_tags \\ false) when is_list(list) and is_binary(key) do
    key = key |> String.replace(" ", "-") |> String.downcase()

    exact = Stream.filter(list, fn art -> art.name() == key || to_string(art) == key end)
    loose = if search_tags, do: Stream.filter(list, fn art -> has_tag?(art, key) end), else: []

    Stream.concat(exact, loose)
    |> Stream.uniq()
  end

  @spec filter(binary) :: Enumerable.t()
  def filter(key), do: filter(all(), key)

  defp has_tag?(art, tag) when is_binary(tag) do
    downtags = Enum.map(art.tags(), &String.downcase/1)
    Enum.member?(downtags, tag)
  end

  @typep sorter() :: :desc | :asc
  @spec sort(article_list(), sorter(), atom) :: article_list()
  def sort(list, sorter \\ :desc, fun \\ :updated_at)

  def sort(list, sorter, :updated_at) do
    Enum.sort_by(
      list,
      fn
        art ->
          d = art.updated_at()
          if d, do: {d.year, d.month, d.day}, else: nil
      end,
      sorter
    )
  end

  def sort(list, sorter, fun) do
    Enum.sort_by(list, &apply(&1, fun, []), sorter)
  end
end
