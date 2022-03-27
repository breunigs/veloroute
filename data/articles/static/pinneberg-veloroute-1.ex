defmodule Data.Article.Static.PinnebergVeloroute1 do
  use Article.Static

  def id(), do: "pinneberg-1"
  def display_id(), do: "1"
  def route_group(), do: :alltag
  def title(), do: "Pinneberg: Veloroute 1"

  def color(), do: "#197888"

  def summary(),
    do: "Veloroute 1 führt von Pinnebergs Zentrum nach Prisdorf"

  def tags(), do: [id(), "pinneberg"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 2,
        group: "Pinneberg 1",
        direction: :forward,
        from: "Pinneberg Zentrum",
        to: "Prisdorf",
        parent_ref: __MODULE__,
        text: "vom Zentrum nach Prisdorf",
        videos: [
          {"2022-02-27-pinneberg/GX013247", "00:01:36.196", "00:01:39.299"},
          {"2022-02-27-pinneberg/GX013241", "00:01:51.511", :end},
          {"2022-02-27-pinneberg/GX013242", :start, "00:00:41.366"}
        ]
      },
      %Video.Track{
        renderer: 2,
        group: "Pinneberg 1",
        direction: :backward,
        from: "Prisdorf",
        to: "Pinneberg Zentrum",
        parent_ref: __MODULE__,
        text: "von Prisdorf zum Zentrum",
        videos: [
          {"2022-02-27-pinneberg/GX013244", "00:00:10.644", :end},
          {"2022-02-27-pinneberg/GX013245", :start, :end},
          {"2022-02-27-pinneberg/GX013246", :start, :end},
          {"2022-02-27-pinneberg/GX013247", :start, "00:01:40.949"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {
        "ADFC zur Ausschilderung der Route",
        "https://adfc-pinneberg.de/verkehrspolitik/381-veloroute-1-endlich-ausgeschildert"
      }
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Pinneberg: Veloroute 1 <.icon>pinneberg-1</.icon></h3>
    <p>Los geht's an der <.m bounds="9.787339,53.661065,9.793126,53.663629" lon="9.793021" lat="53.661852" dir="forward">Koppelstraße</.m>. Über den Park und die <.m bounds="9.784209,53.661061,9.789957,53.668786" lon="9.787434" lat="53.665526" dir="forward">Ottostraße</.m> umgeht man die KFZ-lastigen Straßen zunächst, landet schließlich aber doch auf der <.m bounds="9.773898,53.668445,9.783845,53.672677" lon="9.781066" lat="53.669846" dir="forward">Prisdorfer Straße</.m>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist vollständig ausgeschildert und teils mit Piktogrammen versehen. Ohne Ortskenntnis muss man genau schauen um zu sehen wie abgebogen werden soll.</p>

    <h4>Befahrbarkeit</h4>
    <p>Anfangs führt die Route durch Nebenstraßen und Parkwege, sowohl asphaltiert als auch mit naturnahen Oberflächen (Grand). Entlang der KFZ-Trasse fährt man zunächst auf kombinierten Fuß- und Radwegen. Später muss man auf die KFZ-Spuren ausweichen oder darf im Schritttempo auf den Fußwegen weiterfahren. Die Route ist nur teilweise mit Lastenrad befahrbar.</p>

    <p>Die Ampelschaltung mit Fahrtrichtung Pinneberg ist nicht für den Radverkehr optimiert. Es gibt außerdem zwei Schiebestellen:</p>
    <ul>
      <li>Die <.m bounds="9.78763,53.661952,9.788155,53.662302" lon="9.787926" lat="53.662078" dir="forward">defekte Brücke</.m> über die Pinnau</li>
      <li>Richtung Zentrum wird die <.m bounds="9.791938,53.661524,9.793746,53.662052" lon="9.792175" lat="53.66182" dir="backward">Koppelstraße</.m> für wenige Meter Einbahnstraße</li>
    </ul>

    <h4>Meinung</h4>
    <p>Die Veloroute ist eine Katastrophe. Am Anfang eiert man auf <.m bounds="9.787368,53.662119,9.788953,53.66322" lon="9.78787" lat="53.662578" dir="forward">ungeeigneten Wegen</.m> durch den Park.</p>

    <p>Entlang der Prisdorfer Straße sind die gemeinsamen Fuß/Radwege so schmal, das selbst Begegnungsverkehr Rad/Rad oder Rad/Fuß <.m bounds="9.782492,53.668366,9.784718,53.669419" lon="9.783854" lat="53.668946" dir="forward">ein Problem darstellt</.m>. Lastenräder kommen hier nicht aneinander vorbei. Zudem verläuft der Radweg hier durch die <.ref>Dooring</.ref>-Zone, was eine ernste Unfallgefahr darstellt.</p>

    <p>Aus Prisdorf nach Pinneberg ist die Führung besonders absurd: wer mehr als 7 km/h fahren möchte, muss zunächst auf der KFZ-Spur fahren. Ab dem <.m bounds="9.7706,53.67201,9.774925,53.674334" lon="9.77218" lat="53.673696" dir="backward">Peiner Hag</.m> muss man den linksseitigen gemeinsamen Rad- und Fußweg nutzen. Dies erkennt man aber erst im Kreuzungsbereich, von wo man nicht sicher dorthin wechseln kann. Kurz darauf muss am <.m bounds="9.77647,53.667704,9.783289,53.671664" lon="9.779839" lat="53.670307" dir="backward">Westring</.m> wieder auf die „richtige“ Straßenseite gewechselt werden. Dazu muss drei Mal gewartet werden, weil die Ampeln nicht aufeinander abgestimmt sind. Die Stadt hat außerdem verschlafen die Ampeln der seit Jahren gültigen StVO-Regelung anzupassen – der Radverkehr müsste die KFZ-Ampeln beachten.</p>

    <p>Kurzfristig müssen die Sicherheitsmängel behoben werden. Langfristig müsste die Prisdorfer komplett umgestaltet werden, um für die Radverkehr attraktiv zu sein. Je nach Fahrtziel könnte der geplante <.m bounds="9.781951,53.659294,9.79309,53.664334" lon="9.789565" lat="53.660404" dir="forward" ref="rsw-elmshorn">Radschnellweg nach Elmshorn</.m> eine Alternative sein.</p>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
