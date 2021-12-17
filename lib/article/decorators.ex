defmodule Article.Decorators do
  use Phoenix.Component
  import Guards

  @spec html(Article.t()) :: binary()
  def html(art) do
    apply_with_assigns(art, :text) |> Util.render_heex()
  end

  @spec html(Article.t(), Article.assigns()) :: binary()
  def html(art, %{render_target: _} = assigns) do
    assigns = assign_new(assigns, :current_page, fn -> art end)
    art.text(assigns) |> Util.render_heex()
  end

  @spec text(Article.t()) :: binary()
  def text(art) do
    art
    |> html()
    |> Phoenix.LiveView.HTMLTokenizer.tokenize("nofile", 0, [], [], :text)
    |> elem(0)
    |> Enum.reverse()
    |> Enum.map(fn
      {:text, val, _pos} -> val
      _any -> ""
    end)
    |> Enum.join(" ")
  end

  def colored_circle_svg(art) do
    """
    <svg viewBox="0 0 460.185 460.177" width="19.142" height="19.142" xmlns="http://www.w3.org/2000/svg"><circle style="opacity:1;fill:#{art.color()};stroke:#fff;stroke-width:18.2788;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1" cx="230.092" cy="230.088" r="220.953"/></svg>
    """
  end

  def apply_with_assigns(art, fun) do
    assigns = %{
      __changed__: %{},
      render_target: :html,
      search_query: nil,
      search_bounds: nil,
      current_page: art
    }

    apply(art, fun, [assigns])
  end

  @spec full_title(Article.t()) :: binary()
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
  @spec path(Article.t()) :: binary()
  def path(art) do
    if Article.has_category?(art, "Blog"),
      do: "/article/#{art.name()}",
      else: "/#{art.name()}"
  end

  def path(art, query)
  def path(art, nil), do: path(art)

  def path(art, query) when is_map(query) do
    path(art) <> "?" <> URI.encode_query(query)
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

  @spec type_name(Article.t() | Article.article_type()) :: binary() | nil
  def type_name(type) when is_map_key(@type_names, type), do: @type_names[type]
  def type_name(nil), do: nil
  def type_name(art), do: type_name(art.type())

  @doc """
  Calculate bounding box for the given article.

  It uses the following sources:
  - Map: Relations and Ways tagged with `name == article.name()`
  - Tracks: Bounding Boxes of all videos directly specified in the article
  and unions them to find a bounding box.

  If none can be found that way, it tries to find a map relation using the tags
  specified in the article and use that bounding box.
  """
  @spec bbox(Article.t()) :: Geo.BoundingBox.t() | nil
  def bbox(art) when is_module(art) do
    bbox_self(art) || bbox_from_tags(art)
  end

  @spec bbox_self(Article.t()) :: Geo.BoundingBox.t() | nil
  def bbox_self(art) when is_module(art) do
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

    Geo.CheapRuler.union(bbox_map, bbox_tracks)
  end

  @spec bbox_from_tags(Article.t()) :: Geo.BoundingBox.t() | nil
  def bbox_from_tags(art) when is_module(art) do
    Enum.find_value(art.tags(), fn tag ->
      Cache.Map.relations() |> Map.Element.filter_by_tag(:name, tag) |> Map.Element.bbox()
    end)
  end

  @spec geo_center(Article.t()) :: Geo.Point.t() | nil
  def geo_center(art) when is_module(art) do
    bbox = bbox(art)
    if bbox, do: Geo.CheapRuler.center(bbox)
  end

  @spec related_route_groups(Article.t()) :: [Article.route_group()]
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

  @spec updated_at(Article.t()) :: binary() | nil
  def updated_at(art) when is_module(art) do
    d = art.updated_at()
    if d, do: "#{d.day}.#{d.month}.#{d.year}"
  end

  @doc """
  Returns the current article if it has tracks. Otherwise it will try to find a
  static page with matching tags and use that one's tracks. If no tracks can
  be found, it will still return the original article to avoid having to do nil
  checks.
  """
  @spec article_with_tracks(Article.t()) :: Article.t()
  def article_with_tracks(art) when is_module(art) do
    case art.tracks() do
      [] ->
        Article.List.category("Static")
        |> Article.List.with_tracks()
        |> Article.List.related(art)
        |> Enum.at(0)
        |> Kernel.||(art)

      _tracks ->
        art
    end
  end

  def updated_n_days_ago(art) when is_module(art) do
    Date.diff(Date.utc_today(), art.updated_at())
  end

  @doc """
  Tries to find a picture of a related video track around the center of the
  article's bbox.
  """
  @spec start_image_path(Article.t()) :: binary() | nil
  def start_image_path(art) do
    with [track | _rest] <- article_with_tracks(art).tracks(),
         bbox when is_map(bbox) <- bbox(art),
         rendered <- Video.Rendered.get(track) do
      center = Geo.CheapRuler.center(bbox)

      %{point: %{time_offset_ms: ms}} =
        Geo.CheapRuler.closest_point_on_line(rendered.coords(), center)

      VelorouteWeb.Router.Helpers.image_extract_path(
        VelorouteWeb.Endpoint,
        :image,
        rendered.hash(),
        ms
      )
    end
  end
end
