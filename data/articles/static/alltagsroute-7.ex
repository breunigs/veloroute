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
        renderer: 5,
        group: "7",
        direction: :forward,
        from: "Innenstadt",
        to: "Rahlstedt",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Rahlstedt",
        historic: %{
          "c64e3ba31cb5f066b59057ca159ff9fe" => ~d[2024-05],
          "2046ce92ff9bf4e3d396a3f2e261378b" => ~d[2023-06],
          "1e21b87814bf4de2e0669e54c4fe4529" => ~d[2022-05],
          "68751759d62de45469662db5c6539ec3" => ~d[2021-06]
        },
        videos: [
          {"2024-05-02-vr7/GX017365", :start, :end, vf: "rotate=enable='gte(t,3)':angle=-0.8/t"},
          {"2024-05-02-vr7/GX017366", :start, :end},
          {"2024-05-02-vr7/GX017367", :start, :end},
          {"2024-05-02-vr7/GX017368", :start, :end},
          {"2024-05-02-vr7/GX017369", :start, :end},
          {"2024-05-02-vr7/GX017370", "00:00:01.301", :end},
          {"2024-05-02-vr7/GX017371", :start, :end},
          {"2024-05-02-vr7/GX017372", :start, :end},
          {"2024-05-02-vr7/GX017373", :start, :end},
          {"2024-05-02-vr7/GX017374", :start, :end},
          {"2024-05-02-vr7/GX017375", :start, :end},
          {"2024-05-02-vr7/GX017376", :start, :end},
          {"2024-05-02-vr7/GX017377", :start, :end},
          {"2024-05-02-vr7/GX017378", :start, :end},
          {"2024-05-02-vr7/GX017379", :start, "00:00:17.014"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "7",
        direction: :backward,
        from: "Rahlstedt",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "aus Rahlstedt in die Innenstadt",
        historic: %{
          "385eac401930d2bad4563e7e7962fa45" => ~d[2024-05],
          "2abc0bce6fb61793d6b0d2694ad5b859" => ~d[2023-06],
          "f7ab6d8df65751aa2494d0001215b2d7" => ~d[2022-05],
          "1188d7f9dae4bbb328e4bb53de379938" => ~d[2021-06]
        },
        videos: [
          {"2024-05-02-vr7/GX017379", "00:00:19.349", :end},
          {"2024-05-02-vr7/GX017380", :start, :end},
          {"2024-05-02-vr7/GX017381", :start, :end},
          {"2024-05-02-vr7/GX017382", :start, :end},
          {"2024-05-02-vr7/GX017383", :start, :end},
          {"2024-05-02-vr7/GX017384", :start, "00:00:01.735"},
          {"2024-05-02-vr7/GX017389", "00:00:01.835", "00:01:22.082"},
          {"2024-05-02-vr7/GX017389", "00:01:30.691", :end},
          {"2024-05-02-vr7/GX017390", :start, :end},
          {"2024-05-02-vr7/GX017391", :start, :end},
          {"2024-05-02-vr7/GX017392", :start, :end},
          {"2024-05-02-vr7/GX017393", :start, :end},
          {"2024-05-02-vr7/GX017394", :start, :end},
          {"2024-05-02-vr7/GX017395", :start, :end},
          {"2024-05-02-vr7/GX017396", :start, :end},
          {"2024-05-02-vr7/GX017397", :start, :end},
          {"2024-05-02-vr7/GX017398", :start, "00:00:12.279"},
          {"2023-07-15-vr8/GX016168", "00:00:08.775", :end},
          {"2023-06-03-vr10-vr7/GX015937", :start, "00:00:31.398"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "7j",
        direction: :forward,
        from: "Innenstadt",
        to: "Jenfeld",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Jenfeld",
        historic: %{
          "79aa46902611427455012c6fa7c3f36a" => ~d[2024-05],
          "a889ba648ecf800ca881e93a99431f84" => ~d[2023-06],
          "a5f008c59ead0045826f53f2af732c81" => ~d[2022-05],
          "ca14f6428dc1563838f47e470accb338" => ~d[2021-06]
        },
        videos: [
          {"2024-05-02-vr7/GX017385", "00:00:01.235", :end},
          {"2024-05-02-vr7/GX017386", :start, "00:00:32.693"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "7j",
        direction: :backward,
        from: "Jenfeld",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "aus Jenfeld in die Innenstadt",
        end_action: %{action: :play, route: __MODULE__, group: "7", direction: :backward},
        historic: %{
          "d1694d04ad11a835d9942a87fb9e09cc" => ~d[2024-05],
          "ee0fd947498b1d9e3887993b44e27a6d" => ~d[2023-06],
          "965763fec57e8c331ce54d574036fd92" => ~d[2022-05],
          "a8f9a0ab4d908464c6705094c5d9b957" => ~d[2021-06]
        },
        videos: [
          {"2024-05-02-vr7/GX017386", "00:00:43.368", :end},
          {"2024-05-02-vr7/GX017387", :start, :end},
          {"2024-05-02-vr7/GX017388", :start, :end},
          {"2024-05-02-vr7/GX017389", :start, "00:00:01.835"}
        ]
      }
    ]

  def links(assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/426718/veloroute-7/"},
      ~H{Komoot Routenplaner: <.a href="https://www.komoot.com/de-de/tour/225132901">nach Rahlstedt</.a> oder <.a href="https://www.komoot.com/de-de/tour/229494159">nach Jenfeld</.a>},
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
