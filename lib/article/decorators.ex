defmodule Article.Decorators do
  use VelorouteWeb, :verified_routes
  use Phoenix.Component
  use Memoize
  import Guards

  @spec html(Article.t(), Article.assigns()) :: binary()
  def html(art, assigns \\ %{}) do
    main = apply_with_assigns(art, :text, assigns)

    assigns = %{ref: art}
    build = ~H"<Components.TagHelpers.construction_duration_paragraph ref={@ref}/>"

    Util.render_heex(main) <> Util.render_heex(build)
  end

  @spec text(Article.t(), [binary()]) :: binary()
  def text(art, extra_ignore \\ []) do
    ignore = Enum.join(["[data-nosnippet=yes]" | extra_ignore], ",")

    art
    |> html()
    |> Floki.parse_fragment!()
    |> Floki.filter_out(ignore)
    |> Floki.text(sep: " ")
  end

  def search_result(art, relevance) do
    bbox = Article.Decorators.bbox(art)
    bounds = if bbox, do: bbox, else: Settings.initial()
    type = if art.created_at(), do: "article", else: "page"

    subtext =
      if art.created_at(),
        do: "Letzte Änderung #{Article.Decorators.updated_at(art)}",
        else: art.summary()

    subtext =
      if Util.present?(art.title()),
        do: String.replace_leading(subtext, art.title(), "… "),
        else: subtext

    %Search.Result{
      bounds: bounds,
      name: Article.Decorators.full_title(art),
      url: Article.Decorators.path(art),
      relevance: relevance,
      type: type,
      subtext: subtext
    }
  end

  def apply_with_assigns(art, fun, assigns \\ %{}) do
    default = %{
      __changed__: %{},
      search_query: nil,
      search_bounds: nil,
      limit_to_map_bounds: false,
      show_map_image: false,
      enable_drawing_tools: false,
      ref: art
    }

    assigns = Map.merge(default, assigns)
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

  @doc """
  Returns only the tracks that are directly defined on the article, rejecting
  tracks imported from elsewhere.

      iex> Data.Article.Static.LexikonSchutzstreifen
      ...> |> Article.Decorators.own_tracks()
      ...> |> length()
      0

      iex> Data.Article.Static.Alltagsroute3
      ...> |> Article.Decorators.own_tracks()
      ...> |> length()
      2
  """
  @spec own_tracks(Article.t()) :: [Video.Track.t()]
  def own_tracks(art) do
    Enum.filter(art.tracks(), &(&1.parent_ref == art))
  end

  @spec street_names(Article.t()) :: [binary()]
  def street_names(art) do
    art
    |> own_tracks()
    |> Enum.map(&Video.Generator.get/1)
    |> Util.compact()
    |> Enum.flat_map(& &1.street_names())
    |> Enum.map(& &1.text)
    |> Enum.reject(&(&1 == ""))
    |> Enum.uniq()
  end

  @spec gpx_links(module()) :: [Phoenix.LiveView.Rendered.t()]
  def gpx_links(art) when is_module(art) do
    assigns = %{name: art.name()}

    if length(art.tracks()) > 0 do
      [
        ~H"""
        Route im
        <a href={"/geo/#{@name}.gpx"} download={"#{@name}.gpx"}>GPX-Format</a>
        bzw.
        <a href={"/geo/#{@name}.kml"} download={"#{@name}.kml"}>KML-Format</a>
        """
      ]
    else
      []
    end
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

  @spec path(Article.t(), nil | map()) :: binary()
  def path(art, query)
  def path(art, nil), do: path(art)

  def path(art, query) when is_map(query) do
    path(art) <> "?" <> URI.encode_query(query)
  end

  @doc """
  Returns the canonical URL for a given article
  """
  @spec url(Article.t()) :: binary()
  def url(art) do
    Settings.url() <> path(art)
  end

  @type_names %{
    construction: "Baustelle",
    planned: "Planung",
    changed_routing: "Routenänderung",
    ampel: "Unfaire Ampel",
    intent: "Vorhaben",
    outdated: "Veraltet",
    issue: "Problemstelle",
    finished: "Abgeschlossen",
    event: "Veranstaltung"
  }

  @spec type_name(Article.t() | Article.article_type()) :: binary() | nil
  def type_name(type) when is_map_key(@type_names, type), do: @type_names[type]
  def type_name(nil), do: nil
  def type_name(art), do: type_name(art.type())

  @doc """
  Calculate bounding box for the given article.

  It uses the following sources:
  - Point of interest: if specified will zoom onto that
  - Map: Relations and Ways tagged with `name == article.name()`
  - Tracks: Bounding Boxes of all videos directly specified in the article
  and unions them to find a bounding box.

  If none can be found that way, it tries to find a map relation using the tags
  specified in the article and use that bounding box.
  """
  @spec bbox(Article.t()) :: Geo.BoundingBox.t() | nil
  def bbox(art) when is_module(art) do
    bbox_point_of_interest(art) || bbox_self(art) || bbox_from_tags(art)
  end

  @spec bbox_point_of_interest(Article.t()) :: Geo.BoundingBox.t() | nil
  def bbox_point_of_interest(art) when is_module(art) do
    poi = art.point_of_interest()

    if poi do
      poi
      |> Map.put_new(:zoom, 16)
      |> Geo.CheapRuler.center_zoom_to_bounds()
    end
  end

  @spec bbox_self(Article.t()) :: Geo.BoundingBox.t() | nil
  defmemo bbox_self(art) when is_module(art) do
    # from map, manually defined area of interest
    ways =
      Cache.Map.ways()
      |> Map.Element.filter_by_tag(:name, art.name())
      |> Map.Element.filter_by_tag(:type, "article")

    bbox_map = Map.Element.bbox(ways)

    if bbox_map do
      bbox_map
    else
      # from map, without area of interest
      rels = Map.Element.filter_by_tag(Cache.Map.relations(), :name, art.name())
      bbox_map = Map.Element.bbox(rels)

      # from tracks, in case they don't (closely) match the ideal path
      bbox_tracks =
        art.tracks()
        |> Enum.map(&Video.Generator.get(&1))
        |> Util.compact()
        |> Enum.reduce(nil, &Geo.CheapRuler.union(&1.bbox(), &2))

      Geo.CheapRuler.union(bbox_map, bbox_tracks)
    end
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

  @spec related_route_groups(Article.t()) :: [Layer.route_group()]
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
  single static page with matching tags and use that one's tracks. If no tracks
  can be found, it will still return the original article to avoid having to do
  nil checks.
  """
  @spec article_with_tracks(Article.t()) :: Article.t()
  def article_with_tracks(art) when is_module(art) do
    case art.tracks() do
      [] ->
        Article.List.category("Static")
        |> Article.List.with_tracks()
        |> Article.List.related(art)
        |> Article.List.overlap(art)
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
         rendered <- Video.Generator.get(track) do
      center = Geo.CheapRuler.center(bbox)

      %{point: %{time_offset_ms: ms}} =
        Geo.CheapRuler.closest_point_on_line(rendered.coords(), center)

      # VelorouteWeb.Router.Helpers.image_extract_path(
      #   VelorouteWeb.Endpoint,
      #   :image,
      #   rendered.hash(),
      #   ms
      # )
      ~p"/images/thumbnails/#{rendered.hash()}/#{ms}"
    end
  end

  @doc """
  Returns related tracks to the current article. If the article has own tracks,
  these are returned. Otherwise it will find all overlapping static pages with
  matching tags and return their combined tracks.
  """
  @spec related_tracks(Article.t()) :: [Video.Track.t()]
  defmemo related_tracks(art) when is_module(art) do
    case art.tracks() do
      [] ->
        Article.List.category("Static")
        |> Article.List.with_tracks()
        |> Article.List.related(art)
        |> Article.List.overlap(art)
        |> Stream.flat_map(& &1.tracks())
        |> Enum.uniq()

      tracks ->
        tracks
    end
  end
end
