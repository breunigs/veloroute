defmodule Data.Article.Blog.Veloroute1Aenderungen do
  use Article.Default

  def created_at(), do: ~D[2019-08-21]

  def title(), do: "Verbesserungen Veloroute 1 von Mitte 2018 bis Mitte 2019"

  def type(), do: nil

  def tags(), do: ["1"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die <.a href="/1">Veloroute 1</.a> ließ sich bereits Mitte 2018 gut befahren, was aber nicht heißt das sie frei von Problemstellen oder Verbesserungsmöglichkeiten war. Grund genug um sich anzuschauen was sich in ungefähr einem Jahr verbessert hat.</p>
    <p><strong><.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.550601, lon: 9.985955, zoom: 16.5})} ref="1">Rödingsmarkt / Stadthausbrücke / Axel-Springer-Platz:</.m></strong> Vor einem Jahr wurde hier noch umgebaut, jetzt sind die Kreuzungen größtenteils fertig. Es gibt durchgehende Radfahrstreifen entlang der Strecke und in den Kreuzungen ist die Radverkehrsführung deutlich eingezeichnet. Am Axel-Springer-Platz ist das indirekte abbiegen Richtung Kaiser-Wilhelm-Allee allerdings etwas gewöhnungsbedürftig. Die Möglichkeit links in die Düsternstraße einzubiegen ist gelungen.</p>
    <p><strong><.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.555412, lon: 9.946228, zoom: 16.5})} ref="1">Chemnitzstraße:</.m></strong> Der Ausbau zu einer Fahrradstraße ist mittlerweile fast abgeschlossen. Konkret heißt das Vorfahrt entlang der Strecke, Überhol- und Gesprächsmöglichkeit durch breitere Fahrbahn und eine glatte Oberfläche. Leider wird der ordentliche Anschluss an die <.a href="/article/2018-12-17-1-13-max-brauer-allee">Max-Brauer-Allee wohl erst 2021 angegangen</.a>.</p>
    <p><strong><.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.571283, lon: 9.868823, zoom: 18})} ref="1">Querung Osdorfer Landstraße:</.m></strong> Die Ampel wurde umgebaut sodass Radfahrende automatisch erkannt werden – d.h. das umständliche Betätigen der gelben Taster entfällt künftig. Auch die Kurvenradien und genaue Radführung wurde verdeutlicht.</p>
    <p><strong><.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.58782, lon: 9.85155, zoom: 15})} ref="1">Osdorfer Born:</.m></strong> Der Ausbau der Radwege wurde abgeschlossen. Diese sind jetzt mindestens 1,60m breit und eben. Vor einem Jahr befanden sich diese gerade im Umbau.</p>
    <p><strong><.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.557889, lon: 9.858056, zoom: 16})} ref="1">Jürgensallee:</.m></strong> Offenbar hat der <.a href="/article/2018-09-28-1-juergensallee">geplante Umbau</.a> begonnen – damit wird ein großer Teil des Kopfsteinpflasters durch Asphalt ersetzt.</p>
    <p><strong><.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.580707, lon: 9.769023, zoom: 16})} ref="1">Alte Sülldorfer Landstraße:</.m></strong> Auch hier wurde offenbar mit der <.a href="/article/2018-09-28-1-alte-suelldorfer-landstrasse">Umsetzung der geplanten Verkehrsberuhigung</.a> begonnen.</p>
    <p>Ebenso wurden Planungen verbessert oder in Angriff genommen. Siehe dazu auch die <.a href="/bau">Liste der geplanten Baumaßnahmen und Baustellen</.a>. Wenn ich etwas vergessen habe, <.mailto>schreib mir</.mailto> bitte.</p>
    """
  end
end
