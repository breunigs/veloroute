defmodule Route.List do
  import Mapillary.Types, only: [is_ref: 1]
  @type t :: list(Route.t())

  def all() do
    :code.all_available()
    |> Enum.map(&elem(&1, 0))
    |> Enum.filter(&List.starts_with?(&1, 'Elixir.Data.Route.'))
    |> Enum.map(&List.to_atom/1)
    |> Enum.sort()
  end

  @spec sequences() :: list(Data.Sequence.t())
  def sequences() do
    all()
    |> Enum.flat_map(&Route.sequences/1)
  end

  @spec sequences_with_img(t, Mapillary.Types.ref()) :: list(Data.Sequence.t())
  def sequences_with_img(routes, img) when is_ref(img) do
    Enum.flat_map(routes, &Route.sequences_with_img(&1, img))
  end

  @spec sequences_with_group(t, binary()) :: list(Data.Sequence.t())
  def sequences_with_group(routes, group) do
    Enum.flat_map(routes, &Route.sequences_with_group(&1, group))
  end

  @spec filter_by_group(t, Data.Sequence.group()) :: list(t())
  def filter_by_group(routes, group) do
    Enum.filter(routes, &Route.has_group?(&1, group))
  end

  @deprecated "ideally the caller would already have a sequence ref"
  def sequence_with_name(routes, name) do
    {group, desc} = name

    routes
    |> Enum.flat_map(&Route.sequences/1)
    |> Enum.find(fn
      %{group: ^group, description: ^desc} -> true
      _ -> false
    end)
  end

  @spec groups(t) :: list(binary())
  def groups(routes) do
    routes
    |> Enum.flat_map(&Route.sequences/1)
    |> Enum.map(& &1.group)
    |> Enum.uniq()
  end

  @spec by_tags(list(binary())) :: list(module())
  def by_tags(tags) when is_list(tags) do
    Enum.filter(all(), &Route.has_group?(&1, tags))
  end

  @spec find_within(t(), %Geo.BoundingBox{}, integer()) :: Mapillary.Types.ref()
  def find_within(routes, bbox, buffer) do
    buffered_bbox = Geo.CheapRuler.buffer_bbox(buffer, bbox)

    candidates =
      routes
      |> Stream.flat_map(&Route.images/1)
      |> Stream.filter(&Geo.CheapRuler.inside_bbox?(&1, buffered_bbox))

    fallback = Stream.take(candidates, 1) |> Enum.to_list() |> List.first()
    Enum.find(candidates, fallback, &Geo.CheapRuler.inside_bbox?(&1, bbox))
  end

  @spec find_close_to(t(), Mapillary.Types.ref()) ::
          {module(), Data.Sequence.name(), Mapillary.Types.ref(), integer()} | nil
  def find_close_to(routes, img) when is_list(routes) and is_ref(img) do
    find_in_index(routes, img) || find_by_proximity(routes, img)
  end

  defp find_by_proximity(routes, img) do
    routes
    |> Stream.flat_map(&Route.mapillary_sequence_refs/1)
    |> Mapillary.Resolver.close_to(img)
    |> Enum.find_value(&find_in_index(routes, &1))
  end

  defp find_in_index(routes, %{img: img}) when is_ref(img), do: find_in_index(routes, img)

  defp find_in_index(routes, img) when is_ref(img) do
    routes
    |> Enum.find_value(fn seq ->
      case seq.index[img] do
        nil ->
          false

        map ->
          {route_name, pos} = map |> Map.to_list() |> hd
          img = img_by_pos(seq, route_name, pos)
          {seq, route_name, img[:img], pos}
      end
    end)
  end

  defp img_by_pos(seq, route_name, pos) do
    seq.parsed[route_name] |> Enum.at(pos)
  end
end
