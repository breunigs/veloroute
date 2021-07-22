defmodule Route.List do
  @type t :: list(Route.t())

  @spec all() :: [t()]
  def all() do
    :code.all_available()
    |> Enum.map(&elem(&1, 0))
    |> Enum.filter(&List.starts_with?(&1, 'Elixir.Data.Route.'))
    |> Enum.map(&List.to_atom/1)
    |> Enum.sort()
  end

  @doc """
  Find a Route that contains a video with exactly the given resources
  """
  @spec find_by_sources(Video.Track.plain()) :: t() | nil
  def find_by_sources(sources) do
    Enum.find(all(), fn route ->
      Enum.any?(route.tracks(), fn track -> track.videos == sources end)
    end)
  end

  @spec groups(t) :: list(binary())
  def groups(routes) do
    routes
    |> Enum.flat_map(fn route ->
      Enum.map(route.tracks(), & &1.group)
    end)
    |> Enum.uniq()
  end

  @spec by_tags(list(binary())) :: list(module())
  def by_tags(tags) when is_list(tags) do
    Enum.filter(all(), &Route.has_group?(&1, tags))
  end
end
