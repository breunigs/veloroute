defmodule Data.Article.Static.Alltagsroute13 do
  use Article.Static

  def id(), do: "13"
  def route_group(), do: :alltag
  def title(), do: "Alltagsroute 13"

  def color(), do: "#f28801"

  def summary(),
    do: "Alltagsroute 13 führt ringförmig im Uhrzeigersinn von Altona nach Borgefelde"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "13",
        direction: :forward,
        from: "Altona",
        to: "Hamm",
        parent_ref: __MODULE__,
        text: "innere Ringroute, im Uhrzeigersinn",
        videos: [
          {"2022-05-15-13im-14gg/GX013900", "00:00:03.337", :end},
          {"2022-05-15-13im-14gg/GX013901", :start, :end},
          {"2022-05-15-13im-14gg/GX013902", :start, :end},
          {"2022-05-15-13im-14gg/GX013903", :start, :end},
          {"2022-05-15-13im-14gg/GX013904", :start, :end},
          {"2022-05-15-13im-14gg/GX013905", :start, :end},
          {"2022-05-15-13im-14gg/GX013906", :start, :end},
          {"2022-05-15-13im-14gg/GX013907", :start, :end},
          {"2022-05-15-13im-14gg/GX013908", :start, :end},
          {"2022-05-15-13im-14gg/GX013909", :start, :end},
          {"2022-05-15-13im-14gg/GX013910", :start, :end},
          {"2022-05-15-13im-14gg/GX013911", :start, :end},
          {"2022-05-15-13im-14gg/GX013912", :start, "00:00:13.313"},
          {"2022-05-15-13im-14gg/GX013914", "00:00:31.398", :end},
          {"2022-05-15-13im-14gg/GX013915", :start, :end},
          {"2022-05-15-13im-14gg/GX013916", :start, :end},
          {"2022-05-15-13im-14gg/GX013917", :start, "00:00:04.538"},
          {"2022-05-15-13im-14gg/GX013917", "00:00:47.114", :end},
          {"2022-05-15-13im-14gg/GX013918", :start, :end},
          {"2022-05-15-13im-14gg/GX013919", :start, :end},
          {"2022-05-15-13im-14gg/GX013920", :start, :end},
          {"2022-05-15-13im-14gg/GX013921", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 1,
        group: "13",
        direction: :backward,
        from: "Hamm",
        to: "Altona",
        parent_ref: __MODULE__,
        text: "innere Ringroute, gegen Uhrzeigersinn",
        videos: [
          {"2021-07-15-14uhr-und-13gg/GX012276", "00:00:00.601", "00:00:11.979"},
          {"2021-07-15-14uhr-und-13gg/GX012279", "00:00:03.203", :end},
          {"2021-07-15-14uhr-und-13gg/GX012280", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012281", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012282", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012283", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012284", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012285", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012286", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012287", :start, "00:00:08.408"},
          {"2021-07-15-14uhr-und-13gg/GX012288", "00:00:02.369", "00:00:25.559"},
          {"2021-07-15-14uhr-und-13gg/GX012289", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012290", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012291", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012292", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012293", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012294", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012295", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012296", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012297", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012298", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012299", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012300", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012301", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012302", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012303", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012304", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012305", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012306", :start, :end},
          {"2021-07-15-14uhr-und-13gg/GX012307", :start, "00:00:07.040"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011552", "00:00:03.737", "00:00:07.608"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/426810/veloroute-13/"},
      {"Komoot Routenplaner: von Altona nach Borgefelde", "https://www.komoot.de/tour/225149264"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/2238764"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="11" style="background-image: url(/images/route13.svg)">
          <.icon>13</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <.icon>12</.icon>
        </td>
        <td><.m bounds="9.92758,53.5417787,9.9602617,53.5627471">Altona</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>2</.icon>
        </td>
        <td><.m bounds="9.9351095,53.5631662,9.9775009,53.5824343">Eimsbüttel</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>3</.icon>
        </td>
        <td><.m bounds="9.9683983,53.586403,9.9709292,53.5880841">Hoheluft</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9676637,53.5837055,9.9974094,53.6028033">Eppendorf</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>4</.icon>
        </td>
        <td><.m bounds="9.9912541,53.575329,10.037075,53.6100971">Winterhude</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0129797,53.5796362,10.0130948,53.5797767">Mühlenkamp</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>5</.icon>
        </td>
        <td><.m bounds="10.0190335,53.5696406,10.057332,53.5853664">Barmbek-Süd</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>6</.icon>
        </td>
        <td><.m bounds="10.0440274,53.5707023,10.0441274,53.5708023">Auenviertel</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>7</.icon>
        </td>
        <td><.m bounds="10.0318304,53.5608608,10.0627028,53.5760196">Eilbek</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>8</.icon>
        </td>
        <td><.m bounds="10.022745,53.5494664,10.0411521,53.5608608">Borgfelde</.m></td>
      </tr>
    </table>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
