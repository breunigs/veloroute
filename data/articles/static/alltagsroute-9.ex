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
        renderer: 3,
        group: "9 Bergedorf",
        direction: :forward,
        from: "Innenstadt",
        to: "Bergedorf",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Bergedorf",
        videos: [
          {"2023-05-21-vr12-vr9/GX015803", "00:00:15.346", :end},
          {"2023-05-21-vr12-vr9/GX015804", :start, :end},
          {"2023-05-21-vr12-vr9/GX015805", :start, :end},
          {"2023-05-21-vr12-vr9/GX015806", :start, :end},
          {"2023-05-21-vr12-vr9/GX015807", :start, "00:00:01.535"},
          {"2023-05-21-vr12-vr9/GX015807", "00:00:01.835", :end},
          {"2023-05-21-vr12-vr9/GX015808", :start, :end},
          {"2023-05-21-vr12-vr9/GX015809", :start, :end},
          {"2023-05-21-vr12-vr9/GX015810", :start, "00:00:07.708"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "9 Bergedorf",
        direction: :backward,
        from: "Bergedorf",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "aus Bergedorf in die Innenstadt",
        videos: [
          {"2023-05-21-vr12-vr9/GX015810", "00:00:18.285", :end},
          {"2023-05-21-vr12-vr9/GX015811", :start, :end},
          {"2023-05-21-vr12-vr9/GX015812", :start, :end},
          {"2023-05-21-vr12-vr9/GX015813", :start, :end},
          {"2023-05-21-vr12-vr9/GX015814", :start, "00:03:40.721"},
          {"2023-05-21-vr12-vr9/GX015816", "00:00:00.133", :end},
          {"2023-05-21-vr12-vr9/GX015817", :start, :end},
          {"2023-05-21-vr12-vr9/GX015818", :start, :end},
          {"2023-05-21-vr12-vr9/GX015819", :start, :end},
          {"2023-05-21-vr12-vr9/GX015820", :start, :end},
          {"2023-05-21-vr12-vr9/GX015821", :start, "00:00:23.352"}
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
        <td><.v bounds="9.990953,53.548317,9.998129,53.552594" lon={9.993833} lat={53.550924} dir="forward" ref="9">Rathaus</.v></td>
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
        <td>
          <.icon name="rsw-geesthacht" bounds="10.181904,53.471171,10.25402,53.49209" lon={10.185906} lat={53.486877} dir="forward">RSW</.icon>
        </td>
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
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
