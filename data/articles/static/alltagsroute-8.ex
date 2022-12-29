defmodule Data.Article.Static.Alltagsroute8 do
  use Article.Static

  def id(), do: "8"
  def route_group(), do: :alltag
  def title(), do: "Alltagsroute 8"

  def color(), do: "#e20612"

  def summary(),
    do:
      "Alltagsroute 8 führt vom Rathaus zum Mümmelmannsberg bzw. nach Bergedorf. Die Abzweigung erfolgt bei Billstedt."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "8 Bergedorf",
        direction: :forward,
        from: "Innenstadt",
        to: "Bergedorf",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Bergedorf",
        videos: [
          {"2022-05-07-v10-v7-u-rodigallee/GX013734", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013735", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013736", :start, :end},
          {"2022-05-08-velo8/GX013801", :start, :end},
          {"2022-05-08-velo8/GX013802", :start, :end},
          {"2022-05-08-velo8/GX013803", :start, :end},
          {"2022-05-08-velo8/GX013804", :start, "00:01:16.543"},
          {"2022-05-08-velo8/GX013810", "00:00:00.567", :end},
          {"2022-05-08-velo8/GX013811", :start, :end},
          {"2022-05-08-velo8/GX013812", :start, :end},
          {"2022-05-08-velo8/GX013813", :start, :end},
          {"2022-05-08-velo8/GX013814", :start, :end},
          {"2022-05-08-velo8/GX013815", :start, :end},
          {"2022-05-08-velo8/GX013816", :start, "00:00:46.280"},
          {"2022-05-08-velo8/GX013823", "00:00:02.336", "00:00:10.410"},
          {"2022-05-08-velo8/GX013819", "00:00:00.133", "00:00:31.031"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "8 Bergedorf",
        direction: :backward,
        from: "Bergedorf",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "aus Bergedorf in die Innenstadt",
        videos: [
          {"2022-05-08-velo8/GX013820", "00:00:01.535", :end},
          {"2022-05-08-velo8/GX013821", :start, :end},
          {"2022-05-08-velo8/GX013822", :start, "00:00:08.075"},
          {"2022-05-08-velo8/GX013830", "00:00:02.703", :end},
          {"2022-05-08-velo8/GX013831", :start, "00:03:47.461"},
          {"2022-05-08-velo8/GX023831", "00:02:49.936", :end},
          {"2022-05-08-velo8/GX013832", :start, :end},
          {"2022-05-08-velo8/GX013833", :start, :end},
          {"2022-05-08-velo8/GX013834", :start, :end},
          {"2022-05-08-velo8/GX013835", :start, :end},
          {"2022-05-08-velo8/GX013836", :start, :end},
          {"2022-05-08-velo8/GX013837", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013788", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013789", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013790", :start, "00:00:28.228"}
        ]
      },

      # videos are only the short segments, GPX should be the full tracks
      %Video.Track{
        renderer: 3,
        group: "8 Mümmelmannsberg",
        direction: :forward,
        from: "Innenstadt",
        to: "Mümmelmannsberg",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt zum Mümmelmannsberg",
        videos: [
          {"2022-05-08-velo8/GX013831", "00:03:54.234", :end},
          {"2022-05-08-velo8/GX023831", :seamless, "00:00:27.689"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "8 Mümmelmannsberg",
        direction: :backward,
        from: "Mümmelmannsberg",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "vom Mümmelmannsberg in die Innenstadt",
        videos: [
          {"2022-05-08-velo8/GX023831", "00:00:55.044", "00:02:56.808"}
        ]
      }
    ]

  def links(assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/426726/veloroute-8/"},
      ~H{Komoot Routenplaner: <.a href="https://www.komoot.de/tour/229546496">zum Mümmelmannsberg</.a> oder <.a href="https://www.komoot.de/tour/225134445">nach Bergedorf</.a>},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/229623"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="13" style="background-image: url(/images/route8.svg)">
          <.icon>8</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.990953,53.548317,9.998129,53.552594" lon={9.993833} lat={53.550924} dir="forward" ref="8">Rathaus</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>7</.icon>
          <.icon>9</.icon>
        </td>
        <td><.m bounds="10.0083377,53.5523647,10.0084377,53.5524647">Hauptbahnhof</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0203837,53.5571426,10.020621,53.5572954">Berliner Tor</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>13</.icon>
        </td>
        <td><.m bounds="10.022745,53.5494664,10.0411521,53.5608608">Borgfelde</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0376053,53.5377541,10.0707064,53.5661079">Hamm</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0661032,53.5366519,10.1086515,53.565535">Horn</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>14</.icon>
        </td>
        <td><.m bounds="10.0903342,53.5190615,10.168776,53.5673577">Billstedt</.m></td>
      </tr>
      <tr>
        <td><.m bounds="10.1450277,53.5231075,10.1550277,53.5331075">Mümmelmannsberg</.m></td>
        <td><.m bounds="10.1526762,53.504713,10.1726762,53.524713">Boberg</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.1223665,53.4890274,10.2238906,53.5264217">Lohbrügge</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.1704506,53.4677586,10.2662395,53.499341">Bergedorf</.m>
          <.icon>9</.icon>
        </td>
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
    <.structured_links gpx={true}/>
    """
  end
end
