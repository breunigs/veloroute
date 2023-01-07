defmodule Data.Article.Static.Bau do
  use Article.Static

  def title(), do: "Baustellen und geplante Maßnahmen"

  def summary(),
    do: "(geplante) Baustellen mit Bezug zum Radverkehr"

  def tags(), do: []

  def text(assigns) do
    assigns =
      assign(
        assigns,
        if assigns.limit_to_map_bounds do
          %{
            checkbox_attr: [checked: "checked"],
            list_articles_attr: [
              filter: fn art ->
                Geo.CheapRuler.overlap?(Article.Decorators.bbox(art), assigns.map_bounds)
              end
            ]
          }
        else
          %{
            checkbox_attr: [],
            list_articles_attr: []
          }
        end
      )

    ~H"""
    <p>Die Zeitangaben zu den Baustellen und geplanten Baumaßnahmen stellt meist nur eine grobe Orientierung dar. In der Praxis verschieben sich die genauen Termine durch Baustellenkoordination oder wenn es Streit um Vorhaben gibt. Auch bekomme ich längst nicht alle Änderungen mit – wenn du Fehler findest, bitte <.mailto>schreib mir</.mailto> und ich korrigiere das.</p>

    <p>Für tagesaktuelle Baustelleninfos, siehe auch <.a href="https://www.hamburg.de/baustellen">hamburg.de/baustellen</.a>.</p>

    <form>
      <input type="checkbox" name="limit-to-map-bounds" value="limit-to-map-bounds" id="limit-to-map-bounds" phx-change="limit-to-map-bounds" {@checkbox_attr}>
      <label for="limit-to-map-bounds">Listen auf Kartenausschnitt beschränken</label>
    </form>

    <h3>Baustellen</h3>
    <ul>
      <.list_articles let={art} articles={articles(:construction, :asc, :stop)} grouper={&group_by_stop/1} {@list_articles_attr}>
        <.construction_duration article={art} />
        <.article_link article={art}><%= art.title()%></.article_link>
      </.list_articles>
    </ul>


    <h3>Geplante Baumaßnahmen</h3>
    <ul>
      <.list_articles let={art} articles={articles(:planned, :asc, :start)}  grouper={&group_by_start/1} {@list_articles_attr}>
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
    |> Enum.filter(fn art -> art.type() == type end)
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
