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
        Phoenix.HTML.Tag.content_tag(:span, id, style: "background: #{color}", class: "icon")
      else
        Phoenix.HTML.html_escape(id)
      end

    Phoenix.HTML.Tag.content_tag(:div, [icon, " ", rest], title: "Du folgst: #{full_name} #{rest}")
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
    article_list() |> Enum.slice(0, 4) |> wrap_in_ol
  end

  def articles_by_date(filter \\ "", with_range \\ false) do
    article_list(filter, true, with_range) |> wrap_in_ol
  end

  defp wrap_in_ol([]), do: ""

  defp wrap_in_ol(list) do
    content_tag(:ol, list, class: "hide-bullets")
    |> Phoenix.HTML.safe_to_string()
  end

  # TODO: allow enhanced sorting, allow showing begin to end dates
  defp article_list(filter \\ "", years \\ false, with_range \\ false) do
    Data.articles()
    |> Data.Article.filter(filter)
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
