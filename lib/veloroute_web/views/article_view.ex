defmodule VelorouteWeb.ArticleView do
  use VelorouteWeb, :view
  alias Article
  alias VelorouteWeb.VariousHelpers
  alias Map.Relation
  import Mapillary.Types, only: [is_ref: 1]

  @dialyzer {:nowarn_function, render_template: 2}
  @recent_article_min 4
  @recent_article_max 20
  @recent_article_days 14

  def render(name, assigns) do
    art =
      Cache.Articles.get()
      |> Map.fetch!(name)

    art
    |> maybe_render_dynamic(assigns)
    |> Map.fetch!(:text)
    |> Floki.parse_fragment!()
    |> maybe_prepend_title(art)
    |> maybe_append_date(art)
    |> append_related_articles(art)
    |> append_footer(art)
    |> enhance_tag("icon", &icon/2)
    |> enhance_tag("articles", &articles/2)
    |> enhance_tag("mailto", &mailto/2)
    |> enhance_tag("geolinks", &geolinks/2)
    |> enhance_tag("ref", &ref/2)
    |> enhance_tag("a", &live_links/2)
    |> Floki.raw_html()
    |> Phoenix.HTML.raw()
  end

  def render_feed(%Article{} = art) do
    art
    |> Map.fetch!(:text)
    |> Floki.parse_fragment!()
    |> maybe_prepend_title(art)
    |> maybe_prepend_image(art)
    |> enhance_tag("icon", &icon/2)
    |> enhance_tag("articles", &hide/2)
    |> enhance_tag("mailto", &mailto/2)
    |> enhance_tag("geolinks", &geolinks/2)
    |> enhance_tag("a", &feed_links/2)
    |> Floki.raw_html()
    |> Phoenix.HTML.raw()
  end

  @spec enhance_tag(
          Floki.html_tree(),
          binary(),
          ([Floki.html_attribute()], Floki.html_tree() -> Floki.html_tag() | nil)
        ) :: Floki.html_tree()
  defp enhance_tag(document, name, replacer) do
    Floki.traverse_and_update(document, fn
      {^name, attrs, children} ->
        replacer.(attrs, children)

      any ->
        any
    end)
  end

  defp maybe_render_dynamic(%Article{dynamic: name} = art, assigns)
       when is_binary(name) and name != "" do
    text =
      Phoenix.View.render(VelorouteWeb.DynamicView, art.dynamic, assigns)
      |> Phoenix.HTML.safe_to_string()

    Map.put(art, :text, text)
  end

  defp maybe_render_dynamic(art, _assigns), do: art

  @spec maybe_prepend_title(Floki.html_tree(), %Article{}) :: Floki.html_tree()
  defp maybe_prepend_title(html, %Article{text: "<h3" <> _x}), do: html
  defp maybe_prepend_title(html, %Article{no_auto_title: true}), do: html

  defp maybe_prepend_title(html, %Article{title: t} = art) do
    floki_content_tag(:h3, t) ++ maybe_construction_time(art) ++ html
  end

  defp maybe_construction_time(%Article{type: type} = art) do
    {Article.range(art), type}
    |> case do
      {"", _type} ->
        []

      {range, "finished"} ->
        floki_content_tag(:span, "Umbau abgeschlossen (Bauzeit #{range})", class: "duration")

      {range, _type} ->
        floki_content_tag(:span, "vermutete Bauzeit: #{range}", class: "duration")
    end
  end

  defp maybe_append_date(html, %Article{date: d}) when not is_nil(d) do
    html ++
      floki_content_tag(:time, "Letzte Änderung #{d.day}.#{d.month}.#{d.year}",
        datetime: "#{d}",
        class: "updated"
      )
  end

  defp maybe_append_date(html, _art), do: html

  @spec maybe_prepend_image(Floki.html_tree(), %Article{}) :: Floki.html_tree()
  defp maybe_prepend_image(html, %Article{start_image: img}) when is_ref(img) do
    [{"img", [{"src", Mapillary.Resolver.img_url(img, 2048)}], []}] ++ html
  end

  defp maybe_prepend_image(html, _art), do: html

  @spec append_related_articles(Floki.html_tree(), %Article{}) :: Floki.html_tree()
  defp append_related_articles(html, %Article{name: "0000-00-00-" <> _rest}), do: html

  defp append_related_articles(html, art) do
    related = Article.related(Cache.Articles.get(), art)
    dated = Article.ordered(related, :date)
    nodate = Article.filter(related, date: [nil]) |> Map.values()

    if related == %{} do
      html
    else
      main = nodate |> Enum.flat_map(&to_link/1) |> to_soft_list
      dated = article_list(dated, years: true, time_format: :date)

      html ++
        floki_content_tag(:h3, "Verwandte Artikel") ++
        main ++
        floki_content_tag(:ol, dated, class: "hide-bullets")
    end
  end

  defp to_link(art) do
    url = VariousHelpers.article_path(art)
    live_patch(art.full_title, to: url) |> to_floki
  end

  defp to_list_time(art, :range),
    do: floki_content_tag(:span, Article.range(art), class: "duration")

  defp to_list_time(%Article{date: nil}, :date), do: []

  defp to_list_time(%Article{date: date}, :date),
    do:
      floki_content_tag(
        :time,
        VariousHelpers.short_date(date),
        title: VariousHelpers.long_date(date),
        datetime: Date.to_string(date)
      )

  defp to_soft_list([x]) do
    floki_content_tag(:p, ["Übersicht: " | floki_content_tag(:strong, [x])])
  end

  defp to_soft_list(list) do
    lis = Enum.flat_map(list, &floki_content_tag(:li, [&1]))
    floki_content_tag(:ul, lis)
  end

  defp hide(_attr, _content) do
    {"span", [], []}
  end

  @mail Settings.email()
  defp mailto(_attr, content) do
    content = if content == [], do: @mail, else: content
    {"a", [{"href", "mailto:#{@mail}"}], List.wrap(content)}
  end

  defp geolinks([{"route", route}], content) do
    # TODO: cleanup once all is video
    rel = VariousHelpers.relation_by_id(route)
    route = Route.from_id(route)

    gpx =
      cond do
        rel -> geolinks_gpx(Relation.name(rel), Relation.gpx_name(rel))
        route -> geolinks_gpx(route.name(), route.id())
      end

    osm_href =
      cond do
        route -> route.osm_relation_ref()
        rel -> Relation.osm_url(rel)
      end

    osm =
      case osm_href do
        nil -> []
        href -> [{"li", [], floki_content_tag("a", "Route in der OpenStreetMap", href: href)}]
      end

    {"ul", [], content ++ osm ++ gpx}
  end

  defp geolinks_gpx(_, nil), do: []

  defp geolinks_gpx(name, gpx_name) do
    [gpx] =
      floki_content_tag("a", "GPX-Format",
        href: "/geo/#{gpx_name}.gpx",
        download: name <> ".gpx"
      )

    [kml] =
      floki_content_tag("a", " KML-Format",
        href: "/geo/#{gpx_name}.kml",
        download: name <> ".kml"
      )

    {"li", [], ["Route im ", gpx, " bzw. ", kml]}
  end

  defp icon(given_attr, content) do
    [{_tag, attrs, content}] = content |> Floki.text() |> VariousHelpers.route_icon() |> to_floki
    {"a", given_attr ++ attrs ++ [{"href", "/#{content}"}], content}
  end

  @spec feed_links([Floki.html_attribute()], Floki.html_tree()) :: Floki.html_tag()
  defp feed_links(attrs, children) do
    href = find_attribute(attrs, "href")

    attrs =
      Enum.reject(attrs, fn
        {"data-" <> _, _v} -> true
        {"phx-" <> _, _v} -> true
        _ -> false
      end)

    cond do
      nil == href ->
        name = Floki.text(children)
        {"a", [{"href", "#{Settings.url()}/#{name}"}], children}

      String.starts_with?(href, "/") ->
        {"a", set_attribute(attrs, "href", Settings.url()), children}

      true ->
        {"a", attrs, children}
    end
  end

  @spec live_links([Floki.html_attribute()], Floki.html_tree()) :: Floki.html_tag()
  defp live_links(attrs, children) do
    href = find_attribute(attrs, "href")
    keep = {"a", attrs, children}

    cond do
      find_attribute(attrs, "data-phx-link") != nil ->
        keep

      find_attribute(attrs, "download") != nil ->
        keep

      href == nil && find_attribute(attrs, "phx-click") != nil ->
        keep

      find_attribute(attrs, "bounds") != nil ->
        bounds = find_attribute(attrs, "bounds")
        new_attr = [{"phx-click", "map-zoom-to"}, {"phx-value-bounds", bounds}]

        img = find_attribute(attrs, "img")
        new_attr = if img, do: [{"phx-value-img", img} | new_attr], else: new_attr
        {"a", new_attr, children}

      nil == href ->
        name = Floki.text(children)
        bounds = Overpass.bounds(name)

        if bounds do
          bounds = VariousHelpers.to_string_bounds(bounds)
          {"a", [{"phx-click", "map-zoom-to"}, {"phx-value-bounds", bounds} | attrs], children}
        else
          {"span", [], children}
        end

      String.starts_with?(href, "http") ->
        {"a", [{"target", "_blank"} | attrs], children}

      opts = parse_map_link(href) ->
        values = opts |> Enum.map(fn {k, v} -> {"phx-value-#{k}", v} end)
        attrs = [{"phx-click", "map-zoom-to"}, {"onclick", "return false"}] ++ values ++ attrs
        {"a", attrs, children}

      String.starts_with?(href, "/") ->
        {"a", [{"data-phx-link-state", "push"}, {"data-phx-link", "patch"} | attrs], children}

      String.starts_with?(href, "mailto:") ->
        keep

      true ->
        keep
    end
  end

  def parse_map_link(path) do
    # /13#zoom/lat/lon/img
    Regex.named_captures(
      ~r{/(?<route>\d+)?#(?<zoom>[\d.]+)/(?<lat>[\d.]+)/(?<lon>[\d.]+)(?:/(?<img>.+))?},
      path
    )
  end

  def ref(attrs, children) do
    attrs_as_hash(attrs)[:name]
    |> Kernel.||(Floki.text(children))
    |> Cache.Articles.find()
    |> case do
      {_name, art} ->
        url = VariousHelpers.article_path(art)

        {"a",
         [
           {"data-phx-link-state", "push"},
           {"data-phx-link", "patch"},
           {"class", "ref"},
           {"href", url}
         ], children}

      _ ->
        raise("Cannot find reference for #{inspect(children)}")
    end
  end

  @spec articles([Floki.html_attribute()], Floki.html_tree()) :: Floki.html_tag()
  def articles(attrs, _children) do
    attrs = attrs_as_hash(attrs)

    filters =
      attrs
      |> Map.drop([:sort, :display, :range, :order])
      |> Enum.map(fn {k, v} -> {k, String.split(v, ",")} end)

    display = Map.get(attrs, :display)

    list_opts =
      case display do
        "range" -> [years: false, time_format: :range]
        "plain" -> [years: false, time_format: :date]
        _ -> [years: true, time_format: :date]
      end

    arts =
      Cache.Articles.get()
      |> Article.filter(filters)
      |> Article.ordered(Map.get(attrs, :sort))
      |> slice_articles(Map.get(attrs, :range))
      |> title_filter_cleaner(filters)
      |> article_list(list_opts)

    if display == "range",
      do: floki_content_tag("ul", arts) |> hd(),
      else: floki_content_tag("ol", arts, class: "hide-bullets") |> hd()
  end

  defp slice_articles(arts, nil), do: arts

  defp slice_articles(arts, "recent") do
    {extra, min} =
      arts
      |> Enum.slice((-1 * @recent_article_max)..-1)
      |> Enum.split(@recent_article_max - @recent_article_min)

    extra =
      Enum.filter(extra, fn art ->
        Article.age_in_days(art) <= @recent_article_days
      end)

    extra ++ min
  end

  @spec article_list([%Article{}],
          years: boolean(),
          time_format: :date | :range
        ) :: Floki.html_tree()
  defp article_list([], years: _years, time_format: _time_format), do: []

  defp article_list(articles, years: years, time_format: time_format) do
    articles
    |> Enum.reduce({nil, []}, fn art, {year, list} ->
      item = to_list_item(art, time_format)

      list =
        if !years || year == art.date.year do
          item ++ list
        else
          split = floki_content_tag(:li, year, class: "separator")
          item ++ split ++ list
        end

      prev = if art.date, do: art.date.year, else: nil
      {prev, list}
    end)
    |> elem(1)
    |> List.wrap()
  end

  @spec to_list_item(%Article{}, atom()) :: Floki.html_tree()
  defp to_list_item(art, time_format) do
    floki_content_tag(:li, to_list_time(art, time_format) ++ to_link(art))
  end

  defp title_filter_cleaner(arts, filters) do
    cleaners =
      Keyword.get(filters, :tags, [])
      |> Enum.map(fn val -> ~r{\s+\(Veloroute #{val},?(.*?)\)$} end)

    arts
    |> Enum.map(fn %Article{title: t} = art ->
      t = Enum.reduce(cleaners, t, fn cleaner, t -> Regex.replace(cleaner, t, "\\1") end)
      %{art | title: t}
    end)
  end

  @spec append_footer(Floki.html_tree(), %Article{}) :: Floki.html_tree()
  defp append_footer(html, %Article{hide_footer: true}), do: html
  defp append_footer(html, _art), do: html ++ Floki.parse_fragment!(Settings.footer())

  @spec floki_content_tag(any(), any()) :: Floki.html_tree()
  defp floki_content_tag(tag, content), do: floki_content_tag(tag, content, [])

  @spec floki_content_tag(any(), any(), any()) :: Floki.html_tree()
  defp floki_content_tag(_tag, nil, _attrs), do: []
  defp floki_content_tag(_tag, "", _attrs), do: []

  defp floki_content_tag(tag, content, attrs) when is_list(attrs) do
    attrs = Enum.map(attrs, fn {k, v} -> {to_string(k), to_string(v)} end)

    content =
      cond do
        is_list(content) -> content
        is_integer(content) -> [to_string(content)]
        is_binary(content) -> [content]
      end

    [{to_string(tag), attrs, content}]
  end

  @spec to_floki(Phoenix.HTML.safe()) :: Floki.html_tree()
  defp to_floki({:safe, [_, tag, attrs, _, content | _rest]}) do
    attrs = Enum.map(attrs, fn [_, k, _, _, v, _] -> {k, v} end)
    [{tag, attrs, List.wrap(content)}]
  end

  def find_attribute(attrs, key) do
    Enum.find_value(attrs, fn
      {^key, val} -> val
      _any -> false
    end)
  end

  def set_attribute(attrs, key, val) do
    Enum.map(attrs, fn
      {^key, _v} -> {key, val}
      any -> any
    end)
  end

  defp attrs_as_hash(attrs) do
    attrs
    |> Enum.map(fn {key, val} -> {String.to_existing_atom(key), val} end)
    |> Enum.into(%{})
  end
end
