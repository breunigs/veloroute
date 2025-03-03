defmodule Data.Article.Static.Radroute20 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-20"
  def display_id(), do: "20"
  def title(), do: "Radroute 20"
  def color(), do: RouteColors.blue3()

  def summary(),
    do:
      "Radroute 20 verläuft in Hamburgs Osten in Nord-Süd-Richtung. Sie verbindet die Stadtteile Sasel mit Moorfleet."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "20",
        direction: :forward,
        from: "Sasel",
        to: "Tatenberger Schleuse",
        parent_ref: __MODULE__,
        text: "von Sasel nach Moorfleet",
        historic: %{
          "eb87c70f89491dbad86715e74562f237" => ~d[2025-02]
        },
        videos: [
          {"2024-06-20-14im-13gg/GX017805", "00:00:21.350", "00:00:26.088"},
          {"2023-06-24-14im-13gg/GX016016", "00:00:15.447", "00:00:36.737"},
          {"2023-06-24-14im-13gg/GX016016", "00:01:15.409", "00:01:41.214"},
          {"2024-06-20-14im-13gg/GX017806", "00:00:17.447", "00:02:03.366"},
          {"2024-05-09-vr6/GX017481", "00:01:43.049", "00:01:56.727"},
          {"2025-02-22-nordost/GX018228", "00:00:08.496", "00:00:24.834"},
          {"2025-02-22-nordost/GX018229", :start, :end},
          {"2025-02-22-nordost/GX018230", :start, "00:00:24.391"},
          {"2024-06-20-14im-13gg/GX017808", "00:00:02.269", "00:00:28.256"},
          {"2024-06-20-14im-13gg/GX017809", :start, :end},
          {"2024-06-20-14im-13gg/GX017810", :start, "00:00:08.207"},
          {"2024-06-20-14im-13gg/GX017811", :start, "00:01:30.038"},
          {"2024-06-20-14im-13gg/GX017812", :start, "00:00:05.672"},
          {"2024-06-20-14im-13gg/GX017812", "00:00:08.208", "00:02:04.467"},
          {"2024-06-20-14im-13gg/GX017813", :start, "00:00:02.202"},
          {"2025-02-23-ost/GX018257", "00:00:02.102", :end},
          {"2025-02-23-ost/GX018258", "00:00:00.701", "00:00:22.554"},
          {"2025-02-23-ost/GX018259", :start, "00:00:15.329"},
          {"2025-02-25-nordost/GX018315", "00:00:38.398", "00:01:22.995"},
          {"2025-02-23-ost/GX018259", "00:00:59.557", :end},
          {"2025-02-23-ost/GX018260", :start, :end},
          {"2025-02-23-ost/GX018261", :start, "00:00:14.440"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "20",
        direction: :backward,
        from: "Tatenberger Schleuse",
        to: "Sasel",
        parent_ref: __MODULE__,
        text: "von Moorfleet nach Sasel",
        historic: %{
          "071b8019499175ae06b0dba57c430ac0" => ~d[2025-02]
        },
        videos: [
          {"2025-02-23-ost/GX018262", "00:00:30.100", :end},
          {"2025-02-23-ost/GX018266", :start, :end},
          {"2025-02-23-ost/GX018267", :start, :end},
          {"2025-02-23-ost/GX018268", :start, :end},
          {"2025-02-23-ost/GX018269", :start, :end},
          {"2025-02-23-ost/GX018270", :start, "00:00:06.322"},
          {"2024-06-16-13im-14gg/GX017710", "00:00:04.887", :end},
          {"2024-06-16-13im-14gg/GX017711", :start, "00:00:16.079"},
          {"2024-06-16-13im-14gg/GX017712", :start, "00:00:36.296"},
          {"2024-06-16-13im-14gg/GX017713", :start, "00:00:36.213"},
          {"2024-06-16-13im-14gg/GX017714", "00:00:11.409", "00:00:16.280"},
          {"2024-06-16-13im-14gg/GX017715", :start, :end},
          {"2024-06-16-13im-14gg/GX017716", :start, "00:00:26.622"},
          {"2024-06-16-13im-14gg/GX017717", :start, "00:00:01.535"},
          {"2025-02-22-nordost/GX018227", "00:00:09.076", "00:00:53.904", vf: "curves=lighter"},
          {"2024-05-09-vr6/GX017477", "00:00:43.802", "00:00:57.313"},
          {"2024-05-09-vr6/GX017478", :start, "00:00:08.040"},
          {"2024-06-16-13im-14gg/GX017720", "00:00:02.136", :end},
          {"2024-06-16-13im-14gg/GX017721", :start, "00:00:49.706"}
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
          <.icon>radroute-20</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td><.icon>br-wandsbek-w6</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.089239,53.637039,10.136137,53.660747" lon={10.11285} lat={53.651738} dir="forward" ref={@ref}>Sasel</.v></td>
      </tr>
      <tr>
        <td><.icon>FR2</.icon><.icon>br-wandsbek-w3</.icon><.icon>radroute-6</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.100137,53.606715,10.155992,53.642501" lon={10.122153} lat={53.626224} dir="forward" ref={@ref} highlight="Farmsen-Berne,Berne">Berne</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:underpass} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.117655,53.608454,10.133446,53.617238" lon={10.123449} lat={53.613984} dir="forward" ref={@ref}>U-Bahn-Brücke</.v></td>
      </tr>
      <tr>
        <td><.icon>br-wandsbek-w1</.icon><.icon>br-wandsbek-w8</.icon><.icon>br-wandsbek-w5</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.092127,53.586207,10.145399,53.624022" lon={10.128208} lat={53.604802} dir="forward" ref={@ref} highlight="Farmsen-Berne,Farmsen">Farmsen</.v></td>
      </tr>
      <tr>
        <td><.icon>FR3</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.106828,53.577464,10.160696,53.607319" lon={10.136391} lat={53.593164} dir="forward" ref={@ref}>Tonndorf</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:tunnel} ref={@ref}/></td>
        <td><.v bounds="10.132188,53.591311,10.140508,53.596995" lon={10.135306} lat={53.594209} dir="forward" ref={@ref}>Unterführung S4 (geplant)</.v></td>
      </tr>
      <tr>
        <td><.icon>FR11</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.103843,53.563134,10.145861,53.588348" lon={10.134745} lat={53.574137} dir="forward" ref={@ref}>Jenfeld</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:bridge} ref={@ref}/></td>
        <td><.v bounds="10.123389,53.561953,10.145128,53.571646" lon={10.13371} lat={53.567248} dir="forward" ref={@ref}>Autobahn A24</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-1</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.098596,53.541492,10.154568,53.573601" lon={10.133593} lat={53.566554} dir="forward" ref={@ref}>Schiffbek</.v></td>
      </tr>
      <tr>
        <td><.icon>FR11</.icon><.icon>radroute-8</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.086784,53.531375,10.138151,53.555524" lon={10.112797} lat={53.544211} dir="forward" ref={@ref}>Billstedt</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:underpass} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.100986,53.524796,10.13347,53.543233" lon={10.11322} lat={53.534174} dir="forward" ref={@ref}>Bergedorfer Straße</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.10045,53.52489,10.125103,53.541281" lon={10.112136} lat={53.531431} dir="forward" ref={@ref}>Bille</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-2</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.079656,53.506231,10.133909,53.538596" lon={10.10833} lat={53.524801} dir="forward" ref={@ref}>Billbrook</.v></td>
      </tr>
      <tr>
        <td><.icon>FR5</.icon><.icon>radroute-22</.icon><.icon>radroute-21</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.050237,53.489549,10.100241,53.522643" lon={10.086375} lat={53.511011} dir="forward" ref={@ref}>Moorfleet</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.071896,53.494722,10.086499,53.504745" lon={10.07891} lat={53.500741} dir="forward" ref={@ref}>Dove Elbe</.v></td>
      </tr>
    </table>

    <p>Radroute 20 führt grob in Nord-Süd Richtung von <.v bounds="10.089239,53.637039,10.136137,53.660747" lon={10.11285} lat={53.651738} dir="forward" ref={@ref}>Sasel</.v> zur <.v bounds="10.071896,53.494722,10.086499,53.504745" lon={10.07891} lat={53.500741} dir="forward" ref={@ref}>Tatenberger Schleuse</.v>. Sie bindet damit also die eher östlichen Stadtteile ins Radnetz ein.</p>

    <p>Von dort besteht Anschluss an die Zollenspieker Fähre via <.a name="radroute-22">Radroute 22</.a>. Langfristig soll eine <.a name="2024-01-14-norderelbbruecke-a1">neue Autobahnbrücke</.a> auch die Fahrt in Richtung Wilhelmsburg ermöglichen.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Wege sind größtenteils befestigt und allwettertauglich. Ausnahme ist der Weg <.v bounds="10.110201,53.545847,10.128847,53.562717" lon={10.119109} lat={53.552098} dir="forward" ref={@ref}>hinter dem Schiffbeker Friedhof</.v>. Je nach Stadtteil folgt die Route <.v bounds="10.105827,53.638084,10.130162,53.656206" lon={10.119905} lat={53.645262} dir="forward" ref={@ref}>kleinen Wohnstraßen</.v>, <.v bounds="10.127485,53.569053,10.151036,53.590472" lon={10.139639} lat={53.582288} dir="forward" ref={@ref}>mittleren Sammelstraßen</.v> oder <.v bounds="10.083347,53.586753,10.157636,53.628747" lon={10.120571} lat={53.60579} dir="forward" ref={@ref}>großen Hauptstraßen</.v>.</p>

    <h4>Meinung</h4>
    <p>Insgesamt ist die Route gut zu befahren, obwohl sie kaum ausgebaut ist. Die Probleme sind dabei über die gesamte Strecke verteilt und kein Abschnitt sticht als besonders gut oder schlecht heraus. Am angenehmsten finde ich die <.v bounds="10.105229,53.625461,10.141491,53.657866" lon={10.115704} lat={53.64712} dir="forward" ref={@ref} highlight="Dweerblöcken,Alter Berner Weg,St. Jürgenstraße,Lienaustraße">kaum befahrenen Straßen um Sasel</.v>, am schlimmsten die LKW-Rennstrecke <.v bounds="10.082428,53.508503,10.119107,53.533489" lon={10.099581} lat={53.519075} dir="forward" ref={@ref}>Unterer Landweg</.v></p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
