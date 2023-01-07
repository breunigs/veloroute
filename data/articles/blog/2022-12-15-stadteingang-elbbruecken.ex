defmodule Data.Article.Blog.StadteingangElbbruecken do
  use Article.Default

  def title(),
    do: "Stadteingang Elbbrücken (Freizeitrouten 5 und 6)"

  def summary(),
    do:
      "Vorschlag zur Stadtentwicklung „Stadteingang Elbbrücken-Ost“ sieht Geschäfts- und Wohnbebauung vor."

  def type(), do: :intent
  def tags(), do: ["FR5", "FR6", "erweiterung-mundsburg-elbbruecken"]

  def links(_assigns) do
    [
      {"Visualisierungen des umgebauten Gebiets", "https://www.skyfish.com/p/fhh/1982080"},
      {"Enwurf Bebauungsplan Elbbrücken-Ost", "Dezember 2022",
       "https://sitzungsdienst-hamburg-mitte.hamburg.de/bi/vo020.asp?VOLFDNR=1016344"},
      {"Pressemitteilung Huckepackbahnhof", "Februar 2015",
       "https://www.hamburg.de/pressearchiv-fhh/4445388/2014-02-03-bwvi-huckepackbahnhof/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Das Gebiet wird durch die <.m bounds="10.027416,53.533876,10.034361,53.540403" lon={10.02932} lat={53.535095} dir="backward" ref="erweiterung-mundsburg-elbbruecken">Billhorner Brückenstraße</.m> geprägt, die mit ihren 12 KFZ-Spuren, autobahnähnlichen Anschlüssen und fehlenden Querungsmöglichkeiten den Stadtteil zerteilt. In geringerem Maße gilt dies auch für die Bahnstrecken im Gebiet. Insgesamt ist die Aufenthaltsqualität im Gebiet schlecht, die Rad- und Fußverbindungen wenig ersichtlich oder fehlen ganz.</p>

    <h4>Vorhaben</h4>
    <p>Im Wesentlichen sollen die Autobahn„ohren“ von der Billhorner Brückenstraße zum Billhorner Brückendamm durch kompaktere Straßen ersetzt werden. Die so gewonnenen Flächen werden bebaut, hauptsächlich mit Gebäuden für Firmen und Geschäfte. Nur in Lagen die gut von der Straße bzw. Bahnstrecke abgeschirmt sind soll Wohnbebauung stattfinden.</p>

    <p>Ein Fuß- und Radweg unter dem Bahndamm zum „<.m bounds="10.02932,53.535095,10.042739,53.541264">Huckepackbahnhof</.m>“ genannten Gewerbegebiet soll den Anschluss verbessern. Auch wenn sich manche Wegverbindungen über die Billhorner Brückenstraße verbessern werden, behält die Straße ihre Dominanz.</p>

    <p>Insgesamt ist die Planung auf mehrere Jahrzehnte angelegt. Zunächst sollen die vorhandenen Leitungen und Straßen verlegt werden, um überhaupt erst die Möglichkeit zu haben Gebäude zu errichten.</p>

    <h4>Meinung</h4>
    <p>Der Bebauungsplan gibt nur die generelle Richtung vor, erst mit anschließenden Detailplanungen lassen sich konkretere Aussagen zum Radverkehr machen. Allgemein lässt sich sagen, dass die Radwege zumindest nicht vergessen wurden, so wie es in der HafenCity passiert ist.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
