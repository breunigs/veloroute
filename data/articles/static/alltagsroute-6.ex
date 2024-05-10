defmodule Data.Article.Static.Alltagsroute6 do
  use Article.Static

  def id(), do: "6"
  def route_group(), do: :alltag
  def title(), do: "Alltagsroute 6"

  def color(), do: "#2a3283"

  def summary(),
    do:
      "Alltagsroute 6 führt vom Rathaus nach Volksdorf. Dort schließt der künftige Radschnellweg nach Ahrensburg an."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "6",
        direction: :forward,
        from: "Innenstadt",
        to: "Volksdorf",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Volksdorf",
        end_action: %{
          action: :play,
          route: Data.Article.Static.RSWAhrensburg,
          group: "rsw",
          direction: :forward
        },
        historic: %{
          "8d76804ff8f12c409b46f00888db3a52" => ~d[2024-05],
          "ccb2ebc8df134044c5b9356322b13853" => ~d[2023-07],
          "d0e15711298a41ecbefec751b3199a2f" => ~d[2022-05]
        },
        videos: [
          {"2024-05-09-vr6/GX017467", "00:00:08.942", :end},
          {"2024-05-09-vr6/GX017469", :start, :end},
          {"2024-05-09-vr6/GX017470", :start, :end},
          {"2024-05-09-vr6/GX017471", :start, "00:01:45.806"},
          {"2024-05-09-vr6/GX017487", "00:00:39.840", :end},
          {"2024-05-09-vr6/GX017488", :start, :end},
          {"2024-05-09-vr6/GX017489", :start, :end},
          {"2024-05-09-vr6/GX017490", :start, "00:00:02.603"},
          {"2024-05-09-vr6/GX017473", "00:00:02.603", :end},
          {"2024-05-09-vr6/GX017474", :start, :end},
          {"2024-05-09-vr6/GX017475", :start, :end},
          {"2024-05-09-vr6/GX017476", :start, :end},
          {"2024-05-09-vr6/GX017477", :start, :end},
          {"2024-05-09-vr6/GX017478", :start, "00:03:16.490"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "6",
        direction: :backward,
        from: "Volksdorf",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "aus Volksdorf in die Innenstadt",
        historic: %{
          "d5feef456ec8e50737cf7f87845ae177" => ~d[2024-05],
          "ad11718b6d75961f72c3841eeff084ad" => ~d[2023-07],
          "90460e690f3f5258649b1cdd9e3c4d75" => ~d[2022-05]
        },
        videos: [
          {"2024-05-09-vr6/GX017480", "00:01:29.405", :end},
          {"2024-05-09-vr6/GX017481", :start, :end},
          {"2024-05-09-vr6/GX017482", :start, :end},
          {"2024-05-09-vr6/GX017483", :start, :end},
          {"2024-05-09-vr6/GX017484", :start, :end},
          {"2024-05-09-vr6/GX017485", :start, :end},
          {"2024-05-09-vr6/GX017486", :start, :end},
          {"2024-05-09-vr6/GX017487", :start, "00:00:04.304"},
          {"2024-05-09-vr6/GX017492", "00:00:05.506", :end},
          {"2024-05-09-vr6/GX017493", :start, :end},
          {"2024-05-09-vr6/GX017494", :start, :end},
          {"2024-05-09-vr6/GX017495", :start, :end},
          {"2024-05-09-vr6/GX017496", :start, :end},
          {"2024-05-09-vr6/GX017497", :start, :end},
          {"2024-05-09-vr6/GX017498", :start, "00:00:33.567"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/426692/veloroute-6/"},
      {"Komoot Routenplaner: nach Volksdorf", "https://www.komoot.com/de-de/tour/204279360"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/227477"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="14" style="background-image: url(/images/route6.svg)">
          <.icon>6</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.990953,53.548317,9.998129,53.552594" lon={9.993833} lat={53.550924} dir="forward" ref="6" highlight="Rathausmarkt">Rathaus</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.988166,53.549291,10.035541,53.570707" lon={10.00817} lat={53.558734} dir="forward" ref="6">St. Georg</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR2</.icon>
          <.icon>5</.icon>
        </td>
        <td><.v bounds="10.002812,53.558085,10.04325,53.573375" lon={10.01933} lat={53.56491} dir="forward" ref="6">Hohenfelde</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="10.004607,53.559475,10.051498,53.577981" lon={10.021326} lat={53.565939} dir="forward" ref="6">Uhlenhorst</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>13</.icon>
        </td>
        <td><.v bounds="10.025387,53.564374,10.06104,53.579435" lon={10.04102} lat={53.571454} dir="forward" ref="6">Eilbek</.v></td>
      </tr>
      <tr>
        <td><.icon>FR3</.icon></td>
        <td><.v bounds="10.045757,53.570823,10.078093,53.582276" lon={10.057623} lat={53.575899} dir="forward" ref="6">Friedrichsberg</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="10.051075,53.574348,10.084605,53.592065" lon={10.070711} lat={53.582303} dir="forward" ref="6">Dulsberg</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="10.063273,53.583496,10.110909,53.602008" lon={10.08057} lat={53.58985} dir="forward" ref="6">Wandsbek-Gartenstadt</.v></td>
      </tr>
      <tr>
        <td><.icon>FR11</.icon></td>
        <td><.v bounds="10.090874,53.58803,10.128303,53.605867" lon={10.100132} lat={53.597102} dir="forward" ref="6">Trabrennbahn Farmsen</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>14</.icon>
        </td>
        <td><.v bounds="10.087759,53.585218,10.166152,53.626887" lon={10.119745} lat={53.605868} dir="forward" ref="6">Farmsen</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR2</.icon>
          <.icon>14</.icon>
        </td>
        <td><.v bounds="10.104972,53.621511,10.154019,53.64404" lon={10.128114} lat={53.629193} dir="forward" ref="6">Berne</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="10.132608,53.628871,10.179795,53.663148" lon={10.162516} lat={53.648981} dir="forward" ref="6">Volksdorf</.v></td>
      </tr>
      <tr>
        <td>
          <.icon name="rsw-ahrensburg" bounds="10.162031,53.649846,10.273755,53.688831" lon={10.164112} lat={53.651525} dir="backward">RSW</.icon>
        </td>
        <td>
          <.v bounds="10.162031,53.649846,10.273755,53.688831" lon={10.195135} lat={53.660762} dir="backward" ref="rsw-ahrensburg">Ahrensburg</.v>
        </td>
      </tr>
    </table>

    <p>Die Alltagsroute 6 (auch: Veloroute 6 oder Radroute 6) führt vom <.v bounds="9.982519,53.545759,10.013633,53.55792" lon={9.993806} lat={53.55096} dir="forward" ref="5" highlight="Rathausmarkt">Rathaus</.v> nach <.v bounds="10.132608,53.628871,10.179795,53.663148" lon={10.162516} lat={53.648981} dir="forward" ref="6">Volksdorf</.v>. Dort schließt nahtlos die  <.a name="rsw-ahrensburg">Radroute Plus (Radschnellweg) nach Ahrensburg</.a> an.</p>

    <p>Auf dem Weg dorthin folgt die Route zunächst der <.v bounds="9.977257,53.549596,10.031798,53.572229" lon={10.010782} lat={53.559773} dir="forward" ref="6" highlight="An der Alster,Ballindamm">Ostseite der Alster</.v> und dem <.v bounds="10.010748,53.562984,10.07377,53.583406" lon={10.041073} lat={53.571486} dir="forward" ref="6">Eilbekkanal</.v>.</p>

    <p>Ab <.v bounds="10.050153,53.568718,10.082234,53.588466" lon={10.057662} lat={53.575983} dir="forward" ref="6">Friedrichsberg</.v> knickt die Route nach Nordosten ab und durchquert die Stadtteile <.v bounds="10.062912,53.573671,10.119932,53.59987" lon={10.079754} lat={53.589814} dir="forward" ref="6">Wandsbek-Gartenstadt</.v>, <.v bounds="10.087759,53.585218,10.166152,53.626887" lon={10.119745} lat={53.605868} dir="forward" ref="6">Farmsen</.v> und <.v bounds="10.104972,53.621511,10.154019,53.64404" lon={10.128114} lat={53.629193} dir="forward" ref="6">Berne</.v>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Wege sind größtenteils befestigt und allwettertauglich. Es gibt zwei Stellen mit feinem Schotter (Grand), die bei Regen/Unwetter problematisch werden können:</p>
    <ul>
      <li><.v bounds="10.021435,53.56428,10.032259,53.56829" lon={10.026001} lat={53.566387} dir="forward" ref="6">Kuhmühlenteichpark</.v> – empfohlene Umfahrung via <.v bounds="10.019299,53.565626,10.027653,53.568591" lon={10.027295} lat={53.567034} dir="backward" ref="6">Immenhof</.v> und <.a name="alltagsroute-5">Alltagsroute 5</.a>.</li>
      <li><.v bounds="10.128147,53.630148,10.15831,53.644473" lon={10.142944} lat={53.638431} dir="forward" ref="6">Saselheider Graben</.v> – empfohlene Umfahrung via <.v bounds="10.119964,53.627351,10.159861,53.643268" lon={10.147892} lat={53.634974} dir="forward" ref="FR2">Berner Heerweg</.v>.</li>
    </ul>

    <h4>Meinung</h4>
    <p>Mittlerweile stehen auf der Route zum großen Teil eigene Spuren oder Fahrradstraßen zur Verfügung. Leider fehlt hier häufig eine echte Trennung vom KFZ-Verkehr, etwa durch Bordsteine. Abgesehen von den noch nicht ausgebauten Abschnitten gibt es vor allem punktuell Probleme:</p>

    <ul>
      <li><.v bounds="10.022934,53.564165,10.036927,53.570735" lon={10.031187} lat={53.56686} dir="backward" ref="6" highlight="Immenhof">Wochenmarkt Immenhof</.v> – Vollsperrung der Route an Markttagen, Flohmärkten u.ä. im Immenhof. Für die <.v bounds="10.028057,53.56573,10.033558,53.56855" lon={10.031508} lat={53.566904} dir="backward" ref="6" highlight="Lerchenfeld">B5 Lerchenfeld</.v> würde das auch niemand ernsthaft erwägen.</li>
      <li><.v bounds="10.111165,53.616996,10.131178,53.624544" lon={10.11935} lat={53.621553} dir="backward" ref="14">An der Berner Au</.v> ist eine Spielstraße mit Schrittgeschwindigkeit. Für den Alltagsverkehr unangebracht.</li>
      <li>Missglückte Umgestaltung am <.v bounds="10.141889,53.64304,10.171415,53.654868" lon={10.159225} lat={53.646124} dir="forward" ref="6">Eulenkrug</.v>. In beide Richtungen wird man für wenige Meter in den gefährlichen Autoverkehr geschickt, nur damit KFZ auch weiterhin links in den <.v bounds="10.156766,53.645127,10.163563,53.64786" lon={10.160348} lat={53.646917} dir="forward" ref="6">Uppenhof</.v> abbiegen können.</li>
    </ul>

    <p>Insgesamt macht die Route trotzdem eine gute Figur.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
