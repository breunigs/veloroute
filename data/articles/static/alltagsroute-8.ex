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
          "31b6ed712bac45ba3f4fec9338e48722" => ~d[2022-05]
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
          "c5255d6333a51c0198e152da0587fac8" => ~d[2022-05]
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
          "ae36499378cc6c6a822f9189e3c71e46" => ~d[2022-05]
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
          "1f3e66277483a6b8bfcd4dc3069f6766" => ~d[2022-05]
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
          <.icon>FR1</.icon>
          <.icon>FR4</.icon>
          <.icon>7</.icon>
          <.icon>9</.icon></td>
        <td><.v bounds="9.999532,53.549681,10.017545,53.556575" lon={10.007068} lat={53.551788} dir="forward" ref="7">Hauptbahnhof</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="10.016678,53.546457,10.044401,53.561226" lon={10.024269} lat={53.553693} dir="forward" ref="8">Berliner Tor</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>13</.icon>
        </td>
        <td><.v bounds="10.023414,53.550082,10.044723,53.56092" lon={10.032518} lat={53.554878} dir="forward" ref="8">Borgfelde</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="10.038368,53.545995,10.073167,53.563162" lon={10.048562} lat={53.556059} dir="forward" ref="8">Hamm</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="10.066028,53.539699,10.109812,53.560557" lon={10.087253} lat={53.551596} dir="forward" ref="8">Horn</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR4</.icon>
          <.icon>FR11</.icon>
          <.icon>14</.icon>
        </td>
        <td><.v bounds="10.081333,53.530255,10.121512,53.553589" lon={10.105333} lat={53.53842} dir="forward" ref="8">Billstedt</.v></td>
      </tr>
      <tr>
        <td><.v bounds="10.119978,53.517974,10.163492,53.539083" lon={10.142293} lat={53.529748} dir="forward" ref="8">Mümmelmannsberg</.v></td>
        <td><.v bounds="10.147086,53.501304,10.194571,53.520251" lon={10.167513} lat={53.513643} dir="forward" ref="8">Boberg</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="10.172045,53.489406,10.220007,53.512848" lon={10.197305} lat={53.501236} dir="forward" ref="8">Lohbrügge</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="10.195148,53.485948,10.218407,53.499701" lon={10.208244} lat={53.490393} dir="forward" ref="8">Bergedorf</.v>
          <.icon>9</.icon>
          <.icon>FR4</.icon>
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

    <p>Die Alltagsroute 8 (auch: Veloroute 8 oder Radroute 8) führt vom <.v bounds="9.990953,53.548317,9.998129,53.552594" lon={9.994001} lat={53.550809} dir="forward" ref="8" highlight="Rathausmarkt">Rathaus</.v> in Richtung Südosten nach <.v bounds="10.195148,53.485948,10.218407,53.499701" lon={10.208244} lat={53.490393} dir="forward" ref="8">Bergedorf</.v>. In <.v bounds="10.081333,53.530255,10.121512,53.553589" lon={10.105333} lat={53.53842} dir="forward" ref="8">Billstedt</.v> zweigt ein kurzer Ast ab, der auf direkterem Wege den <.v bounds="10.119978,53.517974,10.163492,53.539083" lon={10.142293} lat={53.529748} dir="forward" ref="8">Mümmelmannsberg</.v> erreicht.</p>

    <p>Die Route verläuft in etwa zu je einem Drittel entlang von <.v bounds="9.99941,53.54698,10.044909,53.562637" lon={10.009662} lat={53.551954} dir="forward" ref="8">Hauptverkehrsstraßen</.v>, durch <.v bounds="10.040469,53.544719,10.097003,53.562862" lon={10.058955} lat={53.555245} dir="forward" ref="8">Grünzüge</.v> und <.v bounds="10.155704,53.495123,10.207734,53.52261" lon={10.15957} lat={53.514657} dir="forward" ref="8">Wohnstraßen</.v>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich. Sie sind meist asphaltiert.</p>

    <h4>Meinung</h4>
    <p>In bereits umgebauten Abschnitten macht die Route einen guten Eindruck. Viele Wege verlaufen dabei abseits des Autoverkehrs und sind daher ampelfrei. Das erlaubt gutes vorankommen. Leider sind diese Strecken nicht vollständig beleuchtet.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
