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
    <p>Die <.a name="alltagsroute-1">Veloroute 1</.a> ließ sich bereits Mitte 2018 gut befahren, was aber nicht heißt das sie frei von Problemstellen oder Verbesserungsmöglichkeiten war. Grund genug um sich anzuschauen was sich in ungefähr einem Jahr verbessert hat.</p>
    <p><strong><.m bounds="9.982079,53.548293,9.989831,53.552909" ref="1">Rödingsmarkt / Stadthausbrücke / Axel-Springer-Platz:</.m></strong> Vor einem Jahr wurde hier noch umgebaut, jetzt sind die Kreuzungen größtenteils fertig. Es gibt durchgehende Radfahrstreifen entlang der Strecke und in den Kreuzungen ist die Radverkehrsführung deutlich eingezeichnet. Am Axel-Springer-Platz ist das indirekte abbiegen Richtung Kaiser-Wilhelm-Allee allerdings etwas gewöhnungsbedürftig. Die Möglichkeit links in die Düsternstraße einzubiegen ist gelungen.</p>
    <p><strong><.m bounds="9.942352,53.553104,9.950104,53.55772" ref="1">Chemnitzstraße:</.m></strong> Der Ausbau zu einer Fahrradstraße ist mittlerweile fast abgeschlossen. Konkret heißt das Vorfahrt entlang der Strecke, Überhol- und Gesprächsmöglichkeit durch breitere Fahrbahn und eine glatte Oberfläche. Leider wird der ordentliche Anschluss an die <.a name="2018-12-17-1-13-max-brauer-allee">Max-Brauer-Allee wohl erst 2021 angegangen</.a>.</p>
    <p><strong><.m bounds="9.867453,53.570467,9.870193,53.572099" ref="1">Querung Osdorfer Landstraße:</.m></strong> Die Ampel wurde umgebaut sodass Radfahrende automatisch erkannt werden – d.h. das umständliche Betätigen der gelben Taster entfällt künftig. Auch die Kurvenradien und genaue Radführung wurde verdeutlicht.</p>
    <p><strong><.m bounds="9.840588,53.581292,9.862512,53.594348" ref="1">Osdorfer Born:</.m></strong> Der Ausbau der Radwege wurde abgeschlossen. Diese sind jetzt mindestens 1,60m breit und eben. Vor einem Jahr befanden sich diese gerade im Umbau.</p>
    <p><strong><.m bounds="9.852575,53.554625,9.863537,53.561153" ref="1">Jürgensallee:</.m></strong> Offenbar hat der <.a name="2018-09-28-1-juergensallee">geplante Umbau</.a> begonnen – damit wird ein großer Teil des Kopfsteinpflasters durch Asphalt ersetzt.</p>
    <p><strong><.m bounds="9.763542,53.577443,9.774504,53.583971" ref="1">Alte Sülldorfer Landstraße:</.m></strong> Auch hier wurde offenbar mit der <.a name="2018-09-28-1-alte-suelldorfer-landstrasse">Umsetzung der geplanten Verkehrsberuhigung</.a> begonnen.</p>
    <p>Ebenso wurden Planungen verbessert oder in Angriff genommen. Siehe dazu auch die <.a name="bau">Liste der geplanten Baumaßnahmen und Baustellen</.a>. Wenn ich etwas vergessen habe, <.mailto>schreib mir</.mailto> bitte.</p>
    """
  end
end
