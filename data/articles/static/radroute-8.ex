defmodule Data.Article.Static.Radroute8 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-8"
  def display_id(), do: "8"
  def title(), do: "Radroute 8"
  def color(), do: RouteColors.purple2()

  def summary(),
    do: "Radroute 8 verbindet die östlichen Stadtteile zwischen Barmbek-Nord und Bergedorf."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "8",
        direction: :forward,
        from: "Hellbrookstraße",
        to: "Bergedorf",
        parent_ref: __MODULE__,
        text: "von Barmbek Nord nach Bergedorf",
        historic: %{
          "739627605b441309d1e16f7342568008" => ~d[2025-08],
          "fbcc3b07dab335e8b35129159163f818" => ~d[2025-02]
        },
        videos: [
          {"2025-02-25-nordost/GX018304", :start, :end},
          {"2025-02-25-nordost/GX018305", :start, "00:00:22.267"},
          {"2025-02-25-nordost/GX018306", "00:00:01.602", :end},
          {"2025-02-25-nordost/GX018307", "00:00:00.167", :end},
          {"2025-02-25-nordost/GX018308", :start, :end},
          {"2025-02-25-nordost/GX018309", "00:00:00.133", :end},
          {"2025-02-25-nordost/GX018310", :start, "00:00:19.708"},
          {"2025-02-25-nordost/GX018311", "00:00:04.240", :end},
          {"2025-02-25-nordost/GX018312", :start, "00:00:42.534"},
          {"2025-02-25-nordost/GX018313", :start, :end},
          {"2024-05-14-vr8/GX017543", :start, :end},
          {"2024-05-14-vr8/GX017544", :start, "00:00:04.238"},
          {"2025-02-25-nordost/GX018314", "00:00:18.018", :end},
          {"2025-02-25-nordost/GX018315", :start, "00:00:29.663"},
          {"2024-05-14-vr8/GX017546", "00:00:02.836", "00:00:06.372"},
          {"2024-05-14-vr8/GX017546", "00:03:13.355", :end},
          {"2024-05-14-vr8/GX017547", :start, "00:00:14.615"},
          {"2024-05-14-vr8/GX017548", :start, "00:00:43.836"},
          {"2024-05-14-vr8/GX017549", :start, "00:00:04.238"},
          {"2023-07-15-vr8/GX016155", "00:00:03.904", "00:00:05.705"},
          {"2023-07-15-vr8/GX016156", :start, "00:00:01.568"},
          {"2025-08-16-br-berge/GX018600", "00:00:01.935", :end},
          {"2025-08-16-br-berge/GX018601", :start, "00:00:08.061"},
          {"2024-05-14-vr8/GX017550", "00:00:08.307", :end}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "8",
        direction: :backward,
        from: "Bergedorf",
        to: "Hellbrookstraße",
        parent_ref: __MODULE__,
        text: "von Bergedorf nach  Barmbek Nord",
        historic: %{
          "345aa92f06b7547f3b8cc7815ac8e4fe" => ~d[2025-08],
          "13d5a8bb0718446abcd5ae482fe3d202" => ~d[2025-02]
        },
        videos: [
          {"2024-05-14-vr8/GX017553", "00:00:14.345", "00:00:37.067"},
          {"2025-08-16-br-berge/GX018598", "00:00:02.968", "00:00:14.548"},
          {"2024-05-14-vr8/GX017553", "00:00:46.613", "00:00:51.041"},
          {"2024-05-14-vr8/GX017554", :start, :end},
          {"2024-05-14-vr8/GX017555", :start, "00:00:46.370"},
          {"2024-05-14-vr8/GX017556", :start, "00:00:16.347"},
          {"2024-05-14-vr8/GX017557", :start, :end},
          {"2024-05-14-vr8/GX017558", :start, :end},
          {"2024-05-14-vr8/GX017559", :start, "00:00:12.477"},
          {"2024-05-14-vr8/GX017568", :start, "00:00:17.551"},
          {"2025-02-25-nordost/GX018317", "00:00:03.637", "00:00:36.861"},
          {"2025-02-25-nordost/GX018318", "00:00:00.300", :end},
          {"2025-02-25-nordost/GX018319", :start, :end},
          {"2025-02-25-nordost/GX018320", :start, :end},
          {"2025-02-25-nordost/GX018321", :start, "00:00:12.140"},
          {"2025-02-25-nordost/GX018322", :start, :end},
          {"2025-02-25-nordost/GX018323", :start, "00:00:55.989"}
        ]
      }
    ]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <table class="routing2">
      <tr>
        <td></td>
        <td>
          <.icon>radroute-8</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td><.icon>FR2</.icon><.icon>br-nord-n6</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.028259,53.57965,10.069342,53.608713" lon={10.054403} lat={53.591639} dir="forward" ref={@ref}>Barmbek-Nord</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.0589,53.583754,10.068818,53.591673" lon={10.062321} lat={53.588178} dir="forward" ref={@ref}>Osterbek</.v></td>
      </tr>
      <tr>
        <td><.icon>br-nord-n5</.icon><.icon>br-nord-n4</.icon><.icon>radroute-6</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.052171,53.568466,10.081081,53.595402" lon={10.063945} lat={53.586713} dir="forward" ref={@ref}>Dulsberg</.v></td>
      </tr>
      <tr>
        <td><.icon>FR3</.icon><.icon>br-wandsbek-w1</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.057329,53.563296,10.092152,53.585266" lon={10.069865} lat={53.576997} dir="forward" ref={@ref}>Wandsbek</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td><.v bounds="10.058975,53.565375,10.091241,53.584712" lon={10.070019} lat={53.576178} dir="forward" ref={@ref}>Wandse</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-7</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.063369,53.557347,10.092273,53.577459" lon={10.075993} lat={53.566551} dir="forward" ref={@ref}>Marienthal</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:bridge} ref={@ref}/></td>
        <td><.v bounds="10.073665,53.558019,10.089994,53.56877" lon={10.079307} lat={53.562462} dir="forward" ref={@ref}>Autobahn A24</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-1</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.074439,53.540542,10.107347,53.559835" lon={10.085931} lat={53.552336} dir="forward" ref={@ref}>Horn</.v></td>
      </tr>
      <tr>
        <td><.icon>FR11</.icon><.icon>FR4</.icon><.icon>radroute-20</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.086453,53.527245,10.12737,53.550371" lon={10.10665} lat={53.537697} dir="forward" ref={@ref}>Billstedt</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:underpass} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.110307,53.530664,10.117661,53.536222" lon={10.113203} lat={53.534121} dir="forward" ref={@ref}>Bergedorfer Straße</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="10.146472,53.497091,10.196623,53.525544" lon={10.169737} lat={53.512038} dir="forward" ref={@ref}>Boberg</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:underpass} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.168678,53.506087,10.185731,53.515019" lon={10.174072} lat={53.510332} dir="forward" ref={@ref}>Bergedorfer Straße</.v></td>
      </tr>
      <tr>
        <td><.icon>FR4</.icon><.icon>BB</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.180341,53.486074,10.226321,53.514403" lon={10.198667} lat={53.500763} dir="forward" ref={@ref}>Lohbrügge</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.201329,53.487614,10.215983,53.495212" lon={10.207679} lat={53.49096} dir="forward" ref={@ref}>S-Bahn-Brücke</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-2</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.189093,53.475173,10.233976,53.505467" lon={10.208078} lat={53.489539} dir="forward" ref={@ref}>Bergedorf</.v></td>
      </tr>
    </table>

    <p>Radroute 8 verläuft in südöstliche Richtung und verbindet <.v bounds="10.028259,53.57965,10.069342,53.608713" lon={10.054403} lat={53.591639} dir="forward" ref={@ref}>Barmbek-Nord</.v> mit <.v bounds="10.189093,53.475173,10.233976,53.505467" lon={10.208078} lat={53.489539} dir="forward" ref={@ref}>Bergedorf</.v>. Sie folgt dabei zunächst den großen KFZ-Trassen (Ring 2), weicht ab <.v bounds="10.101934,53.524322,10.127884,53.545248" lon={10.111625} lat={53.535509} dir="forward" ref="radroute-8">Billstedt</.v> auf weniger befahrene Strecken aus.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich. Meist kommt modernes Betonpflaster zum Einsatz, es gibt aber auch längere Abschnitte, die asphaltiert sind.</p>

    <h4>Meinung</h4>
    <p>Die Route ist zwar zu großen Teilen schon ausgebaut, angenehm ist die Fahrt entlang der Hauptstraßen aber nicht. Zu häufig kommen Alibi-Lösungen wie geteilte Rad/Fußwege oder Sandoberflächen an Bäumen zum Einsatz. Absurd komplizierte Führungen wie an der <.v bounds="10.067692,53.564238,10.083399,53.573948" lon={10.072016} lat={53.570059} dir="forward" ref={@ref}>Robert-Schuman-Brücke</.v> und der laute und dreckige Autoverkehr sind ebenfalls nicht zuträglich.</p>

    <p>Zwischen <.v bounds="10.101692,53.526092,10.129048,53.543253" lon={10.112849} lat={53.533381} dir="forward" ref={@ref}>Billstedt</.v> und <.v bounds="10.176589,53.491652,10.215745,53.515347" lon={10.185171} lat={53.505873} dir="forward" ref={@ref}>Lohbrügge</.v> ist die Fahrt deutlich angenehmer, da sie auf eigenen Wegen oder Straßen mit wenig KFZ-Verkehr geführt wird. Dafür ist man dort aber auch im Dunklen unterwegs.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
