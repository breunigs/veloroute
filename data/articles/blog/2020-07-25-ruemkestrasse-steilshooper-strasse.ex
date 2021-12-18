defmodule Data.Article.Blog.RuemkestrasseSteilshooperStrasse do
  use Article.Default

  def created_at(), do: ~D[2020-07-25]
  def updated_at(), do: ~D[2021-02-09]
  def title(), do: "Kreuzung Rümkerstraße/Steilshooper Straße (Veloroute 5)"

  def start(), do: ~d[2030]

  def type(), do: :intent

  def tags(), do: ["5"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Februar 2021</h4> <p>Laut Bezirksamt erhielt der unten beschriebene Entwurf Kritik, sowohl bzgl. der Gestaltung selbst als auch wegen des angedachten Bautermins. Da der Abschnitt als Umleitungsstrecke für Busse und KFZ während des Baus der U5 gedacht ist, wird die Sanierung verschoben. Man geht dabei aktuell von einem Bautermin ab frühstens 2030 aus.</p> <h4>Alter Zustand</h4> <p>Die Führung an dieser Stelle überlässt einem die Wahl. Entweder fährt man über kurvige und unebene Hochbordradwege, die genauso schnell wieder verschwinden wie sie auftauchen. Oder man bleibt auf der Fahrbahn, wobei es im Kreuzungsbereich keine sinnvolle Führung gibt. Keine der beiden Varianten orientiert sich an den Bedürfnissen des Radverkehrs.</p> <h4>Pläne</h4> <p>Im ersten Entwurf ist angedacht die Ampel durch einen Kreisverkehr zu ersetzen, der auch die <.m bounds="10.047065,53.602385,10.05099,53.603854">Schmachthäger Straße</.m> vollständig anbindet. An allen Armen des Kreisels sind jeweils Mittelinseln und Zebrastreifen geplant, um dem Fußverkehr Vorfahrt einzuräumen. Etwas weiter weg kommen jeweils noch Fahrradstellplätze bzw. eine neue StadtRAD Station dazu. Da der Radverkehr im Kreisel mit den Autos geführt wird, werden die ehemaligen Hochbordradwege zu Fußwegen. Dies verbessert die Situation zwar, reicht aber nicht um alle Engstellen zu beseitigen. Geplant ist ab Sommer 2021 zu bauen.</p> <h4>Meinung</h4> <p>Kreisverkehre sind für den Radverkehr eine angenehme Kreuzungsart. Solange sich die Autofahrenden anständig verhalten und nicht drängeln, sollte man hier gut durchkommen.</p> <h4>Quelle</h4> <ul>
    <li><.a href="https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1009650">Pläne und Erläuterungsbericht</.a></li>
    <li><.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1013703">Verschiebung des Umbaus nach 2030</.a></li>
    </ul>
    """
  end
end
