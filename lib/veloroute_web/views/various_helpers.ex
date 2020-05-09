defmodule VelorouteWeb.VariousHelpers do
  use Phoenix.HTML

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
end
