defmodule Data.Article.Blog.Hasselbrookstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-7-hasselbrookstrasse"
  def created_at(), do: ~D[2019-10-25]

  def title(), do: "Hasselbrookstraße (Veloroute 7)"

  def start(), do: ~d[2021-06-21]
  def stop(), do: ~d[2022-06-30]

  def type(), do: :construction
  def construction_site_id_hh(), do: [16420]
  def tags(), do: ["7", "w10"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die angedachten Maßnahmen auf der Hasselbrookstraße fallen vor allem in den Bereich „Verkehrsberuhigung“. Auf gesamter Länge wird Tempo 30 eingerichtet bzw. genauer die vorhandene Tempo-30-Zone der umliegenden Straßen erweitert. Die ampelfreien Kreuzungen werden enger gefasst um die Geschwindigkeiten zu reduzieren und um bessere Einsicht zu ermöglichen. Die Vorfahrt der Hasselbrookstraße wird aufgehoben und durch Rechts-vor-Links ersetzt.</p> <p>Das <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.565289, lon: 10.05425, zoom: 17})} ref="7">kurze Stück Hochbordradweg</.m> nahe der Haltestelle Hasselbrook entfällt. Ebenso soll <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.565289, lon: 10.05425, zoom: 17})} ref="7">die Fußampel</.m> durch einen Zebrastreifen ersetzt werden. Die Ampel an der <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.564312, lon: 10.045453, zoom: 17})} ref="7">Kreuzung mit der Ritterstraße</.m>  bleibt, jedoch soll hier eine Aufstellfläche für Radfahrende vor den KFZ eingerichtet werden. Bei Rot kann man sich also vor den KFZ aufstellen.</p> <p>Außerdem wird der Fahrbahnbelag erneuert und eine weitere StadtRAD Station eingerichtet. Anlehnbügel zum Abschließen des Fahrrads kommen ebenso an vielen Stellen hinzu.</p><ul><li><.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1011006">vorläufige Lagepläne und Erläuterungsbericht</.a></li><li><.a href="https://www.hamburg.de/wandsbek/strassenbaustellen/15148044/hasselbrookstrasse/">Baustelleninfo</.a></li></ul>
    """
  end
end
