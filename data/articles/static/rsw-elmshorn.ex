defmodule Data.Article.Static.RSWElmshorn do
  use Article.Static

  def id(), do: "rsw-elmshorn"
  def route_group(), do: :rsw
  def name(), do: id()
  def title(), do: "Radschnellweg nach Elmshorn"

  def color(), do: "#000000"

  def summary(),
    do: "Beschreibung und Video zum Radschnellweg Elmshorn ↔ HH-Bahrenfeld bzw. HH-Eimsbüttel"

  def tags(), do: [id(), "rsw"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 1,
        group: "Radschnellweg Elmshorn (ab Diebsteich)",
        direction: :forward,
        from: "Hamburg Diebsteich",
        to: "Elmshorn Wasserstraße",
        parent_ref: __MODULE__,
        text: "künftiger Radschnellweg HH-Diebsteich → Elmshorn",
        videos: [
          {"2021-09-11-rsw-elmshorn/GX012803", "00:01:05.966", :end},
          {"2021-09-11-rsw-elmshorn/GX012804", :start, :end},
          {"2021-09-11-rsw-elmshorn/GX012805", :start, :end},
          {"2021-09-11-rsw-elmshorn/GX012806", :start, :end},
          {"2021-09-11-rsw-elmshorn/GX012807", :start, :end},
          {"2021-09-11-rsw-elmshorn/GX012808", :start, "00:00:01.235"},
          {"2021-09-11-rsw-elmshorn/GX012808", "00:00:23.290", "00:01:15.542"},
          {"2021-09-11-rsw-elmshorn/GX012809", "00:00:01.001", :end},
          {"2021-09-11-rsw-elmshorn/GX012810", :start, "00:03:20.467"},
          {"2021-09-11-rsw-elmshorn/GX012811", "00:00:14.281", "00:00:30.664"},
          {"2021-09-11-rsw-elmshorn/GX012811", "00:01:30.757", "00:01:45.772"},
          {"2021-09-11-rsw-elmshorn/GX012811", "00:01:56.583", "00:02:00.420"},
          {"2021-09-11-rsw-elmshorn/GX012812", "00:00:01.368", "00:01:26.653"},
          {"2021-09-11-rsw-elmshorn/GX012813", "00:00:12.379", :end},
          {"2021-09-11-rsw-elmshorn/GX012814", :start, "00:00:02.436"},
          {"2021-09-11-rsw-elmshorn/GX012814", "00:00:24.825", "00:01:09.236"},
          {"2021-09-11-rsw-elmshorn/GX012816", "00:00:13.213", :end},
          {"2021-09-11-rsw-elmshorn/GX012817", :start, :end},
          {"2021-09-11-rsw-elmshorn/GX012818", :start, :end},
          {"2021-09-11-rsw-elmshorn/GX012819", :start, :end},
          {"2021-09-11-rsw-elmshorn/GX012820", :start, :end},
          {"2021-09-11-rsw-elmshorn/GX012821", :start, :end},
          {"2021-09-11-rsw-elmshorn/GX012822", :start, "00:02:01.088"},
          {"2021-09-11-rsw-elmshorn/GX012822", "00:02:19.673", :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Radschnellweg Elmshorn (zum Diebsteich)",
        direction: :backward,
        from: "Elmshorn Wasserstraße",
        to: "Hamburg Diebsteich",
        parent_ref: __MODULE__,
        text: "künftiger Radschnellweg Elmshorn → HH-Diebsteich",
        videos: [
          {"2022-08-13-rsw-elmshorn-rev/GX014526", :start, :end},
          {"2022-08-13-rsw-elmshorn-rev/GX014527", :start, :end},
          {"2022-08-13-rsw-elmshorn-rev/GX014528", :start, "00:00:37.037"},
          {"2022-08-13-rsw-elmshorn-rev/GX014530", "00:00:01.101", "00:00:19.319"},
          {"2022-08-13-rsw-elmshorn-rev/GX014531", "00:00:01.735", "00:00:31.398"},
          {"2022-02-27-pinneberg/GX013243", "00:00:01.635", "00:00:19.319"},
          {"2022-08-13-rsw-elmshorn-rev/GX014531", "00:00:47.047", "00:03:43.523"},
          {"2022-08-13-rsw-elmshorn-rev/GX014533", "00:00:01.368", "00:00:50.584"},
          {"2022-08-13-rsw-elmshorn-rev/GX014533", "00:01:02.863", "00:03:18.331"},
          {"2022-08-13-rsw-elmshorn-rev/GX014534", "00:00:01.935", "00:03:08.922"},
          {"2022-08-13-rsw-elmshorn-rev/GX014535", :start, :end},
          {"2022-08-13-rsw-elmshorn-rev/GX014536", :start, :end},
          {"2022-08-13-rsw-elmshorn-rev/GX014537", :start, "00:01:16.076"},
          {"2022-08-13-rsw-elmshorn-rev/GX014539", "00:00:00.968", :end},
          {"2022-08-13-rsw-elmshorn-rev/GX014540", :start, :end},
          {"2022-08-13-rsw-elmshorn-rev/GX014541", :start, :end},
          {"2022-08-13-rsw-elmshorn-rev/GX014542", :start, "00:00:36.336"}
        ]
      },
      %Video.Track{
        renderer: 1,
        group: "Radschnellweg Elmshorn (ab Langenfelder Damm)",
        direction: :forward,
        from: "Hamburg Langenfelder Damm",
        to: "Hamburg Elbgaustraße",
        parent_ref: __MODULE__,
        text: "künftiger Radschnellweg HH Langenfelder Damm → HH Elbgaustraße",
        videos: [
          {"2021-12-25-velo2-rsw-elmshorn/GX013083", "00:03:50.831", "00:03:59.806"},
          {"2021-12-25-velo2-rsw-elmshorn/GX013084", "00:00:14.281", :end},
          {"2021-12-25-velo2-rsw-elmshorn/GX013085", :start, :end},
          {"2021-12-25-velo2-rsw-elmshorn/GX013086", :start, :end},
          {"2021-12-25-velo2-rsw-elmshorn/GX013087", :start, "00:00:50.918"}
        ]
      },
      %Video.Track{
        renderer: 1,
        group: "Radschnellweg Elmshorn (ab Langenfelder Damm)",
        direction: :backward,
        from: "Hamburg Elbgaustraße",
        to: "Hamburg Langenfelder Damm",
        parent_ref: __MODULE__,
        text: "künftiger Radschnellweg HH Elbgaustraße → HH Langenfelder Damm",
        videos: [
          {"2021-12-25-velo2-rsw-elmshorn/GX013087", "00:01:28.322", :end},
          {"2021-12-25-velo2-rsw-elmshorn/GX013088", "00:00:01.034", :end},
          {"2021-12-25-velo2-rsw-elmshorn/GX013089", :start, "00:00:20.087"},
          {"2021-12-25-velo2-rsw-elmshorn/GX013089", "00:01:00.561", "00:02:59.613"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"offizielle Seite zu den Radschnellwegen",
       "https://metropolregion.hamburg.de/radschnellwege/"},
      {"Detailseite zum Radschnellweg Elmshorn",
       "https://metropolregion.hamburg.de/radschnellwege/15310038/radschnellweg-elmshorn-hamburg/"},
      {"Pläne und Berichte",
       "https://metropolregion.hamburg.de/radschnellwege/15310058/mediathek-radschnellweg-elmshorn-hamburg/"},
      {"Autobahndeckel Altona", "https://www.hamburg.de/fernstrassen/deckel-altona/"},
      {"U-Bahn Linie 5 – Infos der Stadt", "https://www.hamburg.de/u5/"},
      {"U-Bahn Linie 5 – Infos der Hochbahn",
       "https://www.schneller-durch-hamburg.de/U5-Hamburg/"},
      {"Unterlagen zur K22 Tornesch/Uetersen (2018)",
       "https://www.uvp-verbund.de/trefferanzeige?cmd=doShowObjectDetail&docuuid=4E5E17CE-677B-4E06-8D2A-49CE7E253F1E&plugid=/ingrid-group:ige-iplug-sh"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Die Trassenfindung für einen möglichen <.ref>Radschnellweg</.ref> nach Elmshorn ist abgeschlossen. Die genaue Planung für die einzelnen Abschnitte ist noch offen, entsprechend gibt es auch keinen Zeithorizont zur Umsetzung.</p>

    <p>Der Radschnellweg beginnt in Hamburg an zwei unterschiedlichen Stellen und vereint sich erst in der <.m bounds="9.88323,53.598201,9.895067,53.606363" lon="9.890008" lat="53.601812" dir="forward">Elbgaustraße</.m>. Das lange Video orientiert sich am westlichen Arm und geht bis Elmshorn. Das Kurze zeigt den östlichen Arm nur ab/bis Elbgaustrase. Dort wo neue Brücken und Wege erst noch gebaut werden sollen weichen die Videos von der Trasse ab. Die in der Karte eingezeichnete Strecke ist die Vorzugsvariante. Sollte diesen in Teilen nicht umgesetzt werden können, wurden in der Planung auch Alternativen ausgearbeitet.</p>

    <h4>Hamburg – Westlicher Arm</h4>
    <p>Ab dem künftigen <.m bounds="9.932179,53.566228,9.936053,53.57052" lon="9.933123" lat="53.567272" dir="forward">Fernbahnhof Diebsteich</.m> käme man via Fahrradstraßen zum <.m bounds="9.905415,53.569786,9.924592,53.574445" lon="9.922476" lat="53.570868" dir="forward">Holstenkamp</.m>. Im ersten Abschnitt soll ein schmaler Zweirichtungsradweg auf der Südseite ergänzt werden, der sich nach <.m bounds="9.917098,53.570341,9.919687,53.571486" lon="9.918268" lat="53.570864" dir="forward">der Kreuzung</.m> jedoch wieder aufspaltet. Da der Holstenkamp beim Bau des Autobahndeckel eine Verbindung zur Luruper Chaussee erhalten soll, wird mit deutlich mehr KFZ Verkehr gerechnet. Die Planung dazu erfolgt im Rahmen des Deckelbaus, angepeilt ist Mitte 2020er Jahre.</p>

    <p>Um dem Volkspark herum sind Fahrradstraßen angedacht, ab dem <.m bounds="9.893036,53.583709,9.89976,53.593764" lon="9.895265" lat="53.585007" dir="forward">Hellgrundweg</.m> ein Zweirichtungsradweg auf der Friedhofsseite. Im Rahmen des Baus der U-Bahn Station „Arenen / Volkspark“ soll auch eine Unter- bzw. Überführung des <.m bounds="9.896275,53.592183,9.899914,53.593662" lon="9.898623" lat="53.592856" dir="forward">Farnhornstieg</.m> geprüft werden. Bis dahin soll die Ampel verbessert werden. Die Wege durch die <.m bounds="9.887028,53.592545,9.899774,53.601438" lon="9.896974" lat="53.596083" dir="forward">Grünanlagen</.m> sollen so gut es geht verbreitert werden, wobei weiterhin mit viel Fußverkehr zu rechnen ist.</p>

    <h4>Hamburg – Östlicher Arm</h4>
    <p>Von der <.a name="alltagsroute-2">Alltagsroute 2</.a> fährt man weiter gerade aus um die <.m bounds="9.929076,53.582676,9.934327,53.585482" lon="9.933267" lat="53.58345" dir="forward">Warnstedtstraße</.m> zu erreichen. In diesen Abschnitten sind schmale <.ref>Hochbordradwege</.ref>, <.ref>Kopenhagener Lösung</.ref> o.ä. vorgesehen. Die <.m bounds="9.917948,53.584467,9.930435,53.590734" lon="9.92911" lat="53.585196" dir="forward">Randstraße</.m> soll zu einer Fahrradstraße werden, wobei das <.m bounds="9.925391,53.58569,9.927657,53.586772" lon="9.926503" lat="53.586185" dir="forward">KFZ-freie Stück</.m> erhalten bleiben soll. Kurz vor der Einmündung des <.m lon="9.920557" lat="53.589599" dir="forward" bounds="9.918529,53.588798,9.923046,53.590503">Försterweg</.m> wird der Schnellweg auf einen Zweirichtungsradweg umgelenkt, der auf der Seite der S-Bahn Station verlaufen soll. Die Detailplanung soll mit dem Bau der U-Bahn Station für die U5 erfolgen.</p>

    <p>Der Zweirichtungsradweg würde auf der Südseite des <.m bounds="9.904335,53.590621,9.918884,53.592441" lon="9.917908" lat="53.590932" dir="forward">Binsbarg</.m> verlaufen. Allerdings nur, wenn dies für den KFZ-Verkehr vertretbar ist, was noch geprüft werden muss. Für die <.m bounds="9.903529,53.591987,9.905289,53.595679" lon="9.904208" lat="53.593362" dir="forward">Schnackenburgallee</.m> sind beidseitige Einrichtungsradwege angedacht; mit Hilfe von Mittelinseln käme man leichter in die <.m bounds="9.889783,53.595008,9.90513,53.6019" lon="9.904039" lat="53.595564" dir="forward">Fangdieckstraße</.m>. Diese soll Fahrradstraße werden, wozu noch eine Möglichkeit gefunden werden muss den KFZ-Schleichverkehr auszusperren.</p>

    <h4>Hamburg – ab Elbgaustraße</h4>
    <p>Die <.m bounds="9.88796,53.600075,9.89172,53.602775" lon="9.889988" lat="53.60173" dir="forward">Elbgaustraße</.m> wird zur Zeit umgeplant (<.a name="2021-02-14-elbgaustrasse">Details</.a>). Momentan ist vorgesehen die beiden Äste des Radschnellwegs durch einen schmalen Zweirichtungsradweg auf der Ostseite anzubinden. Zur Querung ist eine breite Mittelinsel kurz vor der Bahnunterführung vorgesehen, sodass je nur eine KFZ-Spur beachtet werden muss. Der <.m bounds="9.887119,53.60167,9.891475,53.603607" lon="9.889635" lat="53.602347" dir="forward">Verbindungsweg</.m> zum Friedrichshulder Weg soll ausgebaut werden. Ab dann sind bis zur Landesgrenze Fahrradstraßen angedacht.</p>

    <h4>Halstenbek</h4>
    <p>Auf <.m bounds="9.825848,53.60916,9.86852,53.638697" lon="9.847346" lat="53.624091" dir="forward">Halstenbeker Gebiet</.m> sind fast ausschließlich Fahrradstraßen vorgesehen. Die Fahrt entlang des Radschnellwegs soll jeweils Vorfahrt haben, was auch für die Anschlüsse nach Hamburg gilt. An der <.m bounds="9.833861,53.628203,9.837038,53.629952" lon="9.835752" lat="53.628532" dir="forward">Dockenhudener Chaussee</.m> würde der Radverkehr anders als der KFZ-Verkehr geradlinig weiterfahren können. Statt einer Ampel sollen Mittelinseln die Querung ermöglichen. Als teurere Alternative erwägt man eine neue <.m bounds="9.836322,53.63064,9.838066,53.631862">Brücke an der Bahnstrecke</.m>. So könnten die vorhandenen Wege erweitert werden und der Schnellweg über den <.m bounds="9.836322,53.625551,9.843823,53.631862">Hagenwisch</.m> geführt werden.</p>

    <p>In Richtung Norden sieht die Vorzugsvariante einen neuen Radweg entlang des <.m bounds="9.812636,53.632378,9.828355,53.640425" lon="9.825385" lat="53.637228" dir="forward">Naturschutzgebiets „Düpenau und Mühlenau“</.m> vor. Man hält eine Genehmigung für unwahrscheinlich, da eine Alternative <.m bounds="9.819673,53.629479,9.832833,53.641509" lon="9.829817" lat="53.629967" dir="forward">östlich der Bahn</.m> möglich wäre. Diese wäre rund 500m länger und bestünde aus Fahrradstraßen und eigenen Radwegen.</p>

    <h4>Pinneberg</h4>
    <p>Von Halstenbek kommend schließt sich eine Fahrradstraße an, die sich bis zum <.m bounds="9.808089,53.643774,9.814633,53.64639" lon="9.813369" lat="53.644318" dir="forward">Thesdorfer Weg</.m> fortsetzt. Dort soll eine weitere Unterquerung gebaut werden, um dann über den Parkplatz auf der Nordseite zum <.m bounds="9.808093,53.644853,9.812719,53.647519" lon="9.809365" lat="53.645455" dir="forward">Kleinen Reitweg</.m> zu kommen. Dort würde der vorhandene Fußweg bzw. die Nebenstraße ausgebaut und wie bisher auf den Weg entlang der Bahn leiten. Auch dieser soll verbreitert werden.</p>

    <p>Um den <.m bounds="9.792388,53.652505,9.803128,53.657647" lon="9.80029" lat="53.653122" dir="forward">Bahnhof Pinneberg</.m> soll der Radschnellweg idealerweise vor der Mühlenau auf die Osterholder Allee geleitet werden, um nicht mit dem Fußverkehr entlang der Unterführung in Konflikt zu geraten. Ab dort sollen Fahrradstraßen, Tempo-20-Zonen (Bahnhof) bzw. Mischverkehr (Neubaugebiet „ILO-Park“) den Radverkehr aufnehmen. Ab der <.m bounds="9.787372,53.658899,9.792929,53.660994" lon="9.789639" lat="53.660318" dir="forward">Mühlenstraße</.m> wird wegen des hohen LKW-Aufkommens dagegen ein Zweirichtungsradweg auf der Bahnseite angestrebt.</p>

    <h4>Prisdorf</h4>
    <p>Die Wege sollen ausgebaut werden, wo dies unter Beachtung des Naturschutz möglich ist. Wo heute KFZ erlaubt sind, sollen es Fahrradstraßen werden, sonst eigenständige Rad- und Fußwege. Von <.m bounds="9.759825,53.672412,9.765766,53.67574" lon="9.765209" lat="53.672873" dir="forward">Rehmen bis zum Bahnhof</.m> hofft man einen neuen, direkten Weg bauen zu können. Ab dem <.m bounds="9.755248,53.674989,9.759273,53.680105" lon="9.75892" lat="53.675702" dir="forward">Hudenfeld</.m> sind wieder Fahrradstraßen vorgesehen.</p>

    <p>Entlang der <.m bounds="9.744906,53.678383,9.758333,53.683394" lon="9.749372" lat="53.681932" dir="forward">Hauptstraße</.m> soll ein Zweirichtungsradweg auf der Südseite entstehen. Je nach Platzangebot würde hier kein Radschnellwegstandard erreicht, oder man müsste Baumfällungen in Erwägung ziehen. Für die <.m bounds="9.75603,53.678685,9.757973,53.680512" lon="9.756958" lat="53.679567" dir="forward">Engstelle Hudenbarg bis Bilsbek-Brücke</.m> wird für KFZ eine Reduktion auf eine Fahrspur mit ampelgesteuertem Wechselverkehr vorgeschlagen. Die <.m bounds="9.745033,53.68186,9.746995,53.682771" lon="9.746676" lat="53.682227" dir="forward">Querung der Hauptstraße</.m> wird durch eine Mittelinsel vereinfacht.</p>

    <h4>Tornesch</h4>
    <p>Auf <.m bounds="9.724995,53.681067,9.75067,53.690846" lon="9.743011" lat="53.684239" dir="forward">Tornscher Gebiet</.m> schließen sich Fahrradstraßen mit landwirtschaftlichem Verkehr oder neue eigenenständige Radwege an. Die genaue Führung orientiert sich an der Untersuchung der Deutschen Bahn die Strecke viergleisig auszubauen. Die ebenfalls in <.m bounds="9.72599,53.686526,9.732181,53.691305" lon="9.729249" lat="53.689198" dir="forward">diesem Bereich</.m> geplante K22 würde durch eine neue Brücke gequert werden. Mit dem Bau entfielen auch die Bahnübergänge Denkmalstraße und Bockhorn als mögliche Wartestellen. Der Bau der K22 ist noch umstritten.</p>
    <p>Im <.m bounds="9.70285,53.690487,9.734942,53.715841" lon="9.7131" lat="53.706958" dir="forward">Stadtgebiet von Tornesch</.m> würde eine Fahrradstraße mit Vorfahrt entlang des Radschnellwegs eingerichtet. Als Besonderheit soll dieser einen baulichen Mittelstreifen erhalten, etwa ein paar Reihen Kopfsteinpflaster. Eine Untersuchung in den Niederlanden zeigte, das dies ausreichte damit Autofahrende seltener und mit mehr Abstand überholen. Zum Queren der <.m bounds="9.716724,53.697338,9.719272,53.699012" lon="9.717911" lat="53.697926" dir="forward">Ahrenloher Straße</.m> würde der Radverkehr zunächst die Straße geradlinig queren, um dann auf der Nordseite links in die Wilhelmstraße abzubiegen. So möchte man unübersichtliche Situationen im Kreuzungsbereich vermeiden.</p>
    <p>Langfristig könnte die Trasse auch weiter entlang der Bahn führen.</p>

    <h4>Elmshorn</h4>
    <p>Die aus Tornesch kommende Fahrradstraßen würden sich bis zum <.m bounds="9.66994,53.733145,9.674969,53.73603" lon="9.671521" lat="53.734707" dir="forward">Hainholter Ohr</.m> fortsetzen. Mit Vorrang, aber ohne die baulichen Mittelstreifen. Um den geplanten Bahnhof „Elmshorn Süd“ soll der Radverkehr auf einen Zweirichtungsradweg geleitet werden, da hier zu viele Autos fahren. Ab dem <.m bounds="9.668209,53.736982,9.671291,53.738939" lon="9.670138" lat="53.737868" dir="forward">Hainholz</.m> soll es wieder eine bevorrechtigte Fahrradstraße werden. An der <.m bounds="9.663164,53.741324,9.666438,53.742946" lon="9.66474" lat="53.741958" dir="forward">Wasserstraße</.m> endet der Schnellweg vorerst.</p>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
