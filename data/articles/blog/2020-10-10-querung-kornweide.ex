defmodule Data.Article.Blog.QuerungKornweide do
  use Article.Default

  def created_at(), do: ~D[2020-10-10]
  def updated_at(), do: ~D[2021-10-16]
  def title(), do: "Querung Kornweide (Veloroute 10)"

  def start(), do: ~d[2022Q3]

  def type(), do: :changed_routing

  def tags(), do: ["10", "M12.2"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Bestand</h4> <p>Momentan quert die Veloroute noch direkt an der Einmündung mit der Otto-Brenner-Straße die Kornweide. Dort gibt es für beide Fahrtrichtungen Bettelampeln um sicher über die Kornweide zu kommen. In Fahrtrichtung Süden gibt es alternativ eine weitere Bettelampel auf <.m lon="10.0068663" lat="53.4808685" dir="backward" bounds="10.005918,53.480448,10.007937,53.481072">Höhe des Alten Deichs</.m>.</p>
    <h4>Planung</h4> <p>Es ist angedacht stattdessen die Straßen <.m bounds="10.0081,53.482441,10.010108,53.482842">Am Callabrack</.m> und <.m bounds="10.006974,53.480889,10.0081,53.482623">Alter Deich</.m> zu Fahrradstraßen umzubauen und den Radverkehr so zur vorhandenen Bettelampel zu führen. An der Kreuzung <.m bounds="10.00721,53.481737,10.012042,53.48323" lon="10.0096162" lat="53.4825554" dir="forward">Kreuzung Am Callabrack / Otto-Brenner-Straße</.m> ist vorgesehen durch eine breite Mittelinsel dem Radverkehr das Linksabbiegen in zwei Zügen zu ermöglichen. Auf der Otto-Brenner-Straße schließen Radfahrstreifen an. Die Einmündung der Nebenstraße ist als Gehwegüberfahrt geplant.</p>
    <h4>Quellen</h4> <ul>
    <li><.a href="https://sitzungsdienst-hamburg-mitte.hamburg.de/bi//to020.asp?TOLFDNR=1028260">Präsentation Veloroute 10 auf Wilhelmsburg (Mai 2021)</.a></li>
    <li><.a href="https://sitzungsdienst-hamburg-mitte.hamburg.de/bi/vo020.asp?VOLFDNR=1013483">Planungsstand Anfang Oktober 2020</.a></li>
    <li><.a href="https://www.hamburg.de/mitte/strassenbau-und-verkehr/13884848">Infoseite der Stadt</.a> (noch keine Pläne für diese Maßnahme)</li>

    </ul>
    """
  end
end
