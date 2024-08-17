defmodule Map.Element do
  @type single() :: Map.Node.t() | Map.Way.t() | Map.Relation.t()
  @type collection() :: [single()]
  @type indexed_collection() :: %{binary() => single()}
  @typep flexible_collection() :: collection() | indexed_collection()

  @compile {:inline, filter_by_tag: 3}
  @spec filter_by_tag(flexible_collection(), atom(), binary() | [binary()]) :: [single()]
  def filter_by_tag(map, tag, value) when is_map(map) and is_atom(tag) and is_binary(value) do
    Enum.reduce(map, [], fn {_id, elem}, acc ->
      if elem.tags[tag] == value, do: [elem | acc], else: acc
    end)
    |> Enum.reverse()
  end

  def filter_by_tag(map, tag, value) when is_map(map),
    do: map |> Map.values() |> filter_by_tag(tag, List.wrap(value))

  def filter_by_tag(list, tag, value) when is_binary(value),
    do: filter_by_tag(list, tag, List.wrap(value))

  def filter_by_tag(list, tag, values) when is_list(list) and is_atom(tag) and is_list(values) do
    Enum.filter(list, fn %{tags: tags} -> Enum.member?(values, tags[tag]) end)
  end

  @spec find_by_tag(flexible_collection(), atom(), binary() | [binary()]) :: single() | nil
  def find_by_tag(map, tag, value) when is_map(map),
    do: map |> Map.values() |> find_by_tag(tag, value)

  def find_by_tag(list, tag, value) when is_binary(value),
    do: find_by_tag(list, tag, List.wrap(value))

  def find_by_tag(list, tag, values)
      when is_list(list) and is_atom(tag) and is_list(values) do
    Enum.find(list, fn %{tags: tags} -> Enum.member?(values, tags[tag]) end)
  end

  @spec bbox(flexible_collection() | single()) :: Geo.BoundingBox.t() | nil
  def bbox([]), do: nil

  def bbox(list) when is_list(list) do
    list
    |> Enum.map(&bbox/1)
    |> Enum.reduce(&Geo.CheapRuler.union/2)
  end

  def bbox(%{bbox: bbox}) when not is_nil(bbox), do: bbox
  def bbox(%Map.Node{} = n), do: Geo.CheapRuler.bbox(n)
  def bbox(%Map.Way{nodes: nodes}), do: Geo.CheapRuler.bbox(nodes)
  def bbox(%Map.Relation{members: members}), do: members |> Enum.map(& &1.ref) |> bbox()
  def bbox(map) when is_map(map), do: map |> Map.values() |> bbox()

  def with_bbox(elem), do: Map.put(elem, :bbox, bbox(elem))

  @spec add_new_tags(single(), map()) :: single()
  def add_new_tags(%{tags: tags} = elem, extra_tags) do
    tags = Map.merge(extra_tags, tags)
    %{elem | tags: tags}
  end

  @spec keep_only_tags(single(), list()) :: single()
  def keep_only_tags(%{tags: tags} = elem, tags_to_keep) do
    tags = Map.take(tags, tags_to_keep)
    %{elem | tags: tags}
  end

  @spec remove_tags(single(), list()) :: single()
  def remove_tags(%{tags: tags} = elem, tags_to_delete) do
    tags = Map.drop(tags, tags_to_delete)
    %{elem | tags: tags}
  end
end
