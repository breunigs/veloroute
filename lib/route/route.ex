defmodule Route do
  @type t :: any()
  @callback index() :: %{required(binary()) => %{required(Data.Sequence.name()) => integer()}}
  @callback parsed() :: %{required(Data.Sequence.name()) => [Data.Image.img_non_nil(), ...]}

  import Mapillary.Types, only: [is_ref: 1]

  @spec sequences_with_img(t(), Mapillary.Types.ref()) :: list(Data.Sequence.t())
  def sequences_with_img(route, img) when is_ref(img) do
    with map when is_map(map) <- route.index[img] do
      Enum.map(map, fn {route_name, _pos} ->
        Data.Sequence.new(
          group: elem(route_name, 0),
          description: elem(route_name, 1),
          route: route
        )
      end)
    end || []
  end

  @spec sequences_with_group(t(), binary()) :: list(Data.Sequence.t())
  def sequences_with_group(route, group) do
    route.parsed
    |> Enum.map(fn
      {{^group, description}, _imgs} ->
        Data.Sequence.new(
          group: group,
          description: description,
          route: route
        )

      {_route_name, _imgs} ->
        nil
    end)
    |> Enum.reject(&is_nil/1)
  end

  @spec sequences(t()) :: list(Data.Sequence.t())
  def sequences(route) do
    route.parsed
    |> Enum.map(fn {{group, description}, _imgs} ->
      Data.Sequence.new(
        group: group,
        description: description,
        route: route
      )
    end)
  end

  @spec has_group?(t(), [Data.Sequence.group()] | Data.Sequence.group()) :: boolean()
  @doc """
  Check if the route belongs to any of the given groups
  """
  def has_group?(route, groups) when is_list(groups) do
    Enum.any?(groups, &has_group?(route, &1))
  end

  def has_group?(route, group) do
    Enum.any?(route.parsed, fn
      {{^group, _description}, _imgs} -> true
      _ -> false
    end)
  end

  @spec find_image(t(), Mapillary.Types.ref()) ::
          {Data.Sequence.t(), Data.Image.img_non_nil()} | nil
  def find_image(route, img) when is_ref(img) do
    with map when is_map(map) <- route.index[img],
         {sequence_name, img_position} <- Util.map_first(map),
         img when not is_nil(img) <- route.parsed[sequence_name] |> Enum.at(img_position) do
      {
        Data.Sequence.new(
          group: elem(sequence_name, 0),
          description: elem(sequence_name, 1),
          route: route
        ),
        img
      }
    end
  end

  @spec find_reverse(t(), Mapillary.Types.ref()) ::
          {Data.Sequence.t(), Mapillary.Types.ref()} | nil
  def find_reverse(route, img) when is_ref(img) do
    with {sequence, full_img} <- find_image(route, img) do
      route
      |> sequences()
      |> List.delete(sequence)
      |> Enum.map(fn seq ->
        {dist, img} = Data.Sequence.closest(seq, full_img)
        {seq, dist, img}
      end)
      |> Enum.sort_by(&elem(&1, 1))
      |> List.first()
      |> case do
        nil -> nil
        {seq, _dist, img} -> {seq, img}
      end
    end
  end

  @spec mapillary_sequence_refs(t()) :: list(Mapillary.Types.ref())
  def mapillary_sequence_refs(sequence) do
    sequence.parsed
    |> Map.values()
    |> List.flatten()
    |> Enum.map(&Map.get(&1, :seq))
    |> Enum.uniq()
    |> Enum.filter(&is_ref/1)
    |> Enum.sort()
  end

  @spec images(t()) :: Enumerable.t()
  def images(sequence) do
    sequence.parsed
    |> Stream.flat_map(fn {_name, imgs} -> imgs end)
  end
end
