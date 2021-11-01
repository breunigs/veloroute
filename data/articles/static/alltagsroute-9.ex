defmodule Data.Article.Static.Alltagsroute9 do
  use Article.Static

  def id(), do: "9"
  def route_group(), do: :alltag
  def name(), do: "alltagsroute-9"
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
          {"2021-07-03-veloroute10/GX012051", :start, "00:00:03.770"},
          {"2021-06-27-veloroute9/GX012023", "00:00:56.356", :end},
          {"2021-04-25-freizeitroute4/GX011376", "00:00:10.377", :end},
          {"2021-06-27-veloroute9/GX012024", "00:00:31.131", :end},
          {"2021-06-27-veloroute9/GX012025", :start, :end},
          {"2021-06-27-veloroute9/GX012026", :start, :end},
          {"2021-06-27-veloroute9/GX012027", :start, "00:01:30.490"},
          {"2021-09-19-rsw-geesthacht-velo9/GX012883", "00:00:15.415", "00:00:58.959"},
          {"2021-06-27-veloroute9/GX012027", "00:02:23.510", :end},
          {"2021-06-27-veloroute9/GX022027", :start, :end},
          {"2021-06-27-veloroute9/GX012028", :start, :end},
          {"2021-06-27-veloroute9/GX012029", :start, :end},
          {"2021-06-27-veloroute9/GX012030", :start, :end},
          {"2021-06-27-veloroute9/GX012031", :start, "00:00:12.312"}
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
          {"2021-06-27-veloroute9/GX012031", "00:00:21.655", :end},
          {"2021-06-27-veloroute9/GX012032", :start, :end},
          {"2021-06-27-veloroute9/GX012033", :start, :end},
          {"2021-06-27-veloroute9/GX012034", :start, :end},
          {"2021-06-27-veloroute9/GX012035", :start, :end},
          {"2021-06-27-veloroute9/GX022035", :start, :end},
          {"2021-06-27-veloroute9/GX012036", :start, :end},
          {"2021-06-27-veloroute9/GX012037", :start, "00:01:06.767"},
          {"2021-09-19-rsw-geesthacht-velo9/GX012918", "00:01:06.066", "00:01:29.356"},
          {"2021-06-27-veloroute9/GX012037", "00:01:46.540", :end},
          {"2021-06-27-veloroute9/GX012038", :start, :end},
          {"2021-06-27-veloroute9/GX012039", :start, :end},
          {"2021-06-27-veloroute9/GX012040", :start, :end},
          {"2021-06-27-veloroute9/GX012041", :start, "00:00:16.350"},
          {"2021-06-22-velo7-und-pauli-altona/GX011937", "00:00:23.023", "00:00:47.180"}
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
