defmodule Article.List do
  @module_name 'Elixir.Data.Article.'

  @spec all :: list
  def all() do
    :code.all_available()
    |> Enum.map(&elem(&1, 0))
    |> Enum.filter(&List.starts_with?(&1, @module_name))
    |> Enum.map(&List.to_atom/1)
    |> Enum.sort()
  end

  @typep sorter() :: :desc | :asc
  @spec sort(list, sorter(), atom) :: list()
  def sort(list, sorter \\ :desc, fun \\ :updated_at)

  def sort(list, sorter, :updated_at) do
    Enum.sort_by(
      list,
      fn
        art ->
          d = art.updated_at()
          {d.year, d.month, d.day}
      end,
      sorter
    )
  end

  def sort(list, sorter, fun) do
    Enum.sort_by(list, &apply(&1, fun, []), sorter)
  end
end
