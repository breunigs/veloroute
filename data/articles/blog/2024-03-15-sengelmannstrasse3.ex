defmodule Data.Article.Blog.Sengelmannstrasse3 do
  use Article.Default

  def title(),
    do:
      "Sengelmannstraße – Rotbuchenstieg bis Rathenaustraße (Radroute 5, Radroute Plus Bad Bramstedt)"

  def summary(),
    do:
      "Konzept der Radwege bleibt wie heute. Sie sollen aber breiter werden, bzw. der Abschnitt mit Spielstraße zu einer Fahrradstraße werden."

  def type(), do: :planned
  def stop(), do: ~d[2030]

  def tags(), do: ["5", "5N", "rsw-bad-bramstedt", "N26"]

  def links(_assigns) do
    [
      {"1. Entwurf, Erläuterungen und Lagepläne", "März 2024",
       "https://www.hamburg.de/politik-und-verwaltung/bezirke/hamburg-nord/detailplaene-zweiter-abschnitt-848068"},
      {"Übersichtsseite Planung Radroute Plus Bad Bramstedt",
       "https://www.hamburg.de/politik-und-verwaltung/bezirke/hamburg-nord/themen/planen-bauen-wohnen/fachbereich-tiefbau/nachhaltige-mobilitaet/radroute-plus"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Meist wird der Radverkehr auf <.ref>Hochbordradwegen</.ref> geführt. Deren Breite reicht von 1,5m bis 2,75m im Zweirichtungsverkehr.</p>

    <p>In Richtung Flughafen werden Fuß- und Radverkehr <.v bounds="10.019446,53.61062,10.025427,53.614151" lon={10.02186} lat={53.612512} dir="forward" ref="rsw-bad-bramstedt">nicht immer getrennt</.v>.</p>

    <p>In Richtung Innenstadt wird der Radverkehr über <.v bounds="10.019446,53.61062,10.025427,53.614151" lon={10.021101} lat={53.612782} dir="backward" ref="rsw-bad-bramstedt">eine verkehrsberuhigte Nebenstraße</.v> („Spielstraße“) geführt.</p>

    <h4>Planung</h4>
    <h5>Strecke Richtung Flughafen</h5>
    <p>Auf der <.v bounds="10.017293,53.608021,10.027327,53.615921" lon={10.022918} lat={53.611592} dir="forward" ref="rsw-bad-bramstedt">Ostseite der Straße</.v> bleibt es beim Hochbordradweg, der mit 2,0m bis 3,0m unterschiedlich breit ausfällt. Er wird durchgängig. <.v bounds="10.014377,53.613005,10.022043,53.615751" lon={10.020061} lat={53.614066} dir="forward" ref="rsw-bad-bramstedt">Der Abschnitt Zweirichtungsradweg</.v> entfällt, d.h. es darf nur noch richtungstreu gefahren werden.</p>

    <h5>Strecke Richtung Stadtpark</h5>
    <p>Auf der <.v bounds="10.016852,53.608989,10.025997,53.615923" lon={10.020854} lat={53.612868} dir="backward" ref="rsw-bad-bramstedt">Westseite der Straße</.v> bleibt es anfangs beim Hochbordradweg. Dessen Breiten schwanken mit 2,45m bis 3,0m weniger. Die Führung über die Nebenstraße ab <.v bounds="10.020063,53.609671,10.025401,53.613746" lon={10.021023} lat={53.612816} dir="backward" ref="rsw-bad-bramstedt" highlight="Dorothea-Kasten-Straße">Höhe Dorothea-Kasten-Straße</.v> bleibt. Die Nebenstraße zur Fahrradstraße umgestaltet.</p>

    <h5>Kreuzung Alsterdorfer Straße</h5>
    <p>An der <.v bounds="10.017995,53.612863,10.02174,53.614912" lon={10.020291} lat={53.613867} dir="forward" ref="rsw-bad-bramstedt" highlight="Alsterdorfer Straße">Kreuzung mit der Alsterdorfer Straße</.v> wird <.ref>indirektes Linksabbiegen</.ref> über Aufstelltaschen im Kreuzungsbereich ermöglicht.</p>

    <p>Der heute noch notwendige Zick-Zack-Kurs an der <.v bounds="10.018322,53.613033,10.021093,53.614887" lon={10.019338} lat={53.613967} dir="backward" ref="5">Bushaltestelle Richtung Stadtpark</.v> wird durch eine geradlinige Führung ersetzt.</p>

    <p>Teilweise darf rechts abgebogen werden, ohne an der Ampel warten zu müssen.</p>

    <h5>Kreuzung Rathenaustraße</h5>
    <p>An der <.v bounds="10.016909,53.613699,10.020557,53.615931" lon={10.019093} lat={53.614791} dir="forward" ref="rsw-bad-bramstedt" highlight="Rathenaustraße">Kreuzung mit der Rathenaustraße</.v> ist aus der Sengelmannstraße <.ref>indirektes Linksabbiegen</.ref> geplant.</p>

    <p><.v bounds="10.017325,53.61388,10.020256,53.615723" lon={10.019042} lat={53.61517} dir="backward" ref="rsw-bad-bramstedt">Entlang der Radroute Plus</.v> soll <.ref>direkt</.ref> links abgebogen werden. Dazu darf sich der Radverkehr vor wartenden KFZ aufstellen (mittels <.ref>ARAS</.ref>). Rechtsabbiegen erfolgt über einen kurzen Radweg vor der Ampel – man muss nicht mehr warten.</p>

    <p><.v bounds="10.015779,53.613616,10.020354,53.616089" lon={10.017996} lat={53.614629} dir="forward" ref="4">Entlang der Radroute 4</.v> bleibt es beim heutigen Zustand. Dieser Abschnitt ist nicht Teil dieser Planung.</p>

    <h5>Sonstiges</h5>
    <p>Die kleineren Straßeneinmündungen bleiben im Wesentlichen so wie heute. Radfurten in den Kreuzungen werden rot eingefärbt.</p>

    <h4>Meinung</h4>
    <p>In der Machbarkeitsstudie wurde noch ein attraktiver, durchgängiger Zweirichtungsradweg vorgeschlagen. Dieser lässt sich allerdings nicht umsetzen, ohne massenhaft Bäume zu fällen – oder dem KFZ-Verkehr eine Fahrspur wegzunehmen. Für letzteres fehlt der Stadt der Mut.</p>

    <p>So bleibt es bei der Sparvariante mit beidseitigen Radwegen in die jeweilige Fahrtrichtung. In Richtung Innenstadt muss die Sengelmannstraße dann zwei Mal gequert werden, was unnötige Wartezeiten mitbringt.</p>

    <p>Die Radwege an sich sind gut geplant und angenehm breit. Die verbleibenden Engstellen – Grund wieder der KFZ-Verkehr – sind ärgerlich, aber nicht all zu lang. Gut sind die Möglichkeiten rechts abzubiegen ohne an der Ampel warten zu müssen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
