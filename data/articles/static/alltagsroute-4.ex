defmodule Data.Article.Static.Alltagsroute4 do
  use Article.Static

  def id(), do: "4"
  def route_group(), do: :alltag
  def title(), do: "Alltagsroute 4"

  def color(), do: "#008aa7"

  def summary(),
    do: "Alltagsroute 4 führt vom Rathaus zum Ochsenzoll"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 2,
        group: "4",
        direction: :forward,
        from: "Innenstadt",
        to: "Ochsenzoll",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt zum Ochsenzoll",
        videos: [
          {"2022-03-26-veloroute-4/GX013379", "00:00:08.842", "00:00:12.446"},
          {"2022-03-26-veloroute-4/GX013380", :start, :end},
          {"2022-03-26-veloroute-4/GX013381", :start, :end},
          {"2022-03-26-veloroute-4/GX013382", :start, "00:00:07.407"},
          {"2022-03-26-veloroute-4/GX013355", "00:00:01.969", :end},
          {"2022-03-26-veloroute-4/GX013356", :start, :end},
          {"2022-03-26-veloroute-4/GX013357", :start, :end},
          {"2022-03-26-veloroute-4/GX013358", :start, :end},
          {"2022-03-26-veloroute-4/GX013359", :start, :end},
          {"2022-03-26-veloroute-4/GX013360", :start, "00:03:01.248"},
          {"2022-03-26-veloroute-4/GX013367", "00:00:27.094", :end},
          {"2022-03-26-veloroute-4/GX013368", :start, "00:00:03.871"},
          {"2022-03-26-veloroute-4/GX013361", "00:00:11.645", :end}
        ]
      },
      %Video.Track{
        renderer: 2,
        group: "4",
        direction: :backward,
        from: "Ochsenzoll",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "vom Ochsenzoll in die Innenstadt",
        videos: [
          {"2022-03-26-veloroute-4/GX013362", "00:00:19.953", :end},
          {"2022-03-26-veloroute-4/GX013363", :start, :end},
          {"2022-03-26-veloroute-4/GX013364", :start, :end},
          {"2022-03-26-veloroute-4/GX013365", "00:00:01.702", :end},
          {"2022-03-26-veloroute-4/GX013366", :start, :end},
          {"2022-03-26-veloroute-4/GX013367", :start, "00:00:22.456"},
          {"2022-03-26-veloroute-4/GX013370", "00:00:10.644", :end},
          {"2022-03-26-veloroute-4/GX013371", :start, :end},
          {"2022-03-26-veloroute-4/GX013372", :start, :end},
          {"2022-03-26-veloroute-4/GX013373", :start, :end},
          {"2022-03-26-veloroute-4/GX013374", :start, :end},
          {"2022-03-26-veloroute-4/GX013375", :start, :end},
          {"2022-03-26-veloroute-4/GX013376", :start, "00:01:16.043"},
          {"2022-03-26-veloroute-4/GX013382", "00:00:25.225", :end},
          {"2022-03-26-veloroute-4/GX013383", :start, "00:00:15.182"},
          {"2022-03-26-veloroute-4/GX013377", "00:00:15.782", :end},
          {"2022-03-26-veloroute-4/GX013378", :start, :end},
          {"2022-03-26-veloroute-4/GX013379", :start, "00:00:08.242"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/418942/veloroute-4/"},
      {"Komoot Routenplaner: zum Ochsenzoll", "https://www.komoot.de/tour/204277309"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/191882"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="12" style="background-image: url(/images/route4.svg)">
          <.icon>4</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9915695,53.5499061,9.9931782,53.5509096">Rathaus</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9702523,53.571455,10.0048458,53.5852536">Harvestehude</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>13</.icon>
        </td>
        <td><.m bounds="9.9912541,53.575329,10.037075,53.6100971">Winterhude</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0012422,53.6021858,10.0028436,53.6032192">Sporthalle Hamburg</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9847402,53.6005769,10.0325604,53.6234808">Alsterdorf</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>5</.icon>
        </td>
        <td><.m bounds="9.9563463,53.6143894,10.0092691,53.6582832">Flughafen</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9563289,53.6143697,10.0366588,53.6497214">Fuhlsbüttel</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>14</.icon>
        </td>
        <td><.m bounds="10.0122131,53.6438888,10.0222131,53.6538888">Langenhorn</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0125721,53.6559764,10.0225721,53.6659764">Langenhorn Nord</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9968152,53.6730751,10.0068152,53.6830751">Ochsenzoll</.m></td>
      </tr>
      <tr>
        <td></td>
        <td class="dir"><.m bounds="9.979352,53.6839195,10.0348566,53.6910373">(Norderstedt)</.m></td>
      </tr>
    </table>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
