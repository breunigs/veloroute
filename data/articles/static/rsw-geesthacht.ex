defmodule Data.Article.Static.RSWGeesthacht do
  use Article.Static

  def id(), do: "rsw-geesthacht"
  def route_group(), do: :rsw
  def title(), do: "Radschnellweg nach Geesthacht"

  def color(), do: "#000000"

  def summary(),
    do: "Beschreibung und Video zum Radschnellweg HH-Tiefstack ↔ Geesthacht (Vorzugsstrecke)"

  def tags(), do: [id(), "rsw"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 1,
        group: "Radschnellweg Geesthacht",
        direction: :forward,
        from: "Hamburg Tiefstack",
        to: "Geesthacht Bergedorfer Straße",
        parent_ref: __MODULE__,
        text: "künftiger Radschnellweg HH-Tiefstack → Geesthacht",
        videos: [
          {"2021-06-27-veloroute9/GX012027", "00:03:10.891", :end},
          {"2021-06-27-veloroute9/GX022027", :start, "00:03:10.390"},
          {"2021-09-19-rsw-geesthacht-velo9/GX012885", "00:04:46.853", "00:05:01.968"},
          {"2021-09-19-rsw-geesthacht-velo9/GX012888", "00:00:01.335", "00:00:03.270"},
          {"2021-09-19-rsw-geesthacht-velo9/GX012889", :start, "00:00:34.801"},
          {"2021-09-19-rsw-geesthacht-velo9/GX012889", "00:00:49.750", :end},
          {"2021-09-19-rsw-geesthacht-velo9/GX012890", :start, "00:00:26.760"},
          {"2021-09-19-rsw-geesthacht-velo9/GX012892", :start, "00:00:13.113"},
          {"2021-09-19-rsw-geesthacht-velo9/GX012894", "00:00:00.334", :end},
          {"2021-09-19-rsw-geesthacht-velo9/GX012895", :start, :end},
          {"2021-09-19-rsw-geesthacht-velo9/GX012896", :start, :end},
          {"2021-09-19-rsw-geesthacht-velo9/GX012897", :start, "00:03:07.654"},
          {"2021-09-19-rsw-geesthacht-velo9/GX012905", "00:00:01.735", "00:00:29.096"},
          {"2021-09-19-rsw-geesthacht-velo9/GX012905", "00:00:38.205", "00:00:58.058"},
          {"2021-09-19-rsw-geesthacht-velo9/GX012897", "00:04:16.656", "00:04:49.890"},
          {"2021-09-19-rsw-geesthacht-velo9/GX012897", "00:04:57.764", :end},
          {"2021-09-19-rsw-geesthacht-velo9/GX012898", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Radschnellweg Geesthacht",
        direction: :backward,
        from: "Geesthacht Bergedorfer Straße",
        to: "Hamburg Tiefstack",
        parent_ref: __MODULE__,
        text: "künftiger Radschnellweg Geesthacht → HH-Tiefstack",
        videos: [
          {"2022-08-14-geesthacht-rev/GX014557", "00:00:56.590", "00:01:00.994"},
          {"2022-08-14-geesthacht-rev/GX014560", :start, "00:00:08.775"},
          {"2022-08-14-geesthacht-rev/GX014560", "00:00:14.314", "00:00:38.238"},
          {"2022-08-14-geesthacht-rev/GX014560", "00:00:42.509", "00:03:25.906"},
          {"2022-08-14-geesthacht-rev/GX014562", "00:00:01.635", "00:01:34.895"},
          {"2021-09-19-rsw-geesthacht-velo9/GX012906", "00:02:16.737", "00:03:02.516"},
          {"2022-08-14-geesthacht-rev/GX014565", "00:02:09.062", :end},
          {"2022-08-14-geesthacht-rev/GX014566", :start, :end},
          {"2022-08-14-geesthacht-rev/GX014567", :start, "00:00:24.725"},
          {"2022-08-14-geesthacht-rev/GX014567", "00:00:35.602", "00:00:46.146"},
          {"2022-08-14-geesthacht-rev/GX014569", "00:00:00.367", :end},
          {"2022-08-14-geesthacht-rev/GX014570", :start, :end},
          {"2022-08-14-geesthacht-rev/GX014571", :start, "00:00:19.753"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"offizielle Seite zu den Radschnellwegen",
       "https://metropolregion.hamburg.de/radschnellwege/"},
      {"Detailseite zum Radschnellweg Geesthacht",
       "https://metropolregion.hamburg.de/radschnellwege/15310118/radschnellweg-geesthacht-hamburg/"},
      {"Pläne und Berichte",
       "https://metropolregion.hamburg.de/radschnellwege/15310162/mediathek-radschnellweg-geesthacht-hamburg/"},
      {"Informationen zum Neubaugebiet Oberbillwerder",
       "https://www.oberbillwerder-hamburg.de/masterplan-2022/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Die Trassenfindung für einen möglichen <.ref>Radschnellweg</.ref> (auch: Radroute Plus) nach Geesthacht ist abgeschlossen. Die genaue Planung für die einzelnen Abschnitte ist noch offen, entsprechend gibt es auch keinen Zeithorizont zur Umsetzung.</p>
    <p>Das Video orientiert sich bis Geesthacht an der Vorzugsführung, muss aber häufig davon abweichen da die Trasse zahlreiche Neubausabschnitte vorsieht. In Geeshacht zeigt das Video die Ausweichstrecke falls die Trasse entlang der Bahnlinie nicht möglich ist. Im unausgebauten Zustand stellt diese Führung nicht die bequemste oder schnellste Verbindung bereit.</p>

    <h4>Hamburg</h4>
    <p>Bis Bergedorf folgt der Radschnellweg der <.a name="alltagsroute-9">Alltagsroute 9</.a>. Es ist vorgesehen ab der <.v bounds="10.064662,53.527882,10.06997,53.530951" lon={10.067625} lat={53.529299} dir="forward" ref={@ref}>Ausschläger Allee</.v> einen Zweirichtungsradweg auf der Nordseite der heutigen Route einzurichten. Dazu sind bei der <.v bounds="10.06826,53.525921,10.0722,53.528151" lon={10.070319} lat={53.526716} dir="forward" ref={@ref}>Grusonstraße</.v> und am <.v bounds="10.085458,53.513796,10.099836,53.520886" lon={10.094533} lat={53.51549} dir="forward" ref={@ref}>Unteren Landweg</.v> jeweils neue Wege vorgesehen, um Warten an Ampeln möglichst zu reduzieren. Bei letzterem ist eine neue Brücke über die Bahnschienen angedacht, die dann direkt auf den <.v bounds="10.092819,53.514392,10.099968,53.519098" lon={10.095396} lat={53.516512} dir="forward" ref={@ref}>Bahnhof Billwerder-Moorfleet</.v> zuführt. Um dort Rad- und Fußverkehr zu entflechten soll die Treppe näher an das Bahngleis rücken und der Radweg links daran vorbeilaufen. Dennoch bleibt diese Stelle ein Konfliktpunkt.</p>

    <p>Ab dem <.v bounds="10.128212,53.486599,10.173178,53.503372" lon={10.13245} lat={53.498513} dir="forward" ref={@ref}>Mittleren Landweg</.v> soll der Schnellweg künftig am Neubaugebiet Oberbillwerder vorbeiführen. Er verläuft weiterhin entlang des Bahngrabens und quert diesen erst beim Viertel <.v bounds="10.165797,53.486724,10.181691,53.492583" lon={10.171956} lat={53.489291} dir="forward" ref={@ref}>Bergedorf West</.v>. Der <.v bounds="10.180064,53.48738,10.183964,53.489084" lon={10.181144} lat={53.488586} dir="forward" ref={@ref}>Bahnhofsvorplatz Nettelnburg</.v> soll insgesamt umgestaltet werden, wobei sich Rad- und Fußverkehr wohl weiterhin kreuzen. In der <.v bounds="10.184317,53.486318,10.187534,53.488271" lon={10.185595} lat={53.487432} dir="forward" ref={@ref}>Bahnunterführung</.v> ist angedacht zwei Autospuren durch besser getaktete Ampeln zu ersetzen. Der Platz würde dann reichen um Zweirichtungsradwege mit Gehwegen auf beiden Seiten zu bauen.</p>

    <p>Ab dem <.v bounds="10.186682,53.485243,10.195461,53.487504" lon={10.187986} lat={53.486737} dir="forward" ref={@ref}>Wehrdeich</.v> soll eine neue Brücke bzw. Rampe direkt an die Albert-Gebel-Straße anschließen. Von dort würde ein neuer Weg direkt an die <.v bounds="10.198821,53.484673,10.203169,53.485987" lon={10.201571} lat={53.485547} dir="forward" ref={@ref}>Kreuzung mit dem Sander Damm</.v> führen. Für diese wird noch geplant wie der Schnellweg am besten queren soll. Am Sander Damm selbst soll die vorhandene Führung je nach Platz brauchbar ausgebaut werden. Die genaue Führung über den <.v bounds="10.208435,53.48263,10.212053,53.484825" lon={10.209422} lat={53.484335} dir="forward" ref={@ref}>Frascatiplatz</.v> ist ebenfalls noch offen.</p>

    <p>Im weiteren Verlauf sollen KFZ-freie Abschnitte zu eigenständigen Rad- und Fußwegen ausgebaut werden. Sind heute KFZ zugelassen sollen Fahrradstraßen eingerichtet werden. Um den <.v bounds="10.25371,53.465527,10.275264,53.474362" lon={10.260593} lat={53.470655} dir="forward" ref={@ref}>Speckenweg</.v> herum verläuft die Vorzugsvariante zunächst entlang der Autobahn und schwenkt in Börnsen dann in Richtung Bahnstrecke. Es wird  ebenfalls erwägt die Trasse schon ab Hamburg entlang der Bahn zu führen.</p>

    <h4>Börnsen</h4>
    <p>Die Vorzugsvariante schlägt eine neue Verbindung von der Autobahn zum <.m bounds="10.268687,53.465675,10.273765,53.468331">Wiesenweg</.m> vor. Alle Abschnitte in Börnsen selbst sollen Fahrradstraßen werden, die Wege danach eigenständige Radwege, ggf. mit Anwohnerverkehr.</p>

    <h4>Escheburg</h4>
    <p>Bis zum <.m bounds="10.290977,53.461242,10.315982,53.466005">ehemaligen Bahnhof</.m> soll eine neue Trasse südlich der Bahnlinie gebaut werden. Am <.v bounds="10.315459,53.459939,10.320472,53.462357" lon={10.316246} lat={53.461777} dir="forward" ref={@ref}>Speckenweg</.v> ist vorgesehen dem Radverkehr Vorfahrt zu geben, idealerweise als Fahrradstraße. Dazu muss aber sichergestellt sein, das der KFZ-Verkehr nicht überhand nimmt. Wie dies geschehen soll ist noch offen. Beim <.v bounds="10.318078,53.459875,10.322802,53.461592" lon={10.318864} lat={53.461218} dir="forward" ref={@ref}>Radelsweg</.v> geht man davon aus, dass dies problemlos möglich ist. Später soll dieser als Rad- und Reitweg geführt werden und so bis zum Ortsrand Geesthacht verlängert werden.</p>

    <h4>Geesthacht</h4>
    <p>Der Rad- und Reitweg mündet in den <.v bounds="10.35296,53.448658,10.356337,53.451287" lon={10.353775} lat={53.450017} dir="forward" ref={@ref}>Schäferstrift</.v>, wobei hier eine bevorrechtigte, abknickende Fahrradstraße in Richtung <.m bounds="10.353535,53.448277,10.355832,53.449485">Schäferstwiete</.m> angedacht ist. Die Vorzugsvariante sieht wieder einen neuen Weg entlang der Bahnstrecke vor. Der <.m bounds="10.357587,53.440373,10.359063,53.442586">Aprikosenweg</.m> würde eine Fahrradstraße und der letzte Abschnitt bis zur <.m bounds="10.361453,53.434656,10.366532,53.436658">Grenzstraße</.m> dann wieder ein Zweirichtungsradweg.</p>

    <p>Ob die Variante entlang der Bahn umgesetzt werden kann ist noch offen, da Naturschutz und vergiftete Böden einer alten Müllkippe diese Führung möglichweise verhindern. Die im Video gefahrene Strecke stellt die alternative Trasse dar.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
