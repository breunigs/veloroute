defmodule Data.Article.Static.RSWTostedt do
  use Article.Static

  def id(), do: "rsw-tostedt"
  def route_group(), do: :rsw
  def name(), do: id()
  def title(), do: "Radschnellweg nach Tostedt"

  def color(), do: "#000000"

  def summary(),
    do: "Beschreibung und Video zum Radschnellweg Tostedt ↔ HH-Harburg"

  def tags(), do: [id(), "rsw"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "Radschnellweg Tostedt",
        direction: :forward,
        from: "Harburg Bahnhof",
        to: "Tostedt",
        parent_ref: __MODULE__,
        text: "künftiger Radschnellweg Harburg Bahnhof → Tostedt",
        videos: [
          {"2022-05-18-rsw-tostedt/GX013972", :start, :end},
          {"2022-05-18-rsw-tostedt/GX013973", :start, :end},
          {"2022-05-18-rsw-tostedt/GX013974", :start, "00:01:23.317"},
          {"2022-05-18-rsw-tostedt/GX013975", :start, :end},
          {"2022-05-18-rsw-tostedt/GX013976", :start, "00:02:24.678"},
          {"2022-05-18-rsw-tostedt/GX013976", "00:02:31.618", :end},
          {"2022-05-18-rsw-tostedt/GX023976", :seamless, "00:00:19.786"},
          {"2022-05-18-rsw-tostedt/GX023976", "00:00:39.139", :end},
          {"2022-05-18-rsw-tostedt/GX013977", :start, "00:00:46.046"},
          {"2022-05-18-rsw-tostedt/GX013977", "00:00:53.787", :end},
          {"2022-05-18-rsw-tostedt/GX013978", "00:00:02.236", "00:00:52.519"},
          {"2022-05-18-rsw-tostedt/GX013978", "00:01:00.294", "00:02:09.062"},
          {"2022-05-18-rsw-tostedt/GX013978", "00:02:34.421", :end},
          {"2022-05-18-rsw-tostedt/GX023978", :seamless, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Radschnellweg Tostedt",
        direction: :backward,
        from: "Tostedt",
        to: "Harburg Bahnhof",
        parent_ref: __MODULE__,
        text: "künftiger Radschnellweg Tostedt → Harburg Bahnhof",
        videos: [
          {"2022-08-20-tostedt-rev/GX014595", "00:00:01.635", "00:02:37.257"},
          {"2022-08-20-tostedt-rev/GX014597", "00:00:00.300", "00:00:30.530"},
          {"2022-08-20-tostedt-rev/GX014598", "00:00:00.968", :end},
          {"2022-08-20-tostedt-rev/GX014599", :start, :end},
          {"2022-08-20-tostedt-rev/GX014600", :start, "00:03:13.326"},
          {"2022-08-20-tostedt-rev/GX014601", :start, :end},
          {"2022-08-20-tostedt-rev/GX014602", :start, "00:00:27.027"},
          {"2022-08-20-tostedt-rev/GX014605", "00:00:00.934", "00:03:24.304"},
          {"2022-08-20-tostedt-rev/GX014608", "00:00:02.636", :end},
          {"2022-08-20-tostedt-rev/GX014609", "00:00:02.502", :end},
          {"2022-08-20-tostedt-rev/GX024609", :seamless, :end},
          {"2022-08-20-tostedt-rev/GX014610", :start, :end},
          {"2022-08-20-tostedt-rev/GX014611", :start, "00:00:50.751"},
          {"2022-08-20-tostedt-rev/GX014612", "00:00:00.367", :end},
          {"2022-08-20-tostedt-rev/GX014613", :start, :end},
          {"2022-08-20-tostedt-rev/GX014614", :start, :end},
          {"2022-08-20-tostedt-rev/GX014615", :start, :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"offizielle Seite zu den Radschnellwegen",
       "https://metropolregion.hamburg.de/radschnellwege/"},
      {"Detailseite zum Radschnellweg Tostedt",
       "https://metropolregion.hamburg.de/radschnellwege/15307158/radschnellweg-tostedt-hamburg/"},
      {"Pläne und Berichte",
       "https://metropolregion.hamburg.de/radschnellwege/15307408/mediathek-radschnellweg-tostedt-hamburg/"},
      {"Infoseite Buchholz 2025plus", "https://buchholz2025plus.de/"},
      {"Infoseite Bucholz Stadtumbau West",
       "https://www.buchholz.de/portal/seiten/foerderprogramm-stadtumbau-west-903000665-20101.html"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Die Trassenfindung für einen möglichen <.ref>Radschnellweg</.ref> (auch: Radroute Plus) nach Tostedt ist abgeschlossen. Die genaue Planung für die einzelnen Abschnitte ist noch offen, entsprechend gibt es auch keinen Zeithorizont zur Umsetzung. Die Videos orientieren sich an der Vorzugstrasse, müssen bei geplanten neuen Wegen aber zwangsläufig von ihr abweichen.</p>

    <h4>Harburg</h4>
    <p>Die Machbarkeitsstudie schlägt nur eine mögliche Anbindung an den <.v bounds="9.985339,53.451653,9.996725,53.458833" lon={9.989574} lat={53.455961} dir="forward" ref={@ref}>Bahnhof Harburg</.v> vor. Die Abwägung gegenüber anderen Führungen soll zu einem späteren Zeitpunkt nachgeholt werden. Entsprechend hoch ist die Wahrscheinlichkeit, dass sich die Strecke hier nochmal ändert. Klar ist jedoch, dass die Landesgrenze am <.v bounds="9.96695,53.415797,9.980777,53.422998" lon={9.97459} lat={53.420477} dir="forward" ref={@ref}>Beetenweg</.v> überquert werden soll.</p>

    <h4>Seevetal</h4>
    <p>Die bereits heute existierenden Wege sollen zu Fahrradstraßen ausgebaut werden. Ab <.v bounds="9.953244,53.390561,9.97101,53.39712" lon={9.96393} lat={53.393521} dir="forward" ref={@ref}>Sunderberge</.v> soll dann ein Zweirichtungsradweg durch den Wald führen. An der <.v bounds="9.944794,53.38735,9.95721,53.390911" lon={9.95059} lat={53.389164} dir="forward" ref={@ref}>Eddelsener Straße</.v> überlegt man den Radverkehr mit über die Bahnbrücke zu führen, um den Autoverkehr zu umgehen.</p>

    <p>Die Führung um – oder durch – <.v bounds="9.921445,53.373485,9.9652,53.387653" lon={9.927295} lat={53.378377} dir="forward" ref={@ref}>das Kieswerk</.v> hängt davon ab, ob es nach Westen erweitert wird. Falls ja, kann die eingezeichnete Führung so nicht umgesetzt werden. Die Alternativen wären:</p>
    <ul>
      <li>weiterer <.m bounds="9.918393,53.375942,9.922548,53.383031">Umweg nach Westen</.m> (+2,2km)</li>
      <li>östlich entlang der Bahn, sofern der Platz an der <.m bounds="9.929063,53.374061,9.937992,53.377731">Autobahnbrücke</.m> reicht (-600m)</li>
      <li>über eine <.m bounds="9.934687,53.374443,9.942637,53.379677">neue Autobahnbrücke</.m>, danach wieder entlang der Bahntrasse (+300m)</li>
    </ul>

    <h4>Rosengarten</h4>
    <p>Der Zweirichtungsradweg setzt sich bis <.v bounds="9.92174,53.363149,9.936985,53.371006" lon={9.929347} lat={53.367889} dir="forward" ref={@ref}>Klecken</.v> fort. Dort könnte die <.v bounds="9.927807,53.366462,9.930369,53.368049" lon={9.928847} lat={53.367258} dir="forward" ref={@ref}>Bürgermeister-Glade-Straße</.v> entlang der Bahn unterfahren werden. Im weiteren Verlauf sollen die Wege entlang der Bahn ausgebaut werden und durchgehend befahrbar werden. Sie sollen autofrei bleiben.</p>

    <h4>Buchholz</h4>
    <p>An der <.v bounds="9.895868,53.337974,9.907806,53.342144" lon={9.901296} lat={53.339939} dir="forward" ref={@ref}>Herrenheide</.v> wechselt der Schnellweg auf die östliche Bahnseite. Auch hier sollen die Wege zu Zweirichtungsradwegen ausgebaut werden. Über eine neu zu bauende Brücke beim Neubaugebiet „Buchholz 2025plus“ werden <.v bounds="9.883485,53.327411,9.889006,53.32923" lon={9.885062} lat={53.328699} dir="forward" ref={@ref}>Itzenbütteler Weg</.v> und <.v bounds="9.883485,53.327411,9.889006,53.32923" lon={9.885062} lat={53.328699} dir="forward" ref={@ref}>Am Radeland</.v> verbunden.</p>

    <p>Über eine neue Querungsmöglichkeit soll die <.v bounds="9.881077,53.326815,9.884806,53.328348" lon={9.882768} lat={53.327762} dir="forward" ref={@ref}>Lindenstraße</.v> direkt erreichbar werden. Im Rahmen des „Stadtumbau West“ sollen die <.v bounds="9.864274,53.323382,9.88004,53.325652" lon={9.875674} lat={53.325058} dir="forward" ref={@ref}>Wege an der Bahn</.v> erneuert werden. In der Planung werden zwei Varianten angegeben:</p>
    <ul>
      <li>entlang der Bahn bis zum <.v bounds="9.842667,53.32008,9.867751,53.324099" lon={9.848677} lat={53.321641} dir="forward" ref={@ref}>Sprötzer Weg</.v> (Vorzugsvariante)</li>
      <li>über die <.v bounds="9.859397,53.322576,9.871709,53.327111" lon={9.862566} lat={53.325447} dir="forward" ref={@ref}>Bremer Reihe</.v> entlang der vorhandenen Straßen</li>
    </ul>

    <p>Im <.v bounds="9.826649,53.317206,9.85169,53.32271" lon={9.840152} lat={53.320694} dir="forward" ref={@ref}>Sprötzer Weg</.v> soll der vorhandene Zweirichtungsradweg verbreitert werden. Im Anschluss erreicht man über einen Seitenarm der <.v bounds="9.823888,53.317865,9.831437,53.320017" lon={9.828605} lat={53.319002} dir="forward" ref={@ref}>Buchholzer Straße</.v> den ehemaligen Bahndamm. Dieser soll ausgebaut werden durch eine neue Unterführung die <.v bounds="9.802168,53.311513,9.808468,53.315227" lon={9.805608} lat={53.313205} dir="forward" ref={@ref}>Hannoversche Straße</.v> queren.</p>

    <h4>Tostedt</h4>
    <p>Auf dem Bahndamm erreicht man die <.v bounds="9.769243,53.312472,9.776083,53.316824" lon={9.771586} lat={53.31474} dir="forward" ref={@ref}>Bundesstraße</.v> und folgt ihr dann auf einem Zweirichtungsradweg. Dieser reicht bis zum Ende des Radschnellwegs an der Kreuzung mit der <.v bounds="9.706877,53.279419,9.717683,53.284193" lon={9.712605} lat={53.281259} dir="forward" ref={@ref}>Bahnhofstraße</.v>.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
