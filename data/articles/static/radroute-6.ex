defmodule Data.Article.Static.Radroute6 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-6"
  def display_id(), do: "6"
  def title(), do: "Radroute 6"
  def color(), do: RouteColors.green1()

  def summary(),
    do:
      "Radroute 6 beginnt am Jungfernstieg und führt in nordöstlicher Richtung Ahrensburg. Sie durchquert die Stadteile Dulsberg, Farmsen und schließlich Volksdorf."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "6",
        direction: :forward,
        from: "Jungfernstieg",
        to: "Wulfsdorf",
        parent_ref: __MODULE__,
        text: "vom Jungfernstieg Richtung Ahrensburg",
        historic: %{
          "6a3c9cfcb48b57331b7297f080bb16b6" => ~d[2025-12],
          "5fa4e4b029fbdae606281e28b9abaa0d" => ~d[2025-09],
          "5ac8b67c5fa198f117ac0b47bd7e5f90" => ~d[2024-05]
        },
        videos: [
          {"2024-05-09-vr6/GX017469", "00:00:03.670", "00:00:35.035"},
          {"2025-12-30-hohenfelde/GX018702", "00:00:15.716", :end},
          {"2025-12-30-hohenfelde/GX018703", :start, "00:00:12.221"},
          {"2024-05-09-vr6/GX017471", "00:00:11.943", "00:01:40.739"},
          {"2024-05-09-vr6/GX017487", "00:00:34.299", "00:00:52.108"},
          {"2024-05-09-vr6/GX017488", :start, "00:00:02.236"},
          {"2024-05-09-vr6/GX017489", :start, "00:00:03.503"},
          {"2024-05-09-vr6/GX017490", :start, "00:00:01.201"},
          {"2024-05-09-vr6/GX017473", "00:00:00.934", "00:00:22.385"},
          {"2024-05-09-vr6/GX017474", :start, :end},
          {"2024-05-09-vr6/GX017475", :start, "00:00:36.996"},
          {"2024-05-09-vr6/GX017476", :start, :end},
          {"2024-05-09-vr6/GX017477", :start, "00:00:57.179"},
          {"2024-05-09-vr6/GX017478", :start, "00:03:15.529"},
          {"2023-07-08-vr6-rsw-ahr/GX010024", "00:02:23.877", "00:03:27.833"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "6",
        direction: :backward,
        from: "Wulfsdorf",
        to: "Jungfernstieg",
        parent_ref: __MODULE__,
        text: "aus Richtung Ahrensburg zum Jungfernstieg",
        historic: %{
          "db87aeef378727a4f7ca95bc6151a324" => ~d[2025-12],
          "cbbf449ce9d6c1c6bdf661a7e8bcf7ac" => ~d[2025-09],
          "dffe3495c553a4a2eb0e1349dc2e4f20" => ~d[2024-05]
        },
        videos: [
          {"2023-07-08-vr6-rsw-ahr/GX010033", "00:02:26.784", "00:03:24.964"},
          {"2024-05-09-vr6/GX017480", "00:01:29.172", "00:03:10.385"},
          {"2024-05-09-vr6/GX017481", "00:00:00.100", "00:02:46.601"},
          {"2024-05-09-vr6/GX017482", :start, "00:00:57.446"},
          {"2024-05-09-vr6/GX017483", :start, "00:00:02.302"},
          {"2024-05-09-vr6/GX017484", :start, "00:00:02.603"},
          {"2024-05-09-vr6/GX017485", :start, "00:00:33.994"},
          {"2024-05-09-vr6/GX017486", "00:00:00.267", "00:00:38.931"},
          {"2024-05-09-vr6/GX017487", :start, "00:00:02.902"},
          {"2024-05-09-vr6/GX017492", "00:00:03.837", "00:00:47.681"},
          {"2025-09-20-random/GX018642", "00:01:15.275", :end},
          {"2025-09-20-random/GX018643", :start, "00:00:06.154"},
          {"2024-05-09-vr6/GX017494", "00:00:05.171", "00:00:28.290"},
          {"2024-05-09-vr6/GX017495", "00:00:00.267", "00:00:06.940"},
          {"2025-12-30-hohenfelde/GX018705", "00:00:00.801", "00:00:28.221"},
          {"2025-02-25-nordost/GX018329", "00:00:53.434", :end},
          {"2025-02-25-nordost/GX018330", :start, :end},
          {"2025-02-25-nordost/GX018331", :start, "00:00:02.536"}
        ]
      }
    ]

  def links(_assigns) do
    [{"Ride With GPS Routenplaner", "https://ridewithgps.com/routes/52643496"}]
  end

  def text(assigns) do
    ~H"""
    <table class="routing2">
      <tr>
        <td></td>
        <td>
          <.icon>radroute-6</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="9.99171,53.550206,10.000705,53.55482" lon={9.994935} lat={53.552067} dir="forward" ref={@ref}>Jungfernstieg</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:underpass} ref={@ref}/></td>
        <td class="dim"><.v bounds="9.996533,53.554052,10.006847,53.559597" lon={10.001412} lat={53.555984} dir="forward" ref={@ref} highlight="Ferdinandstor">Ferdinandstor (Bahnbrücke)</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="9.988166,53.549291,10.035541,53.570707" lon={10.00817} lat={53.558734} dir="forward" ref={@ref}>St. Georg</.v></td>
      </tr>
      <tr>
        <td><.icon>FR2</.icon><.icon>br-nord-n1</.icon><.icon>radroute-9</.icon><.icon>radroute-5</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.002812,53.558085,10.04325,53.573375" lon={10.01933} lat={53.56491} dir="forward" ref={@ref}>Hohenfelde</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-12</.icon></td>
        <td><.graph icon={:underpass} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.018792,53.562267,10.031367,53.57027" lon={10.024447} lat={53.56589} dir="forward" ref={Radroute6}>Kuhmühle</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="10.004607,53.559475,10.051498,53.577981" lon={10.021326} lat={53.565939} dir="forward" ref={@ref}>Uhlenhorst</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-17</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.025387,53.564374,10.06104,53.579435" lon={10.04102} lat={53.571454} dir="forward" ref={@ref}>Barmbek-Süd</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:underpass} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.054931,53.572519,10.064447,53.579005" lon={10.057094} lat={53.575875} dir="forward" ref={@ref}>S-Bahn Brücke</.v></td>
      </tr>
      <tr>
        <td><.icon>FR3</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.045757,53.570823,10.078093,53.582276" lon={10.057623} lat={53.575899} dir="forward" ref={@ref}>Friedrichsberg</.v></td>
      </tr>
      <tr>
        <td><.icon>br-wandsbek-w1</.icon><.icon>br-nord-n4</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.051075,53.574348,10.084605,53.592065" lon={10.070711} lat={53.582303} dir="forward" ref={@ref}>Dulsberg</.v></td>
      </tr>
      <tr>
        <td><.icon>br-wandsbek-w2</.icon><.icon>br-nord-n5</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.063273,53.583496,10.110909,53.602008" lon={10.08057} lat={53.58985} dir="forward" ref={@ref}>Wandsbek-Gartenstadt</.v></td>
      </tr>
      <tr>
        <td><.icon>FR11</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.090874,53.58803,10.128303,53.605867" lon={10.100132} lat={53.597102} dir="forward" ref={@ref}>Trabrennbahn Farmsen</.v></td>
      </tr>
      <tr>
        <td><.icon>br-wandsbek-w5</.icon><.icon>radroute-20</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.087759,53.585218,10.166152,53.626887" lon={10.119745} lat={53.605868} dir="forward" ref={@ref}>Farmsen</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:underpass} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.116338,53.606115,10.13254,53.618515" lon={10.124071} lat={53.613367} dir="forward" ref={@ref}>U1-Brücke</.v></td>
      </tr>
      <tr>
        <td><.icon>FR2</.icon><.icon>radroute-20</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.104972,53.621511,10.154019,53.64404" lon={10.128114} lat={53.629193} dir="forward" ref={@ref} highlight="Gartenstadt Berne,Berne">Berne</.v></td>
      </tr>
      <tr>
        <td><.icon>br-wandsbek-w7</.icon><.icon>br-wandsbek-w6</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.132608,53.628871,10.179795,53.663148" lon={10.162516} lat={53.648981} dir="forward" ref={@ref}>Volksdorf</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:underpass} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.153913,53.643329,10.167805,53.650548" lon={10.159323} lat={53.64614} dir="forward" ref={@ref}>U1-Brücke</.v></td>
      </tr>
      <tr>
        <td><.icon ref={RSWAhrensburg} bounds="10.162031,53.649846,10.273755,53.688831" lon={10.164112} lat={53.651525} dir="backward">RSW</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td>
          <.v bounds="10.162031,53.649846,10.273755,53.688831" lon={10.195135} lat={53.660762} dir="backward" ref={RSWAhrensburg}>Ahrensburg</.v>
        </td>
      </tr>
    </table>

    <p>Die Radroute 6 führt vom <.v bounds="9.988817,53.549096,10.000848,53.556219" lon={9.994663} lat={53.552023} dir="forward" ref={@ref}>Jungfernstieg</.v> nach <.v bounds="10.132608,53.628871,10.179795,53.663148" lon={10.162516} lat={53.648981} dir="forward" ref={@ref}>Volksdorf</.v>. Dort schließt nahtlos die  <.a ref={RSWAhrensburg}>Radroute Plus (Radschnellweg) nach Ahrensburg</.a> an.</p>

    <p>Auf dem Weg dorthin folgt die Route zunächst der <.v bounds="9.977257,53.549596,10.031798,53.572229" lon={10.010782} lat={53.559773} dir="forward" ref={@ref} highlight="An der Alster,Ballindamm">Ostseite der Alster</.v> und dem <.v bounds="10.010748,53.562984,10.07377,53.583406" lon={10.041073} lat={53.571486} dir="forward" ref={@ref}>Eilbekkanal</.v>.</p>

    <p>Ab <.v bounds="10.050153,53.568718,10.082234,53.588466" lon={10.057662} lat={53.575983} dir="forward" ref={@ref}>Friedrichsberg</.v> knickt die Route nach Nordosten ab und durchquert die Stadtteile <.v bounds="10.062912,53.573671,10.119932,53.59987" lon={10.079754} lat={53.589814} dir="forward" ref={@ref}>Wandsbek-Gartenstadt</.v>, <.v bounds="10.087759,53.585218,10.166152,53.626887" lon={10.119745} lat={53.605868} dir="forward" ref={@ref}>Farmsen</.v> und <.v bounds="10.104972,53.621511,10.154019,53.64404" lon={10.128114} lat={53.629193} dir="forward" ref={@ref}>Berne</.v>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Wege sind größtenteils befestigt und allwettertauglich. Es gibt zwei Stellen mit feinem Schotter (Grand), die bei Regen/Unwetter problematisch werden können:</p>
    <ul>
      <li><.v bounds="10.021435,53.56428,10.032259,53.56829" lon={10.026001} lat={53.566387} dir="forward" ref={@ref}>Kuhmühlenteichpark</.v> – empfohlene Umfahrung via <.v bounds="10.019299,53.565626,10.027653,53.568591" lon={10.027295} lat={53.567034} dir="backward" ref={@ref}>Immenhof</.v> und <.a ref={Alltagsroute5}>Alltagsroute 5</.a>.</li>
      <li><.v bounds="10.128147,53.630148,10.15831,53.644473" lon={10.142944} lat={53.638431} dir="forward" ref={@ref}>Saselheider Graben</.v> – empfohlene Umfahrung via <.v bounds="10.119964,53.627351,10.159861,53.643268" lon={10.147892} lat={53.634974} dir="forward" ref={Freizeitroute2}>Berner Heerweg</.v>.</li>
    </ul>

    <h4>Meinung</h4>
    <p>Mittlerweile stehen auf der Route zum großen Teil eigene Spuren oder Fahrradstraßen zur Verfügung. Leider fehlt hier häufig eine echte Trennung vom KFZ-Verkehr, etwa durch Bordsteine. Abgesehen von den noch nicht ausgebauten Abschnitten gibt es vor allem punktuell Probleme:</p>

    <ul>
      <li><.v bounds="10.022934,53.564165,10.036927,53.570735" lon={10.031187} lat={53.56686} dir="backward" ref={@ref} highlight="Immenhof">Wochenmarkt Immenhof</.v> – Vollsperrung der Route an Markttagen, Flohmärkten u.ä. im Immenhof. Für die <.v bounds="10.028057,53.56573,10.033558,53.56855" lon={10.031508} lat={53.566904} dir="backward" ref={@ref} highlight="Lerchenfeld">B5 Lerchenfeld</.v> würde das auch niemand ernsthaft erwägen.</li>
      <li><.v bounds="10.111165,53.616996,10.131178,53.624544" lon={10.11935} lat={53.621553} dir="backward" ref={Alltagsroute14}>An der Berner Au</.v> ist eine Spielstraße mit Schrittgeschwindigkeit. Für den Alltagsverkehr unangebracht.</li>
      <li>Missglückte Umgestaltung am <.v bounds="10.141889,53.64304,10.171415,53.654868" lon={10.159225} lat={53.646124} dir="forward" ref={@ref}>Eulenkrug</.v>. In beide Richtungen wird man für wenige Meter in den gefährlichen Autoverkehr geschickt, nur damit KFZ auch weiterhin links in den <.v bounds="10.156766,53.645127,10.163563,53.64786" lon={10.160348} lat={53.646917} dir="forward" ref={@ref}>Uppenhof</.v> abbiegen können.</li>
    </ul>

    <p>Insgesamt macht die Route trotzdem eine gute Figur.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
