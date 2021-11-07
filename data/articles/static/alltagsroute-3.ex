defmodule Data.Article.Static.Alltagsroute3 do
  use Article.Static

  def id(), do: "3"
  def route_group(), do: :alltag
  def name(), do: "alltagsroute-3"
  def title(), do: "Alltagsroute 3"

  def color(), do: "#e8430b"

  def summary(),
    do: "Alltagsroute 3 führt vom Rathaus nach Niendorf"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        group: "3",
        direction: :forward,
        from: "Innenstadt",
        to: "Niendorf",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Niendorf",
        videos: [
          {"2021-06-05-velorouten-1-1a-2/GX011655", "00:00:46.480", :end},
          {"2021-06-05-velorouten-1-1a-2/GX011656", :start, "00:00:13.046"},
          {"2021-06-12-veloroute-3-und-4/GX011737", "00:00:11.144", :end},
          {"2021-06-12-veloroute-3-und-4/GX011738", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011739", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011740", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011741", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011742", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011743", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011744", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011745", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011746", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011747", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011748", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011749", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011750", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011751", :start, "00:00:02.302"}
        ]
      },
      %Video.Track{
        group: "3",
        direction: :backward,
        from: "Niendorf",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "von Niendorf in die Innenstadt",
        videos: [
          {"2021-06-12-veloroute-3-und-4/GX011751", "00:00:02.302", :end},
          {"2021-06-12-veloroute-3-und-4/GX011752", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011753", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011754", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011755", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011756", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011757", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011758", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011760", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011761", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011762", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011763", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011764", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011765", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011766", :start, "00:00:09.209"},
          {"2021-09-08-velo5-reroute/GX012727", "00:00:07.441", "00:00:20.120"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/418922/veloroute-3/"},
      {"Komoot Routenplaner: nach Niendorf", "https://www.komoot.de/tour/204275386"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/194840"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="9" style="background-image: url(/images/route3.svg)">
          <.icon>3</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9915695,53.5499061,9.9931782,53.5509096">Rathaus</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9879873,53.5547844,9.9893108,53.5554057">Gänsemarkt</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9903608,53.560823,9.9915904,53.5610058">Bahnhof Dammtor</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9700483,53.5569902,10.0082327,53.5738467">Rotherbaum</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>13</.icon>
        </td>
        <td><.m bounds="9.9683983,53.586403,9.9709292,53.5880841">Hoheluft</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9353742,53.5809668,9.9745973,53.608135">Lokstedt</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9465185,53.6146987,9.9565185,53.6246987">Niendorf Markt</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>14</.icon>
        </td>
        <td><.m bounds="9.9451122,53.6358535,9.9551122,53.6458535">Niendorf Nord</.m></td>
      </tr>
    </table>


    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
