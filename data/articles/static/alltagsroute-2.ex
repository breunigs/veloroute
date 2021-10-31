defmodule Data.Article.Static.Alltagsroute2 do
  use Article.Static

  def id(), do: "2"
  def route_group(), do: :alltag
  def name(), do: "alltagsroute-2"
  def title(), do: "Alltagsroute 2"

  def color(), do: "#b2211d"

  def summary(),
    do: "Alltagsroute 2 führt vom Rathaus nach Eidelstedt"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        group: "2",
        direction: :forward,
        from: "Innenstadt",
        to: "Eidelstedt",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Eidelstedt",
        videos: [
          {"2021-06-05-velorouten-1-1a-2/GX011629", "00:00:12.246", :end},
          {"2021-06-05-velorouten-1-1a-2/GX011630", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011631", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011632", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011633", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011634", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011635", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011636", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011637", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011638", :start, "00:01:03.397"},
          {"2021-06-05-velorouten-1-1a-2/GX011647", "00:00:55.522", "00:01:34.061"},
          {"2021-06-05-velorouten-1-1a-2/GX011638", "00:01:35.128", :end},
          {"2021-06-05-velorouten-1-1a-2/GX011639", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011640", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011641", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011642", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011643", :start, :end}
        ]
      },
      %Video.Track{
        group: "2",
        direction: :backward,
        from: "Eidelstedt",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "von Eidelstedt in die Innenstadt",
        videos: [
          {"2021-06-05-velorouten-1-1a-2/GX011645", :start, "00:00:19.620"},
          {"2021-06-05-velorouten-1-1a-2/GX011645", "00:01:05.399", :end},
          {"2021-06-05-velorouten-1-1a-2/GX011646", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011647", :start, "00:00:54.855"},
          {"2021-06-05-velorouten-1-1a-2/GX011649", "00:00:15.749", :end},
          {"2021-06-05-velorouten-1-1a-2/GX011650", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011651", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011652", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011653", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011654", :start, :end},
          {"2021-06-05-velorouten-1-1a-2/GX011655", :start, :end}
        ]
      }
    ]

  def links() do
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
    <.structured_links gpx="yes"/>
    """
  end
end
