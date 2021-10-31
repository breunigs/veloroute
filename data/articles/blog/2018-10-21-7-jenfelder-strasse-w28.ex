defmodule Data.Article.Blog.JenfelderStrasseW28 do
  use Article.Default

  def name(), do: "#{created_at()}-7-jenfelder-strasse-w28"
  def created_at(), do: ~D[2018-10-21]

  def title(),
    do: "Jenfelder Straße zw. Jenfelder Allee und Charlottenburger Straße (Veloroute 7)"

  def start(), do: ~d[2020-05]
  def stop(), do: ~d[2020-12]

  def type(), do: :finished

  def tags(), do: [7, "w28"]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Im Abschnitt der <.m bounds="10.105412,53.573928,10.135253,53.580793">Jenfelder Straße</.m> zwischen <.m bounds="10.124568,53.571022,10.128716,53.586101">Jenfelder Allee</.m> und <.m bounds="10.13455,53.57499,10.141482,53.589093">Charlottenburger Straße</.m> sollen künftig Schutzstreifen (gestrichelte Linie) mit 1,5m Breite markiert werden. Kurz nach der Jenfelder Allee steht mit 1,75m sogar etwas mehr Platz zur Verfügung, wobei Radfahrende im Bereich der Bushaltestelle auch bei Gegenverkehr am Bus vorbeifahren können. Am Ostende zur Charlottenburger Straße erlaubt ein Aufstellbereich vor den KFZ bequem in alle Richtungen abzubiegen.</p> <p>Im Vergleich zum Bestand ist die vorliegende Planung eine deutliche Verbesserung. Die nur 1,5m breiten Schutzstreifen wären zu verschmerzen, wenn das vom ADFC vorgeschlagene 30 km/h Tempolimit eingerichtet wird. Dies ist jedoch unabhängig von der Velorouten Planung, sondern wird ggf. auf Grund der Schule bzw. des Altenheims eingerichtet.</p> <p><.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1009131">Erläuterungsbericht zur Umgestaltung mit vorläufigem Lageplan</.a> (unter Anlagen)</p>
    """
  end
end
