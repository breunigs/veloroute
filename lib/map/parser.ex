defmodule Map.Parser do
  @default_map_path "data/map.osm"

  @typep indexed_nodes :: %{optional(binary()) => Map.Node.t()}
  @typep indexed_ways :: %{optional(binary()) => [Map.Way.t()]}
  @typep indexed_relations :: %{optional(binary()) => Map.Relation.t()}

  def default_map_path, do: @default_map_path
  def load_default, do: load(default_map_path())

  def load(map_path) when is_binary(map_path) do
    map_path |> read() |> parse()
  end

  def read(map_path) do
    raw = File.read!(map_path)
    parsed = Saxy.SimpleForm.parse_string(raw)
    {:ok, {"osm", _attr, children}} = parsed
    children
  end

  # x=Map.Parser.read("data/map.osm"); Benchmark.flamegraph("loading", fn -> Map.Parser.parse(x) end); nil
  def parse(children) do
    grouped =
      Enum.reduce(children, %{"node" => [], "way" => [], "relation" => []}, fn
        {tagName, attrList, children}, grouped ->
          attrs = Enum.into(attrList, %{})

          if attrs["action"] == "deleted" do
            grouped
          else
            elem = {tagName, attrs, children}
            Map.put(grouped, tagName, [elem | grouped[tagName]])
          end

        _other, grouped ->
          grouped
      end)

    nodes = nodes(grouped["node"])
    ways = ways(grouped["way"], nodes)
    relations = relations(grouped["relation"], ways, nodes)

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

  @spec relations(any(), indexed_ways, indexed_nodes) :: indexed_relations
  defp relations(parsed, ways, nodes) do
    parsed
    |> Enum.reduce(%{}, fn w, relations ->
      {"relation", attrs, children} = w

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

      Map.put(relations, attrs["id"], rel)
    end)
    |> Map.reject(fn
      {_k, %{tags: %{ignore: true}}} -> true
      _ -> false
    end)
  end

  @spec ways(any(), indexed_nodes) :: indexed_ways
  defp ways(parsed, nodes) do
    Enum.reduce(parsed, %{}, fn w, ways ->
      {"way", attrs, children} = w

      nodes =
        children
        |> filter_by("nd")
        |> Enum.map(fn {"nd", [{"ref", ref}], _} -> nodes[ref] end)
        |> ensure_right_hand_winding()

      if length(nodes) == 0, do: raise("Way without nodes: #{inspect(w)}")

      Map.put(
        ways,
        attrs["id"],
        Map.Element.with_bbox(%Map.Way{
          id: attrs["id"],
          tags: tags(children),
          nodes: nodes
        })
      )
    end)
  end

  @spec nodes(any()) :: indexed_nodes
  defp nodes(parsed) do
    Enum.reduce(parsed, %{}, fn w, nodes ->
      {"node", attrs, children} = w

      Map.put(nodes, attrs["id"], %Map.Node{
        id: attrs["id"],
        tags: tags(children),
        lon: String.to_float(attrs["lon"]),
        lat: String.to_float(attrs["lat"])
      })
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
    Enum.reduce(enum, %{}, fn
      {"tag", [{"k", key}, {"v", val}], _children}, tags ->
        Map.put(tags, String.to_atom(key), weak_bool(val))

      _other_elem, tags ->
        tags
    end)
  end

  defp weak_bool("yes"), do: true
  defp weak_bool("no"), do: false
  defp weak_bool(x), do: x
end
