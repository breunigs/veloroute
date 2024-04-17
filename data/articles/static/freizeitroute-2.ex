defmodule Data.Article.Static.Freizeitroute2 do
  use Article.Static

  def id(), do: "FR2"
  def route_group(), do: :freizeit
  def title(), do: "Osterbekradweg (FR2)"

  def color(), do: "#006106"
  def color_faded(), do: "#77ba7b"

  def summary(),
    do: "Freizeitroute 2 entführt entlang der Osterbek zum Stellmoorer Tunneltal"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "Osterbekradweg",
        direction: :forward,
        from: "Ferdinandstor",
        to: "Stellmoorer Tunneltal",
        parent_ref: __MODULE__,
        text: "entlang der Osterbek zum Stellmoorer Tunneltal",
        historic: %{
          "0e78e6980b3a3ca24d86ff21496c2b9f" => ~d[2024-04],
          "221035fc132712c9f8bd8b02dde3d2ab" => ~d[2021-04]
        },
        videos: [
          {"2024-04-07-fr2/GX017081", :start, :end},
          {"2024-04-07-fr2/GX017082", :start, :end},
          {"2024-04-07-fr2/GX017083", :start, :end},
          {"2024-04-07-fr2/GX017084", :start, :end},
          {"2024-04-07-fr2/GX017085", :start, :end},
          {"2024-04-07-fr2/GX017086", :start, "00:00:56.757"},
          {"2024-04-07-fr2/GX017086", "00:00:59.960", :end},
          {"2024-04-07-fr2/GX017087", :start, "00:00:03.003"},
          {"2024-04-07-fr2/GX017088", :start, :end},
          {"2024-04-07-fr2/GX017089", :start, :end},
          {"2024-04-07-fr2/GX017090", :start, :end},
          {"2024-04-07-fr2/GX017091", :start, :end},
          {"2024-04-07-fr2/GX017092", :start, "00:05:35.902"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "Osterbekradweg",
        direction: :backward,
        from: "Stellmoorer Tunneltal",
        to: "Ferdinandstor",
        parent_ref: __MODULE__,
        text: "entlang der Osterbek in die Innenstadt",
        historic: %{
          "9a137866880ddd16f5db427d2943cc68" => ~d[2024-04],
          "b9ffc6a7ed185b5776798f9c01fa8f21" => ~d[2021-04]
        },
        videos: [
          {"2024-04-07-fr2/GX017093", :start, "00:01:54.781"},
          {"2024-04-07-fr2/GX017093", "00:02:03.690", "00:04:19.025"},
          {"2024-04-07-fr2/GX017093", "00:04:22.596", :end},
          {"2024-04-07-fr2/GX017094", :start, :end},
          {"2024-04-07-fr2/GX017095", :start, :end},
          {"2024-04-07-fr2/GX017096", :start, :end},
          {"2024-04-07-fr2/GX017097", :start, :end},
          {"2024-04-07-fr2/GX017098", :start, "00:01:29.089"},
          {"2024-04-07-fr2/GX017099", "00:00:00.100", :end},
          {"2024-04-07-fr2/GX017100", :start, :end},
          {"2024-04-07-fr2/GX017101", :start, :end},
          {"2024-04-07-fr2/GX017102", :start, :end},
          {"2024-04-07-fr2/GX017103", :start, :end},
          {"2024-04-07-fr2/GX017104", :start, :end},
          {"2024-04-07-fr2/GX017105", :start, :end},
          {"2024-04-07-fr2/GX017106", :start, :end},
          {"2024-04-07-fr2/GX017107", :start, :end},
          {"2024-04-07-fr2/GX017108", :start, :end},
          {"2024-04-07-fr2/GX017109", :start, "00:00:02.836"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/radtour/6294574/radtour-city-alster-osterbekkanal-volksdorfer-wald/"},
      {"Komoot Routenplaner: entlang der Osterbek",
       "https://www.komoot.com/de-de/tour/227466998"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/9056480"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Freizeitroute 2 – Osterbekradweg <.icon>FR2</.icon></h3>
    <span class="updated">Länge rund 25km</span>

    <p>Ab dem <.v dir="forward" bounds="9.998862,53.55525,10.00495,53.557416" lat={53.55588} lon={10.00128} ref={@ref}>Ferdinandstor</.v> fährt man zunächst entlang der Alster und folgt dann dem <.v dir="forward" bounds="9.997975,53.575401,10.035784,53.584155" lat={53.5771} lon={10.0116} ref={@ref}>Osterbekkanal</.v> durch zahlreiche Grünflächen und Nebenstraßen. Ab der <.v dir="forward" lat={53.5979} lon={10.0991} bounds="10.090837,53.596174,10.110603,53.600748" ref={@ref}>U-Bahn Station Trabrennbahn</.v> geben die Schienen die grobe Richtung vor – nach einem kurzen Abstecher in die <.v dir="forward" bounds="10.115089,53.617707,10.131955,53.623899" lat={53.6190} lon={10.1236} ref={@ref}>Berner Au</.v> führen diese bis zum <.v dir="forward" lat={53.6368} lon={10.1554} bounds="10.144436,53.634382,10.180475,53.646241" ref={@ref}>Volksdorfder Wald</.v>. Von dort ist es nur noch ein kurzes Stück bis zum Ziel der Route, dem <.v dir="forward" bounds="10.158367,53.611997,10.234936,53.636551" lat={53.6349} lon={10.1987} ref={@ref}>Stellmoorer Tunneltal</.v>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und die Führung oft nicht ersichtlich. Gerade an den zahlreichen Straßenquerungen müssen teils erhebliche Umwege gefahren werden, um der Route „geradeaus“ folgen zu können. Ein Navi mit einem großen Bildschirm ist hier hilfreich, um genauer sehen zu können wie man fahren soll. Die Routingdaten der Stadt geben nur die grobe Richtung vor – die von veloroute.hamburg orientieren sich eher an einer fahrbaren Strecke.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Qualität der Bodenbeläge schwankt stark und es sind praktisch alle Varianten vertreten: Kopfsteinpflaster, modernes Radwegpflaster, Asphalt sowie Waldwege aus Grand oder Schotter. Es gibt einige enge Drängelgitter und <.v bounds="10.110882,53.604856,10.123379,53.609256" lat={53.60689} lon={10.11650} dir="forward" ref={@ref}>bei Farmsen</.v> eine Treppe, die aber über die nahen Nebenstraßen umfahren werden kann. </p>
    <p>Nicht überall ist Radfahren erlaubt, an anderen Stellen ist es wegen der engen Wege nicht möglich. Sei exzellent zu Anderen und steige ab, bevor es brenzlig wird.</p>

    <h4>Meinung</h4>
    <p>In die größeren Grünflächen wie den <.v dir="forward" lat={53.6368} lon={10.1554} bounds="10.144436,53.634382,10.180475,53.646241" ref={@ref}>Volksdorfder Wald</.v> oder die <.v dir="forward" bounds="10.115089,53.617707,10.131955,53.623899" lat={53.6190} lon={10.1236} ref={@ref}>Berner Au</.v> lohnt sich ein Abstecher. Auch <.v lat={53.59773} lon={10.07785} dir="forward" bounds="10.067883,53.595866,10.091143,53.601249" ref={@ref}>an der Osterbek</.v> gibt es einige schöne Stellen. Die Verbindungen dazwischen wirken jedoch lieblos und sind teils kaum befahrbar. Das man auch bei umgebauten Straßen noch riesige Umwege fahren muss zeigt klar, das man am Radverkehr wenig interessiert ist.</p>

    <p>Insgesamt lässt sich die Route in ihrem aktuellen Zustand nicht empfehlen. Es ist besser die günstig gelegenen Abschnitte in eine eigene Planung zu übernehmen, statt der Route am Stück zu folgen.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
