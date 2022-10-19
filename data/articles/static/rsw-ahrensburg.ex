defmodule Data.Article.Static.RSWAhrensburg do
  use Article.Static

  def id(), do: "rsw-ahrensburg"
  def route_group(), do: :rsw
  def title(), do: "Radschnellweg nach Ahrensburg"

  def color(), do: "#000000"

  def summary(),
    do:
      "Beschreibung und Video zum geplanten Radschnellweg HH-Volksdorf ↔ Ahrensburg (Vorzugsstrecke)"

  def tags(), do: [id(), "rsw", "ahrensburg"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 1,
        group: "Radschnellweg Ahrensburg",
        direction: :forward,
        from: "Hamburg Volksdorf",
        to: "Ahrensburg Gewerbegebiet Süd",
        parent_ref: __MODULE__,
        text: "künftiger Radschnellweg Volksdorf → Ahrensburg",
        videos: [
          {"2021-09-26-velo6-rsw-ahrensburg/GX012960", "00:00:41.508", :end},
          {"2021-09-26-velo6-rsw-ahrensburg/GX022960", :start, :end},
          {"2021-09-26-velo6-rsw-ahrensburg/GX012964", :start, "00:00:35.402"}
        ]
      },
      %Video.Track{
        renderer: 1,
        group: "Radschnellweg Ahrensburg",
        direction: :backward,
        from: "Ahrensburg Gewerbegebiet Süd",
        to: "Hamburg Volksdorf",
        parent_ref: __MODULE__,
        text: "künftiger Radschnellweg Ahrensburg → Volksdorf",
        videos: [
          {"2021-09-26-velo6-rsw-ahrensburg/GX012965", "00:00:35.636", :end},
          {"2021-09-26-velo6-rsw-ahrensburg/GX012966", :start, :end},
          {"2021-09-26-velo6-rsw-ahrensburg/GX012967", :start, "00:05:01.334"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"offizielle Seite zu den Radschnellwegen",
       "https://metropolregion.hamburg.de/radschnellwege/"},
      {"Detailseite zum Radschnellweg Ahrensburg",
       "https://metropolregion.hamburg.de/radschnellwege/15307136/radschnellweg-ahrensburg-hamburg/"},
      {"Pläne und Berichte",
       "https://metropolregion.hamburg.de/radschnellwege/15307138/mediathek-radschnellweg-ahrensburg-hamburg/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Die Trassenfindung für einen möglichen <.ref>Radschnellweg</.ref> nach Ahrensburg ist abgeschlossen. An einigen Stellen sind alternative Führungen im Gespräch und müssen noch genauer abgewägt werden. Die genaue Planung für die einzelnen Abschnitte ist ebenfalls noch offen, entsprechend gibt es auch keinen Zeithorizont zur Umsetzung.</p>

    <h4>Hamburg</h4>
    <p>Los geht der Schnellweg bereits ab dem <.m bounds="10.14417,53.637615,10.150893,53.646256" lon={10.146144} lat={53.639037} dir="forward">Haselkamp</.m> und folgt der <.a name="alltagsroute-6">Alltagsroute 6</.a> bis zur U-Bahn Station Volksdorf. Bis zum <.m bounds="10.156466,53.644487,10.161663,53.647907" lon={10.158019} lat={53.645727} dir="forward">Kreisel</.m> sind Fahrradstraßen angedacht, im <.m bounds="10.159653,53.64649,10.163835,53.650212" lon={10.160452} lat={53.647107} dir="forward">Uppenhof</.m> richtet man sich nach dem Projekt „autoarmes Volksdorf“.</p>

    <p>Ab dem Bahnhof werden die Vorschläge kleinteilig: die <.m bounds="10.16242,53.649905,10.164847,53.652003" lon={10.163348} lat={53.65026} dir="forward">Claus-Ferck-Straße</.m> soll am Bahnhof für private KFZ gesperrt werden, an den Einmündungen mit <.m bounds="10.163419,53.651135,10.164699,53.651826" lon={10.16395} lat={53.65145} dir="forward">Kattjahren</.m> und <.m bounds="10.166033,53.65136,10.16773,53.652237" lon={10.166721} lat={53.65169} dir="forward">Lerchenberg</.m> jeweils Kreisel entstehen, dazwischen würde <.ref>Mischverkehr</.ref> bei Tempo 30 eingerichtet.</p>

    <p>Ab dem <.m bounds="10.166363,53.651103,10.188213,53.660759" lon={10.168285} lat={53.652267} dir="forward">Lerchenberg</.m> ist eine durchgängige, bevorrechtigte Fahrradstraße vorgesehen. Sollte der KFZ-Durchgangsverkehr zu hoch sein, hält man sich offen zusätzlich Durchgangssperren zu bauen.</p>

    <h4>Ahrensburg</h4>
    <p>Die Fahrradstraße wird im <.m bounds="10.185741,53.658865,10.193167,53.661366" lon={10.187196} lat={53.659921} dir="forward">Bornskamp</.m> zunächst bis zum Gut Wulfsdorf fortgesetzt. Ab dort ist man sich nicht sicher, ob der KFZ Anteil zu hoch für eine Fahrradstraße wäre und plant vorerst nur mit einer Tempo-30-Zone. Über einen Kreisel erreicht man den <.m bounds="10.198009,53.660304,10.208592,53.671446" lon={10.199235} lat={53.661166} dir="forward">Wulfsdorfer Weg</.m> der zu einer Fahrradstraße ausgebaut werden soll, wobei die <.m bounds="10.198009,53.660304,10.208592,53.671446" lon={10.201344} lat={53.666006} dir="forward">Durchfahrtsperre</.m> für KFZ erhalten bleibt.</p>

    <p>Die <.m bounds="10.205888,53.669509,10.208925,53.671332" lon={10.20694} lat={53.670346} dir="forward">Einmündung Am Haidschlag</.m> wird wieder ein Kreisel, für die Straße selbst ist Mischverkehr angedacht. Es ist vorgesehen eine abknickende Vorfahrt in die <.m bounds="10.206052,53.672598,10.227488,53.677334" lon={10.207377} lat={53.67325} dir="forward">Schimmelmannstraße</.m> zu bauen. Diese wird zu einer Fahrradstraße umgebaut, erhält also Vorfahrt und fahrradfreundlichere Bodenwellen, Einengungen und bessere Absicherung der KFZ-Parkplätze. Zur <.m bounds="10.22553,53.675277,10.228837,53.677467" lon={10.226032} lat={53.676806} dir="forward">Stormarnstraße</.m> kommt man wieder mittels Kreisel, wie man dort weiterfährt ist noch offen.</p>

    <p>Ab der <.m bounds="10.227038,53.675148,10.235815,53.678073" lon={10.228001} lat={53.675645} dir="forward">Gerhart-Hauptmann-Straße</.m> gibt es wieder (abknickende) Fahrradstraßen. Der <.m bounds="10.234385,53.677094,10.237539,53.678019" lon={10.235478} lat={53.677446} dir="forward">kurze Verbindungsweg</.m> soll so gut wie möglich ausgebaut werden und mittels einer voll ausgebauten Ampel geradlinig in die <.m bounds="10.236281,53.677284,10.240351,53.679055" lon={10.236946} lat={53.677704} dir="forward">Schulstraße</.m> leiten. Diese erhält eine ausgebaute Anbindung an die <.m bounds="10.239522,53.678233,10.24388,53.679529" lon={10.240331} lat={53.678595} dir="forward">Lübecker Straße</.m>.</p>

    <p>Ab jetzt bleibt die Führung im Wesentlichen gleich, man passt lediglich die Breiten der vorhandenen Wege an. So sind auf der Lübecker Straße 3,0m breite Hochbordradwege pro Fahrtrichtung vorgesehen, ab dem <.m bounds="10.242473,53.677103,10.24972,53.679663" lon={10.243543} lat={53.679133} dir="forward">Ostring</.m> ein 4,0m breiter Zweirichtungsradweg. Sofern möglich würde man dies auch im <.m bounds="10.248291,53.67743,10.254179,53.680845" lon={10.249102} lat={53.678025} dir="forward">Beimoorweg</.m> so machen.</p>

    <h3>Externe Links</h3>
    <.structured_links gpx={true}/>
    """
  end
end
