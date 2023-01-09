defmodule Data.GeoJSON do
  @spec to_feature_lists(Map.Parsed.t()) :: %{
          articles: %{features: list, type: binary()},
          markers: %{features: list, type: binary()},
          routes: %{features: list, type: binary()}
        }
  def to_feature_lists(%Map.Parsed{} = map) do
    %{
      routes: as_feat_collection(routes(map) ++ routeless_ways(map)),
      articles: as_feat_collection(articles(map)),
      markers: as_feat_collection(markers(map) ++ article_polylabels(map))
    }
  end

  defp markers(map) do
    map.nodes()
    |> Map.Element.filter_by_tag(:type, ["marker", "warning"])
    |> Enum.map(&as_geojson(&1))
  end

  defp articles(map) do
    map.ways()
    |> Map.Element.filter_by_tag(:type, "article")
    |> Enum.map(&as_geojson(&1))
    |> Enum.reject(&is_nil/1)
  end

  defp article_polylabels(map) do
    map.ways()
    |> Map.Element.filter_by_tag(:type, "article")
    |> Enum.reject(fn %Map.Way{tags: tags} -> Map.get(tags, :hide_from_map, false) end)
    |> Enum.map(fn %Map.Way{nodes: nodes, tags: tags} ->
      point = Geo.LongestLineLabel.calculate(nodes)

      {main, extra} = title_splitter(tags.article_title)

      %{
        type: "Feature",
        properties: %{
          type: :article,
          name: tags.name,
          icon: tags.article_icon,
          title: tags.article_title,
          title_main: main,
          title_extra: extra
        },
        geometry: %{
          type: "Point",
          coordinates: as_geojson_coord(point)
        }
      }
    end)
  end

  defp routeless_ways(map) do
    map.ways()
    |> Map.Element.filter_by_tag(:type, ["detour", "planned"])
    |> Enum.map(&as_geojson(&1))
  end

  @relevant_geojson_roles ["forward", "backward", ""]
  defp routes(map) do
    map.relations()
    |> Map.values()
    |> add_overlap_info(:alltag)
    |> add_overlap_info(:freizeit)
    |> add_overlap_info(:rsw)
    |> Enum.flat_map(&as_geojson(&1))
  end

  # renders for nodes
  defp as_geojson(%Map.Node{} = n) do
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

  # renders for ways
  defp as_geojson(%Map.Way{tags: %{type: "article", hide_from_map: true}}), do: nil

  defp as_geojson(
         w = %Map.Way{
           tags: %{
             type: "article",
             name: name,
             article_title: _title,
             article_type: type
           }
         }
       ) do
    coords = Enum.map(w.nodes, &as_geojson_coord(&1))

    props = %{
      type: "article",
      name: name,
      title: full_article_title(w),
      icon: Map.get(w.tags, :article_icon) || type
    }

    %{
      type: "Feature",
      properties: props,
      geometry: %{
        type: "Polygon",
        coordinates: [coords]
      }
    }
  end

  defp as_geojson(w = %Map.Way{tags: %{type: "article"}}) do
    raise "A way tagged as an article is missing some required fields. Normally these are auto-inserted from the article's definition. Does the article exist? \n #{inspect(w.tags)}"
  end

  defp as_geojson(%Map.Way{tags: %{type: "detour"}} = w) do
    coords = Enum.map(w.nodes, &as_geojson_coord(&1))
    title = w.tags[:article_title] || w.tags[:titles] || w.tags[:text]
    title = "empfohlene Umleitung wegen „#{title}“"

    props =
      w.tags
      |> Map.take([:name, :type | Map.Way.style_tags()])
      |> Map.put(:title, title)

    %{
      type: "Feature",
      properties: props,
      geometry: %{
        type: "LineString",
        coordinates: coords
      }
    }
  end

  defp as_geojson(%Map.Way{} = w) do
    coords = Enum.map(w.nodes, &as_geojson_coord(&1))

    props =
      w.tags
      |> Map.take([
        :name,
        :text,
        :layer,
        :type,
        :route_group,
        :display_id,
        :offset,
        :overlap_index,
        :title,
        :route_id
        | Map.Way.style_tags()
      ])
      |> Map.put_new(:type, w.tags[:route_group])
      |> Map.put_new_lazy(:title, fn ->
        w.tags[:article_title] || w.tags[:titles] || w.tags[:text]
      end)

    %{
      type: "Feature",
      properties: props,
      geometry: %{
        type: "LineString",
        coordinates: coords
      }
    }
  end

  # renders for relations
  @relation_way_tags_to_keep [:oneway, :offset, :title, :overlap_index, :color, :layer]
  defp as_geojson(%Map.Relation{tags: %{name: "" <> _rest}} = r) do
    art = Article.List.find_exact(r.tags.name)

    if !art,
      do:
        raise("""
          Expected to find an article with name '#{r.tags.name}', but it doesn't exist.
          You need to change either the relation's or the article's name.
        """)

    extra_rel_tags = %{
      color: art.color(),
      route_id: art.id(),
      display_id: art.display_id(),
      route_group: art.route_group(),
      title: art.title()
    }

    r
    |> Map.Relation.ways(@relevant_geojson_roles)
    |> Enum.map(&Map.Element.keep_only_tags(&1, @relation_way_tags_to_keep))
    |> Enum.map(&Map.Element.add_new_tags(&1, extra_rel_tags))
    |> Enum.map(&as_geojson/1)
  end

  defp as_geojson(%Map.Relation{} = r) do
    IO.puts(:stderr, "skipping unsupported relation: #{r.id}")
    nil
  end

  defp as_geojson_coord(%{lon: lon, lat: lat}) do
    [lon, lat]
  end

  defp as_feat_collection(feats) do
    %{
      type: "FeatureCollection",
      features: feats
    }
  end

  # hash from {length_of_rels, index_of_current_rel} → desired_offset_in_geojson
  @offsets %{
    {2, 0} => 1,
    {2, 1} => -1
  }

  defp add_overlap_info(relations, route_group) do
    {rels_to_modify, rels_to_keep} =
      Enum.split_with(relations, fn rel ->
        route = Article.List.find_exact(rel.tags.name)
        route && route.route_group() == route_group
      end)

    # create map from way IDs to relation IDs that include that way,
    # additionally collecting their roles
    ways_to_rels =
      rels_to_modify
      |> Enum.sort_by(fn %Map.Relation{tags: %{name: name}} -> name end, {:desc, NaturalOrder})
      |> Enum.reduce(%{}, fn rel, acc ->
        rel
        |> Map.Relation.way_members(@relevant_geojson_roles)
        |> Enum.reduce(acc, fn %{role: role, ref: %Map.Way{id: wid}}, acc ->
          %{rels: rels, roles: roles} = acc[wid] || %{rels: [], roles: []}
          name = Map.fetch!(rel.tags, :name)
          Map.put(acc, wid, %{rels: [name | rels], roles: [role | roles]})
        end)
      end)

    # add offset/oneway to tags of ways
    Enum.map(rels_to_modify, fn rel ->
      modify_ways(rel, fn way ->
        rels = ways_to_rels[way.id][:rels]
        roles = Enum.uniq(ways_to_rels[way.id][:roles])
        index = Enum.find_index(rels, fn rel_name -> rel_name == rel.tags[:name] end)

        offset = @offsets[{length(rels), index}] || 0
        oneway = length(roles) == 1 && hd(roles) in ["forward", "backward"]
        reverse = oneway && hd(roles) == "backward"

        tags = %{offset: offset, title: relation_titles(rels)}
        tags = if length(rels) >= 2, do: Map.put(tags, :overlap_index, index), else: tags
        tags = if oneway, do: Map.put(tags, :oneway, true), else: tags

        way = if reverse, do: Map.Way.reverse(way), else: way
        Map.Element.add_new_tags(way, tags)
      end)
    end) ++ rels_to_keep
  end

  defp relation_titles(relation_names) when is_list(relation_names) do
    relation_names
    |> Enum.map(&Article.List.find_exact(&1).title())
    |> Enum.join("\n")
  end

  defp modify_ways(%Map.Relation{} = r, fun) do
    members =
      Enum.map(r.members, fn %{ref: ref} = member ->
        updated = if is_struct(ref, Map.Way), do: fun.(ref), else: ref
        %{member | ref: updated}
      end)

    %{r | members: members}
  end

  defp full_article_title(way) do
    type = Article.Decorators.type_name(way.tags[:article_type])
    if type, do: "#{type}: #{way.tags[:article_title]}", else: way.tags[:article_title]
  end

  defp title_splitter(title) do
    with [main, extra] <- String.split(title, " (", parts: 2, trim: true) do
      extra =
        extra
        |> String.split(" (", parts: 2)
        |> List.last()
        |> String.replace(["(", ")"], "")
        |> String.replace(~r/\s+/, " ")
        |> String.trim()

      {main, extra}
    else
      _other -> {title, ""}
    end
  end
end
