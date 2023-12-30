defmodule Data.Article.Static.Alltagsroute14 do
  use Article.Static

  def id(), do: "14"
  def route_group(), do: :alltag
  def title(), do: "Alltagsroute 14"

  def color(), do: "#fdb801"

  def summary(),
    do: "Alltagsroute 14 führt ringförmig im Uhrzeigersinn von Othmarschen nach Billstedt"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "14",
        direction: :forward,
        from: "Othmarschen",
        to: "Billstedt",
        parent_ref: __MODULE__,
        text: "äußere Ringroute im Uhrzeigersinn",
        historic: %{
          "f0c8315afd3726285e4b5d01167f7496" => ~d[2023-06],
          "75438deba968649bfd45830870d975df" => ~d[2022-05],
          "62d159bb8ce5999fbf24260ee31c6333" => ~d[2021-07]
        },
        videos: [
          {"2023-06-17-vr14-halb/GX015946", "00:00:13.780", :end},
          {"2023-06-17-vr14-halb/GX015948", :start, :end},
          {"2023-06-17-vr14-halb/GX015949", :start, :end},
          {"2023-06-17-vr14-halb/GX015950", :start, :end},
          {"2023-06-17-vr14-halb/GX015951", :start, :end},
          {"2023-06-17-vr14-halb/GX015952", :start, :end},
          {"2023-06-17-vr14-halb/GX015953", :start, "00:00:34.368"},
          {"2023-06-17-vr14-halb/GX015955", "00:00:11.178", :end},
          {"2023-06-17-vr14-halb/GX015956", :start, :end},
          {"2023-06-17-vr14-halb/GX015957", :start, :end},
          {"2023-06-17-vr14-halb/GX015958", :start, :end},
          {"2023-06-17-vr14-halb/GX015959", :start, :end},
          {"2023-06-17-vr14-halb/GX015960", :start, :end},
          {"2023-06-17-vr14-halb/GX015961", :start, :end},
          {"2023-06-17-vr14-halb/GX015962", :start, :end},
          {"2023-06-17-vr14-halb/GX015963", :start, :end},
          {"2023-06-17-vr14-halb/GX015964", :start, "00:01:03.430"},
          {"2023-06-24-14im-13gg/GX016013", "00:00:52.185", :end},
          {"2023-06-24-14im-13gg/GX016014", :start, :end},
          {"2023-06-24-14im-13gg/GX016015", :start, :end},
          {"2023-06-24-14im-13gg/GX016016", :start, "00:00:38.906"},
          {"2023-06-24-14im-13gg/GX016016", "00:01:18.378", :end},
          {"2023-06-24-14im-13gg/GX016017", :start, :end},
          {"2023-06-24-14im-13gg/GX016018", :start, :end},
          {"2023-06-24-14im-13gg/GX016019", :start, :end},
          {"2023-06-24-14im-13gg/GX016021", :start, :end},
          {"2023-06-24-14im-13gg/GX016022", :start, :end},
          {"2023-06-24-14im-13gg/GX016023", :start, :end},
          {"2023-06-24-14im-13gg/GX016024", :start, "00:00:02.202"},
          {"2022-05-26-14im-13gg/GX014005", "00:00:02.269", "00:00:03.737"},
          {"2023-06-24-14im-13gg/GX016025", "00:00:00.734", :end},
          {"2023-06-24-14im-13gg/GX016026", :start, :end},
          {"2023-06-24-14im-13gg/GX016027", :start, :end},
          {"2023-06-24-14im-13gg/GX016028", :start, :end},
          {"2023-06-24-14im-13gg/GX016029", :start, :end},
          {"2023-06-24-14im-13gg/GX016030", :start, "00:00:48.382"},
          {"2023-06-24-14im-13gg/GX016030", "00:01:12.539", "00:02:58.810"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "14",
        direction: :backward,
        from: "Billstedt",
        to: "Othmarschen",
        parent_ref: __MODULE__,
        text: "äußere Ringroute gegen Uhrzeigersinn",
        historic: %{
          "c279ffbdfe4ca539c2c78b9e53740802" => ~d[2023-06],
          "153c4ea447de3ea61e07a30fae6d0e5a" => ~d[2022-05],
          "7fb5070532080e77905e6f92dbc352a1" => ~d[2021-07]
        },
        videos: [
          {"2023-06-25-13im-14gg/GX016100", :start, :end},
          {"2023-06-25-13im-14gg/GX016101", :start, :end},
          {"2023-06-25-13im-14gg/GX016102", :start, :end},
          {"2023-06-25-13im-14gg/GX016104", :start, :end},
          {"2023-06-25-13im-14gg/GX016105", :start, :end},
          {"2022-05-15-13im-14gg/GX013934", :start, "00:00:01.969"},
          {"2023-06-25-13im-14gg/GX016109", "00:00:00.133", :end},
          {"2023-06-25-13im-14gg/GX016110", :start, :end},
          {"2023-06-25-13im-14gg/GX016112", :start, "00:00:08.942"},
          {"2023-06-25-13im-14gg/GX016114", "00:00:01.235", :end},
          {"2023-06-25-13im-14gg/GX016116", :start, :end},
          {"2023-06-25-13im-14gg/GX016117", :start, :end},
          {"2023-06-25-13im-14gg/GX016118", :start, :end},
          {"2023-06-25-13im-14gg/GX016119", :start, :end},
          {"2023-06-25-13im-14gg/GX016120", :start, :end},
          {"2023-06-25-13im-14gg/GX016121", :start, :end},
          {"2023-06-25-13im-14gg/GX016122", :start, :end},
          {"2023-06-25-13im-14gg/GX016123", :start, :end},
          {"2023-06-25-13im-14gg/GX016124", :start, :end},
          {"2023-06-25-13im-14gg/GX016125", :start, :end},
          {"2023-06-25-13im-14gg/GX016126", :start, "00:00:39.473"},
          {"2023-06-25-13im-14gg/GX016127", "00:00:16.316", :end},
          {"2023-06-25-13im-14gg/GX016128", :start, :end},
          {"2023-06-25-13im-14gg/GX016129", :start, :end},
          {"2023-06-25-13im-14gg/GX016130", :start, "00:00:26.326"},
          {"2022-05-15-13im-14gg/GX013950", "00:00:32.833", "00:00:36.236"},
          {"2023-06-25-13im-14gg/GX016133", "00:00:01.134", :end},
          {"2023-06-25-13im-14gg/GX016134", :start, :end},
          {"2023-06-25-13im-14gg/GX016139", "00:00:01.702", :end},
          {"2023-06-25-13im-14gg/GX016140", :start, :end},
          {"2023-06-25-13im-14gg/GX016141", :start, "00:02:33.122"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/426818/veloroute-14/"},
      {"Komoot Routenplaner: nach Othmarschen nach Billstedt",
       "https://www.komoot.de/tour/225149829"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/8349004"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="17" style="background-image: url(/images/route14.svg)">
          <.icon>14</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.866288,53.552569,9.901401,53.567193" lon={9.882609} lat={53.557444} dir="forward" ref="14">Othmarschen</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR11</.icon>
          <.icon>FR9</.icon>
          <.icon>1</.icon>
        </td>
        <td><.v bounds="9.847024,53.561897,9.893062,53.5954" lon={9.874968} lat={53.572019} dir="forward" ref="14">Osdorf</.v></td>
      </tr>
      <tr>
        <td>
          <.icon bounds="9.784876,53.59252,9.903967,53.659784" lon={9.889568} lat={53.602359} dir="forward" name="rsw-elmshorn">RSW</.icon>
        </td>
        <td><.v bounds="9.862288,53.583285,9.89577,53.608463" lon={9.884646} lat={53.594938} dir="forward" ref="14">Lurup</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>2</.icon>
        </td>
        <td><.v bounds="9.882946,53.599509,9.929624,53.623448" lon={9.898407} lat={53.610026} dir="forward" ref="14">Eidelstedt</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.897549,53.616903,9.953993,53.64607" lon={9.919298} lat={53.627305} dir="forward" ref="14">Schnelsen</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR10</.icon>
          <.icon>3</.icon>
        </td>
        <td><.v bounds="9.924002,53.620501,9.98224,53.649794" lon={9.94734} lat={53.639663} dir="forward" ref="14">Niendorf Nord</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR12</.icon>
          <.icon bounds="9.784876,53.59252,10.060399,53.739026" lon={10.017399} lat={53.650044} dir="forward" name="rsw-bad-bramstedt">RSW</.icon>
          <.icon>4</.icon>
        </td>
        <td><.v bounds="9.986298,53.635994,10.043677,53.66859" lon={10.009066} lat={53.648155} dir="forward" ref="14">Langenhorn</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="10.012476,53.634999,10.0694,53.657814" lon={10.031127} lat={53.649827} dir="forward" ref="14">Hummelsbüttel</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR1</.icon>
          <.icon>5</.icon>
        </td>
        <td><.v bounds="10.056884,53.636769,10.127932,53.667057" lon={10.084268} lat={53.656261} dir="forward" ref="14">Poppenbüttel</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="10.089239,53.637039,10.136137,53.660747" lon={10.11285} lat={53.651738} dir="forward" ref="14">Sasel</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>6</.icon>
        </td>
        <td><.v bounds="10.100137,53.606715,10.155992,53.642501" lon={10.122153} lat={53.626224} dir="forward" ref="14">Berne</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR2</.icon>
          <.icon>6</.icon>
        </td>
        <td><.v bounds="10.092127,53.586207,10.145399,53.624022" lon={10.128208} lat={53.604802} dir="forward" ref="14">Farmsen</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR3</.icon>
          <.icon>7</.icon>
        </td>
        <td><.v bounds="10.106828,53.577464,10.160696,53.607319" lon={10.136391} lat={53.593164} dir="forward" ref="14">Tonndorf</.v></td>
      </tr>
      <tr>
        <td class="dir"><.m bounds="10.14752,53.5540497,10.2785664,53.5988388">(Barsbüttel)</.m></td>
        <td><.v bounds="10.103843,53.563134,10.145861,53.588348" lon={10.134745} lat={53.574137} dir="forward" ref="14">Jenfeld</.v>
          <.icon>7</.icon>
          <.icon>FR11</.icon>
        </td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="10.098596,53.541492,10.154568,53.573601" lon={10.133593} lat={53.566554} dir="forward" ref="14">Öjendorfer Park</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>8</.icon>
        </td>
        <td><.v bounds="10.086784,53.531375,10.138151,53.555524" lon={10.112797} lat={53.544211} dir="forward" ref="14">Billstedt</.v></td>
      </tr>
    </table>

    <p>Die Alltagsroute 14 (auch: Veloroute 14, Radroute 14 oder äußere Ringroute) dem Namen nach in einem runden Bogen ab Othmarschen bis nach Billstedt. Dadurch stellt sie Querverbindungen zwischen den äußeren Stadtteilen und anderen Alltagsrouten bereit.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die meisten Wege sind befestigt und allwettertauglich. Ausnahmen bilden die Abschnitte im <.v bounds="9.862932,53.570632,9.881087,53.582119" lon={9.873981} lat={53.57575} dir="forward" ref="14">Lise-Meitner-Park</.v>, beim <.v bounds="9.862932,53.570632,9.904986,53.624813" lon={9.900168} lat={53.622777} dir="forward" ref="14">Brookgraben</.v> und am <.v bounds="9.862932,53.550314,10.120994,53.624813" lon={9.900168} lat={53.622777} dir="forward" ref="14">Friedhof Schiffbek</.v>. Hinzu kommen kurze unbefestigte Stellen an Bäumen.</p>

    <h4>Meinung</h4>
    <p>Die Route ist bisher (Stand: Ende 2023) kaum ausgebaut und daher nur schlecht befahrbar. Sie lässt sich in zwei Streckenarten mit unterschiedlichen Charakter einteilen:</p>

    <ul>
      <li><strong>Wohnstraßen</strong>: geringes Verkehrsaufkommen. Unklare Führung durch häufiges Abbiegen. KFZ-Parken am Fahrbahnrand reduziert zwar das KFZ-Höchsttempo, behindert aber auch den Radverkehr am Vorankommen. Beispiele: <.v bounds="9.864897,53.575845,9.882797,53.58992" lon={9.874059} lat={53.57962} dir="forward" ref="14">Lurup</.v>m <.v bounds="9.877863,53.601489,9.914855,53.628904" lon={9.897491} lat={53.608468} dir="forward" ref="14">Eidelstedt</.v>, <.v bounds="10.107975,53.591122,10.146042,53.630351" lon={10.125316} lat={53.6129} dir="forward" ref="14">Farmsen-Berne</.v> und <.v bounds="10.095898,53.529807,10.141066,53.565538" lon={10.126878} lat={53.560976} dir="forward" ref="14">Billstedt</.v>.</li>
      <li><strong>Autostraßen</strong>: hohes KFZ-Aufkommen und viel Lärm. Eindeutige Führung. Zahlreiche nur auf den KFZ-Verkehr ausgerichtete Ampeln bremsen den Radverkehr aus. Beispiele: alle Straßen des Ring 3, etwa <.v bounds="9.862411,53.579843,9.922039,53.615943" lon={9.878961} lat={53.590271} dir="forward" ref="14">Elbgaustraße</.v>, <.v bounds="9.987012,53.644297,10.095366,53.661184" lon={10.004046} lat={53.648579} dir="forward" ref="14">Krohnstieg</.v> oder <.v bounds="9.987012,53.644297,10.095366,53.661184" lon={10.039826} lat={53.647937} dir="forward" ref="14">Poppenbütteler Weg</.v>.</li>
    </ul>

    <p>Keine der Arten ist für den Radverkehr wirklich attraktiv. Abschnitte die nicht verändert werden sollen bzw. bereits umgebaut wurden haben die gleichen Probleme. Ein Ausbau nach bisherigen Schema kann also die Wegequalität- und Breite verbessern und ggf. die Führung verdeutlichen. Für gutes Vorankommen wären jedoch mehr Änderungen notwendig.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
