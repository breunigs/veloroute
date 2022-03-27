defmodule Data.Article.Static.Alltagsroute12 do
  use Article.Static

  def id(), do: "12"
  def route_group(), do: :alltag
  def title(), do: "Alltagsroute 12"

  def color(), do: "#ed6706"

  def summary(),
    do: "Alltagsroute 12 führt vom Rathaus nach Altona"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 1,
        group: "12",
        direction: :forward,
        from: "Innenstadt",
        to: "Altona",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Altona",
        videos: [
          {"2021-06-13-veloroute-5-5a-und-13rein/GX011832", :start, :end},
          {"2021-06-13-veloroute-5-5a-und-13rein/GX011833", :start, :end},
          {"2021-06-13-veloroute-5-5a-und-13rein/GX011834", :start, :end},
          {"2021-06-13-veloroute-5-5a-und-13rein/GX011835", :start, :end},
          {"2021-06-13-veloroute-5-5a-und-13rein/GX011836", :start, :end},
          {"2021-06-13-veloroute-5-5a-und-13rein/GX011837", :start, "00:00:46.413"}
        ]
      },
      %Video.Track{
        renderer: 1,
        group: "12",
        direction: :backward,
        from: "Altona",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "von Altona in die Innenstadt",
        videos: [
          {"2021-06-27-veloroute9/GX012013", :start, :end},
          {"2021-06-27-veloroute9/GX012014", :start, :end},
          {"2021-06-27-veloroute9/GX012015", :start, :end},
          {"2021-06-27-veloroute9/GX012016", :start, :end},
          {"2021-06-27-veloroute9/GX012017", :start, :end},
          {"2021-06-27-veloroute9/GX012018", :start, :end},
          {"2021-06-27-veloroute9/GX012019", :start, :end},
          {"2021-06-27-veloroute9/GX012020", :start, :end},
          {"2021-06-27-veloroute9/GX012021", :start, "00:00:13.413"},
          {"2021-06-22-velo7-und-pauli-altona/GX011901", "00:00:04.238", "00:00:16.450"},
          {"2021-06-05-velorouten-1-1a-2/GX011655", "00:00:34.601", "00:00:48.215"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/426798/veloroute-12/"},
      {"Komoot Routenplaner: nach Altona", "https://www.komoot.de/tour/225148542"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/2238410"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="7" style="background-image: url(/images/route12.svg)">
          <.icon>12</.icon>
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
          <.icon>2</.icon>
        </td>
        <td><.m bounds="9.9866263,53.5479641,9.9871242,53.548472">Rödingsmarkt</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>11</.icon>
        </td>
        <td><.m bounds="9.9661435,53.5412334,9.9761435,53.5512334">Landungsbrücken</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>11</.icon>
        </td>
        <td><.m bounds="9.9663729,53.5457403,9.9668345,53.5459993">Alter Elbtunnel</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9510767,53.5453571,9.9530303,53.546346">Fischmarkt</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>13</.icon>
        </td>
        <td><.m bounds="9.92758,53.5417787,9.9602617,53.5627471">Altona</.m></td>
      </tr>
    </table>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
