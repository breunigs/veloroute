defmodule Data.Article.Static.Alltagsroute2 do
  use Article.Static

  def id(), do: "2"
  def route_group(), do: :alltag
  def title(), do: "Alltagsroute 2"

  def color(), do: "#b2211d"

  def summary(),
    do: "Alltagsroute 2 führt vom Rathaus nach Eidelstedt"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "2",
        direction: :forward,
        from: "Innenstadt",
        to: "Eidelstedt",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Eidelstedt",
        videos: [
          {"2022-04-22-velo2/GX013448", :start, :end},
          {"2022-04-22-velo2/GX013449", :start, :end},
          {"2022-04-22-velo2/GX013450", :start, "00:00:05.172"},
          {"2022-04-22-velo2/GX013451", :start, :end},
          {"2022-04-22-velo2/GX013452", :start, :end},
          {"2022-04-22-velo2/GX013453", :start, :end},
          {"2022-04-22-velo2/GX013454", :start, :end},
          {"2022-04-22-velo2/GX013455", :start, :end},
          {"2022-04-22-velo2/GX013456", :start, :end},
          {"2022-04-22-velo2/GX013457", :start, :end},
          {"2022-04-22-velo2/GX013458", :start, :end},
          {"2022-04-22-velo2/GX013459", :start, :end},
          {"2022-04-22-velo2/GX013460", :start, :end},
          {"2022-04-22-velo2/GX013461", :start, :end},
          {"2022-04-22-velo2/GX013462", :start, :end},
          {"2022-04-22-velo2/GX013463", :start, :end},
          {"2022-04-22-velo2/GX013464", :start, "00:00:02.236"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "2",
        direction: :backward,
        from: "Eidelstedt",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "von Eidelstedt in die Innenstadt",
        videos: [
          {"2022-04-22-velo2/GX013464", "00:00:12.813", :end},
          {"2022-04-22-velo2/GX013465", :start, :end},
          {"2022-04-22-velo2/GX013466", :start, :end},
          {"2022-04-22-velo2/GX013467", :start, :end},
          {"2022-04-22-velo2/GX013468", :start, :end},
          {"2022-04-22-velo2/GX013469", :start, :end},
          {"2022-04-22-velo2/GX013470", "00:00:01.101", :end},
          {"2022-04-22-velo2/GX013471", :start, :end},
          {"2022-04-22-velo2/GX013472", :start, :end},
          {"2022-04-22-velo2/GX013473", :start, :end},
          {"2022-04-22-velo2/GX013444", :start, :end},
          {"2022-04-22-velo2/GX013445", :start, "00:00:16.316"},
          {"2022-04-22-velo2/GX013446", "00:00:00.901", :end},
          {"2022-04-22-velo2/GX013447", :start, "00:00:12.412"},
          {"2022-03-26-veloroute-4/GX013342", "00:00:30.764", "00:01:00.694"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/418914/veloroute-2/"},
      {"Komoot Routenplaner: nach Eidelstedt", "https://www.komoot.de/tour/204274161"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/194841"}
    ]
  end

  def text(assigns) do
    ~H"""
     <table class="routing">
      <tr>
        <td></td>
        <td rowspan="9" style="background-image: url(/images/route2.svg)">
          <.icon>2</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9915695,53.5499061,9.9931782,53.5509096">Rathaus</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>1</.icon>
          <.icon>11</.icon>
          <.icon>12</.icon>
        </td>
        <td><.m bounds="9.9866263,53.5479641,9.9871242,53.548472">Rödingsmarkt</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9624081,53.5594992,9.9655552,53.562092">Schanzenviertel</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>13</.icon>
        </td>
        <td><.m bounds="9.9351095,53.5631662,9.9775009,53.5824343">Eimsbüttel</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9307791,53.5796377,9.9308791,53.5797377">Langenfelde</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9054092,53.5716142,9.948001,53.6064873">Stellingen</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>14</.icon>
        </td>
        <td><.m bounds="9.8691962,53.5861088,9.9353742,53.6252091">Eidelstedt</.m></td>
      </tr>
      <tr>
        <td></td>
        <td class="dir"><.m bounds="9.7988673,53.6092986,9.8849942,53.6472848">(Halstenbek)</.m></td>
      </tr>
    </table>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
