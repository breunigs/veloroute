defmodule Data.Article.Static.Freizeitroute1 do
  use Article.Static

  def id(), do: "FR1"
  def route_group(), do: :freizeit
  def name(), do: "freizeitroute-1"
  def title(), do: "Alsterradweg (FR1)"

  def color(), do: "#006106"

  def summary(),
    do: "Freizeitroute 1 führt entlang der Alster zum Duvenstedter Brook"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        group: "Alsterradweg",
        direction: :forward,
        from: "Binnenalster",
        to: "Duvenstedter Brook",
        parent_ref: __MODULE__,
        text: "entlang der Alster zum Duvenstedter Brook",
        videos: [
          {"2021-07-26-missing-parts-fr2-fr3/GX012415", :start, "00:00:11.178"},
          {"2021-09-26-velo6-rsw-ahrensburg/GX012988", "00:00:04.972", "00:00:06.039"},
          {"2021-09-26-velo6-rsw-ahrensburg/GX012983", "00:01:17.811", "00:01:35.762"},
          {"2021-05-29-freizeitroute1/GX011470", "00:00:24.524", :end},
          {"2021-05-29-freizeitroute1/GX011471", :start, "00:00:00.634"},
          {"2021-05-29-freizeitroute1/GX011473", :start, "00:00:15.349"},
          {"2021-05-29-freizeitroute1/GX011474", "00:00:26.860", :end},
          {"2021-05-29-freizeitroute1/GX011475", :start, :end},
          # TODO: maybe cut part where I go wrong?,
          {"2021-05-29-freizeitroute1/GX011476", :start, :end},
          {"2021-05-29-freizeitroute1/GX011477", "00:00:38.739", "00:03:21.968"},
          {"2021-05-29-freizeitroute1/GX011478", :start, "00:00:03.403"},
          {"2021-05-29-freizeitroute1/GX011479", "00:00:15.115", :end},
          {"2021-05-29-freizeitroute1/GX011480", :start, :end},
          {"2021-05-29-freizeitroute1/GX011481", :start, "00:00:01.301"},
          {"2021-05-29-freizeitroute1/GX011483", "00:00:06.874", :end},
          {"2021-05-29-freizeitroute1/GX011484", :start, "00:00:16.283"},
          {"2021-05-29-freizeitroute1/GX011484", "00:00:43.810", "00:01:44.605"},
          {"2021-05-29-freizeitroute1/GX011485", "00:00:03.203", "00:03:27.708"}
        ]
      },
      %Video.Track{
        group: "Alsterradweg",
        direction: :backward,
        from: "Duvenstedter Brook",
        to: "Binnenalster",
        parent_ref: __MODULE__,
        text: "entlang der Alster in die Innenstadt",
        videos: [
          {"2021-05-29-freizeitroute1/GX011485", "00:03:29.276", :end},
          {"2021-05-29-freizeitroute1/GX011487", :start, "00:01:17.678"},
          {"2021-05-29-freizeitroute1/GX011489", "00:01:13.040", "00:01:46.707"},
          {"2021-05-29-freizeitroute1/GX011490", "00:00:01.134", :end},
          {"2021-05-29-freizeitroute1/GX011491", :start, :end},
          {"2021-05-29-freizeitroute1/GX011492", :start, "00:01:21.214"},
          {"2021-05-29-freizeitroute1/GX011493", "00:00:12.880", :end},
          {"2021-05-29-freizeitroute1/GX011494", :start, :end},
          {"2021-05-29-freizeitroute1/GX021494", :start, :end},
          {"2021-05-29-freizeitroute1/GX011495", :start, :end},
          {"2021-05-29-freizeitroute1/GX011496", :start, :end},
          {"2021-05-29-freizeitroute1/GX011497", :start, :end},
          {"2021-05-29-freizeitroute1/GX011498", :start, :end},
          {"2021-05-29-freizeitroute1/GX011499", :start, :end},
          {"2021-05-29-freizeitroute1/GX011500", :start, "00:02:03.423"},
          {"2021-09-26-velo6-rsw-ahrensburg/GX012984", "00:00:02.736", "00:00:21.955"},
          {"2021-09-26-velo6-rsw-ahrensburg/GX012988", "00:00:08.442", "00:00:13.046"},
          {"2021-07-26-missing-parts-fr2-fr3/GX012414", "00:00:10.844", :end}
        ]
      }
    ]

  def links() do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/radtour/6294566/radtour-city-alster-wohlsdorfer-wald-duvenstedter-brook/"},
      {"Komoot Routenplaner: entlang der Alster", "https://www.komoot.de/tour/253561892"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/9040865"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Freizeitroute 1 – Alsterradweg <.icon>FR1</.icon></h3>
    <span class="updated">Länge rund 32km</span>

    <p>Die Fahrt beginnt an der <.m bounds="9.994139,53.552351,9.99759,53.557223">Binnenalster</.m> und folgt der Alster dann flussaufwärts fast bis zur Landesgrenze. Bei <.m bounds="10.094746,53.670325,10.163218,53.707857">Ohlstedt</.m> knickt sie jedoch in den <.m bounds="10.121815,53.702633,10.214657,53.747276">Duvenstedter Brook</.m> ab und endet dort.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und muss daher nach Gefühl oder mit Navi gefolgt werden. Die Routingdaten dazu sind unten verlinkt. Da ich mich manchmal selbst verfahren habe, stimmen Video und eingezeichnete Strecke nicht immer überein. Ebenso finden sich je nach Quelle und Jahr leicht andere Führungen, die jedoch alle gleich gut sind. Ausnahme: die „Nebenroute“ leitet durch die Wohngebiete <.m bounds="10.077008,53.668168,10.122618,53.684726">Mellingstedt</.m> und <.m bounds="10.088551,53.697803,10.129147,53.71253">Duvenstedt</.m> statt dem Alstertal zu folgen und ist entsprechend deutlich weniger im Grünen.</p>

    <h4>Befahrbarkeit</h4>
    <p>Der Belag ist meistens plattgedrückter Schotter („Grand“) und daher nur bedingt regenfest. Bis Winterhude folgt die Strecke der <.a href="/alltagsroute-4">Alltagsroute <.icon>4</.icon></.a> und sollte daher auch im Winter nutzbar sein. Zwischen der <.a lat="53.60584" lon="9.99573" dir="forward" route="FR1">Wilhelm-Metzger-Straße</.a> und der <.a lat="53.61166" lon="10.00866" dir="forward" route="FR1">Hindenburgstraße</.a> gibt es viel Hindernisse die Lastenrädern oder E-Bikes zu schaffen machen. In diesem Abschnitt ist ein Ausweichen über die <.icon>4</.icon> empfehlenswert.</p>

    <p>Auf der Strecke selbst gibt es viel Fußverkehr und zahlreiche Engstellen. Sei exzellent zu Anderen und steige ab, bevor es brenzlig wird.</p>

    <h4>Meinung</h4>
    <p>Der Alsterradweg macht Spaß und ist gut zu befahren, sofern man von den Hindernissen um <.m bounds="9.993629,53.604893,10.006302,53.612092">Alsterdorf</.m> herum absieht. Eine Ausschilderung gerade im Alstertal wäre aber wünschenswert um sich auch ohne Navi nicht zu verfahren.</p>


    <h3>Externe Links</h3>
    <.structured_links gpx="yes"/>
    """
  end
end
