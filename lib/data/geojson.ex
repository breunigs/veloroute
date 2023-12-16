defmodule Data.GeoJSON do
  require Logger

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
    |> Util.compact()
  end

  defp article_polylabels(map) do
    map.ways()
    |> Map.Element.filter_by_tag(:type, "article")
    |> Enum.map(fn
      %Map.Way{tags: %{hide_from_map: true}} ->
        nil

      %Map.Way{
        nodes: nodes,
        tags: tags = %{article_title: title, name: name, article_icon: icon}
      } ->
        point = Geo.LongestLineLabel.calculate(nodes)

        {main, extra} = title_splitter(title, tags[:text])

        %{
          type: "Feature",
          properties: %{
            type: :article,
            name: name,
            icon: icon,
            title: title,
            title_main: main,
            title_extra: extra
          },
          geometry: %{
            type: "Point",
            coordinates: as_geojson_coord(point)
          }
        }

      %Map.Way{tags: tags} ->
        Logger.error(
          "A way tagged as an article is missing some required fields. Normally these are auto-inserted from the article's definition. Does the article exist? \n #{inspect(tags)}"
        )

        nil
    end)
    |> Util.compact()
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
    |> add_overlap_info(:bezirk)
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
    Logger.error(
      "A way tagged as an article is missing some required fields. Normally these are auto-inserted from the article's definition. Does the article exist? \n #{inspect(w.tags)}"
    )

    nil
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

  @way_tags_to_keep [
                      :display_id,
                      :name,
                      :route_group,
                      :route_id,
                      :text,
                      :title,
                      :type
                    ] ++ Map.Relation.style_tags() ++ Map.Way.style_tags()

  defp as_geojson(%Map.Way{} = w) do
    coords = Enum.map(w.nodes, &as_geojson_coord(&1))

    props =
      w.tags
      |> Map.take(@way_tags_to_keep)
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
      color_faded: art.color_faded(),
      route_id: art.id(),
      display_id: art.display_id(),
      route_group: art.route_group(),
      title: art.title()
    }

    r
    |> Map.Relation.ways(@relevant_geojson_roles)
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
    # additionally collecting their names and roles.
    ways_to_rels =
      rels_to_modify
      |> Enum.sort_by(fn %Map.Relation{tags: %{name: name}} -> name end, {:desc, NaturalOrder})
      |> Enum.reduce(%{}, fn rel, acc ->
        rel
        |> Map.Relation.way_members(@relevant_geojson_roles)
        |> Enum.reduce(acc, fn %{role: role, ref: %Map.Way{id: wid}}, acc ->
          %{ids: ids, names: names, roles: roles} = acc[wid] || %{ids: [], names: [], roles: []}

          Map.put(acc, wid, %{
            ids: [rel.id | ids],
            names: [Map.fetch!(rel.tags, :name) | names],
            roles: [role | roles]
          })
        end)
      end)

    # add offset/oneway to tags of ways
    Enum.map(rels_to_modify, fn rel ->
      modify_ways(rel, fn way ->
        rel_ids = ways_to_rels[way.id][:ids]
        rel_names = ways_to_rels[way.id][:names]
        roles = Enum.uniq(ways_to_rels[way.id][:roles])
        index = Enum.find_index(rel_ids, fn rel_id -> rel_id == rel.id end)

        offset = @offsets[{length(rel_ids), index}] || 0
        oneway = length(roles) == 1 && hd(roles) in ["forward", "backward"]
        reverse = oneway && hd(roles) == "backward"

        tags = %{offset: offset, title: relation_titles(rel_names)}
        tags = if length(rel_ids) >= 2, do: Map.put(tags, :overlap_index, index), else: tags
        tags = if oneway, do: Map.put(tags, :oneway, true), else: tags

        tags =
          if length(rel_ids) >= 2,
            do: Map.put(tags, :overlap_route_ids, relation_route_ids(rel_names)),
            else: tags

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

  defp relation_route_ids(relation_names) when is_list(relation_names) do
    joined =
      relation_names
      |> Enum.map(&Article.List.find_exact(&1).id())
      |> Enum.join("|")

    # can only substring search in style.json, so let's make that easy
    "|#{joined}|"
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

  @spec title_splitter(binary(), binary() | nil) :: {binary(), binary()}
  defp title_splitter(title, custom_subtext) do
    with [main, extra] <- String.split(title, " (", parts: 2, trim: true) do
      extra =
        extra
        |> String.split(" (", parts: 2)
        |> List.last()
        |> String.replace(["(", ")"], "")
        |> String.replace(~r/\s+/, " ")
        |> String.trim()

      extra = if custom_subtext != nil && custom_subtext != "", do: custom_subtext, else: extra

      {main, extra}
    else
      _other -> {title, custom_subtext || ""}
    end
  end
end
