defmodule Data.Article.Static.Changes do
  use Article.Static

  def title(), do: "Letzte Änderungen"

  def tags(), do: []

  def text(assigns) do
    ~H"""
    <h3 id="getNotified">Auf dem Laufenden bleiben</h3>
    <p>Wenn Du über neue oder geänderte Artikel informiert werden möchtest, hast Du mehrere Möglichkeiten:</p>

    <ul class="imgbullet">
      <li><.a href="/updates.atom"><img src="/images/rss.svg"> RSS-Feed</.a> (benötigt einen <.a href="https://www.rss-readers.org/">Feedreader</.a>)</li>
      <li><.a href="https://twitter.com/VelorouteHH"><img src="/images/twitter.svg"> Twitter</.a></li>
      <li><.a href="https://norden.social/@VelorouteHamburg" rel="me"><img src="/images/mastodon.svg"> Mastodon</.a></li>
      <li><.a href="https://bsky.app/profile/veloroutehh.bsky.social"><img src="/images/bluesky.webp"> Bluesky</.a></li>
      <li><.mailto subject="veloroute.hamburg Newsletter abonnieren" body={"Hallo,\n\nbitte halte mich zu neuen oder aktualisierten Artikeln auf dem Laufenden. Nimm dazu einfach diese E-Mail Adresse.\n\nDanke!"}><img src="/images/email.svg"> E-Mail Newsletter abonnieren</.mailto></li>
    </ul>

    <h3 id="lastChanges">Letzte Änderungen</h3>
    <.noindex>
    <ol class="hide-bullets">
      <.list_articles :let={ref} refs={Article.List.recent(_min_arts = 50, _max_arts = 1000, _max_days = 10*365)}>
        <.updated_at_time ref={ref} />
        <.article_link ref={ref}/>
      </.list_articles>
    </ol>
    </.noindex>
    """
  end
end
