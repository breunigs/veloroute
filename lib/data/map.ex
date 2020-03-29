defmodule Data.Map do
  defstruct [:ways, :nodes, :relations]

  defmodule Node do
    defstruct [:id, :lon, :lat]

    def as_geojson(n) do
      [n.lon, n.lat]
    end
  end

  defmodule Way do
    defstruct [:id, :tags, :nodes]

    def grade_tags, do: [:fast, :comfortable, :talk]

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
        |> Map.merge(Map.take(w.tags, grade_tags()))
        |> Map.merge(%{id: w.id, grade: grade(w)})

      coords = Enum.map(w.nodes, &Node.as_geojson(&1))

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
      coords = Enum.map(w.nodes, &Node.as_geojson(&1))

      latBounds = w.nodes |> Enum.map(& &1.lat) |> Enum.min_max()
      lonBounds = w.nodes |> Enum.map(& &1.lon) |> Enum.min_max()
      bounds = [elem(lonBounds, 0), elem(latBounds, 0), elem(lonBounds, 1), elem(latBounds, 1)]

      title =
        case articles[w.tags[:name]] do
          %Data.Article{title: title} -> title
          _ -> "Unknown article: " <> w.tags[:name]
        end

      %{
        type: "Feature",
        properties: %{
          type: "article",
          name: w.tags[:name],
          bounds: bounds,
          title: title
        },
        geometry: %{
          type: "LineString",
          coordinates: coords
        }
      }
    end
  end

  defmodule Relation do
    defstruct [:id, :tags, :members]

    def routes_as_geojson(r, overlaps) do
      Enum.map(ways(r), fn %{ref: w} ->
        id = r.id

        offset =
          case overlaps[w.id] do
            [^id, _] -> 1
            [_, ^id] -> -1
            _ -> 0
          end

        tags = %{
          color: r.tags[:color],
          offset: offset
        }

        Way.as_graded_geojson(w, tags)
      end)
    end

    def ways(r), do: Enum.filter(r.members, &match?(%{ref: %Way{}}, &1))

    def way_ids(r) do
      ways(r)
      |> Enum.map(fn %{ref: %Way{id: wid}} -> wid end)
    end
  end

  def to_feature_list(m, articles) do
    overlaps = find_overlaps(m)

    routes =
      m.relations
      |> Map.values()
      |> Enum.map(&Relation.routes_as_geojson(&1, overlaps))

    articles =
      m.ways
      |> Map.values()
      |> Enum.filter(&match?(%Way{tags: %{type: "article"}}, &1))
      |> Enum.map(&Way.as_article(&1, articles))

    %{
      type: "FeatureCollection",
      features: Enum.concat(routes, articles)
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
  def load(path) do
    raw = File.read!(path)
    parsed = Saxy.SimpleForm.parse_string(raw)
    {:ok, {"osm", _attr, children}} = parsed

    nodes = nodes(children)
    ways = ways(children, nodes)
    relations = relations(children, ways, nodes)

    %Data.Map{ways: ways, nodes: nodes, relations: relations}
  end

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

      {attrs["id"],
       %Data.Map.Relation{
         id: attrs["id"],
         tags: tags(children),
         members: members
       }}
    end)
  end

  defp ways(parsed, nodes) do
    parsed
    |> filter_by("way")
    |> Enum.into(%{}, fn w ->
      {"way", attrsList, children} = w

      attrs = Enum.into(attrsList, %{})

      noderefs =
        children
        |> filter_by("nd")
        |> Enum.map(fn {"nd", [{"ref", ref}], _} -> nodes[ref] end)

      {attrs["id"],
       %Data.Map.Way{
         id: attrs["id"],
         tags: tags(children),
         nodes: noderefs
       }}
    end)
  end

  defp nodes(parsed) do
    parsed
    |> filter_by("node")
    |> Enum.into(%{}, fn w ->
      {"node", attrsList, _children} = w

      attrs = Enum.into(attrsList, %{})

      {attrs["id"],
       %Data.Map.Node{
         id: attrs["id"],
         lon: to_f(attrs["lon"]),
         lat: to_f(attrs["lat"])
       }}
    end)
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
