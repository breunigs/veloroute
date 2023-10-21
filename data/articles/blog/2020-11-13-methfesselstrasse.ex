defmodule Data.Article.Blog.Methfesselstrasse do
  use Article.Default

  def created_at(), do: ~D[2020-11-13]

  def title(), do: "Methfesselstraße"

  def type(), do: :finished
  def start(), do: ~d[2022-09-13]
  def stop(), do: ~d[2023-07-31]
  def construction_site_id_hh(), do: [113_061]

  def tags(), do: ["eimsbüttel", "articles", "br-eimsbuettel-nord-sued"]

  def tracks(), do: []

  def links(_assigns) do
    [
      {"Pressemitteilung zum Umbau", "September 2022",
       "https://www.hamburg.de/eimsbuettel/pressemitteilungen/16499936/2022-09-15-eimsbuettel-methfesselstrasse/"},
      {"Erläuterungsbericht und Pläne",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1006045"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4> <p>Radfahrende haben die Wahl auf schmalen und kurvigen Hochbord-Radwegen zu fahren oder sich die Fahrbahn mit dem KFZ-Verkehr zu teilen. Mit Ausnahme des <.m bounds="9.946114,53.581669,9.948996,53.583112">Kreisels am Eidelstedter Weg</.m> sind alle Kreuzungen und Einmündungen durch eine Ampel geregelt.</p>
    <h4>Planung</h4> <p>Der Methfesselstraße Fahrtrichtung Norden folgend: zunächst werden die <.m bounds="9.945689,53.579694,9.947298,53.580431">vorhandenen 1,5m breiten Schutzstreifen</.m> bis zur <.m bounds="9.94633,53.580244,9.947939,53.580982">Kreuzung mit der Hartwig-Hesse-Straße</.m> verlängert. Dort regelt künftig ein Kreisverkehr die Vorfahrt, wobei sich Fahrrad und KFZ die Spur teilen. Weiter geradeaus trennen sich die Führungen wieder und der Radverkehr erhält rund 2,0m breite <.ref>Radfahrstreifen</.ref>. Die <.m bounds="9.946847,53.581144,9.948448,53.581946">Ampel an der Lutterrothstraße</.m> wird durch einen Zebrastreifen ersetzt. Kurz darauf schließt eine Bushaltestelle auf der Fahrbahn an, die mit 3,75m Breite ein Vorbeifahren an wartenden Bussen ermöglichen sollte. Der vorhandene <.m bounds="9.946114,53.581669,9.948996,53.583112">Kreisverkehr am Eidelstedter Weg</.m> wird so umgebaut, das der Radverkehrkehr sich die Spur mit den KFZ teilt. Dies soll die häufigen Unfälle an dieser Stelle reduzieren. Im Anschluss wird der Radverkehr <.m bounds="9.946817,53.582724,9.948426,53.583462">über einen Parkplatz</.m> auf den alten Radweg aufgeleitet.</p> <p>In Fahrtrichtung Süden ergibt sich fast genau das gleiche Bild, bloß mit umgedrehter Reihenfolge. Die Ableitung des vorhandenen Radwegs erfolgt in etwa auf Höhe <.m bounds="9.946109,53.582602,9.949093,53.584096">Steenwisch</.m>.</p> <p>Die alten Radwege werden zurückgebaut und entweder den Fußwegen zugeschlagen oder zu KFZ-Parkplätzen ausgebaut. Die <.m bounds="9.945509,53.579699,9.94722,53.580556">StadtRAD Station auf Höhe des Luruper Weg</.m> soll vergrößert werden. Die Arme der Kreisverkehre erhalten jeweils eine Mittelinsel und Zebrastreifen, um auch Leuten zu Fuß eine einfache Querung zu ermöglichen. In der Mitte der Methfesselstraße wird zusätzlich ein run 2,0m breiter Grünstreifen angelegt.</p> <p>Geplant ist mit den Bauarbeiten ab Mai/Juni 2021 zu beginnen.</p>
    <h4>Meinung</h4> <p>Die wegfallenden Ampeln ermöglichen dem Radverkehr eine deutlich stetigere Fahrt, was Kraft spart. Die viel zu schmalen und kurvigen Altradwege zu ersetzen ist ebenfalls gut. Die Einmündung der Lutterrothstraße wirft jedoch Fragen auf: die Mittelinsel wird unterbrochen um Linksabbiegen zu ermöglichen, obwohl dies vermutlich kaum vorkommt. In Fahrtrichtung Norden sollen Autofahrende hier „einen Bogen“ um den Radfahrstreifen fahren, während die Wunschlinie schnurgerade ist. Es könnte also sein, das Radfahrende hier häufig geschnitten werden.</p>
    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
