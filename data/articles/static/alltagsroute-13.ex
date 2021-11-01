defmodule Data.Article.Static.Alltagsroute13 do
  use Article.Static

  def id(), do: "13"
  def route_group(), do: :alltag
  def name(), do: "alltagsroute-13"
  def title(), do: "Alltagsroute 13"

  def color(), do: "#f28801"

  def summary(),
    do: "Alltagsroute 13 führt ringförmig im Uhrzeigersinn von Altona nach Borgefelde"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        group: "13",
        direction: :forward,
        from: "Altona",
        to: "Hamm",
        parent_ref: __MODULE__,
        text: "innere Ringroute, im Uhrzeigersinn",
        videos: [
          {"2021-07-10-13uhr-14gg/GX012155", :start, :end},
          {"2021-07-10-13uhr-14gg/GX012156", :start, :end},
          {"2021-07-10-13uhr-14gg/GX012157", :start, :end},
          {"2021-07-10-13uhr-14gg/GX012159", :start, :end},
          {"2021-07-10-13uhr-14gg/GX012160", :start, :end},
          {"2021-07-10-13uhr-14gg/GX012161", :start, :end},
          {"2021-07-10-13uhr-14gg/GX012162", :start, :end},
          {"2021-07-10-13uhr-14gg/GX012163", :start, :end},
          {"2021-07-10-13uhr-14gg/GX012164", :start, :end},
          {"2021-07-10-13uhr-14gg/GX012165", :start, :end},
          {"2021-07-10-13uhr-14gg/GX012166", :start, :end},
          {"2021-07-10-13uhr-14gg/GX012167", :start, "00:00:09.076"},
          {"2021-07-10-13uhr-14gg/GX012168", "00:00:01.668", :end},
          {"2021-07-10-13uhr-14gg/GX012169", :start, :end},
          {"2021-07-10-13uhr-14gg/GX012170", :start, :end},
          {"2021-07-10-13uhr-14gg/GX012171", :start, :end},
          {"2021-07-10-13uhr-14gg/GX012172", :start, :end},
          {"2021-07-10-13uhr-14gg/GX012173", :start, :end},
          {"2021-07-10-13uhr-14gg/GX012174", :start, :end},
          {"2021-07-10-13uhr-14gg/GX012175", :start, :end},
          {"2021-07-10-13uhr-14gg/GX012176", :start, :end},
          {"2021-07-10-13uhr-14gg/GX012177", :start, :end},
          {"2021-07-10-13uhr-14gg/GX012178", :start, :end},
          {"2021-07-10-13uhr-14gg/GX012179", :start, "00:00:12.079"},
          {"2021-07-15-14uhr-und-13gg/GX012277", "00:00:00.534", :end},
          {"2021-07-15-14uhr-und-13gg/GX012278", :start, "00:00:03.303"},
          {"2021-07-10-13uhr-14gg/GX012180", "00:00:03.403", :end},
          {"2021-07-10-13uhr-14gg/GX012181", :start, :end}
        ]
      },
      %Video.Track{
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
    <.structured_links gpx="yes"/>
    """
  end
end
