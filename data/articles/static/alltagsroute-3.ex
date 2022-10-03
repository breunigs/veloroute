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
        renderer: 3,
        group: "3",
        direction: :forward,
        from: "Innenstadt",
        to: "Niendorf",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Niendorf",
        videos: [
          {"2022-04-02-velo9/GX013424", "00:00:21.455", :end},
          {"2022-04-23-velo3-velo12altona/GX013488", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013489", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013490", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013492", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013493", :start, "00:00:01.702"},
          {"2022-04-23-velo3-velo12altona/GX013493", "00:00:02.970", :end},
          {"2022-04-23-velo3-velo12altona/GX013494", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013495", :start, "00:00:17.251"},
          {"2022-04-23-velo3-velo12altona/GX013496", "00:00:15.415", :end},
          {"2022-04-23-velo3-velo12altona/GX013497", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013499", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013500", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013501", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013503", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013504", :start, "00:01:00.894"},
          {"2022-04-23-velo3-velo12altona/GX013506", "00:00:02.469", "00:00:23.757"},
          {"2022-04-23-velo3-velo12altona/GX013504", "00:01:25.819", "00:02:00.287"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "3",
        direction: :backward,
        from: "Niendorf",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "von Niendorf in die Innenstadt",
        videos: [
          {"2022-07-24-neumuenster/GX014346", :start, :end},
          {"2022-07-24-neumuenster/GX014347", :start, :end},
          {"2022-07-24-neumuenster/GX014348", :start, :end},
          {"2022-07-24-neumuenster/GX014349", :start, :end},
          {"2022-07-24-neumuenster/GX014350", :start, :end},
          {"2022-07-24-neumuenster/GX014351", :start, "00:00:14.181"},
          {"2022-04-23-velo3-velo12altona/GX013514", "00:00:03.704", :end},
          {"2022-04-23-velo3-velo12altona/GX013515", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013516", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013517", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013518", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013519", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013520", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013521", :start, "00:00:15.616"}
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
    <.structured_links gpx={true}/>
    """
  end
end
