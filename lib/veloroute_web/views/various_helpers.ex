defmodule VelorouteWeb.VariousHelpers do
  use Phoenix.HTML

  import Phoenix.LiveView.Helpers
  alias VelorouteWeb.Router.Helpers, as: Routes

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

  def recent_articles() do
    content_tag(:ol, Enum.slice(article_list(), 0, 4), class: "hide-bullets")
  end

  def articles_by_date() do
    content_tag(:ol, article_list(true), class: "hide-bullets")
  end

  def display_route({id, rest}) do
    rel = Data.Map.find_relation_by_tag(Data.map(), :id, id)
    color = Map.get(rel.tags, :color)
    full_name = Map.get(rel.tags, :name, id)

    icon =
      if color do
        Phoenix.HTML.Tag.content_tag(:span, id, style: "background: #{color}", class: "icon")
      else
        Phoenix.HTML.html_escape(id)
      end

    Phoenix.HTML.Tag.content_tag(:div, [icon, " ", rest], title: "Du folgst: #{full_name} #{rest}")
  end

  defp article_list(years \\ false) do
    Data.articles()
    |> Data.Article.ordered_by_date()
    |> Enum.reduce({nil, []}, fn art, {year, list} ->
      url = Routes.article_path(VelorouteWeb.Endpoint, VelorouteWeb.FrameLive, art.name)

      item =
        content_tag(:li, [
          content_tag(:time, short_date(art.date), title: long_date(art.date)),
          live_patch(art.title, to: url)
        ])

      list =
        if !years || year == nil || year == art.date.year do
          [item | list]
        else
          split = content_tag(:li, year, class: "separator")
          [item, split | list]
        end

      {art.date.year, list}
    end)
    |> elem(1)
  end
end
