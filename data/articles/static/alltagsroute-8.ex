defmodule Data.Article.Static.Alltagsroute8 do
  use Article.Static

  def id(), do: "8"
  def route_group(), do: :alltag
  def name(), do: "alltagsroute-8"
  def title(), do: "Alltagsroute 8"

  def color(), do: "#e20612"

  def summary(),
    do:
      "Alltagsroute 8 führt vom Rathaus zum Mümmelmannsberg bzw. nach Bergedorf. Die Abzweigung erfolgt bei Billstedt."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        group: "8 Bergedorf",
        direction: :forward,
        from: "Innenstadt",
        to: "Bergedorf",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Bergedorf",
        videos: [
          {"2021-07-03-veloroute10/GX012051", :start, "00:00:03.770"},
          {"2021-06-27-veloroute9/GX012023", "00:00:56.356", :end},
          {"2021-04-25-freizeitroute4/GX011376", "00:00:10.377", :end},
          {"2021-04-25-freizeitroute4/GX011377", :start, "00:00:06.473"},
          {"2021-06-25-velo8/GX011969", "00:00:06.974", :end},
          {"2021-06-25-velo8/GX011970", :start, :end},
          {"2021-06-25-velo8/GX011971", :start, :end},
          {"2021-06-25-velo8/GX011972", :start, :end},
          {"2021-06-25-velo8/GX011973", :start, :end},
          {"2021-06-25-velo8/GX011975", :start, "00:01:16.009"},
          {"2021-06-25-velo8/GX011979", "00:00:21.021", :end},
          {"2021-06-25-velo8/GX011980", :start, :end},
          {"2021-06-25-velo8/GX011981", :start, :end},
          {"2021-06-25-velo8/GX011982", :start, :end},
          {"2021-06-25-velo8/GX011983", :start, :end},
          {"2021-06-25-velo8/GX011984", :start, "00:00:19.753"},
          {"2021-06-25-velo8/GX011985", "00:03:14.828", :end},
          {"2021-06-25-velo8/GX011986", :start, :end},
          {"2021-06-25-velo8/GX011987", :start, :end},
          {"2021-06-25-velo8/GX011988", :start, "00:00:10.744"}
        ]
      },
      %Video.Track{
        group: "8 Bergedorf",
        direction: :backward,
        from: "Bergedorf",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "aus Bergedorf in die Innenstadt",
        videos: [
          {"2021-06-25-velo8/GX011989", "00:00:01.368", :end},
          {"2021-06-25-velo8/GX011990", :start, :end},
          {"2021-06-25-velo8/GX011991", :start, :end},
          {"2021-06-25-velo8/GX011992", :start, :end},
          {"2021-06-25-velo8/GX011993", :start, :end},
          {"2021-06-25-velo8/GX011994", :start, :end},
          {"2021-06-25-velo8/GX011995", :start, :end},
          {"2021-06-25-velo8/GX011996", :start, :end},
          {"2021-06-25-velo8/GX011997", :start, :end},
          {"2021-06-25-velo8/GX011998", :start, :end},
          {"2021-06-25-velo8/GX011999", :start, :end},
          {"2021-06-25-velo8/GX012000", :start, :end},
          {"2021-06-25-velo8/GX012001", :start, :end},
          {"2021-06-22-velo7-und-pauli-altona/GX011937", :start, "00:00:47.180"}
        ]
      },

      # videos are only the short segments, GPX should be the full tracks
      %Video.Track{
        group: "8 Mümmelmannsberg",
        direction: :forward,
        from: "Innenstadt",
        to: "Mümmelmannsberg",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt zum Mümmelmannsberg",
        videos: [
          {"2021-06-25-velo8/GX011984", "00:00:19.753", :end},
          {"2021-06-25-velo8/GX011985", :start, "00:01:33.226"}
        ]
      },
      %Video.Track{
        group: "8 Mümmelmannsberg",
        direction: :backward,
        from: "Mümmelmannsberg",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "vom Mümmelmannsberg in die Innenstadt",
        videos: [
          {"2021-06-25-velo8/GX011985", "00:01:33.226", "00:03:12.592"}
        ]
      }
    ]

  def links() do
    assigns = {}

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
        <td><.m bounds="9.9915695,53.5499061,9.9931782,53.5509096">Rathaus</.m></td>
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
    <.structured_links gpx="yes"/>
    """
  end
end
