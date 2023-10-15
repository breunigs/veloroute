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
        historic: %{
          "30120b94cadb07b40e25f16363238821" => ~d[2023-07],
          "31b6ed712bac45ba3f4fec9338e48722" => ~d[2022-05],
          "3158969df4651fbffffe9a7921c32fac" => ~d[2021-06]
        },
        videos: [
          {"2023-06-03-vr10-vr7/GX015898", "00:00:16.650", "00:00:34.134"},
          {"2023-07-15-vr8/GX016147", "00:00:42.843", :end},
          {"2023-07-15-vr8/GX016148", :start, :end},
          {"2023-07-15-vr8/GX016149", :start, :end},
          {"2023-07-15-vr8/GX016150", :start, :end},
          {"2023-07-15-vr8/GX016151", :start, "00:00:41.775"},
          {"2023-07-15-vr8/GX016153", "00:00:49.917", :end},
          {"2023-07-15-vr8/GX016154", :start, :end},
          {"2023-07-15-vr8/GX016155", :start, :end},
          {"2023-07-15-vr8/GX016156", :start, :end},
          {"2023-07-15-vr8/GX016157", :start, "00:00:19.453"}
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
        historic: %{
          "487633ba1bb5e87ff942d0cc1ab94b91" => ~d[2023-07],
          "c5255d6333a51c0198e152da0587fac8" => ~d[2022-05],
          "fef594acfa954c454f4ebb8f388b27ed" => ~d[2021-06]
        },
        videos: [
          {"2023-07-15-vr8/GX016157", "00:00:31.131", :end},
          {"2023-07-15-vr8/GX016158", :start, :end},
          {"2023-07-15-vr8/GX016159", :start, :end},
          {"2023-07-15-vr8/GX016160", :start, :end},
          {"2023-07-15-vr8/GX016161", :start, :end},
          {"2023-07-15-vr8/GX016162", :start, :end},
          {"2023-07-15-vr8/GX016163", :start, :end},
          {"2023-07-15-vr8/GX016164", :start, :end},
          {"2023-07-15-vr8/GX016165", :start, :end},
          {"2023-07-15-vr8/GX016166", :start, :end},
          {"2023-07-15-vr8/GX016167", :start, :end},
          {"2023-07-15-vr8/GX016168", :start, :end},
          {"2023-06-03-vr10-vr7/GX015937", :start, "00:00:31.832"}
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
        historic: %{
          "951dd9670ae619864a3a2bc4d907ceb5" => ~d[2023-07],
          "ae36499378cc6c6a822f9189e3c71e46" => ~d[2022-05],
          "3b9ad829d244b5beab1b060e74e166db" => ~d[2021-06]
        },
        videos: [
          {"2023-07-15-vr8/GX016151", "00:00:37.838", "00:02:27.948"}
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
        historic: %{
          "a53d40087ef8bfc2ff0542c448f06153" => ~d[2023-07],
          "1f3e66277483a6b8bfcd4dc3069f6766" => ~d[2022-05],
          "0f4d948cf00d56ed23724235c9a5591f" => ~d[2021-06]
        },
        videos: [
          {"2023-07-15-vr8/GX016151", "00:02:29.716", :end},
          {"2023-07-15-vr8/GX016152", :start, :end},
          {"2023-07-15-vr8/GX016153", :start, "00:00:42.543"}
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
        <td><.v bounds="9.990953,53.548317,9.998129,53.552594" lon={9.993833} lat={53.550924} dir="forward" ref="8" highlight="Rathausmarkt">Rathaus</.v></td>
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
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
