defmodule Data.Article.Blog.TilsiterStrasseBeimAltenTeichweg do
  use Article.Default

  def name(), do: "#{created_at()}-tilsiter-strasse-beim-alten-teichweg"
  def created_at(), do: ~D[2021-01-16]

  def title(), do: "Tilsiter Straße zwischen Lesserstraße und Eulenkamp (Veloroute 6)"

  def start(), do: ~d[2021-01-04]
  def stop(), do: ~d[2021-11-15]

  def type(), do: :construction
  def construction_site_id_hh(), do: [13995, 15562]
  def tags(), do: ["6", "w16", "w16.1"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Ein Teilstück der Planung „W16“ soll bereits umgesetzt werden. Für eine Beschreibung, siehe bitte <.a href="/article/2019-10-24-6-tilsiter-strasse-eckerkoppel-w16">Eckerkoppel und Tilsiter Straße</.a>. </p> <h4>Quelle</h4> <ul>
    <li><.a href="https://suche.transparenz.hamburg.de/dataset/f53a3526-a842-4fb6-9e10-7d3979aa7c55">Ausschreibung mit Zuschlag</.a> (Transparenzportal Hamburg)</li>
    <li><.a href="https://www.hamburg.de/wandsbek/strassenbaustellen/15029656/tilsiter-und-allensteiner-strasse/">Infoseite zur Baustelle</.a></li>
    </ul>
    """
  end
end
