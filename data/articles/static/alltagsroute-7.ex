defmodule Data.Article.Static.Alltagsroute7 do
  use Article.Static

  def id(), do: "7"
  def route_group(), do: :alltag
  def title(), do: "Alltagsroute 7"

  def color(), do: "#97ba22"

  def summary(),
    do: "Alltagsroute 7 führt vom Rathaus nach Jenfeld bzw. Rahlstedt."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "7",
        direction: :forward,
        from: "Innenstadt",
        to: "Rahlstedt",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Rahlstedt",
        historic: %{
          "2046ce92ff9bf4e3d396a3f2e261378b" => ~d[2023-06],
          "1e21b87814bf4de2e0669e54c4fe4529" => ~d[2022-05],
          "68751759d62de45469662db5c6539ec3" => ~d[2021-06]
        },
        videos: [
          {"2023-06-03-vr10-vr7/GX015898", "00:00:16.650", :end},
          {"2023-06-03-vr10-vr7/GX015899", :start, :end},
          {"2023-06-03-vr10-vr7/GX015900", :start, :end},
          {"2023-06-03-vr10-vr7/GX015901", :start, :end},
          {"2023-06-03-vr10-vr7/GX015902", :start, :end},
          {"2023-06-03-vr10-vr7/GX015903", :start, :end},
          {"2023-06-03-vr10-vr7/GX015904", :start, :end},
          {"2023-06-03-vr10-vr7/GX015905", :start, :end},
          {"2023-06-03-vr10-vr7/GX015906", :start, :end},
          {"2023-06-03-vr10-vr7/GX015907", :start, :end},
          {"2023-06-03-vr10-vr7/GX015908", :start, :end},
          {"2023-06-03-vr10-vr7/GX015909", :start, :end},
          {"2023-06-03-vr10-vr7/GX015910", :start, "00:00:35.936"},
          {"2023-06-03-vr10-vr7/GX015910", "00:00:51.485", :end},
          {"2023-06-03-vr10-vr7/GX015911", :start, :end},
          {"2023-06-03-vr10-vr7/GX015912", :start, :end},
          {"2023-06-03-vr10-vr7/GX015913", :start, :end},
          {"2023-06-03-vr10-vr7/GX015914", :start, :end},
          {"2023-06-03-vr10-vr7/GX015915", :start, :end},
          {"2023-06-03-vr10-vr7/GX015916", :start, :end},
          {"2023-06-03-vr10-vr7/GX015917", :start, :end},
          {"2023-06-03-vr10-vr7/GX015919", :start, :end},
          {"2023-06-03-vr10-vr7/GX015920", :start, :end},
          {"2023-06-03-vr10-vr7/GX015921", :start, "00:00:30.597"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "7",
        direction: :backward,
        from: "Rahlstedt",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "aus Rahlstedt in die Innenstadt",
        historic: %{
          "2abc0bce6fb61793d6b0d2694ad5b859" => ~d[2023-06],
          "f7ab6d8df65751aa2494d0001215b2d7" => ~d[2022-05],
          "1188d7f9dae4bbb328e4bb53de379938" => ~d[2021-06]
        },
        videos: [
          {"2023-06-03-vr10-vr7/GX015922", :start, :end},
          {"2023-06-03-vr10-vr7/GX015923", :start, "00:00:05.706"},
          {"2023-06-03-vr10-vr7/GX015923", "00:00:10.010", :end},
          {"2023-06-03-vr10-vr7/GX015924", :start, :end},
          {"2023-06-03-vr10-vr7/GX015925", :start, :end},
          {"2023-06-03-vr10-vr7/GX015926", :start, "00:00:32.099"},
          {"2023-06-03-vr10-vr7/GX015928", "00:00:03.770", "00:00:37.371"},
          {"2023-06-03-vr10-vr7/GX015929", "00:00:00.868", :end},
          {"2023-06-03-vr10-vr7/GX015930", :start, :end},
          {"2023-06-03-vr10-vr7/GX015931", :start, :end},
          {"2023-06-03-vr10-vr7/GX015933", :start, :end},
          {"2023-06-03-vr10-vr7/GX015934", :start, :end},
          {"2023-06-03-vr10-vr7/GX015935", :start, :end},
          {"2023-06-03-vr10-vr7/GX015936", :start, :end},
          {"2023-06-03-vr10-vr7/GX015937", :start, "00:00:31.832"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "7j",
        direction: :forward,
        from: "Innenstadt",
        to: "Jenfeld",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Jenfeld",
        historic: %{
          "a889ba648ecf800ca881e93a99431f84" => ~d[2023-06],
          "a5f008c59ead0045826f53f2af732c81" => ~d[2022-05],
          "ca14f6428dc1563838f47e470accb338" => ~d[2021-06]
        },
        videos: [
          {"2023-06-03-vr10-vr7/GX015926", "00:00:48.949", "00:01:53.614"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "7j",
        direction: :backward,
        from: "Jenfeld",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "aus Jenfeld in die Innenstadt",
        historic: %{
          "ee0fd947498b1d9e3887993b44e27a6d" => ~d[2023-06],
          "965763fec57e8c331ce54d574036fd92" => ~d[2022-05],
          "a8f9a0ab4d908464c6705094c5d9b957" => ~d[2021-06]
        },
        videos: [
          {"2023-06-03-vr10-vr7/GX015926", "00:01:56.350", :end},
          {"2023-06-03-vr10-vr7/GX015927", :start, :end},
          {"2023-06-03-vr10-vr7/GX015928", :start, "00:00:03.670"}
        ]
      }
    ]

  def links(assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/426718/veloroute-7/"},
      ~H{Komoot Routenplaner: <.a href="https://www.komoot.de/tour/225132901">nach Rahlstedt</.a> oder <.a href="https://www.komoot.de/tour/229494159">nach Jenfeld</.a>},
      {
        "Route in der OpenStreetMap",
        "https://www.openstreetmap.org/relation/228035"
      }
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="9" style="background-image: url(/images/route7.svg)">
          <.icon>7</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.990953,53.548317,9.998129,53.552594" lon={9.994001} lat={53.550809} dir="forward" ref="7" highlight="Rathausmarkt">Rathaus</.v>
        </td>
      </tr>
      <tr>
        <td>
          <.icon>FR1</.icon>
          <.icon>FR4</.icon>
          <.icon>8</.icon>
          <.icon>9</.icon></td>
        <td><.v bounds="9.999532,53.549681,10.017545,53.556575" lon={10.007068} lat={53.551788} dir="forward" ref="7">Hauptbahnhof</.v></td>
      </tr>
      <tr>
        <td><.icon>br-nord-n1</.icon></td>
        <td><.v bounds="10.015691,53.554022,10.032917,53.562543" lon={10.022447} lat={53.55794} dir="forward" ref="7">Hohenfelde</.v></td>
      </tr>
      <tr>
        <td><.icon>13</.icon></td>
        <td><.v bounds="10.030704,53.557958,10.055372,53.571052" lon={10.043693} lat={53.563793} dir="forward" ref="7">Eilbek</.v></td>
      </tr>
      <tr>
        <td><.icon>br-wandsbek-w2</.icon></td>
        <td><.v bounds="10.05379,53.563592,10.094062,53.577387" lon={10.071139} lat={53.569574} dir="forward" ref="7">Wandsbek Markt</.v></td>
      </tr>
      <tr>
        <td><.icon>14</.icon> <.v bounds="10.098043,53.565295,10.147663,53.582896" lon={10.12205} lat={53.574824} dir="forward" ref="7">Jenfeld</.v></td>
        <td><.v bounds="10.115525,53.576405,10.148118,53.596693" lon={10.126294} lat={53.581843} dir="forward" ref="7">Tonndorf</.v> <.icon>14</.icon> <.icon>br-wandsbek-w8</.icon> <.icon>FR11</.icon></td>
      </tr>
      <tr>
        <td class="dir"><.m bounds="10.14752,53.5540497,10.2785664,53.5988388">(Barsbüttel)</.m></td>
        <td><.v bounds="10.145341,53.594407,10.160741,53.60604" lon={10.154252} lat={53.602163} dir="forward" ref="7">Rahlstedt</.v> <.icon>br-wandsbek-w5</.icon></td>
      </tr>
    </table>

    <p>Die Alltagsroute 7 (auch: Veloroute 7 oder Radroute 7) führt vom <.v bounds="9.990953,53.548317,9.998129,53.552594" lon={9.994001} lat={53.550809} dir="forward" ref="7" highlight="Rathausmarkt">Rathaus</.v> in Richtung Osten nach <.v bounds="10.098043,53.565295,10.147663,53.582896" lon={10.12205} lat={53.574824} dir="forward" ref="7">Jenfeld</.v>. Dort knickt ein Routenast leicht nach Norden ab und führt nach <.v bounds="10.145341,53.594407,10.160741,53.60604" lon={10.154252} lat={53.602163} dir="forward" ref="7">Rahlstedt</.v>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich. Sie sind meist asphaltiert.</p>

    <h4>Meinung</h4>
    <p>Die Routenführung macht mehrere unintuitive 90° Knicke, die auch nach dem Umbau zur Radroute nicht ersichtlich sind.</p>

    <p>Auf vielen Abschnitten konnte man sich nicht dazu durchringen, den KFZ-Verkehr auszusperren, was der Route abträglich ist. Negativbeispiel ist hier die <.v bounds="10.030874,53.555924,10.057076,53.56974" lon={10.044241} lat={53.563808} dir="forward" ref="7">Hasselbrookstraße</.v>. Sie wurde durch den Umbau eher noch schlechter, obwohl mit <.v bounds="10.030874,53.555924,10.057076,53.56974" lon={10.03778} lat={53.565642} dir="forward" ref="br-wandsbek-w1">Wandsbeker Chaussee</.v> und <.v bounds="10.030874,53.555924,10.057076,53.56974" lon={10.042256} lat={53.560732} dir="forward" ref="13">Sievekingsallee</.v> rund 4- bis 6-spurige Autotrassen vorhanden sind.</p>

    <p>Der einzig wirklich gute Abschnitt bisher ist die <.v bounds="10.023861,53.556483,10.039209,53.563107" lon={10.029071} lat={53.559073} dir="forward" ref="7">Angerstraße</.v>, da sie als KFZ-Sackgasse vergleichsweise ruhig ist und trotzdem direkte Führung bietet.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
