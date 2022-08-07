defmodule Map.Parser do
  @default_map_path "data/map.osm"

  @typep indexed_nodes :: %{optional(binary()) => Map.Node.t()}
  @typep indexed_ways :: %{optional(binary()) => [Map.Way.t()]}
  @typep indexed_relations :: %{optional(binary()) => Map.Relation.t()}

  def default_map_path, do: @default_map_path

  def load_default, do: load(default_map_path())

  def load(map_path) when is_binary(map_path) do
    raw = File.read!(map_path)
    parsed = Saxy.SimpleForm.parse_string(raw)
    {:ok, {"osm", _attr, children}} = parsed

    children = Enum.reject(children, &is_deleted?(&1))

    nodes = nodes(children)
    ways = ways(children, nodes)
    relations = relations(children, ways, nodes)

    %Map.Parsed{ways: filter_typed(ways), nodes: filter_typed(nodes), relations: relations}
  end

  @spec filter_typed(%{optional(binary()) => Map.Way.t() | Map.Node.t()}) ::
          %{optional(binary()) => Map.Way.t() | Map.Node.t()}
  defp filter_typed(objs) do
    Enum.reduce(objs, %{}, fn
      {key, obj = %{tags: %{type: type}}}, acc when is_binary(type) -> Map.put(acc, key, obj)
      {_key, _obj}, acc -> acc
    end)
  end

  defp is_deleted?({_tag, attrsList, _children}) do
    Enum.member?(attrsList, {"action", "delete"})
  end

  defp is_deleted?(_), do: false

  @spec relations(any(), indexed_ways, indexed_nodes) :: indexed_relations
  defp relations(parsed, ways, nodes) do
    parsed
    |> filter_by("relation")
    |> Enum.into(%{}, fn w ->
      {"relation", attrsList, children} = w

      attrs = Enum.into(attrsList, %{})

      members =
        children
        |> filter_by("member")
        |> Enum.map(fn {"member", attrsList, _} ->
          attrs = Enum.into(attrsList, %{})

          ref =
            case attrs["type"] do
              "way" -> ways[attrs["ref"]]
              "node" -> nodes[attrs["ref"]]
            end

          %{ref: ref, role: attrs["role"]}
        end)

      rel =
        %Map.Relation{
          id: attrs["id"],
          tags: tags(children),
          members: members
        }
        |> Map.Element.with_bbox()
        |> Map.Relation.purge_member_bbox()

      {attrs["id"], rel}
    end)
  end

  @spec ways(any(), indexed_nodes) :: indexed_ways
  defp ways(parsed, nodes) do
    parsed
    |> filter_by("way")
    |> Enum.into(%{}, fn w ->
      {"way", attrsList, children} = w

      attrs = Enum.into(attrsList, %{})

      nodes =
        children
        |> filter_by("nd")
        |> Enum.map(fn {"nd", [{"ref", ref}], _} -> nodes[ref] end)
        |> ensure_right_hand_winding

      if length(nodes) == 0, do: raise("Way without nodes: #{inspect(w)}")

      {attrs["id"],
       Map.Element.with_bbox(%Map.Way{
         id: attrs["id"],
         tags: tags(children),
         nodes: nodes
       })}
    end)
  end

  @spec nodes(any()) :: indexed_nodes
  defp nodes(parsed) do
    parsed
    |> filter_by("node")
    |> Enum.into(%{}, fn w ->
      {"node", attrsList, children} = w

      attrs = Enum.into(attrsList, %{})

      {attrs["id"],
       %Map.Node{
         id: attrs["id"],
         tags: tags(children),
         lon: to_f(attrs["lon"]),
         lat: to_f(attrs["lat"])
       }}
    end)
  end

  defp ensure_right_hand_winding([]), do: []

  defp ensure_right_hand_winding(nodes) do
    if hd(nodes) == List.last(nodes) && area(nodes) < 0,
      do: Enum.reverse(nodes),
      else: nodes
  end

  defp area(nodes) do
    Enum.reduce(tl(nodes), {0, hd(nodes)}, fn curr, {area, prev} ->
      area = area + (curr.lon - prev.lon) * (prev.lat + curr.lat)
      {area, curr}
    end)
    |> elem(0)
  end

  defp filter_by(enum, tagName) do
    Enum.filter(enum, &match?({^tagName, _attr, _children}, &1))
  end

  defp tags(enum) do
    enum
    |> filter_by("tag")
    |> Enum.into(%{}, fn {"tag", [{"k", key}, {"v", val}], _children} ->
      {String.to_atom(key), weak_bool(val)}
    end)
  end

  defp to_f(str) do
    {f, ""} = Float.parse(str)
    f
  end

  defp weak_bool("yes"), do: true
  defp weak_bool("no"), do: false
  defp weak_bool(x), do: x
end
