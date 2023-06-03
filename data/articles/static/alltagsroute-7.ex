defmodule Data.Article.Static.Alltagsroute7 do
  use Article.Static

  def id(), do: "7"
  def route_group(), do: :alltag
  def title(), do: "Alltagsroute 7"

  def color(), do: "#97ba22"

  def summary(),
    do: "Die Route führt vom Rathaus nach Jenfeld bzw. Rahlstedt."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "7",
        direction: :forward,
        from: "Innenstadt",
        to: "Rahlstedt",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Rahlstedt",
        videos: [
          {"2023-06-03-vr10-vr7/GX015898", "00:00:16.650", :end},
          {"2023-06-03-vr10-vr7/GX015899", :start, :end},
          {"2023-06-03-vr10-vr7/GX015900", :start, :end},
          {"2023-06-03-vr10-vr7/GX015901", :start, :end},
          {"2023-06-03-vr10-vr7/GX015902", :start, :end},
          {"2023-06-03-vr10-vr7/GX015903", :start, :end},
          {"2023-06-03-vr10-vr7/GX015904", :start, :end},
          {"2023-06-03-vr10-vr7/GX015905", :start, :end},
          {"2023-06-03-vr10-vr7/GX015906", :start, :end},
          {"2023-06-03-vr10-vr7/GX015907", :start, :end},
          {"2023-06-03-vr10-vr7/GX015908", :start, :end},
          {"2023-06-03-vr10-vr7/GX015909", :start, :end},
          {"2023-06-03-vr10-vr7/GX015910", :start, "00:00:35.936"},
          {"2023-06-03-vr10-vr7/GX015910", "00:00:51.485", :end},
          {"2023-06-03-vr10-vr7/GX015911", :start, :end},
          {"2023-06-03-vr10-vr7/GX015912", :start, :end},
          {"2023-06-03-vr10-vr7/GX015913", :start, :end},
          {"2023-06-03-vr10-vr7/GX015914", :start, :end},
          {"2023-06-03-vr10-vr7/GX015915", :start, :end},
          {"2023-06-03-vr10-vr7/GX015916", :start, :end},
          {"2023-06-03-vr10-vr7/GX015917", :start, :end},
          {"2023-06-03-vr10-vr7/GX015919", :start, :end},
          {"2023-06-03-vr10-vr7/GX015920", :start, :end},
          {"2023-06-03-vr10-vr7/GX015921", :start, "00:00:30.597"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "7",
        direction: :backward,
        from: "Rahlstedt",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "aus Rahlstedt in die Innenstadt",
        videos: [
          {"2023-06-03-vr10-vr7/GX015922", :start, :end},
          {"2023-06-03-vr10-vr7/GX015923", :start, "00:00:05.706"},
          {"2023-06-03-vr10-vr7/GX015923", "00:00:10.010", :end},
          {"2023-06-03-vr10-vr7/GX015924", :start, :end},
          {"2023-06-03-vr10-vr7/GX015925", :start, :end},
          {"2023-06-03-vr10-vr7/GX015926", :start, "00:00:32.099"},
          {"2023-06-03-vr10-vr7/GX015928", "00:00:03.770", "00:00:37.371"},
          {"2023-06-03-vr10-vr7/GX015929", "00:00:00.868", :end},
          {"2023-06-03-vr10-vr7/GX015930", :start, :end},
          {"2023-06-03-vr10-vr7/GX015931", :start, :end},
          {"2023-06-03-vr10-vr7/GX015933", :start, :end},
          {"2023-06-03-vr10-vr7/GX015934", :start, :end},
          {"2023-06-03-vr10-vr7/GX015935", :start, :end},
          {"2023-06-03-vr10-vr7/GX015936", :start, :end},
          {"2023-06-03-vr10-vr7/GX015937", :start, "00:00:31.832"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "7j",
        direction: :forward,
        from: "Innenstadt",
        to: "Jenfeld",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Jenfeld",
        videos: [
          {"2023-06-03-vr10-vr7/GX015926", "00:00:48.949", "00:01:53.614"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "7j",
        direction: :backward,
        from: "Jenfeld",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "aus Jenfeld in die Innenstadt",
        videos: [
          {"2023-06-03-vr10-vr7/GX015926", "00:01:56.350", :end},
          {"2023-06-03-vr10-vr7/GX015927", :start, :end},
          {"2023-06-03-vr10-vr7/GX015928", :start, "00:00:03.670"}
        ]
      }
    ]

  def links(assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/426718/veloroute-7/"},
      ~H{Komoot Routenplaner: <.a href="https://www.komoot.de/tour/225132901">nach Rahlstedt</.a> oder <.a href="https://www.komoot.de/tour/229494159">nach Jenfeld</.a>},
      {
        "Route in der OpenStreetMap",
        "https://www.openstreetmap.org/relation/228035"
      }
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="9" style="background-image: url(/images/route7.svg)">
          <.icon>7</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.986909,53.549043,10.000479,53.553078">Rathaus</.m>
        </td>
      </tr>
      <tr>
        <td>
          <.icon>8</.icon>
          <.icon>9</.icon></td>
        <td><.m bounds="10.0083377,53.5523647,10.0084377,53.5524647">Hauptbahnhof</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0207948,53.5597006,10.0224092,53.5604826">Alsterschwimmhalle</.m></td>
      </tr>
      <tr>
        <td><.icon>1</.icon></td>
        <td><.m bounds="9.9549651,53.5431746,9.9902942,53.5638046">St. Pauli</.m></td>
      </tr>
      <tr>
        <td><.icon>13</.icon></td>
        <td><.m bounds="10.0318304,53.5608608,10.0627028,53.5760196">Eilbek</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0617414,53.5666636,10.0717414,53.5766636">Wandsbek Markt</.m></td>
      </tr>
      <tr>
        <td><.icon>14</.icon> <.m bounds="10.1034487,53.5643859,10.1520039,53.5879648">Jenfeld</.m></td>
        <td><.m bounds="10.098152,53.5759187,10.1430031,53.5979981">Tonndorf</.m> <.icon>14</.icon></td>
      </tr>
      <tr>
        <td class="dir"><.m bounds="10.14752,53.5540497,10.2785664,53.5988388">(Barsbüttel)</.m></td>
        <td><.m bounds="10.1233839,53.5762276,10.2219513,53.6383737">Rahlstedt</.m></td>
      </tr>
    </table>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
