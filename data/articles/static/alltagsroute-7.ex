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
        renderer: 1,
        group: "7",
        direction: :forward,
        from: "Innenstadt",
        to: "Rahlstedt",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Rahlstedt",
        videos: [
          {"2021-07-03-veloroute10/GX012051", :start, "00:00:03.770"},
          {"2021-06-27-veloroute9/GX012023", "00:00:56.356", :end},
          {"2021-04-25-freizeitroute4/GX011376", "00:00:10.377", :end},
          {"2021-04-25-freizeitroute4/GX011377", :start, "00:00:06.473"},
          {"2021-06-25-velo8/GX011969", "00:00:06.974", :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011902", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011903", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011904", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011905", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011906", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011907", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011908", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011909", :start, "00:00:40.207"},
          {"2021-06-22-velo7-und-pauli-altona/GX011909", "00:00:54.922", "00:01:36.229"},
          {"2021-06-22-velo7-und-pauli-altona/GX011913", "00:00:07.741", :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011914", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011915", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011916", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011917", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011918", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011920", :start, "00:00:57.057"}
        ]
      },
      %Video.Track{
        renderer: 1,
        group: "7",
        direction: :backward,
        from: "Rahlstedt",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "aus Rahlstedt in die Innenstadt",
        videos: [
          {"2021-06-22-velo7-und-pauli-altona/GX011921", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011922", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011923", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011924", :start, "00:01:20.647"},
          {"2021-06-22-velo7-und-pauli-altona/GX011925", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011926", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011927", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011928", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011930", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011931", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011932", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011933", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011934", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011935", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011937", :start, "00:00:47.180"}
        ]
      },
      %Video.Track{
        renderer: 1,
        group: "7j",
        direction: :forward,
        from: "Innenstadt",
        to: "Jenfeld",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Jenfeld",
        videos: [
          {"2021-06-22-velo7-und-pauli-altona/GX011909", "00:01:37.097", :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011910", :start, "00:00:03.170"}
        ]
      },
      %Video.Track{
        renderer: 1,
        group: "7j",
        direction: :backward,
        from: "Jenfeld",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "aus Jenfeld in die Innenstadt",
        videos: [
          {"2021-06-22-velo7-und-pauli-altona/GX011911", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011912", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011913", :start, "00:00:02.269"}
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
    <.structured_links gpx="true"/>
    """
  end
end
