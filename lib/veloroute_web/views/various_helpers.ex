defmodule VelorouteWeb.VariousHelpers do
  use Phoenix.HTML

  import Phoenix.LiveView.Helpers
  alias VelorouteWeb.Router.Helpers, as: Routes

  def display_route({id, rest}) do
    rel = Data.Map.find_relation_by_tag(Data.map(), :id, id)
    color = Map.get(rel.tags, :color)
    full_name = Map.get(rel.tags, :name, id)

    icon =
      if color do
        content_tag(:span, id, style: "background: #{color}", class: "icon")
      else
        Phoenix.HTML.html_escape(id)
      end

    content_tag(:div, [icon, " ", rest], title: "Du folgst: #{full_name} #{rest}")
  end

  @short_month_names [
    "Jan",
    "Feb",
    "Mär",
    "Apr",
    "Mai",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Okt",
    "Nov",
    "Dez"
  ]
  # TODO: unify with RoughDate?
  @long_month_names [
    "Januar",
    "Februrar",
    "März",
    "April",
    "Mai",
    "Juni",
    "Juli",
    "August",
    "September",
    "Oktober",
    "November",
    "Dezember"
  ]
  def short_date(%Date{day: day, month: month}) do
    "#{day}. #{Enum.at(@short_month_names, month - 1)}"
  end

  def long_date(%Date{day: day, month: month, year: year}) do
    "#{day}. #{Enum.at(@long_month_names, month - 1)} #{year}"
  end

  @recent_article_count 4
  def articles(attrs, _body) do
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

    articles =
      Data.articles()
      |> Data.Article.filter(filters)
      |> Data.Article.ordered(Map.get(attrs, :sort))
      |> Enum.slice((-1 * range)..-1)

    articles = if Map.get(attrs, :order) == "rev", do: Enum.reverse(articles), else: articles

    display = Map.get(attrs, :display)

    arts =
      case display do
        "range" -> articles_to_html(articles, false, true)
        "plain" -> articles_to_html(articles, false, false)
        _ -> articles_to_html(articles, length(articles) > @recent_article_count, false)
      end

    if display == "range",
      do: floki_content_tag("ul", arts),
      else: floki_content_tag("ol", arts, class: "hide-bullets")
  end

  defp articles_to_html(articles, years, ranges) do
    articles
    |> Enum.reduce({nil, []}, fn art, {year, list} ->
      url = Routes.article_path(VelorouteWeb.Endpoint, VelorouteWeb.FrameLive, art.name)

      time =
        if ranges,
          do: floki_content_tag(:span, Data.Article.range(art), class: "duration"),
          else: floki_content_tag(:time, short_date(art.date), title: long_date(art.date))

      item =
        floki_content_tag(:li, [
          time,
          live_patch(art.title, to: url) |> to_floki
        ])

      list =
        if !years || year == nil || year == art.date.year do
          [item | list]
        else
          split = floki_content_tag(:li, year, class: "separator")
          [item, split | list]
        end

      {art.date.year, list}
    end)
    |> elem(1)
  end

  defp floki_content_tag(tag, content), do: floki_content_tag(tag, content, [])

  defp floki_content_tag(_tag, nil, _attrs), do: nil

  defp floki_content_tag(tag, content, attrs) when is_list(attrs) do
    attrs = Enum.map(attrs, fn {k, v} -> {to_string(k), to_string(v)} end)

    content =
      cond do
        is_list(content) -> content
        is_integer(content) -> [to_string(content)]
        is_binary(content) -> [content]
      end

    {to_string(tag), attrs, content}
  end

  defp to_floki({:safe, [_, tag, attrs, _, content | _rest]}) do
    attrs = Enum.map(attrs, fn [_, k, _, _, v, _] -> {k, v} end)
    {tag, attrs, List.wrap(content)}
  end
end
