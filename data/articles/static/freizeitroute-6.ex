defmodule Data.Article.Static.Freizeitroute6 do
  use Article.Static

  def id(), do: "FR6"
  def route_group(), do: :freizeit
  def title(), do: "Elbbrücken (FR6)"

  def color(), do: "#006106"

  def summary(),
    do: "Die Radtour „Elbbrücken“ führt über Wilhelmsburg in die Harburger Berge"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 1,
        group: "Elbbrücken",
        direction: :forward,
        from: "Hauptbahnhof",
        to: "Harburger Berge",
        parent_ref: __MODULE__,
        text: "vom Hauptbahnhof in die Harburger Berge",
        videos: [
          {"2021-06-27-veloroute9/GX012024", "00:00:31.999", :end},
          {"2021-06-27-veloroute9/GX012025", :start, :end},
          {"2021-06-27-veloroute9/GX012026", :start, "00:00:11.612"},
          {"2021-04-03-freizeitroute-5-realtime/GX011113.MP4_time_lapse.mkv", :start, :end},
          {"2021-04-03-freizeitroute-5-realtime/GX011114.MP4_time_lapse.mkv", :start, :end},
          {"2021-04-03-freizeitroute-5-realtime/GX011115.MP4_time_lapse.mkv", :start, :end},
          {"2021-04-03-freizeitroute-5-realtime/GX011116.MP4_time_lapse.mkv", :start,
           "00:00:14.848"},
          {"2021-04-17-freizeitrouten-6und-7/GX011261", "00:00:01.635", :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011262", :start, "00:00:26.660"},
          {"2021-07-18-whburg-and-on/GX012389", "00:00:26.360", :end},
          {"2021-07-18-whburg-and-on/GX012390", :start, :end},
          {"2021-07-18-whburg-and-on/GX012391", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011264", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011265", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011266", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011267", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011268", :start, "00:00:47.314"},
          {"2021-07-03-veloroute10/GX012083", "00:00:00.267", "00:00:04.071"},
          {"2021-04-17-freizeitrouten-6und-7/GX011268", "00:00:51.752", :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011269", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011270", :start, "00:00:01.435"},
          {"2021-04-17-freizeitrouten-6und-7/GX011273", "00:00:22.189", "00:01:06.199"},
          {"2021-04-17-freizeitrouten-6und-7/GX011273", "00:01:12.973", "00:02:56.743"},
          {"2021-04-17-freizeitrouten-6und-7/GX011274", "00:00:07.040", "00:00:38.038"},
          {"2021-04-17-freizeitrouten-6und-7/GX011275", "00:00:08.675", "00:01:34.695"},
          {"2021-04-17-freizeitrouten-6und-7/GX011275", "00:01:51.278", "00:02:12.733"}
        ]
      },
      %Video.Track{
        renderer: 1,
        group: "Elbbrücken",
        direction: :backward,
        from: "Harburger Berge",
        to: "Hauptbahnhof",
        parent_ref: __MODULE__,
        text: "von den Harburger Bergen zum Hauptbahnhof",
        videos: [
          {"2021-04-17-freizeitrouten-6und-7/GX011275", "00:02:33.186", :end},
          {"2021-04-17-freizeitrouten-6und-7/GX021275", :start, "00:02:18.772"},
          {"2021-04-17-freizeitrouten-6und-7/GX011273", "00:00:07.841", "00:00:18.151"},
          {"2021-04-17-freizeitrouten-6und-7/GX011271", "00:00:07.074", "00:00:09.243"},
          {"2021-04-17-freizeitrouten-6und-7/GX011278", "00:00:02.870", :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011300", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011301", :start, "00:00:15.749"},
          {"2021-07-03-veloroute10/GX012082", "00:00:58.792", "00:01:07.000"},
          {"2021-04-17-freizeitrouten-6und-7/GX011301", "00:00:25.092", "00:01:02.029"},
          {"2021-04-17-freizeitrouten-6und-7/GX011301", "00:01:19.012", :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011302", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011303", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011304", :start, :end},
          {"2021-07-18-whburg-and-on/GX012396", :start, :end},
          {"2021-07-18-whburg-and-on/GX012397", :start, "00:00:04.705"},
          {"2021-07-03-veloroute10/GX012091", "00:00:10.410", "00:00:24.024"},
          {"2021-04-17-freizeitrouten-6und-7/GX011305", "00:00:14.314", :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011306", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011307", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011308", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011309", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011310", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011311", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011312", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011313", :start, "00:00:14.114"},
          {"2021-06-27-veloroute9/GX012038", "00:00:04.805", :end},
          {"2021-06-27-veloroute9/GX012039", :start, :end},
          {"2021-06-27-veloroute9/GX012040", :start, "00:00:01.835"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/radtour/6294576/radtour-city-wilhelmsburg-harburger-stadtpark/"},
      {"Komoot Routenplaner: über die Elbbrücken", "https://www.komoot.de/tour/227478472"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/8847600"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Freizeitroute 6 – Elbbrücken <.icon>FR6</.icon></h3>
    <span class="updated">Länge rund 21km</span>
    <p>Beginnend am <.m bounds="9.993132,53.549269,10.01548,53.556036" dir="forward" lat="53.5516" lon="10.0056">Hauptbahnhof</.m> folgt man grob der <.m lat="53.5449" lon="10.0172" bounds="9.995601,53.536759,10.048165,53.552678" dir="forward">Amsinckstraße</.m> um über die <.m dir="forward" lat="53.5346" lon="10.0282" bounds="10.018778,53.527385,10.033289,53.536906">Elbbrücken</.m> auf die <.m bounds="10.009405,53.52204,10.032666,53.532834" lon="10.023808" lat="53.530213" dir="forward">Veddel</.m> zu gelangen.</p>
    <p>Von dort geht es weiter auf <.m bounds="9.96971,53.47396,10.049128,53.525687" lon="9.991852" lat="53.504458" dir="forward">Wilhelmsburg</.m> und durch <.m bounds="9.972304,53.450751,9.994229,53.465226" lon="9.978722" lat="53.461352" dir="forward">Harburgs Zentrum</.m>. Der <.m bounds="9.967672,53.439201,9.983253,53.452214" lon="9.978441" lat="53.440041" dir="forward" ref="10">Engelbek</.m> folgend erreicht man schließlich die <.m bounds="9.864695,53.383146,10.003912,53.439215" lon="9.97499" lat="53.421967" dir="forward">Landsgrenze kurz vor den Harburger Bergen</.m>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und stellenweise ist die Führung nicht ersichtlich. Ein Navi ist daher empfehlenswert.</p>

    <h4>Befahrbarkeit</h4>
    <p>Zu einem großen Teil ist die Route befestigt, also asphaltiert oder gepflastert. Ausnahmen sind der leicht umfahrbare <.m bounds="9.9775,53.454145,9.982341,53.45807" lon="9.980286" lat="53.456916" dir="forward">alte Harburger Friedhof</.m> und eine <.m bounds="9.981074,53.431467,9.984331,53.435518" lon="9.98204" lat="53.433727" dir="forward">kleinere Grünfläche</.m> gegen Ende der Tour.</p>
    <p>Viele der Grünanlagen sind stark besucht, sodass hohe Geschwindigkeiten nicht möglich sind. Zu Stau kommt es selten, und falls doch: sei exzellent zu anderen und steige ab, bevor es eng wird.</p>

    <h4>Meinung</h4>
    <p>Die Tour hat einige schöne Stellen, gerade ab Harburgs Innenstadt ist man fast ausschließlich im Grünen unterwegs. Auf den Elbinseln und in Hamburgs Innenstadt ist die Streckenführung jedoch sehr autolastig und weniger empfehlenswert. Hier merkt man, das die Freizeitroute geplant wurde als die Alltagsrouten noch nicht brauchbar ausgebaut waren.</p>

    <p>Eine ähnliche, aber ruhigere Führung ist grob: <.a href="/alltagsroute-9">Alltagsroute <.icon>9</.icon></.a> bis Elbbrücken; Veddel wie gehabt; auf Wilhelmsburg stattdessen der <.a href="/alltagsroute-11">Alltagsroute <.icon>11</.icon></.a> folgen; Rest wie gehabt.</p>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
