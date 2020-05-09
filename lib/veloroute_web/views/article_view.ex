defmodule VelorouteWeb.ArticleView do
  use VelorouteWeb, :view
  alias Data.Article
  alias VelorouteWeb.VariousHelpers

  @dialyzer {:nowarn_function, render_template: 2}
  @recent_article_count 4

  def render(name, _assigns) do
    art =
      Data.articles()
      |> Map.fetch!(name)

    art
    |> Map.fetch!(:text)
    |> Floki.parse_fragment!()
    |> enhance_tag("a", &live_links/2)
    |> enhance_tag("articles", &articles/2)
    |> enhance_tag("mailto", &mailto/2)
    |> maybe_prepend_title(art)
    |> append_related_articles(art)
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

  @spec maybe_prepend_title(Floki.html_tree(), %Article{}) :: Floki.html_tree()
  defp maybe_prepend_title(html, %Article{text: "<h3" <> _x}), do: html

  defp maybe_prepend_title(html, %Article{title: t}), do: floki_content_tag(:h3, t) ++ html

  @spec append_related_articles(Floki.html_tree(), %Article{}) :: Floki.html_tree()
  defp append_related_articles(html, art) do
    Data.articles()
    |> Article.related(art)
    |> case do
      x when x == %{} ->
        html

      x ->
        items =
          x
          |> Article.ordered(:date)
          |> article_list(years: true, time_format: :date)

        html ++
          floki_content_tag(:h3, "Verwandte Artikel") ++
          floki_content_tag(:ol, items, class: "hide-bullets")
    end
  end

  @spec to_list_item(%Article{}, atom()) :: Floki.html_tree()
  defp to_list_item(%Article{name: name, title: title} = art, time_format) do
    url = Routes.article_path(VelorouteWeb.Endpoint, VelorouteWeb.FrameLive, name)

    time = to_list_time(art, time_format)
    link = live_patch(title, to: url) |> to_floki
    floki_content_tag(:li, time ++ link)
  end

  defp to_list_time(art, :range),
    do: floki_content_tag(:span, Article.range(art), class: "duration")

  defp to_list_time(%Article{date: date}, :date),
    do:
      floki_content_tag(
        :time,
        VariousHelpers.short_date(date),
        title: VariousHelpers.long_date(date),
        datetime: Date.to_string(date)
      )

  @mail Settings.email()
  defp mailto(_attr, content) do
    content = if content == [], do: @mail, else: content
    {"a", [{"href", "mailto:#{@mail}"}], List.wrap(content)}
  end

  @spec live_links([Floki.html_attribute()], Floki.html_tree()) :: Floki.html_tag()
  defp live_links(attrs, children) do
    href =
      Enum.find_value(attrs, fn
        {"href", val} -> val
        _any -> false
      end)

    cond do
      nil == href ->
        name = Floki.text(children)
        {"a", [{"phx-click", "map-zoom-to"}, {"phx-value-name", name} | attrs], children}

      String.starts_with?(href, "http") ->
        {"a", [{"target", "_blank"} | attrs], children}

      opts = parse_map_link(href) ->
        values = opts |> Enum.map(fn {k, v} -> {"phx-value-#{k}", v} end)
        attrs = [{"phx-click", "map-zoom-to"}, {"onclick", "return false"}] ++ values ++ attrs
        {"a", attrs, children}

      String.starts_with?(href, "/") ->
        {"a", [{"data-phx-link-state", "push"}, {"data-phx-link", "patch"} | attrs], children}

      String.starts_with?(href, "mailto:") ->
        {"a", attrs, children}

      true ->
        {"a", attrs, children}
    end
  end

  defp parse_map_link(path) do
    # /13#zoom/lat/lon/img
    Regex.named_captures(
      ~r{/(?<route>\d+)?#(?<zoom>[\d.]+)/(?<lat>[\d.]+)/(?<lon>[\d.]+)(?:/(?<img>.+))?},
      path
    )
  end

  @spec articles([Floki.html_attribute()], Floki.html_tree()) :: Floki.html_tag()
  def articles(attrs, _children) do
    attrs =
      attrs
      |> Enum.map(fn {key, val} -> {String.to_existing_atom(key), val} end)
      |> Enum.into(%{})

    filters =
      attrs
      |> Map.drop([:sort, :display, :range, :order])
      |> Enum.map(fn {k, v} -> {k, String.split(v, ",")} end)

    range =
      attrs
      |> Map.get(:range)
      |> case do
        "recent" -> @recent_article_count
        _ -> -1
      end

    display = Map.get(attrs, :display)

    list_opts =
      case display do
        "range" -> [years: false, time_format: :range]
        "plain" -> [years: false, time_format: :date]
        _ -> [years: true, time_format: :date]
      end

    arts =
      Data.articles()
      |> Data.Article.filter(filters)
      |> Data.Article.ordered(Map.get(attrs, :sort))
      |> Enum.slice((-1 * range)..-1)
      |> article_list(list_opts)

    if display == "range",
      do: floki_content_tag("ul", arts) |> hd(),
      else: floki_content_tag("ol", arts, class: "hide-bullets") |> hd()
  end

  @spec article_list([%Article{}],
          years: boolean(),
          time_format: :date | :range
        ) :: Floki.html_tag()
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

      {art.date.year, list}
    end)
    |> elem(1)
  end

  @spec floki_content_tag(any(), any()) :: Floki.html_tree()
  defp floki_content_tag(tag, content), do: floki_content_tag(tag, content, [])

  @spec floki_content_tag(any(), any(), any()) :: Floki.html_tree()
  defp floki_content_tag(_tag, nil, _attrs), do: []

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
end
