defmodule Data.Article.Static.Alltagsroute10 do
  use Article.Static

  def id(), do: "10"
  def route_group(), do: :alltag
  def title(), do: "Alltagsroute 10"

  def color(), do: "#552976"

  def summary(),
    do: "Alltagsroute 10 führt vom Rathaus nach Neugraben"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 1,
        group: "10",
        direction: :forward,
        from: "Innenstadt",
        to: "Neugraben",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Neugraben",
        videos: [
          {"2021-07-03-veloroute10/GX012051", :start, :end},
          {"2021-07-03-veloroute10/GX012052", :start, :end},
          {"2021-07-03-veloroute10/GX012053", :start, :end},
          {"2021-07-03-veloroute10/GX012054", :start, :end},
          {"2021-07-03-veloroute10/GX012055", :start, :end},
          {"2021-07-03-veloroute10/GX012056", :start, :end},
          {"2021-07-03-veloroute10/GX012057", :start, :end},
          {"2021-07-03-veloroute10/GX012058", :start, :end},
          {"2021-07-03-veloroute10/GX012059", :start, :end},
          {"2021-07-03-veloroute10/GX012060", :start, :end},
          {"2021-07-03-veloroute10/GX012061", :start, :end},
          {"2021-07-03-veloroute10/GX012062", :start, :end},
          {"2021-07-03-veloroute10/GX012063", :start, "00:00:43.277"},
          {"2021-07-03-veloroute10/GX012068", "00:00:31.265", :end},
          {"2021-07-03-veloroute10/GX012069", :start, "00:01:11.939"},
          {"2021-07-03-veloroute10/GX012083", "00:00:00.200", "00:00:03.904"},
          {"2021-07-03-veloroute10/GX012070", "00:00:02.469", "00:00:32.366"},
          {"2021-07-03-veloroute10/GX012071", "00:00:00.067", :end},
          {"2021-07-03-veloroute10/GX012072", :start, :end},
          {"2021-07-03-veloroute10/GX012073", :start, :end},
          {"2021-07-03-veloroute10/GX012074", :start, :end},
          {"2021-07-03-veloroute10/GX012075", :start, :end},
          {"2021-07-03-veloroute10/GX012076", :start, "00:01:39.199"}
        ]
      },
      %Video.Track{
        renderer: 1,
        group: "10",
        direction: :backward,
        from: "Neugraben",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "von Neugraben in die Innenstadt",
        videos: [
          {"2021-07-03-veloroute10/GX012076", "00:02:13.633", "00:03:49.229"},
          {"2021-07-03-veloroute10/GX012077", "00:01:43.670", :end},
          {"2021-07-03-veloroute10/GX012078", :start, :end},
          {"2021-07-03-veloroute10/GX012079", :start, :end},
          {"2021-07-03-veloroute10/GX012080", :start, :end},
          {"2021-07-03-veloroute10/GX012081", :start, :end},
          {"2021-07-03-veloroute10/GX012082", :start, "00:01:06.500"},
          {"2021-07-03-veloroute10/GX012084", "00:00:00.400", :end},
          {"2021-07-03-veloroute10/GX012085", :start, :end},
          {"2021-07-03-veloroute10/GX012086", :start, "00:00:11.645"},
          {"2021-07-03-veloroute10/GX012087", "00:00:00.200", :end},
          {"2021-07-03-veloroute10/GX012088", :start, :end},
          {"2021-07-03-veloroute10/GX012089", :start, :end},
          {"2021-07-03-veloroute10/GX012090", :start, "00:00:15.782"},
          {"2021-07-03-veloroute10/GX012091", "00:00:00.501", :end},
          {"2021-07-03-veloroute10/GX012092", :start, :end},
          {"2021-07-03-veloroute10/GX012093", :start, :end},
          {"2021-07-03-veloroute10/GX012094", :start, :end},
          {"2021-07-03-veloroute10/GX012095", :start, :end},
          {"2021-07-03-veloroute10/GX012096", :start, :end},
          {"2021-07-03-veloroute10/GX012097", :start, :end},
          {"2021-07-03-veloroute10/GX012098", :start, :end},
          {"2021-07-03-veloroute10/GX012099", :start, :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/426738/veloroute-10/"},
      {"Komoot Routenplaner: nach Neugraben", "https://www.komoot.de/tour/225135899"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/231965"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="11" style="background-image: url(/images/route10.svg)">
          <.icon>10</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9915695,53.5499061,9.9931782,53.5509096">Rathaus</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9803816,53.5300578,10.0315651,53.5469165">HafenCity</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>11</.icon>
        </td>
        <td><.m bounds="10.011765,53.5095885,10.0597062,53.5329804">Veddel</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9948007,53.4678065,10.0348007,53.5078065">Kirchdorf</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>11</.icon>
        </td>
        <td><.m bounds="9.9938767,53.4714464,9.9961153,53.4755551">Alte Harburger Elbbrücke</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.983502,53.5440542,9.9873381,53.5443446">Binnenhafen</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.8774298,53.472953,9.8775298,53.473053">Neuwiedenthal</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.8569684,53.469918,9.8570684,53.470018">Neugraben</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.8193917,53.4747242,9.8194917,53.4748242">Fischbek</.m></td>
      </tr>
      <tr>
        <td></td>
        <td class="dir"><.m bounds="9.7264034,53.3644242,9.8618269,53.5053032">(Neu Wulmstorf)</.m></td>
      </tr>
    </table>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
