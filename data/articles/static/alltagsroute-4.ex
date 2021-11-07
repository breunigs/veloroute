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
        group: "4",
        direction: :forward,
        from: "Innenstadt",
        to: "Ochsenzoll",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt zum Ochsenzoll",
        videos: [
          {"2021-06-05-velorouten-1-1a-2/GX011655", "00:00:46.480", :end},
          {"2021-06-05-velorouten-1-1a-2/GX011656", :start, "00:00:02.669"},
          {"2021-06-12-veloroute-3-und-4/GX011701", "00:00:01.301", :end},
          {"2021-06-12-veloroute-3-und-4/GX011702", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011703", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011704", :start, "00:00:02.135"},
          {"2021-09-26-velo6-rsw-ahrensburg/GX012988", "00:00:02.603", "00:00:06.039"},
          {"2021-09-26-velo6-rsw-ahrensburg/GX012983", "00:01:17.811", "00:01:33.660"},
          {"2021-06-12-veloroute-3-und-4/GX011704", "00:00:20.554", :end},
          {"2021-06-12-veloroute-3-und-4/GX011705", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011706", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011707", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011708", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011709", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011710", :start, "00:02:14.067"},
          {"2021-09-09-rsw-bad-bramstedt/GX012763", "00:01:27.187", "00:01:58.018"},
          {"2021-06-12-veloroute-3-und-4/GX011711", "00:00:11.712", :end}
        ]
      },
      %Video.Track{
        group: "4",
        direction: :backward,
        from: "Ochsenzoll",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "vom Ochsenzoll in die Innenstadt",
        videos: [
          {"2021-06-12-veloroute-3-und-4/GX011712", "00:00:01.869", :end},
          {"2021-06-12-veloroute-3-und-4/GX011713", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011714", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011715", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011716", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011717", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011718", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011719", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011720", :start, "00:00:19.319"},
          {"2021-06-12-veloroute-3-und-4/GX011727", "00:00:01.568", :end},
          {"2021-06-12-veloroute-3-und-4/GX011728", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011729", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011730", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011731", :start, "00:00:58.759"},
          {"2021-09-26-velo6-rsw-ahrensburg/GX012984", "00:00:02.636", "00:00:25.125"},
          {"2021-06-12-veloroute-3-und-4/GX011731", "00:01:21.848", :end},
          {"2021-06-12-veloroute-3-und-4/GX011732", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011733", :start, :end},
          {"2021-06-12-veloroute-3-und-4/GX011734", :start, "00:00:26.894"},
          {"2021-09-08-velo5-reroute/GX012727", "00:00:09.510", "00:00:20.120"}
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
