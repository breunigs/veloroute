defmodule Data.Article.Static.Freizeitroute4 do
  use Article.Static

  def id(), do: "FR4"
  def route_group(), do: :freizeit
  def title(), do: "Billeradweg (FR4)"

  def color(), do: "#006106"

  def summary(),
    do: "Freizeitroute 4 führt entlang der Bille zur Altmannbrücke"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        fade: nil,
        group: "Billeradweg",
        direction: :forward,
        from: "Altmannbrücke",
        to: "Bergedorfer Gehölz",
        parent_ref: __MODULE__,
        text: "entlang der Bille ins Bergedorfer Gehölz",
        videos: [
          {"2021-04-25-freizeitroute4/GX011378", :start, "00:01:02.562"},
          {"2021-04-25-freizeitroute4/GX011379", :start, :end},
          {"2021-04-25-freizeitroute4/GX011380", :start, :end},
          {"2021-04-25-freizeitroute4/GX011381", :start, "00:01:01.895"},
          {"2021-04-25-freizeitroute4/GX011381", "00:01:06.633", :end},
          {"2021-04-25-freizeitroute4/GX011382", :start, :end},
          {"2021-04-25-freizeitroute4/GX011383", :start, "00:00:04.338"},
          {"2021-04-25-freizeitroute4/GX011384", :start, :end},
          {"2021-04-25-freizeitroute4/GX011385", :start, :end},
          {"2021-04-25-freizeitroute4/GX011386", :start, :end},
          {"2021-04-25-freizeitroute4/GX011387", :start, "00:01:37.164"},
          {"2021-04-25-freizeitroute4/GX011388", "00:00:09.109", "00:02:54.574"},
          {"2021-04-25-freizeitroute4/GX011388", "00:03:11.825", :end},
          {"2021-04-25-freizeitroute4/GX011389", :start, :end},
          {"2021-04-25-freizeitroute4/GX011390", :start, :end},
          {"2021-04-25-freizeitroute4/GX011391", :start, :end},
          {"2021-04-25-freizeitroute4/GX011392", :start, :end},
          {"2021-04-25-freizeitroute4/GX011393", :start, "00:00:09.276"},
          {"2021-04-25-freizeitroute4/GX011394", "00:00:00.467", "00:02:27.214"}
        ]
      },
      %Video.Track{
        fade: nil,
        group: "Billeradweg",
        direction: :backward,
        from: "Bergedorfer Gehölz",
        to: "Altmannbrücke",
        parent_ref: __MODULE__,
        text: "entlang der Bille in die Innenstadt",
        videos: [
          {"2021-04-25-freizeitroute4/GX011394", "00:03:07.054", "00:03:52.899"},
          {"2021-04-25-freizeitroute4/GX011395", "00:00:01.902", :end},
          {"2021-04-25-freizeitroute4/GX011396", :start, :end},
          {"2021-04-25-freizeitroute4/GX011397", :start, :end},
          {"2021-04-25-freizeitroute4/GX011398", :start, :end},
          {"2021-04-25-freizeitroute4/GX011399", :start, "00:00:26.159"},
          {"2021-04-25-freizeitroute4/GX011400", "00:00:00.901", :end},
          {"2021-04-25-freizeitroute4/GX011401", :start, "00:04:34.908"},
          {"2021-04-25-freizeitroute4/GX021401", "00:02:55.675", :end},
          {"2021-04-25-freizeitroute4/GX031401", :start, :end},
          {"2021-04-25-freizeitroute4/GX011402", :start, :end},
          {"2021-04-25-freizeitroute4/GX011403", :start, :end},
          {"2021-04-25-freizeitroute4/GX011404", :start, :end},
          {"2021-04-25-freizeitroute4/GX011405", :start, :end},
          {"2021-04-25-freizeitroute4/GX011406", :start, "00:00:13.881"}
        ]
      },
      %Video.Track{
        fade: nil,
        group: "Walter-Hammer-Weg",
        direction: :forward,
        from: "",
        to: "",
        parent_ref: __MODULE__,
        text: "Walter-Hammer-Weg Richtung Osten (Nebenstrecke FR4)",
        videos: [
          {"2021-04-25-freizeitroute4/GX011401", "00:04:34.941", :end},
          {"2021-04-25-freizeitroute4/GX021401", :start, "00:01:16.743"}
        ]
      },
      %Video.Track{
        fade: nil,
        group: "Walter-Hammer-Weg",
        direction: :backward,
        from: "",
        to: "",
        parent_ref: __MODULE__,
        text: "Walter-Hammer-Weg Richtung Westen (Nebenstrecke FR4)",
        videos: [
          {"2021-04-25-freizeitroute4/GX021401", "00:01:18.111", "00:02:55.675"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/radtour/6294594/radtour-city-geesthang-boberger-niederung-bergedorf/"},
      {"Komoot Routenplaner: entlang der Bille", "https://www.komoot.de/tour/227476622"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/223231"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Freizeitroute 4 – Billeradweg <.icon>FR4</.icon></h3>
    <span class="updated">Länge rund 21km</span>
    <p>Man beginnt <.m bounds="10.004201,53.549656,10.010574,53.554563" lon="10.009" lat="53.550662" dir="forward">südlich des Hauptbahnhofs</.m> und folgt zunächst den Straßen entlang der Bahntrasse. Am <.m bounds="10.02236,53.551986,10.028696,53.554641" lon="10.024741" lat="53.553585" dir="forward">Berliner Tor</.m> wechselt man auf dem Grünstreifen oberhalb der U2/U4 bis zur <.m bounds="10.064532,53.552192,10.070336,53.554953" lon="10.065094" lat="53.554617" dir="forward">Station Rauhes Haus</.m>. Ab hier gelangt man über Treppen oder den Fahrstuhl in der U-Bahnstation hinunter zur Hammer Landstraße und von dort in <.m bounds="10.067029,53.545846,10.082746,53.553467" lon="10.070821" lat="53.55043" dir="forward">Kleingärten</.m>.</p>

    <p>Nach einem kurzen Stück Industriegebiet ist man an der <.m bounds="10.070821,53.535759,10.106986,53.55043" lon="10.098308" lat="53.538287" dir="forward">Bille</.m> angelangt und folgt ihr durch die <.m bounds="10.070821,53.498738,10.167733,53.55043" lon="10.129413" lat="53.51485" dir="forward">Boberger Niederung</.m> bis nach <.m bounds="10.070821,53.486466,10.215925,53.55043" lon="10.209758" lat="53.490112" dir="forward">Bergedorf</.m>. Das Ziel der Tour ist das <.m bounds="10.070821,53.488571,10.248662,53.55043" lon="10.2341" lat="53.496215" dir="forward">Bergedorfer Gehölz</.m>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und einige Abbiegungen sind kaum erkennbar. Ein Navi ist daher hilfreich, aber nicht unbedingt notwendig. Die Streckenführung ist noch einfach genug sie sich mit etwas Vorbereitung zu merken.</p>

    <h4>Befahrbarkeit</h4>
    <p>Bis <.m bounds="10.070821,53.511133,10.14456,53.55043" lon="10.133133" lat="53.517008" dir="forward">Anfang der Boberger Niederung</.m> sind die Wege durchgehend befestigt. Wer über die <.m bounds="10.070821,53.511133,10.14456,53.55043" lon="10.134525" lat="53.516213" dir="forward">Nebenroute entlang des Walter-Hammer-Wegs</.m> abkürzt kann noch etwas länger auf Asphalt fahren, bevor die naturnahen Wege (Trampelpfade, Grand) den Hauptteil stellen. Die stadtnahen Wege in Bergedorf sind ebenfalls befestigt.</p>
    <p>Es gibt einige Stellen an denen Überholen nicht möglich ist, insbesondere auf der <.m bounds="10.070821,53.511133,10.14456,53.55043" lon="10.134525" lat="53.516213" dir="forward">Nebenroute entlang des Walter-Hammer-Wegs</.m> ist dies kaum möglich. Sei exzellent zu Anderen und steige an diesen Stellen ab, bevor es eng wird. Insgesamt kommt man aber gut und weitgehend ampelfrei durch.</p>

    <h4>Meinung</h4>
    <p>Die Route ist einen Ausflug wert. Der erste Streckenabschnitt um die <.m bounds="10.006037,53.548808,10.070821,53.554946" lon="10.012841" lat="53.549856" dir="forward">Norderstraße</.m> lohnt sich jedoch nicht. Es ist besser hier gleich der <.a href="/alltagsroute-8">Alltagsroute <.icon>8</.icon></.a> zu folgen. Alternativ kann man auch von der Alster den <.m bounds="10.010896,53.552599,10.026937,53.561695">Grünzug Lohmühlenstraße</.m> bis zum Berliner Tor nutzen.</p>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
