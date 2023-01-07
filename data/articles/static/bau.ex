defmodule Data.Article.Static.Bau do
  use Article.Static

  def title(), do: "Baustellen und geplante Maßnahmen"

  def summary(),
    do: "(geplante) Baustellen mit Bezug zum Radverkehr"

  def tags(), do: []

  def text(assigns) do
    ~H"""
    <p>Die Zeitangaben zu den Baustellen und geplanten Baumaßnahmen stellt meist nur eine grobe Orientierung dar. In der Praxis verschieben sich die genauen Termine durch Baustellenkoordination oder wenn es Streit um Vorhaben gibt. Auch bekomme ich längst nicht alle Änderungen mit – wenn du Fehler findest, bitte <.mailto>schreib mir</.mailto> und ich korrigiere das.</p>

    <p>Für tagesaktuelle Baustelleninfos, siehe auch <.a href="https://www.hamburg.de/baustellen">hamburg.de/baustellen</.a>.</p>

    <h3>Baustellen</h3>
    <ul>
      <.list_articles let={art} articles={articles(:construction, :asc, :stop)} grouper={&group_by_stop/1}>
        <.construction_duration article={art} />
        <.article_link article={art}><%= art.title()%></.article_link>
      </.list_articles>
    </ul>


    <h3>Geplante Baumaßnahmen</h3>
    <ul>
      <.list_articles let={art} articles={articles(:planned, :asc, :start)}  grouper={&group_by_start/1}>
        <.construction_duration article={art} />
        <.article_link article={art}><%= art.title() %></.article_link>
      </.list_articles>
    </ul>
    """
  end

  @spec articles(Article.article_type(), :asc | :desc, atom()) :: [
          Article.t()
        ]
  defp articles(type, sorter, field) when is_atom(type) do
    Article.List.category("Blog")
    |> Stream.filter(fn art -> art.type() == type end)
    # |> Stream.filter(fn art -> art.start() != Data.RoughDate.zero() end)
    |> Article.List.sort(sorter, field)
  end

  defp group_by_start(art) do
    if art.start() == Data.RoughDate.zero() do
      "unbekannt"
    else
      "ab #{art.start().year}"
    end
  end

  defp group_by_stop(art) do
    if art.stop() == Data.RoughDate.zero() do
      "unbekannt"
    else
      "bis #{art.stop().year}"
    end
  end
end
