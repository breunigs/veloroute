defmodule Data.Article.Static.RSWStade do
  use Article.Static

  def id(), do: "rsw-stade"
  def route_group(), do: :rsw
  def title(), do: "Radschnellweg nach Stade"

  def color(), do: "#000000"

  def summary(),
    do:
      "Beschreibung und Video zum Radschnellweg Stade ↔ HH-Finkenwerder (via Neuenfelde oder via Neugraben)"

  def tags(), do: [id(), "rsw"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 1,
        group: "Radschnellweg Stade (via Neugraben)",
        direction: :forward,
        from: "Hamburg Finkenwerder",
        via: ["Neugraben"],
        to: "Stade Am Güterbahnhof",
        parent_ref: __MODULE__,
        text: "künftiger Radschnellweg Finkenwerder → Stade (via Neugraben)",
        videos: [
          {"2021-09-18-rsw-stade/GX012828.MP4.time_lapse.mkv", :start, :end},
          {"2021-09-18-rsw-stade/GX012829", :start, :end},
          {"2021-09-18-rsw-stade/GX012830", :start, :end},
          {"2021-09-18-rsw-stade/GX012831", :start, "00:02:53.006"},
          {"2021-09-18-rsw-stade/GX012831", "00:03:09.022", "00:03:34.047"},
          {"2021-09-18-rsw-stade/GX012834", :start, "00:00:37.271"},
          {"2021-09-18-rsw-stade/GX012839", "00:00:01.168", "00:00:23.323"},
          {"2021-09-18-rsw-stade/GX012840", "00:01:01.261", "00:02:52.005"},
          {"2021-09-18-rsw-stade/GX012842", "00:00:04.271", :end},
          {"2021-09-18-rsw-stade/GX012843", :start, :end},
          {"2021-09-18-rsw-stade/GX012844", :start, :end},
          {"2021-09-18-rsw-stade/GX012846", :start, "00:00:23.357"},
          {"2021-09-18-rsw-stade/GX012847", "00:00:04.705", "00:00:27.895"},
          {"2021-09-18-rsw-stade/GX012848", "00:00:00.767", :end},
          {"2021-09-18-rsw-stade/GX012849", :start, :end},
          {"2021-09-18-rsw-stade/GX012850", :start, :end},
          {"2021-09-18-rsw-stade/GX012851", :start, "00:00:03.403"},
          {"2021-09-18-rsw-stade/GX012853", "00:00:02.636", :end},
          {"2021-09-18-rsw-stade/GX012854", :start, :end},
          {"2021-09-18-rsw-stade/GX012855", :start, :end},
          {"2021-09-18-rsw-stade/GX012856", :start, :end},
          {"2021-09-18-rsw-stade/GX012857", :start, "00:02:11.198"},
          {"2021-09-18-rsw-stade/GX012857", "00:02:55.242", :end},
          {"2021-09-18-rsw-stade/GX012858", :start, "00:02:28.248"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Radschnellweg Stade (via Neugraben)",
        direction: :backward,
        from: "Stade Am Güterbahnhof",
        via: ["Neugraben"],
        to: "Hamburg Finkenwerder",
        parent_ref: __MODULE__,
        text: "künftiger Radschnellweg Stade → Finkenwerder (via Neugraben)",
        videos: nil
      },
      %Video.Track{
        renderer: 3,
        group: "Radschnellweg Stade (via Neuenfelde)",
        direction: :forward,
        from: "Hamburg Finkenwerder",
        via: ["Neuenfelde"],
        to: "Buxtehude Bahnhof",
        parent_ref: __MODULE__,
        text: "künftiger Radschnellweg Finkenwerder → Buxtehude (via Neuenfelde)",
        videos: nil
      },
      %Video.Track{
        renderer: 1,
        group: "Radschnellweg Stade (via Neuenfelde)",
        direction: :backward,
        from: "Buxtehude Bahnhof",
        via: ["Neuenfelde"],
        to: "Hamburg Finkenwerder",
        parent_ref: __MODULE__,
        text: "künftiger Radschnellweg Buxtehude → Finkenwerder (via Neuenfelde)",
        videos: [
          {"2021-09-18-rsw-stade/GX012862", :start, :end},
          {"2021-09-18-rsw-stade/GX012863", :start, :end},
          {"2021-09-18-rsw-stade/GX012864", :start, :end},
          {"2021-09-18-rsw-stade/GX012865", :start, :end},
          {"2021-09-18-rsw-stade/GX012866", :start, :end},
          {"2021-09-18-rsw-stade/GX012867", :start, "00:00:16.283"},
          {"2021-09-18-rsw-stade/GX012868", "00:00:03.804", :end},
          {"2021-09-18-rsw-stade/GX012869", :start, "00:01:18.078"},
          {"2021-09-18-rsw-stade/GX012870", "00:00:08.909", :end},
          {"2021-09-18-rsw-stade/GX012871", :start, :end},
          {"2021-09-18-rsw-stade/GX012872", :start, "00:00:01.535"},
          {"2021-09-18-rsw-stade/GX012874", :start, :end},
          {"2021-09-18-rsw-stade/GX012875", :start, :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"offizielle Seite zu den Radschnellwegen",
       "https://metropolregion.hamburg.de/radschnellwege/"},
      {"Detailseite zum Radschnellweg Stade",
       "https://metropolregion.hamburg.de/radschnellwege/15307278/radschnellweg-stade-hamburg/"},
      {"Pläne und Berichte",
       "https://metropolregion.hamburg.de/radschnellwege/15307294/mediathek-radschnellweg-stade-hamburg/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Die Trassenfindung für einen möglichen <.ref>Radschnellweg</.ref> nach Stade ist abgeschlossen. Die genaue Planung für die einzelnen Abschnitte ist noch offen, entsprechend gibt es auch keinen Zeithorizont zur Umsetzung. Die Videos orientieren sich an der Vorzugstrasse, müssen bei geplanten neuen Wegen aber zwangsläufig von ihr abweichen.</p>

    <p>Von <.m bounds="9.84641,53.52339,9.890216,53.544547" lon="9.878172" lat="53.535534" dir="forward">Finkenwerder</.m> aus sind zwei verschiedene Trassen vorgesehen: eine westlich über <.m bounds="9.797523,53.505998,9.826201,53.528265" lon="9.814055" lat="53.521044" dir="backward">Neuenfelde</.m>, <.m bounds="9.742716,53.484095,9.79501,53.499015" lon="9.774205" lat="53.491254" dir="backward">Rübke</.m> nach <.m bounds="9.662081,53.460264,9.730682,53.489849" lon="9.713926" lat="53.470708" dir="backward">Buxtehude</.m>. Die Östliche führt über <.m bounds="9.867344,53.49395,9.886985,53.514762" lon="9.877577" lat="53.501706" dir="forward">Francop</.m>, <.m bounds="9.822114,53.459795,9.873431,53.489916" lon="9.85486" lat="53.480638" dir="forward">Neugraben</.m>, <.m bounds="9.761047,53.457854,9.812217,53.480748" lon="9.793211" lat="53.473185" dir="forward">Neu Wulmstorf</.m> nach <.m bounds="9.663318,53.458791,9.734956,53.489983" lon="9.699531" lat="53.469169" dir="forward">Buxtehude</.m>. Von dort soll der Schnellweg an größtenteils bereits vorhandenen Wegen entlang der Bahnlinie bis nach <.m bounds="9.431069,53.571797,9.524408,53.620104" lon="9.486932" lat="53.594437" dir="forward">Stade</.m> verlaufen.</p>

    <h4>Hamburg – Finkenwerder</h4>
    <p>Der Verbindung <.m bounds="9.870296,53.532603,9.963878,53.548802" lon="9.878374" lat="53.536389" dir="backward">über die Elbe</.m> ist wichtig. Neben einer Taktverdichtung der Fähren wird empfohlen eine Bike+Ride Anlage direkt auf den Pontons zu bauen. Um die Fahrradmitnahme zu verbessern, soll auch geprüft werden ob besser geeignete Schiffe angeschafft werden.</p>

    <p>Vom <.m bounds="9.874028,53.533148,9.881181,53.537841" lon="9.878402" lat="53.535453" dir="forward">Fähranleger</.m> schließt zunächst eine Fahrradstraße an, die auf die <.m bounds="9.863056,53.528662,9.880191,53.536024" lon="9.877269" lat="53.533411" dir="forward">alte Bahnstrecke</.m> führt. In Fahrtrichtung Süden wurde diese schon teilweise zu einem gemeinsamen Fuß- und Radweg umgebaut. Sie soll für den Radschnellweg aber nochmal verbreitert werden und die Verkehrsarten trennen. In Richtung Westen soll der Schnellweg zwischen den Flutschutzmauern gebaut werden.</p>

    <h4>Hamburg – Südöstlicher Arm</h4>
    <p>Die <.m bounds="9.875509,53.516623,9.88312,53.522647" lon="9.878254" lat="53.522448" dir="forward">alte Bahnstrecke</.m> soll weiter ausgebaut werden. Über eine neue Brücke käme man kreuzungsfrei auf den vorhandenen Fuß- und Radweg <.m bounds="9.878113,53.51411,9.882488,53.517615" lon="9.880729" lat="53.516779" dir="forward">an der alten Süderelbe</.m>. Da dieser grob dem Schnellweg-Standard entspricht, will man diesen vorerst so lassen. Den <.m bounds="9.869845,53.508121,9.876976,53.513865" lon="9.874022" lat="53.512175" dir="forward">Weg durch die Plantagen</.m> bzw. <.m bounds="9.87027,53.501128,9.880296,53.510286" lon="9.876572" lat="53.506197" dir="forward">entlang des Deichs</.m> baut man aus.</p>

    <p>Auf dem <.m bounds="9.863974,53.484775,9.87897,53.502547" lon="9.877559" lat="53.501772" dir="forward">Hinterdeich bzw. der Francoper Straße</.m> steht die Führung noch nicht fest. Die Straße zerteilt das Naturschutzgebiet zu sehr und soll daher angepasst werden. In einer tiefergehenden Planung sollen Schnellweg und Naturschutz in Einklang gebracht werden. Ähnlich sieht es bei <.m bounds="9.854479,53.481014,9.864968,53.485546" lon="9.863235" lat="53.484244" dir="forward">einem neuen Weg</.m> zum Neugrabener Dorf aus. Ab dort käme man im <.ref>Mischverkehr</.ref> oder über Fahrradstraßen bis zum <.m bounds="9.847393,53.473544,9.855807,53.475472" lon="9.854096" lat="53.474997" dir="forward">Bahnhof Neugraben</.m>.</p>

    <p>Ab jetzt verläuft der Schnellweg parallel zur Bahn. Am <.m bounds="9.83663,53.474175,9.841894,53.475425" lon="9.839474" lat="53.474801" dir="forward">Geutensweg</.m> ist eine neue Brücke vorgesehen. An den ebenerdigen Bahnübergängen ist vermutlich keine Vorfahrt für den Schnellweg möglich, da man aus Sicherheitsgründen vermeiden will das Fahrzeuge auf den Schienen zum Stehen kommen.</p>

    <h4>Neu Wulmstorf – Südöstlicher Arm</h4>
    <p>Die Wege sollen verbreitert werden um Rad- und Fußverkehr voneinander trennen zu können. Für das <.m bounds="9.796158,53.472853,9.800533,53.474787" lon="9.798615" lat="53.47375" dir="forward">Tor („Katzenklappe“)</.m> denkt man an einen Bewegungsmelder. Um den <.m bounds="9.784667,53.472466,9.791484,53.473825" lon="9.788655" lat="53.473229" dir="forward">Bahnhof herum</.m> gäbe es ein Stück Fahrradstraße mit KFZ; ansonsten sind entweder gar keine KFZ zugelassen oder nur landwirtschaftlicher Verkehr.</p>

    <h4>Buxtehude – Südöstlicher Arm</h4>
    <p>Prinzipiell soll der Weg weiter entlang der Bahnlinie führen. Der <.m bounds="9.762379,53.471012,9.773677,53.473104">Neubauabschnitt durchs Naturschutzgebiet</.m> wird dabei als besonders knifflig angesehen, da hier eine gefährdete Vogelart brütet und durch den Bau vollständig vertrieben werden könnte. An der <.m bounds="9.704728,53.466115,9.71688,53.471319" lon="9.709368" lat="53.46874" dir="forward">Konrad-Adenauer-Allee</.m> vereinen sich die Trassen.</p>

    <h4>Hamburg – Nordwestlicher Arm</h4>
    <p>Wie bereits erwähnt würde der Radschnellweg hier auf der <.m bounds="9.85068,53.533566,9.876537,53.537077" lon="9.866468" lat="53.534827" dir="forward">ehemaligen Bahntrasse zwischen den Flutschutzmauern</.m> geführt. Ab dem <.m bounds="9.84247,53.535893,9.848884,53.537373" lon="9.845305" lat="53.53671" dir="forward">Neßdeich</.m> bleibt es bei der heutigen Führung mit gemeinsamen Rad- und Fußweg, wobei dieser geringfügig verbreitert werden soll. <.m bounds="9.821391,53.525315,9.824727,53.526941" lon="9.823117" lat="53.526041" dir="forward">Am Rosengarten</.m> soll die Ampel besser geschalten werden.</p>

    <p>Über Landwirtschaftswege erreicht man <.m bounds="9.811341,53.520557,9.822638,53.522195" lon="9.818685" lat="53.521406" dir="forward">Neuenfelde</.m> und quert direkt den Deich. Im Ortsgebiet sind Fahrradstraßen vorgesehen. Die <.m bounds="9.809632,53.512511,9.814203,53.514255" lon="9.811566" lat="53.513666" dir="forward">Nincoper Straße</.m> würde zumindest für ein kurzes Stück Tempo 30, bevor man wieder auf einem asphaltierten Feldweg radelt. Entlang der A26 erreicht man <.m bounds="9.768131,53.489246,9.807267,53.497244" lon="9.779712" lat="53.492018" dir="forward">Rübke</.m> auf einer Fahrradstraße.</p>

    <h4>Rübke – Nordwestlicher Arm</h4>
    <p>Die Planung geht hier aktuell von <.ref>Mischverkehr</.ref> bei Tempo 30 aus. Auf dem <.m bounds="9.778322,53.491464,9.781004,53.493143" lon="9.779291" lat="53.49215" dir="forward">Nincoper Deich</.m> sollen je nach dem Verkehrsaufkommen ggf. noch schmale <.ref>Schutzstreifen</.ref> angelegt werden. Gleichzeitig wird auch eine Ortsumgehung Rübke untersucht, die langfristig die Situation vor Ort wandeln könnte.</p>

    <h4>Buxtehude – Nordwestlicher Arm</h4>
    <p>Auf dem <.m bounds="9.71372,53.473544,9.754031,53.489952" lon="9.732424" lat="53.483044" dir="forward">ländlichen Abschnitt bis Buxtehude</.m> soll ein neben der Straße verlaufender Weg angelegt werden, der von Rad und Fuß geteilt und in beide Richtungen verwendet wird. Erst <.m bounds="9.705815,53.467344,9.722456,53.477421" lon="9.718006" lat="53.474979" dir="forward">ab dem Ortsgebiet</.m> sollen Rad- und Fuß je eigene Flächen erhalten. An der <.m bounds="9.704728,53.466115,9.71688,53.471319" lon="9.709368" lat="53.46874" dir="forward">Konrad-Adenauer-Allee</.m> vereinen sich die Trassen.</p>

    <h4>Buxtehude – Gemeinsamer Abschnitt</h4>
    <p>Der Radschnellweg soll südlich der <.m bounds="9.69335,53.467764,9.711163,53.470635" lon="9.70634" lat="53.468717" dir="forward" ref="rsw-stade">Konrad-Adenauer-Allee</.m> verlaufen. Aus Richtung Rübke müsste hier die Straßenseite gewechselt werden, von Neu Wulmstorf führe man dagegen geradeaus weiter. Über eine neue Brücke über die <.m bounds="9.696264,53.469054,9.697993,53.46979" lon="9.697262" lat="53.469503" dir="forward">Kreisstraße</.m> erreicht man den Gildenweg, der verbreitert werden soll. Vor der <.m bounds="9.689536,53.469054,9.697993,53.47085" lon="9.690949" lat="53.470259" dir="forward">Bahnhofstraße</.m> wird der Zweirichtungsradweg auf die KFZ-Spuren aufgeleitet. Für die Fahrt in Richtung Bahnhof ist dazu eine schmale, langgestreckte Mittelinsel in der Straßenmitte vorgesehen. Sie erlaubt die einzelnen Fahrspuren getrennt zu queren, idealerweise rollend ohne anzuhalten zu müssen.</p>

    <p>Die <.m bounds="9.672356,53.470197,9.691141,53.472992" lon="9.68206" lat="53.47158" dir="forward">Giselbertstraße</.m> soll innerorts zu einer Fahrradstraße werden. Danach wird der Radverkehr im <.ref>Mischverkehr</.ref> mit den KFZ geführt. Außerorts wäre dies bei Tempo 50, innerorts bei Tempo 30. In <.m bounds="9.649337,53.47296,9.665762,53.478478" lon="9.660154" lat="53.474902" dir="forward">Heitmannshausen</.m> soll die Straße asphaltiert werden. Das Planungsbüro schlägt vor Maßnahmen zu treffen um den Schleichverkehr auf dem Abschnitt nach <.m bounds="9.638345,53.474756,9.655966,53.483267" lon="9.648056" lat="53.478076" dir="forward">Neukloster</.m> auszusperren.</p>

    <p>Um den <.m bounds="9.636793,53.479177,9.644875,53.483411" lon="9.640862" lat="53.481039" dir="forward">Bahnhof Neukloster</.m> sollen die vorhandenen Wege ausgebaut werden. Zur Querung der <.m bounds="9.63841,53.48144,9.639405,53.482158" lon="9.639001" lat="53.481756" dir="forward">Jorker Straße</.m> ist eine breite Mittelinsel vorgesehen, sodass man nur eine KFZ-Spur gleichzeitig beachten muss. Bei geschlossener Schranke sollen die KFZ vor der Insel halten, damit der Radschnellweg befahrbar bleibt.</p>

    <h4>Nottensdorf</h4>
    <p>Nach Möglichkeit sollen die existierenden Feldwege ausgebaut werden. Rad-, Fuß- und landwirtschaftlicher  Verkehr würden sich die 4m breiten Wege teilen. Lediglich um das kleine <.m bounds="9.606824,53.49141,9.614908,53.496165" lon="9.61079" lat="53.493706" dir="forward">Industriegebiet „An der Bahn“</.m> kämen noch KFZ hinzu. Die Wege sollen möglichst asphaltiert und beleuchtet werden, die Kurven fahrradfreundlich angepasst werden. Im <.m bounds="9.613114,53.48847,9.621606,53.493642" lon="9.618365" lat="53.490358" dir="forward">Waldstück</.m> wurde eine Asphaltierung abgelehnt.</p>

    <h4>Horneburg</h4>
    <p>In <.m bounds="9.567882,53.500842,9.596468,53.516095" lon="9.582634" lat="53.507578" dir="forward">Horneburg</.m> soll nur wenig angepasst werden, es bleibt also beim <.ref>Mischverkehr</.ref>. Wo heute schneller gefahren werden darf soll Tempo 30 eingerichtet werden. Der Schnellweg bleibt beim <.m bounds="9.590969,53.501531,9.593199,53.504041" lon="9.59202" lat="53.503153" dir="forward">Schützenweg</.m> wartepflichtig, soll dann aber entlang der Ortsdurchfahrt Vorfahrt erhalten. Entsprechend muss auch beim Linksabbiegen aus dem <.m bounds="9.572626,53.51006,9.579739,53.513161" lon="9.575832" lat="53.511232" dir="forward">Teiledamm</.m> gewartet werden.</p>

    <p><.m bounds="9.572879,53.51097,9.579254,53.515469" lon="9.576303" lat="53.511538" dir="forward">Teiledamm und Langer Moordamm</.m> werden im Stadtgebiet Fahrradstraße. Im weiteren Verlauf sind 4m breite, gemeinsame Fuß- und Radwege mit Freigabe für landwirtschaftlichen Verkehr vorgesehen.</p>

    <h4>Dollern und Agathenburg</h4>
    <p>Die Feldwege werden wie in Horneburg auf 4m verbreitert und als gemeinsame Fuß- und Radwege mit landwirtschaftlichem Verkehr ausgeschildert. Lediglich um die <.m bounds="9.529573,53.563073,9.533563,53.56538" lon="9.531474" lat="53.564146" dir="forward">Bahnstation Agathenburg</.m> ist auf einem kurzen Stück auch KFZ das Befahren erlaubt.</p>

    <h4>Stade</h4>
    <p>Alle Streckenabschnitte auf Stader Gebiet sollen zu Fahrradstraßen werden. Zur <.m bounds="9.517236,53.568814,9.522329,53.574203" lon="9.519891" lat="53.571179" dir="forward">L111</.m> soll eine Rampe gebaut werden, damit man das dort angesiedelte Industriegebiet erreichen kann. Wo <.m bounds="9.490972,53.580809,9.509716,53.591248" lon="9.500838" lat="53.584934" dir="forward">heute noch ein Umweg</.m> notwendig ist, soll künftig der Weg weiter parallel zur Bahnstrecke verlaufen. In <.m bounds="9.490437,53.588055,9.497162,53.592647" lon="9.492942" lat="53.590326" dir="forward">diesem Bereich</.m> sind jedoch neue Bahngleise geplant, sodass der Schnellweg diese zweimal unterfahren würde – in etwa bei den eingezeichneten Dellen.</p>

    <p>Langfristig soll die Straße „<.m bounds="9.482616,53.595769,9.487782,53.597614">Am Staatsarchiv</.m>“ mittels Bahn-Unterführung an „<.m bounds="9.483404,53.592791,9.487627,53.594491">Hinterm Teich</.m>“ anschließen. Der Radschnellweg <.m bounds="9.485215,53.593108,9.489696,53.595139" lon="9.487644" lat="53.593998" dir="forward">soll an dieser Stelle</.m> wartepflichtig sein. Um dennoch brauchbar queren zu können ist eine Breite Mittelinsel vorgesehen. Der Radschnellweg endet bzw. beginnt am <.m bounds="9.48098,53.595422,9.484612,53.597879" lon="9.482559" lat="53.596695" dir="forward">Kreisel am Güterbahnhof</.m>.</p>


    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
