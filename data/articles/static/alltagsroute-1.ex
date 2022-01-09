defmodule Data.Article.Static.Alltagsroute1 do
  use Article.Static

  def id(), do: "1"
  def route_group(), do: :alltag
  def title(), do: "Alltagsroute 1"

  def color(), do: "#7d8b2f"

  def summary(),
    do:
      "Alltagsroute 1 führt vom Rathaus nach Rissen bzw. zum Osdorfer Born. Die Route spaltet sich in Othmarschen."

  def tags(), do: [id(), "1a"]

  def tracks(),
    do: [
      %Video.Track{
        fade: nil,
        group: "1",
        direction: :forward,
        from: "Innenstadt",
        to: "Rissen",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Rissen",
        videos: [
          {"2021-06-05-velorouten-1-1a-2/GX011629", "00:00:12.246", :end},
          {"2021-06-05-velorouten-1-1a-2/GX011630", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011631", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011632", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011633", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011659", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011660", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011661", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011662", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011663", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011664", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011665", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011666", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011667", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011668", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011669", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011670", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011671", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011672", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011673", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011674", :start, "00:01:14.000"}
        ]
      },
      %Video.Track{
        fade: nil,
        group: "1",
        direction: :backward,
        from: "Rissen",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "aus Rissen in die Innenstadt",
        videos: [
          {"2021-06-05-velorouten-1-1a-2/GX011675", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011676", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011677", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011678", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011679", :start, "00:00:45.178"},
          {"2021-06-05-velorouten-1-1a-2/GX011686", "00:02:00.187", :end},
          {"2021-06-05-velorouten-1-1a-2/GX011687", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011688", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011690", :start, "00:00:15.282"},
          {"2021-06-05-velorouten-1-1a-2/GX011691", "00:00:01.134", :end},
          {"2021-06-05-velorouten-1-1a-2/GX011692", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011693", :start, :end},
          {"2021-04-18-freizeitroute3/GX011324", :start, "00:00:16.683"},
          {"2021-04-10-freizeitroute2/GX011183", "00:00:01.435", "00:00:51.818"},
          {"2021-06-05-velorouten-1-1a-2/GX011654", "00:00:30.964", :end},
          {"2021-06-05-velorouten-1-1a-2/GX011655", :start, :end}
        ]
      },
      %Video.Track{
        fade: nil,
        group: "1a",
        direction: :forward,
        from: "Innenstadt",
        to: "Osdorfer Born",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt zum Osdorfer Born",
        videos: [
          {"2021-06-05-velorouten-1-1a-2/GX011680", "00:00:01.000", "00:00:47.915"},
          {"2021-09-25-velo1-velo14-changed-routing-flottbek/GX012935", "00:00:32.466",
           "00:00:48.148"},
          {"2021-09-25-velo1-velo14-changed-routing-flottbek/GX012936", :start, "00:00:17.918"},
          {"2021-09-25-velo1-velo14-changed-routing-flottbek/GX012939", "00:00:01.335",
           "00:00:33.600"},
          {"2021-06-05-velorouten-1-1a-2/GX011682", "00:00:15.883", :end},
          {"2021-06-05-velorouten-1-1a-2/GX011683", :start, "00:00:47.447"}
        ]
      },
      %Video.Track{
        fade: nil,
        group: "1a",
        direction: :backward,
        from: "Osdorfer Born",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "vom Osdorfer Born in die Innenstadt",
        videos: [
          {"2021-06-05-velorouten-1-1a-2/GX011683", "00:00:47.447", :end},
          {"2021-06-05-velorouten-1-1a-2/GX011684", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011685", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011686", :start, "00:00:07.174"},
          {"2021-09-25-velo1-velo14-changed-routing-flottbek/GX012940", "00:00:01.235", :end},
          {"2021-09-25-velo1-velo14-changed-routing-flottbek/GX012941", :start, "00:00:12.045"},
          {"2021-06-05-velorouten-1-1a-2/GX011686", "00:01:18.345", "00:02:00.187"}
        ]
      }
    ]

  def links(assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/418898/veloroute-1/"},
      ~H{Komoot Routenplaner: <.a href="https://www.komoot.de/tour/228243760">zum Osdorfer Born</.a> oder <.a href="https://www.komoot.de/tour/225147673">nach Rissen</.a>},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/194843"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="14" style="background-image: url(/images/route1.svg)">
          <.icon>1</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9915695,53.5499061,9.9931782,53.5509096">Rathaus</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>11</.icon>
          <.icon>12</.icon>
          <.icon>2</.icon>
        </td>
        <td><.m bounds="9.9866263,53.5479641,9.9871242,53.548472">Rödingsmarkt</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9672602,53.5511364,9.9745376,53.5571361">Heiligengeistfeld</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>7</.icon>
        </td>
        <td><.m bounds="9.9549651,53.5431746,9.9902942,53.5638046">St. Pauli</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.92758,53.5417787,9.9602617,53.5627471">Altona-Altstadt</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9093475,53.5415333,9.9348885,53.5600679">Ottensen</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>14</.icon>
        </td>
        <td><.m bounds="9.8638682,53.5415406,9.917539,53.5600054">Othmarschen</.m></td>
      </tr>
      <tr>
        <td><.m bounds="9.8637341,53.5583216,9.9004188,53.5715607">Groß Flottbek</.m></td>
        <td><.m bounds="9.8558825,53.5531648,9.8658825,53.5631648">Klein Flottbek</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>14</.icon> <.m bounds="9.8266622,53.5577662,9.8669147,53.5950351">Osdorf</.m>
        </td>
        <td><.m bounds="9.8204171,53.5442254,9.8650723,53.5653583">Nienstedten</.m></td>
      </tr>
      <tr>
        <td><.m bounds="9.8399615,53.5752492,9.8456209,53.5917348">Osdorfer Born</.m></td>
        <td><.m bounds="9.7617571,53.5508,9.8266896,53.5742528">Blankenese</.m></td>
      </tr>
      <tr>
        <td class="dir"><.m bounds="9.7897061,53.5841903,9.8681548,53.6156231">(Schenefeld)</.m></td>
        <td><.m bounds="9.7788518,53.5709306,9.8184877,53.6067525">Sülldorf</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.7301155,53.5551486,9.7990198,53.6314046">Rissen</.m></td>
      </tr>
      <tr>
        <td></td>
        <td class="dir"><.m bounds="9.6333439,53.5575882,9.7592222,53.6187534">(Wedel)</.m></td>
      </tr>
    </table>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
