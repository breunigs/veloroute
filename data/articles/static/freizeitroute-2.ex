defmodule Data.Article.Static.Freizeitroute2 do
  use Article.Static

  def id(), do: "FR2"
  def route_group(), do: :freizeit
  def title(), do: "Osterbekradweg (FR2)"

  def color(), do: "#006106"

  def summary(),
    do: "Freizeitroute 2 entführt entlang der Osterbek zum Stellmoorer Tunneltal"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        fade: :none,
        group: "Osterbekradweg",
        direction: :forward,
        from: "Ferdinandstor",
        to: "Stellmoorer Tunneltal",
        parent_ref: __MODULE__,
        text: "entlang der Osterbek zum Stellmoorer Tunneltal",
        videos: [
          {"2021-04-10-freizeitroute2/GX011188", :start, :end},
          {"2021-04-10-freizeitroute2/GX011189", :start, :end},
          {"2021-04-10-freizeitroute2/GX011190", :start, "00:00:51.552"},
          {"2021-04-10-freizeitroute2/GX011192", "00:00:01.034", :end},
          {"2021-04-10-freizeitroute2/GX011193", :start, "00:00:04.271"},
          {"2021-04-10-freizeitroute2/GX011195", "00:00:15.115", :end},
          {"2021-04-10-freizeitroute2/GX011196", :start, :end},
          {"2021-04-10-freizeitroute2/GX011197", :start, :end},
          {"2021-04-10-freizeitroute2/GX011198", :start, :end},
          {"2021-04-10-freizeitroute2/GX011199", :start, "00:00:51.852"},
          {"2021-04-10-freizeitroute2/GX011201", "00:00:07.341", :end},
          {"2021-04-10-freizeitroute2/GX011202", :start, "00:02:18.205"},
          {"2021-04-10-freizeitroute2/GX011204", "00:00:02.903", :end},
          {"2021-04-10-freizeitroute2/GX011205", :start, :end},
          {"2021-04-10-freizeitroute2/GX011206", :start, :end},
          {"2021-04-10-freizeitroute2/GX011207", :start, :end},
          {"2021-04-10-freizeitroute2/GX011208", :start, :end},
          {"2021-04-10-freizeitroute2/GX011209", :start, :end},
          {"2021-04-10-freizeitroute2/GX011210", :start, :end},
          {"2021-04-10-freizeitroute2/GX011211", :start, "00:00:42.776"},
          {"2021-04-10-freizeitroute2/GX011212", "00:00:00.300", "00:00:32.733"},
          {"2021-04-10-freizeitroute2/GX011213", "00:00:01.935", :end},
          {"2021-04-10-freizeitroute2/GX011214", :start, :end},
          {"2021-04-10-freizeitroute2/GX011215", :start, "00:00:01.602"},
          {"2021-04-10-freizeitroute2/GX011217", "00:00:12.713", "00:00:42.209"},
          {"2021-04-10-freizeitroute2/GX011217", "00:00:57.157", :end},
          {"2021-04-10-freizeitroute2/GX011218", :start, "00:00:06.240"},
          {"2021-04-10-freizeitroute2/GX011218", "00:00:16.750", :end},
          {"2021-04-10-freizeitroute2/GX011219", :start, "00:01:29.856"},
          {"2021-04-10-freizeitroute2/GX011220", "00:00:00.000", "00:00:01.001"},
          {"2021-04-10-freizeitroute2/GX011221", "00:00:00.200", :end},
          {"2021-04-10-freizeitroute2/GX011222", :start, "00:01:10.671"}
        ]
      },
      %Video.Track{
        fade: :none,
        group: "Osterbekradweg",
        direction: :backward,
        from: "Stellmoorer Tunneltal",
        to: "Ferdinandstor",
        parent_ref: __MODULE__,
        text: "entlang der Osterbek in die Innenstadt",
        videos: [
          {"2021-04-10-freizeitroute2/GX011223", "00:00:19.052", "00:03:28.041"},
          {"2021-04-10-freizeitroute2/GX011223", "00:03:40.687", "00:04:34.841"},
          {"2021-04-10-freizeitroute2/GX021223", "00:00:02.936", :end},
          {"2021-04-10-freizeitroute2/GX011224", :start, :end},
          {"2021-04-10-freizeitroute2/GX011225", :start, :end},
          {"2021-04-10-freizeitroute2/GX011226", :start, "00:01:04.665"},
          {"2021-04-10-freizeitroute2/GX011226", "00:01:20.213", :end},
          {"2021-04-10-freizeitroute2/GX011227", :start, "00:00:23.524"},
          {"2021-04-10-freizeitroute2/GX011227", "00:00:30.063", :end},
          {"2021-04-10-freizeitroute2/GX011228", :start, :end},
          {"2021-04-10-freizeitroute2/GX011229", :start, :end},
          {"2021-04-10-freizeitroute2/GX011230", :start, :end},
          {"2021-04-10-freizeitroute2/GX011231", :start, :end},
          {"2021-04-10-freizeitroute2/GX011232", :start, :end},
          {"2021-04-10-freizeitroute2/GX011233", :start, :end},
          {"2021-04-10-freizeitroute2/GX011234", :start, :end},
          {"2021-04-10-freizeitroute2/GX011235", :start, :end},
          {"2021-04-10-freizeitroute2/GX011236", :start, :end},
          {"2021-04-10-freizeitroute2/GX011237", :start, :end},
          {"2021-04-10-freizeitroute2/GX011238", :start, :end},
          {"2021-04-10-freizeitroute2/GX011239", :start, :end},
          {"2021-04-10-freizeitroute2/GX011240", :start, :end},
          {"2021-04-10-freizeitroute2/GX011241", :start, :end},
          {"2021-04-10-freizeitroute2/GX011242", :start, "00:01:33.660"},
          {"2021-06-13-veloroute-5-5a-und-13rein/GX011822", "00:00:15.849", :end},
          {"2021-06-13-veloroute-5-5a-und-13rein/GX011823", :start, :end},
          {"2021-06-13-veloroute-5-5a-und-13rein/GX011824", :start, :end},
          {"2021-06-13-veloroute-5-5a-und-13rein/GX011825", :start, "00:00:01.969"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/radtour/6294574/radtour-city-alster-osterbekkanal-volksdorfer-wald/"},
      {"Komoot Routenplaner: entlang der Osterbek", "https://www.komoot.de/tour/227466998"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/9056480"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Freizeitroute 2 – Osterbekradweg <.icon>FR2</.icon></h3>
    <span class="updated">Länge rund 25km</span>

    <p>Ab dem <.m dir="forward" bounds="9.998862,53.55525,10.00495,53.557416" lat="53.55588" lon="10.00128">Ferdinandstor</.m> fährt man zunächst entlang der Alster und folgt dann dem <.m dir="forward" bounds="9.997975,53.575401,10.035784,53.584155" lat="53.5771" lon="10.0116">Osterbekkanal</.m> durch zahlreiche Grünflächen und Nebenstraßen. Ab der <.m dir="forward" lat="53.5979" lon="10.0991" bounds="10.090837,53.596174,10.110603,53.600748">U-Bahn Station Trabrennbahn</.m> geben die Schienen die grobe Richtung vor – nach einem kurzen Abstecher in die <.m dir="forward" bounds="10.115089,53.617707,10.131955,53.623899" lat="53.6190" lon="10.1236">Berner Au</.m> führen diese bis zum <.m dir="forward" lat="53.6368" lon="10.1554" bounds="10.144436,53.634382,10.180475,53.646241">Volksdorfder Wald</.m>. Von dort ist es nur noch ein kurzes Stück bis zum Ziel der Route, dem <.m dir="forward" bounds="10.158367,53.611997,10.234936,53.636551" lat="53.6349" lon="10.1987">Stellmoorer Tunneltal</.m>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und die Führung oft nicht ersichtlich. Gerade an den zahlreichen Straßenquerungen müssen teils erhebliche Umwege gefahren werden, um der Route „geradeaus“ folgen zu können. Ein Navi mit einem großen Bildschirm ist hier hilfreich, um genauer sehen zu können wie man fahren soll. Die Routingdaten der Stadt geben nur die grobe Richtung vor – die von veloroute.hamburg orientieren sich eher an einer fahrbaren Strecke.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Qualität der Bodenbeläge schwankt stark und es sind praktisch alle Varianten vertreten: Kopfsteinpflaster, modernes Radwegpflaster, Asphalt sowie Waldwege aus Grand oder Schotter. Es gibt einige enge Drängelgitter und <.m bounds="10.110882,53.604856,10.123379,53.609256" lat="53.60689" lon="10.11650" dir="forward">bei Farmsen</.m> eine Treppe, die aber über die nahen Nebenstraßen umfahren werden kann. </p>
    <p>Nicht überall ist Radfahren erlaubt, an anderen Stellen ist es wegen der engen Wege nicht möglich. Sei exzellent zu Anderen und steige ab, bevor es brenzlig wird.</p>

    <h4>Meinung</h4>
    <p>In die größeren Grünflächen wie den <.m dir="forward" lat="53.6368" lon="10.1554" bounds="10.144436,53.634382,10.180475,53.646241">Volksdorfder Wald</.m> oder die <.m dir="forward" bounds="10.115089,53.617707,10.131955,53.623899" lat="53.6190" lon="10.1236">Berner Au</.m> lohnt sich ein Abstecher. Auch <.m lat="53.59773" lon="10.07785" dir="forward" bounds="10.067883,53.595866,10.091143,53.601249">an der Osterbek</.m> gibt es einige schöne Stellen. Die Verbindungen dazwischen wirken jedoch lieblos und sind teils kaum befahrbar. Das man auch bei umgebauten Straßen noch riesige Umwege fahren muss zeigt klar, das man am Radverkehr wenig interessiert ist.</p>

    <p>Insgesamt lässt sich die Route in ihrem aktuellen Zustand nicht empfehlen. Es ist besser die günstig gelegenen Abschnitte in eine eigene Planung zu übernehmen, statt der Route am Stück zu folgen.</p>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
