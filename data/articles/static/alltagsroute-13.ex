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
        historic: %{
          "e29ad9e22984ec8ea9c871aadca15443" => ~d[2023-06],
          "61efced8de5be9384b396cc574220cbe" => ~d[2022-05]
        },
        videos: [
          {"2023-06-25-13im-14gg/GX016066", :start, :end},
          {"2023-06-25-13im-14gg/GX016067", :start, :end},
          {"2023-06-25-13im-14gg/GX016068", :start, :end},
          {"2023-06-25-13im-14gg/GX016069", :start, :end},
          {"2023-06-25-13im-14gg/GX016070", :start, :end},
          {"2023-06-25-13im-14gg/GX016071", :start, :end},
          {"2023-06-25-13im-14gg/GX016072", :start, :end},
          {"2023-06-25-13im-14gg/GX016073", :start, :end},
          {"2023-06-25-13im-14gg/GX016074", :start, :end},
          {"2023-06-25-13im-14gg/GX016075", :start, :end},
          {"2023-06-25-13im-14gg/GX016076", :start, :end},
          {"2023-06-25-13im-14gg/GX016077", :start, :end},
          {"2023-06-25-13im-14gg/GX016078", :start, :end},
          {"2023-06-25-13im-14gg/GX016079", :start, :end},
          {"2023-06-25-13im-14gg/GX016080", :start, :end},
          {"2023-06-25-13im-14gg/GX016081", :start, :end},
          {"2023-06-25-13im-14gg/GX016082", :start, :end},
          {"2023-06-25-13im-14gg/GX016083", :start, :end},
          {"2023-06-25-13im-14gg/GX016084", :start, :end},
          {"2023-06-25-13im-14gg/GX016085", :start, :end},
          {"2023-06-25-13im-14gg/GX016086", :start, :end},
          {"2023-06-25-13im-14gg/GX016088", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "13",
        direction: :backward,
        from: "Hamm",
        to: "Altona",
        parent_ref: __MODULE__,
        text: "innere Ringroute, gegen Uhrzeigersinn",
        historic: %{
          "6dcbeca4acd6f5fdfc16c40446290db1" => ~d[2023-06],
          "389dcd7d37df5354bf21e20e13007b84" => ~d[2022-05],
          "b5ddde0ec8f7dde1de5b114ad3fa80fc" => ~d[2021-07]
        },
        videos: [
          {"2023-06-24-14im-13gg/GX016038", "00:00:04.104", "00:00:38.205"},
          {"2023-06-24-14im-13gg/GX016042", "00:00:36.036", :end},
          {"2023-06-24-14im-13gg/GX016043", :start, :end},
          {"2023-06-24-14im-13gg/GX016044", :start, :end},
          {"2023-06-24-14im-13gg/GX016045", :start, :end},
          {"2023-06-24-14im-13gg/GX016046", :start, :end},
          {"2023-06-24-14im-13gg/GX016047", :start, :end},
          {"2023-06-24-14im-13gg/GX016048", :start, :end},
          {"2023-06-24-14im-13gg/GX016049", :start, :end},
          {"2023-06-24-14im-13gg/GX016050", :start, :end},
          {"2023-06-24-14im-13gg/GX016051", :start, :end},
          {"2023-06-24-14im-13gg/GX016052", :start, :end},
          {"2023-06-24-14im-13gg/GX016053", :start, :end},
          {"2023-06-24-14im-13gg/GX016054", :start, :end},
          {"2023-06-24-14im-13gg/GX016055", :start, :end},
          {"2023-06-24-14im-13gg/GX016056", :start, :end},
          {"2023-06-24-14im-13gg/GX016057", :start, :end},
          {"2023-06-24-14im-13gg/GX016058", :start, :end},
          {"2023-06-24-14im-13gg/GX016059", :start, :end},
          {"2023-06-24-14im-13gg/GX016060", :start, :end},
          {"2023-06-24-14im-13gg/GX016061", :start, :end},
          {"2023-06-24-14im-13gg/GX016062", :start, :end},
          {"2023-06-24-14im-13gg/GX016063", :start, :end}
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
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
