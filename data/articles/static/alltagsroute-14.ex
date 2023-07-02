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
        <td><.m bounds="9.8638682,53.5415406,9.917539,53.5600054">Othmarschen</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>1</.icon>
        </td>
        <td><.m bounds="9.8266622,53.5577662,9.8669147,53.5950351">Osdorf</.m></td>
      </tr>
      <tr>
        <td>
          <.icon bounds="9.784876,53.59252,9.903967,53.659784" lon={9.889568} lat={53.602359} dir="forward" name="rsw-elmshorn">RSW</.icon>
        </td>
        <td><.m bounds="9.844518,53.5813426,9.9008894,53.6132514">Lurup</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>2</.icon>
        </td>
        <td><.m bounds="9.8691962,53.5861088,9.9353742,53.6252091">Eidelstedt</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.8861829,53.6199835,9.9501171,53.6555215">Schnelsen</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>3</.icon>
        </td>
        <td><.m bounds="9.9451122,53.6358535,9.9551122,53.6458535">Niendorf Nord</.m></td>
      </tr>
      <tr>
        <td>
          <.icon bounds="9.784876,53.59252,10.060399,53.739026" lon={10.017399} lat={53.650044} dir="forward" name="rsw-bad-bramstedt">RSW</.icon>
          <.icon>4</.icon>
        </td>
        <td><.m bounds="10.0122131,53.6438888,10.0222131,53.6538888">Langenhorn</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0202046,53.6319343,10.0685823,53.6819818">Hummelsbüttel</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>5</.icon>
        </td>
        <td><.m bounds="10.0517108,53.6405808,10.1016828,53.6797629">Poppenbüttel</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0903848,53.6302042,10.1426051,53.6726368">Sasel</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>6</.icon>
        </td>
        <td><.m bounds="10.1349662,53.6220857,10.1449662,53.6320857">Berne</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>6</.icon>
        </td>
        <td><.m bounds="10.1127994,53.602222,10.1227994,53.612222">Farmsen</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>7</.icon>
        </td>
        <td><.m bounds="10.098152,53.5759187,10.1430031,53.5979981">Tonndorf</.m></td>
      </tr>
      <tr>
        <td class="dir"><.m bounds="10.14752,53.5540497,10.2785664,53.5988388">(Barsbüttel)</.m></td>
        <td><.m bounds="10.1034487,53.5643859,10.1520039,53.5879648">Jenfeld</.m>
          <.icon>7</.icon>
        </td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.1335082,53.5495053,10.152237,53.5659504">Öjendorfer Park</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>8</.icon>
        </td>
        <td><.m bounds="10.0903342,53.5190615,10.168776,53.5673577">Billstedt</.m></td>
      </tr>
    </table>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
