defmodule Data.Article.Static.Changes do
  use Article.Static

  def title(), do: "Letzte Änderungen"

  def tags(), do: []

  def text(assigns) do
    ~H"""
    <h3 id="getNotified">Auf dem Laufenden bleiben</h3>
    <ul>
      <li><.a href="/updates.atom">RSS-Feed</.a> (benötigt einen <.a href="https://www.rss-readers.org/">Feedreader</.a>)</li>
      <li><.a href="https://twitter.com/VelorouteHH">Twitter</.a></li>
      <li><.mailto subject="veloroute.hamburg Newsletter abonnieren" body={"Hallo,\n\nbitte halte mich zu neuen oder aktualisierten Artikeln auf dem Laufenden. Nimm dazu einfach diese E-Mail Adresse.\n\nDanke!"}>E-Mail Newsletter abonnieren</.mailto></li>
    </ul>

    <h3 id="lastChanges">Letzte Änderungen</h3>
    <ol class="hide-bullets">
      <.list_articles let={art} articles={Article.List.recent(_min_arts = 50, _max_arts = 1000, _max_days = 10*365)}>
        <.updated_at_time article={art} />
        <.article_link article={art}/>
      </.list_articles>
    </ol>
    """
  end
end
