defmodule Data.Map do
  defstruct [:ways, :nodes, :relations, :bboxes]

  defmodule Node do
    defstruct [:id, :lon, :lat, :tags]

    def as_geojson_coord(n) do
      [n.lon, n.lat]
    end

    def as_geojson(n) do
      props = Map.merge(%{id: n.id}, n.tags)

      %{
        type: "Feature",
        properties: props,
        geometry: %{
          type: "Point",
          coordinates: as_geojson_coord(n)
        }
      }
    end
  end

  defmodule Way do
    defstruct [:id, :tags, :nodes]

    def grade_tags, do: [:fast, :comfortable, :talk]
    def style_tags, do: [:oneway, :color]

    @grade_best 1
    @grade_worst 5
    def grade(w) do
      have = Enum.count(grade_tags(), &w.tags[&1])
      want = length(grade_tags())

      # transform ranges [0, 1] to [best, worst]
      (@grade_best + (1 - have / want) * (@grade_worst - @grade_best))
      |> Float.round(1)
    end

    def as_graded_geojson(w, extra_props \\ %{}) do
      props =
        extra_props
        |> Map.merge(Map.take(w.tags, style_tags()))
        |> Map.merge(%{id: w.id, grade: grade(w)})

      coords = Enum.map(w.nodes, &Node.as_geojson_coord(&1))

      %{
        type: "Feature",
        properties: props,
        geometry: %{
          type: "LineString",
          coordinates: coords
        }
      }
    end

    def as_article(w, articles) do
      coords = Enum.map(w.nodes, &Node.as_geojson_coord(&1))
      %{title: title, type: type} = articles[w.tags[:name]]

      %{
        type: "Feature",
        properties: %{
          type: "article",
          name: w.tags[:name],
          title: title,
          icon: type
        },
        geometry: %{
          type: "Polygon",
          coordinates: [coords]
        }
      }
    end
  end

  defmodule Relation do
    defstruct [:id, :tags, :members, :bbox]

    def routes_as_geojson(r, overlaps) do
      r
      |> ways()
      |> Enum.map(fn w ->
        id = r.id

        offset =
          case overlaps[w.id] do
            [^id, _] -> 1
            [_, ^id] -> -1
            _ -> 0
          end

        tags = %{
          color: r.tags[:color],
          offset: offset,
          route_id: r.tags.id
        }

        Way.as_graded_geojson(w, tags)
      end)
    end

    def osm_url(%{tags: %{osm_relation_ref: url}}), do: url

    def osm_url(%{tags: %{osm_relation_id: rel_id}}),
      do: "https://www.openstreetmap.org/relation/#{rel_id}"

    def osm_url(_), do: nil

    def osm_relation_id(%{tags: %{osm_relation_id: rel_id}}) do
      {rel_id, ""} = Integer.parse(rel_id)
      rel_id
    end

    def osm_relation_id(%{tags: %{osm_relation_ref: url}}) do
      String.split(url, "/")
      |> List.last()
      |> Integer.parse()
      |> case do
        {rel_id, ""} ->
          rel_id

        _ ->
          IO.warn(
            "Relation has osm_relation_ref=#{url} but cannot find the OSM relation ID in that"
          )

          nil
      end
    end

    def osm_relation_id(_), do: nil

    def name(rel), do: rel.tags[:name] || rel.tags[:id]

    def gpx_name(rel) do
      # return GPX name only if relation can be detected
      if osm_relation_id(rel) != nil, do: Map.get(rel.tags, :gpx_name, rel.tags[:id])
    end

    def calc_bbox(r) do
      Map.put(
        r,
        :bbox,
        ways(r)
        |> Enum.reduce(nil, fn way, acc ->
          way.nodes
          |> CheapRuler.bbox()
          |> CheapRuler.union(acc)
        end)
      )
    end

    def ways(r),
      do:
        Enum.filter(r.members, &match?(%{ref: %Way{}}, &1))
        |> Enum.map(&Map.get(&1, :ref))

    def nodes(r) do
      r
      |> Data.Map.Relation.ways()
      |> Enum.flat_map(fn %Data.Map.Way{nodes: nodes} -> nodes end)
    end

    def way_ids(r) do
      ways(r)
      |> Enum.map(fn %Way{id: wid} -> wid end)
    end
  end

  def find_relation_by_tag(%Data.Map{relations: r}, tag, value) do
    find_relation_by_tag(r, tag, value)
  end

  def find_relation_by_tag(relations, tag, value) when is_atom(tag) and is_binary(value) do
    relations
    |> Map.values()
    |> Enum.find(fn rel ->
      Map.get(rel.tags, tag, nil) == value
    end)
  end

  def article_bboxes(m) do
    article_ways(m)
    |> Enum.reduce(%{}, fn way, acc ->
      bbox = way.nodes |> CheapRuler.bbox()
      Map.update(acc, way.tags[:name], bbox, &CheapRuler.union(&1, bbox))
    end)
  end

  def article_ways(m) do
    m.ways
    |> Map.values()
    |> Enum.filter(&match?(%Way{tags: %{type: "article"}}, &1))
  end

  def markers(m) do
    m.nodes
    |> Map.values()
    |> Enum.filter(&match?(%Node{tags: %{type: "marker"}}, &1))
  end

  def to_feature_lists(m, articles) do
    overlaps = find_overlaps(m)

    routes =
      m.relations
      |> Map.values()
      |> Enum.map(&Relation.routes_as_geojson(&1, overlaps))

    articles =
      article_ways(m)
      |> Enum.map(&Way.as_article(&1, articles))

    markers = markers(m) |> Enum.map(&Node.as_geojson(&1))

    %{
      routes: as_feat_collection(routes),
      articles: as_feat_collection(articles),
      markers: as_feat_collection(markers)
    }
  end

  defp as_feat_collection(feats) do
    %{
      type: "FeatureCollection",
      features: feats
    }
  end

  # find_overlaps returns a map with way IDs mapped to a list of relations IDs
  # they're used in
  defp find_overlaps(m) do
    m.relations
    |> Enum.sort_by(fn {id, _rel} -> id end)
    |> Enum.reduce(%{}, fn {_id, rel}, acc ->
      rel
      |> Relation.way_ids()
      |> Enum.reduce(acc, fn wid, acc ->
        Map.update(acc, wid, [rel.id], &[rel.id | &1])
      end)
    end)
  end
end

defmodule Data.MapParser do
  @map_path "data/map.osm"

  def map_path, do: @map_path

  def load(path) do
    raw = File.read!(path)
    parsed = Saxy.SimpleForm.parse_string(raw)
    {:ok, {"osm", _attr, children}} = parsed

    children = Enum.reject(children, &is_deleted?(&1))

    nodes = nodes(children)
    ways = ways(children, nodes)
    relations = relations(children, ways, nodes)

    %Data.Map{ways: ways, nodes: nodes, relations: relations}
  end

  defp is_deleted?({_tag, attrsList, _children}) do
    Enum.member?(attrsList, {"action", "delete"})
  end

  defp is_deleted?(_), do: false

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
        Data.Map.Relation.calc_bbox(%Data.Map.Relation{
          id: attrs["id"],
          tags: tags(children),
          members: members
        })

      {attrs["id"], rel}
    end)
  end

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
       %Data.Map.Way{
         id: attrs["id"],
         tags: tags(children),
         nodes: nodes
       }}
    end)
  end

  defp nodes(parsed) do
    parsed
    |> filter_by("node")
    |> Enum.into(%{}, fn w ->
      {"node", attrsList, children} = w

      attrs = Enum.into(attrsList, %{})

      {attrs["id"],
       %Data.Map.Node{
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
