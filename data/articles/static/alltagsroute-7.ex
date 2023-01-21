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
          {"2022-05-07-v10-v7-u-rodigallee/GX013734", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013735", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013736", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013737", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013739", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013740", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013741", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013743", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013744", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013745", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013746", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013747", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013748", :start, "00:00:25.526"},
          {"2022-05-07-v10-v7-u-rodigallee/GX013752", "00:00:48.382", "00:01:38.265"},
          {"2022-05-07-v10-v7-u-rodigallee/GX013764", "00:01:27.254", :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013765", :start, "00:00:02.369"},
          {"2022-05-07-v10-v7-u-rodigallee/GX013755", "00:00:00.934", "00:00:21.088"},
          {"2022-05-07-v10-v7-u-rodigallee/GX013764", "00:00:09.543", "00:00:18.218"},
          {"2022-05-07-v10-v7-u-rodigallee/GX013755", "00:00:29.096", :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013756", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013757", :start, :end}
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
          {"2022-05-07-v10-v7-u-rodigallee/GX013758", "00:00:01.101", :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013759", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013760", :start, "00:00:03.203"},
          {"2022-05-07-v10-v7-u-rodigallee/GX013762", "00:00:08.842", :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013763", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013764", :start, "00:00:04.805"},
          {"2022-05-07-v10-v7-u-rodigallee/GX013764", "00:00:42.476", "00:01:08.569"},
          {"2022-05-07-v10-v7-u-rodigallee/GX013766", "00:00:05.472", :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013767", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013768", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013769", :start, "00:00:47.514"},
          {"2022-05-07-v10-v7-u-rodigallee/GX013770", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013778", "00:01:21.148", :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013779", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013780", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013781", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013782", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013783", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013784", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013785", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013786", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013787", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013788", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013789", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013790", :start, "00:00:28.228"}
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
          {"2022-05-07-v10-v7-u-rodigallee/GX013748", "00:00:25.559", :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013749", :start, "00:00:17.251"}
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
          {"2022-05-07-v10-v7-u-rodigallee/GX013750", "00:00:02.436", :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013751", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013752", :start, "00:00:36.470"}
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
