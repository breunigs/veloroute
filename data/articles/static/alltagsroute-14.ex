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
        renderer: 1,
        group: "14",
        direction: :forward,
        from: "Othmarschen",
        to: "Billstedt",
        parent_ref: __MODULE__,
        text: "äußere Ringroute im Uhrzeigersinn",
        videos: [
          {"2021-06-05-velorouten-1-1a-2/GX011680", "00:00:01.000", "00:00:47.915"},
          {"2021-09-25-velo1-velo14-changed-routing-flottbek/GX012935", "00:00:32.466",
           "00:00:48.148"},
          {"2021-09-25-velo1-velo14-changed-routing-flottbek/GX012936", :start, "00:00:18.018"},
          {"2021-09-25-velo1-velo14-changed-routing-flottbek/GX012937", "00:00:03.770",
           "00:00:29.763"},
          {"2021-07-15-14uhr-und-13gg/GX012235", "00:00:38.906", :end},
          {"2021-07-15-14uhr-und-13gg/GX012236", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012238", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012239", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012240", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012241", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012242", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012243", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012244", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012245", :start, "00:00:39.773"},
          {"2021-07-15-14uhr-und-13gg/GX012246", "00:00:00.033", :end},
          {"2021-07-15-14uhr-und-13gg/GX012247", "00:00:00.033", "00:00:35.102"},
          # TODO: gap here (this segment takes the wrong path)
          {"2021-07-15-14uhr-und-13gg/GX012247", "00:01:36.229", "00:02:08.362"},
          {"2021-07-15-14uhr-und-13gg/GX012250", "00:00:00.434", :end},
          {"2021-07-15-14uhr-und-13gg/GX012251", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012252", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012253", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012254", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012255", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012256", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012257", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012258", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012259", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012260", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012261", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012262", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012263", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012264", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012265", :start, "00:00:13.213"},
          {"2021-07-15-14uhr-und-13gg/GX012266", "00:00:29.129", "00:00:50.317"},
          {"2021-07-15-14uhr-und-13gg/GX012267", "00:00:01.602", :end},
          {"2021-07-15-14uhr-und-13gg/GX012268", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012269", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012270", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012271", :start, :end}
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
        videos: [
          {"2022-05-15-13im-14gg/GX013928", "00:00:23.156", :end},
          {"2022-05-15-13im-14gg/GX013929", :start, :end},
          {"2022-05-15-13im-14gg/GX013930", :start, :end},
          {"2022-05-15-13im-14gg/GX013931", :start, :end},
          {"2022-05-15-13im-14gg/GX013932", :start, :end},
          {"2022-05-15-13im-14gg/GX013933", :start, :end},
          {"2022-05-15-13im-14gg/GX013934", :start, "00:01:18.478"},
          {"2022-05-15-13im-14gg/GX013935", "00:00:13.847", :end},
          {"2022-05-15-13im-14gg/GX013936", :start, :end},
          {"2022-05-15-13im-14gg/GX013937", :start, :end},
          {"2022-05-15-13im-14gg/GX013938", :start, :end},
          {"2022-05-15-13im-14gg/GX013939", :start, :end},
          {"2022-05-15-13im-14gg/GX013940", :start, :end},
          {"2022-05-15-13im-14gg/GX013941", :start, :end},
          {"2022-05-15-13im-14gg/GX013943", :start, :end},
          {"2022-05-15-13im-14gg/GX013944", :start, :end},
          {"2022-05-15-13im-14gg/GX013945", :start, :end},
          {"2022-05-15-13im-14gg/GX013946", :start, :end},
          {"2022-05-15-13im-14gg/GX013947", :start, :end},
          {"2022-05-15-13im-14gg/GX013948", :start, :end},
          {"2022-05-15-13im-14gg/GX013949", :start, :end},
          {"2022-05-15-13im-14gg/GX013950", :start, :end},
          {"2022-05-15-13im-14gg/GX013951", :start, :end},
          {"2022-05-15-13im-14gg/GX013952", :start, :end},
          {"2022-05-15-13im-14gg/GX013953", :start, :end},
          {"2022-05-15-13im-14gg/GX013954", :start, :end},
          {"2022-05-15-13im-14gg/GX013955", :start, :end},
          {"2022-04-24-velo1-1a/GX013554", :start, :end},
          {"2022-04-24-velo1-1a/GX013555", :start, "00:00:33.600"}
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
        <td>
          <.icon>1</.icon>
        </td>
        <td><.m bounds="9.8638682,53.5415406,9.917539,53.5600054">Othmarschen</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>1</.icon>
        </td>
        <td><.m bounds="9.8266622,53.5577662,9.8669147,53.5950351">Osdorf</.m></td>
      </tr>
      <tr>
        <td></td>
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
    <.structured_links gpx="true"/>
    """
  end
end
