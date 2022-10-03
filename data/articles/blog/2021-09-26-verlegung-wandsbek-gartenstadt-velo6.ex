defmodule Data.Article.Blog.VerlegungWandsbekGartenstadtVelo6 do
  use Article.Default

  def name(), do: "#{created_at()}-verlegung-wandsbek-gartenstadt-velo6"
  def created_at(), do: ~D[2021-09-26]

  def title(), do: "Verlegung Veloroute 6 in Wandsbek-Gartenstadt"

  def summary(), do: "Veloroute 6 verläuft stadteinwärts nun auch über die Tilsiter Straße"

  def type(), do: :changed_routing

  def tags(), do: ["6"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Alte Führung</h4> <p>Stadteinwärts verlief die Veloroute zunächst geradeaus über die <.m bounds="10.07543,53.591694,10.093202,53.595956">Pillauer Straße</.m>. Am Bahnhof Wandsbek-Gartenstadt knickte sie über die <.m bounds="10.073877,53.588152,10.0782,53.592414">Allensteiner Straße</.m> nach Süden ab um zum <.m bounds="10.071772,53.584335,10.077073,53.589563" lon={10.075085} lat={53.588433} dir="backward">Eulenkamp</.m> zu kommen.</p>
    <h4>Neue Führung</h4> <p>Der Verlauf stadteinwärts ist nun identisch mit der Strecke stadtauswärts. Man biegt in die Straße „<.m bounds="10.096419,53.593041,10.098877,53.597624" lon={10.097964} lat={53.596384} dir="backward">Am Stadtrand</.m>“ ein und nutzt den Kreisel um in die <.m bounds="10.075208,53.588707,10.098934,53.594298" lon={10.097089} lat={53.593375} dir="backward">Tilsiter Straße</.m> zu kommen. Dieser folgt man bis zum Eulenkamp. Stadtauswärts gab es entsprechend keine Veränderung.</p>
    <h4>Meinung</h4> <p>Man hatte Schwierigkeiten in der zum Bahnhof hin engen Pillauer Straße attraktive Radwege unterzubringen. Die Überlegung die Fahrtrichtungen länger gemeinsam verlaufen zu lassen waren schon etwas älter, aber ab wo genau war noch offen.</p>
    <p>Gut ist, das man sich die gleiche Führung leichter merken kann. Da weder alte noch neue Führung ausgebaut sind, unterscheiden sich die Abschnitte aber bisher kaum. Es bleibt zu hoffen das die Planungsbüros den Platz in der Tilsiter Straße nun gewinnbringend nutzen. Für eine Beschreibung des Vorentwurfs, siehe <.a name="2021-04-23-tilsiter-strasse">Artikel zur Tilsiter Straße</.a>.</p>
    <h4>Quelle</h4> <p>Die Änderung wurde durch einen zeitlichen Vergleich der <.a href="https://fahrrad.hamburg/de/service/velorouten/">Karte der Stadt zu den Velorouten</.a> abgeleitet.</p>
    """
  end
end
