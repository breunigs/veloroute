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
    recent =
      Data.articles()
      |> Data.Article.recent()
      |> Enum.reverse()
      |> Enum.map(fn art ->
        url = Routes.article_path(VelorouteWeb.Endpoint, VelorouteWeb.FrameLive, art.name)

        content_tag(:li, [
          content_tag(:time, short_date(art.date), title: long_date(art.date)),
          live_patch(art.title, to: url)
        ])
      end)

    content_tag(:ol, recent, class: "hide-bullets")
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
end
