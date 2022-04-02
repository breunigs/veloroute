defmodule Data.Article.Static.Alltagsroute9 do
  use Article.Static

  def id(), do: "9"
  def route_group(), do: :alltag
  def title(), do: "Alltagsroute 9"

  def color(), do: "#9d2928"

  def summary(),
    do: "Alltagsroute 9 führt vom Rathaus nach Bergedorf"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        group: "9 Bergedorf",
        direction: :forward,
        from: "Innenstadt",
        to: "Bergedorf",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Bergedorf",
        videos: [
          {"2022-04-02-velo9/GX013399", "00:00:18.185", :end},
          {"2022-04-02-velo9/GX013400", :start, :end},
          {"2022-04-02-velo9/GX013401", :start, :end},
          {"2022-04-02-velo9/GX013402", :start, :end},
          {"2022-04-02-velo9/GX013403", :start, :end},
          {"2022-04-02-velo9/GX013404", :start, :end},
          {"2022-04-02-velo9/GX013405", :start, :end},
          {"2022-04-02-velo9/GX013406", :start, :end},
          {"2022-04-02-velo9/GX013407", :start, :end},
          {"2022-04-02-velo9/GX013408", :start, :end},
          {"2022-04-02-velo9/GX013409", :start, :end},
          {"2022-04-02-velo9/GX013410", :start, :end},
          {"2022-04-02-velo9/GX013411", :start, :end},
          {"2022-04-02-velo9/GX013412", :start, "00:00:13.847"}
        ]
      },
      %Video.Track{
        group: "9 Bergedorf",
        direction: :backward,
        from: "Bergedorf",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "aus Bergedorf in die Innenstadt",
        videos: [
          {"2022-04-02-velo9/GX013412", "00:00:26.226", :end},
          {"2022-04-02-velo9/GX013413", :start, :end},
          {"2022-04-02-velo9/GX013414", :start, :end},
          {"2022-04-02-velo9/GX013415", :start, :end},
          {"2022-04-02-velo9/GX013416", :start, :end},
          {"2022-04-02-velo9/GX023416", :start, "00:00:22.589"},
          {"2022-04-02-velo9/GX023416", "00:00:50.617", :end},
          {"2022-04-02-velo9/GX013417", :start, :end},
          {"2022-04-02-velo9/GX013418", :start, :end},
          {"2022-04-02-velo9/GX013419", :start, :end},
          {"2022-04-02-velo9/GX013420", :start, :end},
          {"2022-04-02-velo9/GX013421", :start, :end},
          {"2022-04-02-velo9/GX013422", :start, :end},
          {"2022-04-02-velo9/GX013424", :start, "00:00:21.588"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/426734/veloroute-9/"},
      {"Komoot Routenplaner: nach Bergedorf", "https://www.komoot.de/tour/225135288"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/229823"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="13" style="background-image: url(/images/route9.svg)">
          <.icon>9</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9915695,53.5499061,9.9931782,53.5509096">Rathaus</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>7</.icon>
          <.icon>8</.icon>
        </td>
        <td><.m bounds="10.0083377,53.5523647,10.0084377,53.5524647">Hauptbahnhof</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0060344,53.5394017,10.0447385,53.5526723">Hammerbrook</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0229773,53.5002225,10.0737667,53.5459307">Rothenburgsort</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0586566,53.5109338,10.1141172,53.5400402">Billbrook</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0962539,53.5158937,10.0963539,53.5159937">Billwerder-Moorfleet</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.1309892,53.4981136,10.1310892,53.4982136">Mittlerer Landweg</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.1228325,53.4740577,10.1854185,53.4925659">Neuallermöhe</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.1688618,53.4592625,10.2088618,53.4992625">Nettelnburg</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>8</.icon>
        </td>
        <td><.m bounds="10.1704506,53.4677586,10.2662395,53.499341">Bergedorf</.m></td>
      </tr>
      <tr>
        <td></td>
        <td class="dir"><.m bounds="10.2345401,53.4789784,10.2876139,53.5089987">(Wentorf)</.m></td>
      </tr>
      <tr>
        <td></td>
        <td class="dir"><.m bounds="10.2104116,53.4956643,10.3158619,53.5799592">(Reinbek)</.m></td>
      </tr>
    </table>


    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
