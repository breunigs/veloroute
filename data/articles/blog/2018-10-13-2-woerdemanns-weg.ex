defmodule Data.Article.Blog.WoerdemannsWeg do
  use Article.Default

  def name(), do: "#{created_at()}-2-woerdemanns-weg"
  def created_at(), do: ~D[2018-10-13]

  def title(), do: "Wördemanns Weg (Veloroute 2)"

  def start(), do: ~d[2020-06-24]
  def stop(), do: ~d[2022-07-29]

  def type(), do: :construction
  def construction_site_id_hh(), do: [9608, 20222]
  def tags(), do: ["2"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die ungenügenden Radwege im <.m bounds="9.916527,53.59684,9.932818,53.60012">Wördemanns Weg</.m> sollen zurückgebaut und durch 1,5m breite Schutzstreifen ersetzt werden. Diese sind geradlinig und durchgängig, wenn man von der kurzen Unterbrechung an den Bushaltestellen absieht. An der Kreuzung zum <.m bounds="9.931638,53.587142,9.935193,53.59684">Basselweg</.m> bzw. <.m bounds="9.929857,53.596784,9.95175,53.599554">Gazellenkamp</.m> gibt es nur kleine Änderungen: die Aufleitung auf den Radweg entgegen der Einbahnstraße <.m bounds="9.931638,53.587142,9.935193,53.59684">Basselweg</.m> wird im Kreuzungsbereich auf der Fahrbahn geführt und erst ein paar Meter später auf den alten Hochbordradweg aufgeleitet. Neben den den fortgeführten Leitlinien für die Schutzstreifen gibt es noch eine eigene Linksabbiegerspur für Fahrräder, die vom <.m bounds="9.929857,53.596784,9.95175,53.599554">Gazellenkamp</.m> in den <.m bounds="9.931638,53.587142,9.935193,53.59684">Basselweg</.m> abbiegen wollen.</p> <p>Im Vergleich zur aktuellen Situation, wo man sich als Radfahrende sowohl auf dem Radweg als auch auf der Straße fehl am Platze fühlt, schafft die geplante Führung definitiv Klarheit. Zwar wäre ein geringeres Tempo als 50 km/h wünschenswert gewesen, aber auch ohne ist der Entwurf annehmbar.</p> <p>Der Umbau soll im Anschluss an die Fertigstellung des Stellinger Deckels erfolgen. Projektiert war das ursprünglich für Anfang 2018, wobei dieser Termin offensichtlich nicht gehalten wurde.</p> <ul>
    <li><.a href="https://www.hamburg.de/eimsbuettel/woerdemannsweg/">Infoseite der Stadt zum Wördemanns Weg</.a></li>
    <li><.a href="https://www.hamburg.de/contentblob/9260570/8698b22b4907664bb69d4f8f9c6ce7a5/data/d-woerdemannsweg-lageplan01.pdf">Lageplan 1</.a></li>
    <li><.a href="https://www.hamburg.de/contentblob/13929732/1fd3d03349358a07e8c27348c697e236/data/d-woerdemannsweg-lageplan02.pdf">Lageplan 2</.a></li>
    <li><.a href="https://www.hamburg.de/contentblob/13929734/9b0c27fd46228bdd50c9987a52359e08/data/d-woerdemannsweg-lageplan03.pdf">Lageplan 3</.a></li>
    <li><.a href="https://www.hamburg.de/contentblob/13929736/94fc06b8adb2b9b02e60e46d3c5978a9/data/d-woerdemannsweg-lageplan04.pdf">Lageplan 4</.a></li>
    <li><.a href="https://www.hamburg.de/contentblob/13929738/0a66ee5d9068c39c9fca4e3f30dda9af/data/d-woerdemannsweg-lageplan05.pdf">Lageplan 5</.a></li>
    </ul>
    """
  end
end
