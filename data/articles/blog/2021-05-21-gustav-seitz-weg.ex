defmodule Data.Article.Blog.GustavSeitzWeg do
  use Article.Default

  def name(), do: "#{created_at()}-gustav-seitz-weg"
  def created_at(), do: ~D[2021-05-21]

  def title(), do: "Gustav-Seitz-Weg (Veloroute 5)"

  def start(), do: ~d[2022Q1]

  def type(), do: :planned

  def tags(), do: [5, "W31"]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4> <p>Der Radverkehr darf hier auf rund 1,25m breiten, unebenen <ref>Hochbordradwegen</ref> fahren, oder auf der Fahrbahn im Autoverkehr mitschwimmen. Durch die Führung der Strecke ist <.m bounds="10.060237,53.608314,10.063914,53.609466" lon="10.0623337" lat="53.6087119" dir="forward">bergauf</.m> nur der Hochbordradweg gut zu erreichen. Bergab verpasst man die <.m bounds="10.058107,53.609847,10.066346,53.61173" lon="10.0618397" lat="53.6105941" dir="backward">Aufleitung kurz nach dem Kreisel</.m> leicht.</p>
    <p>Zum Queren der Steilshooper Straße muss eine Bettelampel benutzt werden.</p>
    <h4>Planung</h4> <p>Der erste Entwurf schlägt Hochbordradwege den Fußwegen zu. Der Radverkehr wird über 2,0m breite <ref>Radfahrstreifen</ref> geführt. Wegen des Baus der U5 werden hier Ersatzbushaltestellen angelegt, die den Radfahrstreifen nahe des Kreisels unterbrechen.</p>
    <p>Richtung Steilshoop erhält der Radverkehr eine eigene Radampel, die ein <.m bounds="10.057892,53.608131,10.06332,53.609372" lon="10.0618723" lat="53.6085465" dir="forward">paar Meter vor der bisherigen Querungsmöglichkeit</.m> installiert wird.</p>
    <p>Richtung Innenstadt verbreitert sich der Radfahrstreifen zu eigenen Links- und Rechtsabbiegespuren. Diese sind durch eine Verkehrsinsel vom Autoverkehr abgetrennt. Die Rechtskurve entlang der Veloroute wird im Kreuzungsbereich ebenfalls durch eine schmale Verkehrsinsel abgesichert.</p>
    <h4>Meinung</h4> <p>Die Planung hat einige gute Ansätze, überzeugt insgesamt aber gar nicht.</p>
    <p>Während der Bauzeit der U5 – rund 5 Jahre – muss der Radverkehr regelmäßig haltenden Bussen ausweichen. Die Taktung liegt bei weniger als 5 Minuten, also sehr häufig. Auf der Ostseite kommen die ein- und ausparkenden KFZ hinzu, da man hier Parkplätze rechts des Radfahrstreifens anlegt. Dies obwohl zahlreiche Tiefgaragen in unmittelbarer Nähe zur Verfügung stehen. Dies macht den Abschnitt für den Radverkehr unattraktiv.</p>
    <p>Die geplante schmale Verkehrsinsel zum Schutz der Rechtsabbieger Richtung Innenstadt (<.m bounds="10.060376,53.608304,10.063212,53.609225" lon="10.0618425" lat="53.6088481" dir="backward">etwa hier</.m>) wirft Fragen auf. Folgt man der Veloroute ist diese Führung nur umständlich. Gerade aus entlang der Steilshooper Allee blockiert sie jedoch die direktere Führung und stellt somit eine neue Schikane dar.</p>
    <p>In der Gegenrichtung gibt es wieder nur Aufstellfläche für 3-4 Fahrräder. An einer <.m bounds="9.961525,53.556177,9.965941,53.557654" lon="9.9637536" lat="53.5570378" dir="forward">vergleichbaren Stelle auf der Veloroute 1</.m> führt dies regelmäßig zu Konflikten</p>
    <p>Es ist klar das die Kreuzung insgesamt umgestaltet werden muss um für den Radverkehr attraktiv zu werden. Immerhin bekommt der Radverkehr durch die eigenen Radampeln etwas längere Grünphasen.</p>
    <h4>Quelle</h4> <p><.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1014315">Erläuterungsbericht und Lageplan des ersten Entwurfs</.a></p>
    """
  end
end
