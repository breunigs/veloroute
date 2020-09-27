defmodule Data.RouteList do
  import Mapillary, only: [is_ref: 1]
  @type t :: list(Data.Route.t())

  def all() do
    Settings.route_list()
  end

  @spec sequences() :: list(Data.Sequence.t())
  def sequences() do
    all()
    |> Enum.flat_map(&Data.Route.sequences/1)
  end

  # @spec filter_by_img(t, Mapillary.ref()) :: list(t)
  # def filter_by_img(routes, img) when is_ref(img) do
  #   Enum.filter(routes, &Data.Route.has_image?(&1, img))
  # end

  @spec sequences_with_img(t, Mapillary.ref()) :: list(Data.Sequence.t())
  def sequences_with_img(routes, img) when is_ref(img) do
    Enum.flat_map(routes, &Data.Route.sequences_with_img(&1, img))
  end

  @spec sequences_with_one_of_img(t, list(Mapillary.ref())) :: list(Data.Sequence.t())
  def sequences_with_one_of_img(routes, imgs) when is_list(imgs) do
    imgs
    |> Enum.reject(&is_nil/1)
    |> Enum.uniq()
    |> Enum.flat_map(&sequences_with_img(routes, &1))
    |> Enum.uniq()
  end

  @spec sequences_with_group(t, binary()) :: list(Data.Sequence.t())
  def sequences_with_group(routes, group) do
    Enum.flat_map(routes, &Data.Route.sequences_with_group(&1, group))
  end

  @spec filter_by_group(t, Data.Sequence.group()) :: list(t())
  def filter_by_group(routes, group) do
    Enum.filter(routes, &Data.Route.has_group?(&1, group))
  end

  @deprecated "ideally the caller would already have a sequence ref"
  def sequence_with_name(routes, name) do
    {group, desc} = name

    routes
    |> Enum.flat_map(&Data.Route.sequences/1)
    |> Enum.find(fn
      %{group: ^group, description: ^desc} -> true
      _ -> false
    end)
  end

  @spec groups(t) :: list(binary())
  def groups(routes) do
    routes
    |> Enum.flat_map(&Data.Route.sequences/1)
    |> Enum.map(& &1.group)
    |> Enum.uniq()
  end

  @spec by_tags(list(binary())) :: list(module())
  def by_tags(tags) when is_list(tags) do
    tags
    |> Enum.map(&Data.Route.by_tag/1)
    |> Enum.reject(&is_nil/1)
  end

  @spec find_within(t(), %BoundingBox{}, integer()) :: Mapillary.ref()
  def find_within(routes, bbox, buffer) do
    buffered_bbox = CheapRuler.buffer_bbox(buffer, bbox)

    candidates =
      routes
      |> Stream.flat_map(&Data.Route.images/1)
      |> Stream.filter(&CheapRuler.inside_bbox?(&1, buffered_bbox))

    fallback = Stream.take(candidates, 1) |> Enum.to_list() |> List.first()
    Enum.find(candidates, fallback, &CheapRuler.inside_bbox?(&1, bbox))
  end

  @spec find_close_to(t(), Mapillary.ref()) ::
          {module(), Data.Sequence.name(), Mapillary.ref(), integer()} | nil
  def find_close_to(routes, img) when is_list(routes) and is_ref(img) do
    find_in_index(routes, img) || find_by_proximity(routes, img)
  end

  defp find_by_proximity(routes, img) do
    routes
    |> Stream.flat_map(&Data.Route.mapillary_sequence_refs/1)
    |> Mapillary.close_to(img)
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
