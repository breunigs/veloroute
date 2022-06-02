defmodule Data.Article.Static.Freizeitroute3 do
  use Article.Static

  def id(), do: "FR3"
  def route_group(), do: :freizeit
  def title(), do: "Wandseradweg (FR3)"

  def color(), do: "#006106"

  def summary(),
    do: "Freizeitroute 3 führt entlang der Wandse nach Stapelfeld"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 1,
        group: "Wandseradweg",
        direction: :forward,
        from: "Ferdinandstor",
        to: "Stapelfeld",
        parent_ref: __MODULE__,
        text: "entlang der Wandse nach Stapelfeld",
        videos: [
          {"2021-04-10-freizeitroute2/GX011188", :start, :end},
          {"2021-04-10-freizeitroute2/GX011189", :start, "00:00:57.524"},
          {"2021-07-26-missing-parts-fr2-fr3/GX012418", "00:00:19.620", :end},
          {"2021-07-26-missing-parts-fr2-fr3/GX012419", :start, :end},
          {"2021-07-26-missing-parts-fr2-fr3/GX012420", :start, "00:00:03.504"},
          {"2021-04-18-freizeitroute3/GX011334", "00:00:03.003", :end},
          {"2021-04-18-freizeitroute3/GX011335", :start, :end},
          {"2021-04-18-freizeitroute3/GX011336", :start, :end},
          {"2021-04-18-freizeitroute3/GX011337", :start, :end},
          {"2021-04-18-freizeitroute3/GX011338", :start, :end},
          {"2021-04-18-freizeitroute3/GX011339", :start, "00:00:41.341"},
          {"2021-04-18-freizeitroute3/GX011340", :start, :end},
          {"2021-04-18-freizeitroute3/GX011341", :start, "00:00:10.677"},
          {"2021-04-18-freizeitroute3/GX011342", :start, "00:01:39.600"},
          {"2021-04-18-freizeitroute3/GX011342", "00:01:40.467", :end},
          {"2021-04-18-freizeitroute3/GX011343", :start, :end},
          {"2021-04-18-freizeitroute3/GX011344", :start, "00:00:32.366"},
          {"2021-04-18-freizeitroute3/GX011345", "00:00:07.241", :end},
          {"2021-04-18-freizeitroute3/GX011348", "00:00:00.367", "00:00:13.580"},
          {"2021-04-18-freizeitroute3/GX011349", "00:00:00.267", :end},
          {"2021-04-18-freizeitroute3/GX011350", :start, "00:04:02.309"}
        ]
      },
      %Video.Track{
        renderer: 1,
        group: "Wandseradweg",
        direction: :backward,
        from: "Stapelfeld",
        to: "Ferdinandstor",
        parent_ref: __MODULE__,
        text: "entlang der Wandse in die Innenstadt",
        videos: [
          {"2021-04-18-freizeitroute3/GX011350", "00:04:44.785", :end},
          {"2021-04-18-freizeitroute3/GX011351", :start, :end},
          {"2021-04-18-freizeitroute3/GX011352", "00:00:13.714", "00:01:42.569"},
          {"2021-04-18-freizeitroute3/GX011352", "00:02:10.497", "00:02:59.413"},
          {"2021-04-18-freizeitroute3/GX011352", "00:02:59.880", :end},
          {"2021-04-18-freizeitroute3/GX011353", :start, :end},
          {"2021-04-18-freizeitroute3/GX011354", :start, :end},
          {"2021-04-18-freizeitroute3/GX011355", :start, :end},
          {"2021-04-18-freizeitroute3/GX011356", :start, :end},
          {"2021-04-18-freizeitroute3/GX011357", :start, :end},
          {"2021-04-18-freizeitroute3/GX011358", :start, :end},
          {"2021-04-18-freizeitroute3/GX011359", :start, :end},
          {"2021-04-18-freizeitroute3/GX011360", :start, "00:02:00.187"},
          {"2021-07-26-missing-parts-fr2-fr3/GX012422", "00:00:03.570", "00:00:05.138"},
          {"2021-07-26-missing-parts-fr2-fr3/GX012423", :start, "00:00:02.469"},
          {"2021-07-26-missing-parts-fr2-fr3/GX012428", :start, :end},
          {"2021-07-26-missing-parts-fr2-fr3/GX012429", :start, "00:00:04.037"},
          {"2021-04-10-freizeitroute2/GX011242", "00:01:19.846", "00:01:33.660"},
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
       "https://www.hamburg.de/radtour/6294592/radtour-city-eilbekkanal-wandse-gruenzug/"},
      {"Komoot Routenplaner: entlang der Wandse", "https://www.komoot.de/tour/227474867"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/14910"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Freizeitroute 3 – Wandseradweg <.icon>FR3</.icon></h3>
    <span class="updated">Länge rund 18km</span>

    <p>Anfangs fährt man rechts entlang der Außenalster, knickt nach dem <.m bounds="10.014707,53.56464,10.027611,53.568152" lat="53.56592" lon="10.01712" dir="forward">Mundsburger Kanal</.m> Richtung Osten ab und folgt dem Einbekkanal bzw. der Wandse. Ab <.m bounds="10.15223,53.598467,10.168589,53.602915" lat="53.6006" lon="10.1567" dir="forward">Rahlstedt</.m> orientiert man sich an der Stellau. Nach einem Abstecher durch das <.m lat="53.6022" lon="10.1664" bounds="10.162929,53.597604,10.180606,53.604574" dir="forward">Rahlstedter Gehölz</.m> erreicht man so die Landesgrenze bei <.m bounds="10.189129,53.599008,10.232269,53.616014" lat="53.6002" lon="10.1965" dir="forward">Stapelfeld</.m>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und <.m bounds="10.14209,53.592919,10.188502,53.611218">um Rahlstedt herum</.m> auch nicht mehr so leicht ersichtlich. Mit einem Navi kann ihr problemlos gefolgt werden. </p>

    <h4>Befahrbarkeit</h4>
    <p>Bis Höhe des <.m bounds="10.05126,53.573927,10.065831,53.579676" lat="53.57573" lon="10.05674" dir="forward">S-Bahnhof Friedrichsberg</.m> folgt man grob der <.a name="alltagsroute-6">Alltagsroute <.icon>6</.icon></.a>, welche mit Radwegpflaster und Asphalt ausgebaut ist. Hier dürfte es am ehesten Winterdienst geben.</p>
    <p>Ab dem <.m lat="53.57474" lon="10.05960" bounds="10.053359,53.573339,10.066225,53.578415" dir="forward">Mühlenteich</.m> hat man fast ausschließlich naturnahe Oberflächen: Grand oder feinen Schotter.</p>
    <p>Bei schönem Wetter sind die Wege gut besucht, hohe Geschwindigkeiten sind nicht möglich. An einigen Engstellen (z.B. <.m dir="forward" bounds="10.157231,53.599673,10.167305,53.603645" lat="53.6010" lon="10.1617">Klettenstieg</.m>) erfordert sogar einfacher Begegnungsverkehr besondere Vorsicht. Sei exzellent zu Anderen und steige ab, bevor es brenzlig wird.</p>

    <h4>Meinung</h4>
    <p>Die Route führt durch abswechslungsreiche Natur auf eben so abswechslungsreichen Wegen. Viele Orte an denen sie vorbeiführt laden aber auch zum Verweilen ein. Die Strecke ist selten langweilig und einen Ausflug wert. Allerdings sollte man Zeit mitbringen, denn die Wege sind voll, schmal oder beides – das tut dem Spaß aber keinen Abbruch.</p>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
