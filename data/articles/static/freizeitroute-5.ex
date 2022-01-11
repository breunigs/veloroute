defmodule Data.Article.Static.Freizeitroute5 do
  use Article.Static

  def id(), do: "FR5"
  def route_group(), do: :freizeit
  def title(), do: "Vier und Marschlande (FR5)"

  def color(), do: "#006106"

  def summary(),
    do: "Freizeitroute 5 führt durch die Vier- und Marschlande nach Borghorst"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        fade: :none,
        group: "Vier und Marschlande",
        direction: :forward,
        from: "Hauptbahnhof",
        to: "Besenhorster Sandberge",
        parent_ref: __MODULE__,
        text: "vom Hauptbahnhof nach Borghorst",
        videos: [
          {"2021-06-27-veloroute9/GX012024", "00:00:31.999", :end},
          {"2021-06-27-veloroute9/GX012025", :start, :end},
          {"2021-06-27-veloroute9/GX012026", :start, "00:00:11.612"},
          {"2021-04-03-freizeitroute-5-realtime/GX011113.MP4_time_lapse.mkv", :start, :end},
          {"2021-04-03-freizeitroute-5-realtime/GX011114.MP4_time_lapse.mkv", :start, :end},
          {"2021-04-03-freizeitroute-5-realtime/GX011115.MP4_time_lapse.mkv", :start, :end},
          {"2021-04-03-freizeitroute-5-realtime/GX011116.MP4_time_lapse.mkv", :start, :end},
          {"2021-04-03-freizeitroute-5-realtime/GX011117.MP4_time_lapse.mkv", :start, :end},
          {"2021-04-03-freizeitroute-5-realtime/GX021117.MP4_time_lapse.mkv", :start, :end},
          {"2021-04-03-freizeitroute-5-realtime/GX031117.MP4_time_lapse.mkv", :start, :end},
          {"2021-04-03-freizeitroute-5-realtime/GX041117.MP4_time_lapse.mkv", :start, :end},
          {"2021-04-03-freizeitroute-5-realtime/GX051117.MP4_time_lapse.mkv", :start,
           "00:00:27.661"},
          {"2021-04-03-freizeitroute-5-realtime/GX011118.MP4_time_lapse.mkv", "00:00:01.502",
           :end},
          {"2021-04-03-freizeitroute-5-realtime/GX021118.MP4_time_lapse.mkv", :start, :end},
          {"2021-04-03-freizeitroute-5-realtime/GX011119.MP4_time_lapse.mkv", "00:00:00.400",
           :end},
          {"2021-04-03-freizeitroute-5-realtime/GX021119.MP4_time_lapse.mkv", :start, :end},
          {"2021-04-03-freizeitroute-5-realtime/GX031119.MP4_time_lapse.mkv", :start, :end}
        ]
      },
      %Video.Track{
        fade: :none,
        group: "Vier und Marschlande",
        direction: :backward,
        from: "Besenhorster Sandberge",
        to: "Hauptbahnhof",
        parent_ref: __MODULE__,
        text: "von Borghorst zum Hauptbahnhof",
        videos: [
          {"2021-04-03-freizeitroute-5-realtime/GX011120.MP4_time_lapse.mkv", :start,
           "00:01:00.928"},
          {"2021-04-03-freizeitroute-5-realtime/GX011121.MP4_time_lapse.mkv", "00:00:00.434",
           :end},
          {"2021-04-03-freizeitroute-5-zeitraffer/GX011122", :start, :end},
          {"2021-04-03-freizeitroute-5-zeitraffer/GX011123", :start, :end},
          {"2021-04-03-freizeitroute-5-zeitraffer/GX011124", :start, :end},
          {"2021-04-03-freizeitroute-5-zeitraffer/GX011125", :start, :end},
          {"2021-04-03-freizeitroute-5-zeitraffer/GX011126", :start, :end},
          {"2021-04-03-freizeitroute-5-zeitraffer/GX021126", :start, :end},
          {"2021-04-03-freizeitroute-5-zeitraffer/GX011127", :start, :end},
          {"2021-04-03-freizeitroute-5-zeitraffer/GX011128", :start, "00:00:07.241"},
          {"2021-04-03-freizeitroute-5-zeitraffer/GX011129", :start, "00:00:15.048"},
          {"2021-04-17-freizeitrouten-6und-7/GX011307", "00:00:00.234", :end},
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
       "https://www.hamburg.de/radtour/6294596/radtour-city-elbpark-entenwerder-vier-und-marschlande/"},
      {"Komoot Routenplaner: durch die Vier- und Marschlande",
       "https://www.komoot.de/tour/227477342"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/8847599"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Freizeitroute 5 – Vier- und Marschlande <.icon>FR5</.icon></h3>
    <span class="updated">Länge rund 35km</span>

    <p>Beginnend am <.m bounds="9.993132,53.549269,10.01548,53.556036" dir="forward" lat="53.5516" lon="10.0056">Hauptbahnhof</.m> folgt man grob der <.m lat="53.5449" lon="10.0172" bounds="9.995601,53.536759,10.048165,53.552678" dir="forward">Amsinckstraße</.m> um über den <.m bounds="10.020288,53.527317,10.050496,53.536469" lat="53.53341" lon="10.03093" dir="forward">Entenweder Park</.m> auf den <.m dir="forward" lat="53.5203" lon="10.0571" bounds="9.998449,53.497936,10.10166,53.529217">Kaltehofer Deich</.m> zu kommen. Ab jetzt ist die Tour bis auf wenige Ausnahmen autofrei.</p>

    <p>Nach Querung der <.m bounds="10.071488,53.496369,10.084494,53.501247" dir="forward" lat="53.4996" lon="10.0783">Dove Elbe</.m> folgt man dem <.m lat="53.4926" lon="10.0770" dir="forward" bounds="10.008422,53.411938,10.303531,53.501498">Marschbahndamm</.m>. Entlang dieser ehemaligen Bahntrasse kommt man fast bis zum Ziel der Tour. <.m lat="53.4410" lon="10.3007" bounds="10.293833,53.439739,10.327467,53.454259" dir="forward">Ab Borghorst</.m> teilt sich die Route, entweder man fährt weiter in Richtung <.m bounds="10.287802,53.453666,10.335029,53.474048" dir="forward" lat="53.4567" lon="10.3162">Escheburg</.m> wie im Video, oder man fährt über die <.m bounds="10.307092,53.435753,10.339602,53.44979">Besenhorster Sandberge</.m> nach Geesthacht.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist zwar nicht beschildert, aber durch ihre durchgängigen Wege ist ihr nach dem Innenstadtbereich leicht zu folgen. Ab dem <.m lat="53.5295" lon="10.0442" dir="forward" bounds="10.031863,53.523829,10.057375,53.534823">Sperrwerk Billwerder Bucht</.m> gibt es im Wesentlichen nur noch drei Stellen an denen man nicht geradeaus dem Weg folgt:</p>
    <ul>
      <li><.m bounds="10.068511,53.495066,10.085246,53.502282" dir="forward" lat="53.5000" lon="10.0785">Querung der Dove Elbe</.m></li>
      <li><.m lat="53.4135" lon="10.1824" bounds="10.176568,53.411341,10.188502,53.416497" dir="forward">Kehrtwende am ehemaligen Gleisdreieck</.m></li>
      <li><.m lat="53.4410" lon="10.3007" bounds="10.293833,53.439739,10.327467,53.454259" dir="forward">die letzten Meter ab Borghorst</.m></li>
    </ul>

    <h4>Befahrbarkeit</h4>
    <p>Man kommt auf dieser Tour gut und unterbrechungsfrei voran. Es gibt wenig Kreuzungen, die Führung ist klar und die Wege breit genug um problemlos an langsameren Ausflüglern vorbei zu kommen. Sollte es sich trotzdem mal stauen, sei bitte exzellent zu anderen und steige ab, bevor es brenzlig wird. Ein Regenschauer macht übrigens auch kein Problem, da man größtenteils auf Beton, Asphalt oder Pflaster fährt.</p>

    <h4>Meinung</h4>
    <p>Die Route ist hervorragend, da sie abseits vom Autolärm lange Strecken ohne Anhalten ermöglicht. Ihr Manko ist das sie vergleichsweise wenig abwechlungsreich ist bzw. kaum Sehenswürdigkeiten bietet.</p>

    <p>Einige Tipps:</p>
    <ul>
      <li>bis zum Entenweder Park ist die <.a href="/alltagsroute-9">Alltagsroute <.icon>9</.icon></.a> die bessere Wahl. Die <.m lat="53.5449" lon="10.0172" bounds="9.995601,53.536759,10.048165,53.552678" dir="forward">Amsinckstraße</.m> hat den Charakter einer innerstädtischen Autotrasse und bietet sonst wenig.</li>
      <li>In <.m bounds="10.165931,53.394212,10.192045,53.404031">Zollenspieker</.m> kann mittels Fähre die Elbseite gewechselt werden. Dazu am <.m lat="53.4135" lon="10.1824" bounds="10.176568,53.411341,10.188502,53.416497" dir="forward">Gleisdreieck</.m> geradeaus fahren.</li>
      <li>Für Rennrad-Fahrten ist der Hauptdeich direkt an der Elbe die angenehmere Strecke, da hier auch höhere Geschwindigkeiten möglich sind.</li>
    </ul>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
