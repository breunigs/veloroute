defmodule Data.Article.Blog.BasselwegBeimSportplatzring do
  use Article.Default

  def name(), do: "#{created_at()}-2-basselweg-beim-sportplatzring"
  def created_at(), do: ~D[2019-01-22]

  def title(), do: "Basselweg auf Höhe des Sportplatzring (Veloroute 2)"

  def type(), do: :planned

  def tags(), do: ["2"]

  def links(_assigns) do
    [
      {"Bericht Hauptverkehrsstraße",
       "https://lsbg.hamburg.de/resource/blob/784318/1da6be37504ccb1290463037dc0a61df/sportplatzring-lueckenschluss-abstimmungsunterlage-zweite-verschickung-bericht-data.pdf"},
      {"Lagepläne Hauptverkehrsstraße",
       "https://lsbg.hamburg.de/resource/blob/784320/d6371317732384ef726ac07561e6df70/sportplatzring-lueckenschluss-abstimmungsunterlage-zweite-verschickung-plaene-data.pdf"},
      {"Bericht Neubaugebiet / Basselweg",
       "https://lsbg.hamburg.de/resource/blob/784326/967842c32f45330885ca132a54cdd367/stellingen-62-spoprtplatzring-erschliessung-abstimmungsunterlage-zweite-verschickung-bericht-data.pdf"},
      {"Lagepläne Neubaugebiet / Basselweg",
       "https://lsbg.hamburg.de/resource/blob/784328/a22ff39df5749d98e1cf9d9e4eec1589/stellingen-62-spoprtplatzring-erschliessung-abstimmungsunterlage-zweite-verschickung-plan-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Das Gelände des ehemaligen Sportplatzes „Kampfbahn Stellingen“ wird erschlossen und soll zum Wohngebiet werden. Ebenso wird der <.m bounds="9.92954,53.591554,9.93228,53.593186">südliche Sportplatzring</.m> angepasst um die Abbiegesituation für KFZ in die Kieler Straße zu verbessern. Im Zuge dessen wird auch die Radverkehrsführung im <.m bounds="9.930368,53.591842,9.93585,53.595106">Basselweg</.m> leicht angepasst.</p> <p>Zuerst zur <.m bounds="9.932215,53.593912,9.933585,53.594728">Einmündung der Hagenbeckallee</.m>: Der Hochbordradweg wird weiter nördlich auf einen Radfahrstreifen abgeleitet, sodass man nicht mehr im Kreuzungsbereich auf die Straße wechseln muss. Durch die Markierung hat der von Norden kommende Radverkehr gegenüber dem Sportplatzring Vorfahrt, was hoffentlich durch Schilder verdeutlicht wird. Kurz nach der Kreuzung hört der Radfahrstreifen auf und man fährt im Mischverkehr weiter. Von Süden kommend ändert sich fast nichts, da weiterhin Rechts-vor-Links gilt. Lediglich die Möglichkeit den Hochbordradweg zu benutzen entfällt, was aufgrund der unklaren Kreuzungssituation nur wenige hundert Meter später aber keinen großen Verlust darstellt.</p> <p>Richtung Süden geht kurz vor der <.m bounds="9.933325,53.592162,9.934695,53.592978">Kreuzung Sportplatzring / Koppelweg / Basselweg</.m> noch die neu zu bauende <.m bounds="9.929976,53.59298,9.933449,53.593193">Borchertstraße</.m> ab, wobei der Radverkehr auch hier durch Markierungen die Vorfahrt hat. Danach wird der Basselweg im Vergleich zu heute deutlich verbreitert um Platz für eine Rechtsabbiegerspur zu gewinnen. Diese teilt sich der Radverkehr mit den KFZ. Für die kombinierte Geradeaus- und Linksabbiegerspur wird ein schmaler Vorbeifahrstreifen eingezeichnet, sodass man die Aufstellfläche vor den Autos legal erreichen kann. In der Gegenrichtung gibt es ein kurzes Stück Radfahrstreifen, der aber noch vor der <.m bounds="9.929976,53.59298,9.933449,53.593193">Borchertstraße</.m> endet.</p> <p>Die anderen Arme der Kreuzung bleiben jedoch praktisch gleich. Nur wer entlang Hauptverkehrsstraße (<.m bounds="9.928438,53.592183,9.933743,53.594332">Sportplatzring</.m> bzw. <.m bounds="9.760029,53.592475,9.946589,53.675075">Koppelstraße</.m>) fährt und indirekt links auf die Veloroute abbiegen möchte erhält künftig eigene Ampeln. Zusätzlich wird in der nordwestlichen Ecke der Kreuzung, auf dem neuen <.m bounds="9.932894,53.592754,9.933329,53.593089">Stegemannplatz</.m>, eine StadtRAD Station eingerichtet.</p> <p>Im Bereich der Veloroute sind die Planungen okay, aber definitiv nicht überragend. Es ist gut das man die Vorfahrtsituation am <.m bounds="9.932215,53.593912,9.933585,53.594728">nördlichen Sportplatzring</.m> und der <.m bounds="9.929976,53.59298,9.933449,53.593193">Borchertstraße</.m> deutlich klärt, ebenso wie der Vorbeifahrstreifen Richtung Süden. Andererseits bleibt es in diesem Abschnitt des Basselwegs bei 50 km/h, ohne das für den Radverkehr Infrastruktur geschaffen wird. Detaillierter wird im Bericht nur die Einrichtung von Schutzstreifen diskutiert – die unter hohem Baum- und Stellplatzverlust jedoch zurecht abgelehnt wird. Das weder ein 30er Tempolimit noch Einbahnstraße mit Busfreigabe erörtert wurden zeigt jedoch, das es noch ein weiter Weg bis zur Fahrradstadt Hamburg ist.</p> <p>Der Umbau der Hauptverkehrsstraße soll 2020 beginnen, sobald der Autobahnanschluss Hamburg-Stellingen fertig ist. Der Basselweg folgt wenn die angrenzende Wohnbebauung weitestgehend abgeschlossen ist – was ca. erst 2022 der Fall sein wird.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
