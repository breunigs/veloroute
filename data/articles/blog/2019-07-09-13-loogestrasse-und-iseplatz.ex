defmodule Data.Article.Blog.LoogestrasseUndIseplatz do
  use Article.Default

  def name(), do: "#{created_at()}-13-loogestrasse-und-iseplatz"
  def created_at(), do: ~D[2019-07-09]

  def title(), do: "Loogestraße und Iseplatz (Veloroute 13)"

  def start(), do: ~d[2020Q2]
  def stop(), do: ~d[2020-12-01]

  def type(), do: :finished

  def tags(), do: ["13"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die <.m bounds="9.983294,53.58364,9.994256,53.590168">Loogestraße</.m> lässt sich gut befahren, verwirrt jedoch durch unklare Markierungen. Was wie ein Radfahrstreifen aussieht ist vermutlich Teil der Sicherheitsabstände zu den überwiegend rückwärts ausparkenden Autos. Auch das Stopschild von der <.m bounds="9.987013,53.584611,9.989753,53.586243">Hegestraße in die Loogestraße</.m> ist etwas umständlich.</p>
    <p>Die Umplanung räumt beide Probleme aus dem Weg: Entlang der Loogestraße soll es durchgehende Radfahrstreifen von rund 2m Breite geben. Die <.m bounds="9.987013,53.584611,9.989753,53.586243">Kreuzung Iseplatz / Isekai / Hegestraße / Loogestraße</.m> wird zu einem kleinen Kreisverkehr umgebaut und lässt sich damit vermutlich rollend durchfahren. Auf <.m bounds="9.989013,53.586756,9.991753,53.588388">Höhe der Sporthalle</.m> wird zusätzlich eine Mittelinsel bzw. Querungshilfe installiert, die auch das Linksabbiegen zu selbiger erleichtern sollte. Leider wird deswegen auch der Radfahrstreifen hier etwas schmäler – man wollte verhindern das im KFZ im Alltag den Radfahrstreifen mitbenutzen und hat daher die Markierung zulasten des Radverkehrs verschoben.</p> <p>Umgesetzt werden soll die Maßnahme ab Frühjahr 2020. Da der Asphalt teilweise erneuert werden soll, sind Vollsperrungen wohl unvermeidbar. Da es sich bereits um die Schlussverschickung handelt, ist es sehr wahrscheinlich, dass der Umbau so erfolgt wie dargestellt.</p>
    <p><.a href="https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1008439">Erläuterungsbericht und Lagepläne</.a> (unter Anlagen).</p>
    """
  end
end
