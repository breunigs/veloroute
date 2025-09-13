defmodule Data.Article.Static.BrBergedorfA do
  use Article.Static

  def id(), do: "br-bergedorf-a"
  def display_id(), do: "BA"

  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Bergedorf – A – Ost/West"

  def color(), do: "#b482ff"
  def color_faded(), do: "#dac2ff"

  def summary(),
    do:
      "Die Bezirksroute A in Bergedorf verläuft in Ost/West-Richtung und führt vom Eichbaumsee über Bergedors Zentrum zum Brookdeich in Richtung Geesthacht."

  def tags(), do: [id(), display_id(), "br-bergedorf"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "ostwest",
        direction: :forward,
        from: "Eichbaumsee",
        to: "Brookdeich",
        parent_ref: __MODULE__,
        text: "Bezirksroute Bergedorf A → Osten",
        end_action: :reverse,
        historic: %{
          "05802547df6cc0c4ec7966172d54803a" => ~d[2025-08]
        },
        videos: [
          {"2025-08-16-br-berge/GX018590", "00:01:43.413", :end},
          {"2025-08-16-br-berge/GX018591", :start, "00:00:10.114"},
          {"2025-08-16-br-berge/GX018592", "00:00:03.185", "00:00:21.948"},
          {"2025-08-16-br-berge/GX018593", "00:00:36.506", :end},
          {"2025-08-16-br-berge/GX018594", :start, "00:00:04.629"},
          {"2025-08-16-br-berge/GX018594", "00:00:30.422", "00:00:59.635"},
          {"2025-08-16-br-berge/GX018596", :start, "00:00:56.355"},
          {"2025-08-16-br-berge/GX018597", "00:00:01.401", "00:00:05.812"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "ostwest",
        direction: :backward,
        from: "Brookdeich",
        to: "Eichbaumsee",
        parent_ref: __MODULE__,
        text: "Bezirksroute Bergedorf B → Westen",
        end_action: :reverse,
        historic: %{
          "576e9faec5bfb507548e27e211eb02df" => ~d[2025-08]
        },
        videos: [
          {"2025-08-16-br-berge/GX018597", "00:00:05.812", "00:01:21.815"},
          {"2025-08-16-br-berge/GX018601", "00:01:06.466", "00:01:23.517"},
          {"2025-08-16-br-berge/GX018601", "00:01:25.819", :end},
          {"2025-03-02-bergedorf/GX018398", :start, "00:00:02.669"},
          {"2025-08-16-br-berge/GX018607", "00:00:01.268", "00:00:52.709"},
          {"2025-08-16-br-berge/GX018611", "00:00:04.754", "00:02:15.914"},
          {"2024-04-23-gr2/GX017267", "00:01:26.169", "00:01:34.376"},
          {"2025-08-16-br-berge/GX018611", "00:02:28.656", "00:02:57.110"},
          {"2025-08-16-br-berge/GX018612", :start, "00:00:18.760"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Ride With GPS Routenplaner", "https://ridewithgps.com/routes/52643555"},
      {"Bezirksrouten Bergedorf Zielnetz", ~d[2025-08],
       "https://suche.transparenz.hamburg.de/dataset/bezirksradrouten-hamburg-bergedorf-finales-zielnetz1"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Bezirksroute Bergedorf – Ost-West-Richtung <.icon>BA</.icon></h3>

    <p>Die als „A“ bezeichnete Route verbindet den <.v bounds="10.094097,53.480595,10.122192,53.492601" lon={10.113529} lat={53.485956} dir="forward" ref={@ref}>Eichbaumsee</.v> im Westen mit dem <.v bounds="10.2126,53.473708,10.244067,53.488451" lon={10.227971} lat={53.480391} dir="forward" ref={@ref}>Brookdeich</.v> im Osten. Dort soll sie an der Straße <.v bounds="10.2126,53.473708,10.244067,53.488451" lon={10.232214} lat={53.478772} dir="forward" ref={@ref}>Pollhof</.v> enden. An beiden Enden ist eine Weiterfahrt für Fernziele möglich:</p>
    <ul>
      <li>Richtung Innenstadt Hamburg via <.m bounds="10.071894,53.481163,10.119867,53.502256">Moorfleeter Deich</.m> und <.a name="radroute-22">Radroute 22</.a></li>
      <li>Richtung <.m bounds="10.231473,53.415824,10.420866,53.49126">Geesthacht</.m> mit der <.a name="rsw-geesthacht">gleichnamigen Radroute Plus</.a></li>
    </ul>

    <p>In Bergedorfs Zentrum soll die Route über den Straßenzug <.v bounds="10.199482,53.482528,10.218799,53.489793" lon={10.20802} lat={53.486345} dir="forward" ref={@ref}>Weidenbaumsweg / Stuhlrohrstraße / Dietrich-Schreyge-Straße / Rektor-Ritter-Straße</.v> führen. Sie ist damit eine Alternative zur etwas südlicheren Radroute Plus Geesthacht, die einmal am <.v bounds="10.197668,53.474669,10.235061,53.489934" lon={10.206024} lat={53.484876} dir="forward" ref="rsw-geesthacht">Sander Damm</.v> bis <.v bounds="10.197668,53.474669,10.235061,53.489934" lon={10.227513} lat={53.478811} dir="forward" ref="rsw-geesthacht">Schwarzer Weg</.v> verlaufen soll.</p>

    <h4>Speziell für diese Route</h4>
    <p>Vom Moorfleeter Deich kommend wird vorschlagen auf der <.v bounds="10.111623,53.483973,10.120674,53.491126" lon={10.11549} lat={53.486846} dir="forward" ref={@ref} highlight="Hans-Duncker-Straße">Autobahnbrücke (Hans-Duncker-Straße)</.v> beidseitige Radwege einzurichten und den Radverkehr nicht mehr über den gemeinsamen Geh- und Radweg unter der Brücke zu führen. Im <.v bounds="10.11198,53.483875,10.131822,53.495895" lon={10.122312} lat={53.490574} dir="forward" ref={@ref}>Mittleren Landweg</.v> sind keine Änderungen vorgesehen, der <.v bounds="10.121387,53.484915,10.15665,53.498188" lon={10.147111} lat={53.491582} dir="forward" ref={@ref}>Weg auf dem Deich</.v> müsste stellenweise saniert werden.</p>

    <p>Auf dem Straßenzug <.v bounds="10.148136,53.485247,10.184544,53.49098" lon={10.169647} lat={53.488625} dir="forward" ref={@ref}>Walter-Rudolphi-Weg / Sophie-Schoop-Weg / Rahel-Varnhagen-Weg</.v> wird vorgeschlagen auf beiden Straßenseiten durchgängige Radwege einzurichten. Bisher ist nur der Radweg auf der Häuserseite durchgängig. An der <.v bounds="10.177815,53.482831,10.190107,53.489866" lon={10.182374} lat={53.485938} dir="forward" ref={@ref} highlight="Nettelnburger Landweg">Einmündung zum Nettelnburger Landweg</.v> werden zwei Varianten skizziert:</p>
    <ul>
      <li>vorhandenen Zweirichtungsradweg verbreitern</li>
      <li>eine weitere Querungsmöglichkeit und ein neuer Radweg an der Lärmschutzwand</li>
    </ul>

    <p>Ab hier teilt sich die Bezirksroute den Weg mit der <.a name="rsw-geesthacht">Radroute Plus Geesthacht</.a>. Dazu sind <.v bounds="10.187321,53.483926,10.203669,53.487841" lon={10.195302} lat={53.484925} dir="forward" ref={@ref}>zwei Lückenschlüsse</.v> notwendig, die als eigener Radweg ohne KFZ-Verkehr gedacht sind.</p>

    <p>Im <.v bounds="10.200537,53.484798,10.20402,53.487676" lon={10.202438} lat={53.486255} dir="forward" ref={@ref}>Weidenbaumsweg</.v> und in der <.v bounds="10.202582,53.486154,10.208234,53.488307" lon={10.20471} lat={53.487296} dir="forward" ref={@ref}>Stuhlrohrstraße</.v> selbst sind keine Änderungen vorgesehen, allerdings muss zum <.v bounds="10.202582,53.486154,10.208234,53.488307" lon={10.203436} lat={53.487643} dir="backward" ref={@ref} highlight="Weidenbaumsweg">Linksabbiegen in den Weidenbaumsweg</.v> noch eine Lösung gefunden werden.</p>

    <p>Um die Querung der <.v bounds="10.209135,53.485012,10.211314,53.486548" lon={10.209897} lat={53.485908} dir="forward" ref={@ref}>Vierlandenstraße</.v> zu erleichtern, sind <.ref>Mittelinseln</.ref> vorgesehen. Durch sie kann man die Straße in zwei Zügen queren und muss jeweils nur eine Fahrtrichtung beachten. Dies <.a name="2022-11-15-vierlandenstrasse">könnte bald umgesetzt</.a> werden.</p>

    <p>Der Entwurf schlägt vor, den <.v bounds="10.21137,53.482357,10.219622,53.485209" lon={10.214535} lat={53.48416} dir="forward" ref={@ref}>Brookdeich</.v> zu einer KFZ-Einbahnstraße zu machen. Zur besseren Erreichbarkeit könnte die <.v bounds="10.208746,53.483252,10.215246,53.486104" lon={10.212261} lat={53.484678} dir="forward" ref={@ref} highlight="Neuer Weg">Einmündung Neuer Weg</.v> zu einem Kreisverkehr umgebaut werden. An der <.v bounds="10.216998,53.480622,10.22395,53.483999" lon={10.220434} lat={53.482203} dir="forward" ref={@ref}>Brookkehre</.v> soll die Bezirskroute Vorfahrt erhalten.</p>

    <%= Data.Article.Shared.bezirksroute(:bergedorf) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
