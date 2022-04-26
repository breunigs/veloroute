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
        renderer: 3,
        group: "1",
        direction: :forward,
        from: "Innenstadt",
        to: "Rissen",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Rissen",
        videos: [
          {"2022-04-22-velo2/GX013448", :start, :end},
          {"2022-04-22-velo2/GX013449", :start, :end},
          {"2022-04-22-velo2/GX013450", :start, "00:00:05.172"},
          {"2022-04-22-velo2/GX013451", :start, :end},
          {"2022-04-22-velo2/GX013452", :start, :end},
          {"2022-04-22-velo2/GX013453", :start, :end},
          {"2022-04-22-velo2/GX013454", :start, "00:00:07.941"},
          {"2022-04-22-velo2/GX013478", "00:00:07.140", :end},
          {"2022-04-22-velo2/GX013479", :start, "00:00:17.117"},
          {"2022-04-24-velo1-1a/GX013531", "00:00:05.072", :end},
          {"2022-04-24-velo1-1a/GX013532", :start, :end},
          {"2022-04-24-velo1-1a/GX013533", :start, :end},
          {"2022-04-24-velo1-1a/GX013534", :start, :end},
          {"2022-04-24-velo1-1a/GX013535", :start, :end},
          {"2022-04-24-velo1-1a/GX013536", :start, :end},
          {"2022-04-24-velo1-1a/GX013537", :start, :end},
          {"2022-04-24-velo1-1a/GX013539", :start, :end},
          {"2022-04-24-velo1-1a/GX013540", :start, :end},
          {"2022-04-24-velo1-1a/GX013541", :start, :end},
          {"2022-04-24-velo1-1a/GX013542", :start, :end},
          {"2022-04-24-velo1-1a/GX013543", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "1",
        direction: :backward,
        from: "Rissen",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "aus Rissen in die Innenstadt",
        videos: [
          {"2022-04-24-velo1-1a/GX013544", "00:00:01.268", :end},
          {"2022-04-24-velo1-1a/GX013545", :start, :end},
          {"2022-04-24-velo1-1a/GX013546", :start, "00:01:05.198"},
          {"2022-04-24-velo1-1a/GX013547", "00:00:02.836", :end},
          {"2022-04-24-velo1-1a/GX013548", :start, "00:00:47.180"},
          {"2022-04-24-velo1-1a/GX013555", "00:00:31.765", :end},
          {"2022-04-24-velo1-1a/GX013556", :start, :end},
          {"2022-04-24-velo1-1a/GX013557", :start, :end},
          {"2022-04-24-velo1-1a/GX013558", :start, :end},
          {"2022-04-24-velo1-1a/GX013559", :start, :end},
          {"2022-04-24-velo1-1a/GX013560", :start, :end},
          {"2022-04-24-velo1-1a/GX013561", :start, "00:00:24.725"},
          {"2022-04-02-velo9/GX013390", "00:00:04.371", "00:00:14.681"},
          {"2022-04-23-velo3-velo12altona/GX013481", "00:00:01.368", "00:00:33.200"},
          {"2022-04-22-velo2/GX013443", "00:00:10.077", :end},
          {"2022-04-22-velo2/GX013444", :start, :end},
          {"2022-04-22-velo2/GX013445", :start, "00:00:16.316"},
          {"2022-04-22-velo2/GX013446", "00:00:00.901", :end},
          {"2022-04-22-velo2/GX013447", :start, "00:00:12.412"},
          {"2022-03-26-veloroute-4/GX013342", "00:00:30.764", "00:01:00.694"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "1a",
        direction: :forward,
        from: "Innenstadt",
        to: "Osdorfer Born",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt zum Osdorfer Born",
        videos: [
          {"2022-04-24-velo1-1a/GX013549", "00:00:04.605", :end},
          {"2022-04-24-velo1-1a/GX013550", :start, :end},
          {"2022-04-24-velo1-1a/GX013551", :start, :end},
          {"2022-04-24-velo1-1a/GX013552", :start, "00:00:56.256"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "1a",
        direction: :backward,
        from: "Osdorfer Born",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "vom Osdorfer Born in die Innenstadt",
        videos: [
          {"2022-04-24-velo1-1a/GX013553", "00:00:02.069", :end},
          {"2022-04-24-velo1-1a/GX013554", :start, :end},
          {"2022-04-24-velo1-1a/GX013555", :start, "00:00:33.600"}
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
