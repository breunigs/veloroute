defmodule Data.Article.Blog.Kloevensteenweg do
  use Article.Default

  def name(), do: "#{created_at()}-1-kloevensteenweg"
  def created_at(), do: ~D[2018-09-28]
  def updated_at(), do: ~D[2020-08-11]
  def title(), do: "Klövensteenweg (Veloroute 1)"

  def start(), do: ~d[2021Q3]

  def type(), do: :planned

  def tags(), do: ["1"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Stand August 2020:</h4> <p>Die Planungen zum Kreisverkehr und die Tempo-30-Zone in der <.m bounds="9.763843,53.46337,10.088009,53.590145">Alten Sülldorfer Landstraße</.m> sind abgeschlossen und sollen im Sommer 2021 umgesetzt werden. Der Artikel wurde an die Detailänderungen angepasst.</p>
    <h4>Bestand</h4> <p>Die Kreuzung ist mit einer Ampel versehen. Radwege gibt es nur im  <.m bounds="9.763089,53.581203,9.766407,53.609231">Klövensteenweg</.m>, die aber schwer zu erkennen sind und deren Aufleitungen nicht hervorgehoben sind.</p>
    <h4>Pläne</h4> <p>Diese Kreuzung soll vorraussichtlich im Sommer 2021 zu einem Kreisverkehr umgebaut werden. Die Stummelradwege auf dem <.m bounds="9.763089,53.581203,9.766407,53.609231">Klövensteenweg</.m> werden entfernt und die <.m bounds="9.763089,53.579719,9.776531,53.581823">Alte Sülldorfer Landstraße</.m> wird in dieser Baumaßnahme bis zum <.m bounds="9.762458,53.579407,9.767208,53.580782">Rissener Busch</.m> zu einer Tempo-30-Zone umgebaut. Folgt man der Veloroute Richtung stadtauswärts, gibt es eine halbe Vorbeifahrmöglichkeit am Kreisel, die sich vermutlich gut nutzen lässt um rollend durchzukommen. In der Gegenrichtung hat man selbstverständlich den langen Weg durch den Kreisverkehr. Zebrastreifen an jeder Einmündung in den Kreisel erlauben zu Fuß Gehenden eine leichtere Querung.</p>
    <h4>Meinung</h4> <p>Ein Kreisverkehr ist gerade in Nebenzeiten sinnvoll – beim Abfahren der Route stand ich häufig grundlos an der roten Ampel. Außerdem wird durch die neue Anordnung klar wo der Radverkehr fahren soll, statt durch kurze Radwegstücke zu verwirren.</p>
    <h4>Quelle</h4> <p><.a href="https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1010254">Erläuterungsbericht zur Umgestaltung mit Lageplan</.a></p>
    """
  end
end
