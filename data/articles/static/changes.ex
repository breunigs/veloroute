defmodule Data.Article.Static.Changes do
  use Article.Static

  def name(), do: "changes"
  def title(), do: "Letzte Änderungen"

  def tags(), do: []

  def text(assigns) do
    ~H"""
    <h3 id="getNotified">Auf dem Laufenden bleiben</h3>
    <ul>
      <li><.a href="/updates.atom">RSS-Feed</.a> (benötigt einen <.a href="https://www.rss-readers.org/">Feedreader</.a>)</li>
      <li><.a href="https://twitter.com/VelorouteHH">Twitter</.a></li>
      <li><.a href="mailto:stefan-veloroute@breunig.xyz?subject=veloroute.hamburg%20Newsletter%20abonnieren&amp;body=Hallo,%0A%0Abitte%20halte%20mich%20über%20über%20Baustellen,%20Änderungen%20an%20der%20Seite,%20usw.%20auf%20dem%20Laufenden.%20Nimm%20dazu%20einfach%20diese%20E-Mail%20Adresse.%0A%0ADanke!">E-Mail Newsletter abonnieren</.a></li>
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
