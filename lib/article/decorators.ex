defmodule Article.Decorators do
  use Phoenix.Component
  import Guards

  @spec html(Article.Behaviour.t(), Article.Behaviour.assigns()) :: binary()
  def html(art, assigns) do
    assigns = assign_new(assigns, :current_page, fn -> art end)
    art.text(assigns) |> Phoenix.HTML.Safe.to_iodata() |> IO.iodata_to_binary()
  end

  @spec full_title(Article.Behaviour.t()) :: binary()
  def full_title(art) do
    tn = type_name(art)

    cond do
      String.contains?(art.title(), ":") -> art.title()
      tn != nil -> "#{tn}: #{art.title()}"
      true -> art.title()
    end
  end

  @spec gpx_links(module()) :: Phoenix.LiveView.Rendered.t()
  def gpx_links(art) when is_module(art) do
    assigns = %{name: art.name()}

    ~H"""
    Route im
    <a href={"/geo/#{@name}.gpx"} download={"#{@name}.gpx"}>GPX-Format</a>
    bzw.
    <a href={"/geo/#{@name}.kml"} download={"#{@name}.kml"}>KML-Format</a>
    """
  end

  @doc """
  Returns the canonical path for a given article
  """
  @spec path(Article.Behaviour.t()) :: binary()
  def path(art) do
    if Article.List.has_type?(art, 'Blog'),
      do: "/article/#{art.name()}",
      else: "/#{art.name()}"
  end

  @doc """
  Returns the HTML link to the article, using the full title (with type prefix)
  as text if no content is given
  """
  @spec link(Article.Behaviour.t(), binary | Phoenix.LiveView.Rendered.t() | nil) ::
          Phoenix.LiveView.Rendered.t()
  def link(art, content \\ nil) do
    assigns = %{href: path(art), content: content || full_title(art)}

    ~H"""
    <a href={@href} data-phx-link-state="push" data-phx-link="patch"><%= @content %></a>
    """
  end

  @type_names %{
    construction: "Baustelle",
    planned: "Planung",
    changed_routing: "Routenänderung",
    ampel: "Unfaire Ampel",
    intent: "Vorhaben",
    issue: "Problemstelle",
    finished: "Abgeschlossen"
  }

  @spec type_name(Article.Behaviour.t()) :: binary() | nil
  def type_name(art), do: Map.get(@type_names, art.type(), nil)

  @doc """
  Calculate bounding box for the given article.

  It uses the following sources:
  - Map: Relations and Ways tagged with `name == article.name()`
  - Tracks: Bounding Boxes of all videos directly specified in the article
  and unions them to find a bounding box.

  If none can be found that way, it tries to find a map relation using the tags
  specified in the article and use that bounding box.
  """
  @spec bbox(Article.Behaviour.t()) :: Geo.BoundingBox.t() | nil
  def bbox(art) when is_module(art) do
    # from map
    ways = Map.Element.filter_by_tag(Cache.Map.ways(), :name, art.name())
    rels = Map.Element.filter_by_tag(Cache.Map.relations(), :name, art.name())
    bbox_map = Geo.CheapRuler.union(Map.Element.bbox(ways), Map.Element.bbox(rels))

    # from tracks
    bbox_tracks =
      art.tracks()
      |> Enum.map(&Video.Rendered.get(&1))
      |> Util.compact()
      |> Enum.reduce(nil, &Geo.CheapRuler.union(&1.bbox(), &2))

    bbox = Geo.CheapRuler.union(bbox_map, bbox_tracks)

    bbox ||
      Enum.find_value(art.tags(), fn tag ->
        # fallback to tags if article has no tracks nor other bounding box in the map
        Cache.Map.relations() |> Map.Element.filter_by_tag(:name, tag) |> Map.Element.bbox()
      end)
  end

  @spec related_route_groups(Article.Behaviour.t()) :: [Article.Behaviour.route_group()]
  def related_route_groups(art) when is_module(art) do
    groups =
      art.route_group() ||
        art
        |> Article.List.related()
        |> Enum.map(& &1.route_group())
        |> Enum.uniq()
        |> Util.compact()

    List.wrap(groups)
  end

  def updated_n_days_ago(art) when is_module(art) do
    Date.diff(Date.utc_today(), art.updated_at())
  end
end
