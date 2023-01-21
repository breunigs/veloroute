defmodule Data.Article.Static.Alltagsroute3 do
  use Article.Static

  def id(), do: "3"
  def route_group(), do: :alltag
  def name(), do: "alltagsroute-3"
  def title(), do: "Alltagsroute 3"

  def color(), do: "#e8430b"

  def summary(),
    do: "Alltagsroute 3 führt vom Rathaus nach Niendorf"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "3",
        direction: :forward,
        from: "Innenstadt",
        to: "Niendorf",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Niendorf",
        videos: [
          {"2022-04-02-velo9/GX013424", "00:00:21.455", :end},
          {"2022-04-23-velo3-velo12altona/GX013488", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013489", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013490", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013492", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013493", :start, "00:00:01.702"},
          {"2022-04-23-velo3-velo12altona/GX013493", "00:00:02.970", :end},
          {"2022-04-23-velo3-velo12altona/GX013494", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013495", :start, "00:00:17.251"},
          {"2022-04-23-velo3-velo12altona/GX013496", "00:00:15.415", :end},
          {"2022-04-23-velo3-velo12altona/GX013497", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013499", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013500", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013501", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013503", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013504", :start, "00:01:00.894"},
          {"2022-04-23-velo3-velo12altona/GX013506", "00:00:02.469", "00:00:23.757"},
          {"2022-04-23-velo3-velo12altona/GX013504", "00:01:25.819", "00:02:00.287"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "3",
        direction: :backward,
        from: "Niendorf",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "von Niendorf in die Innenstadt",
        videos: [
          {"2022-07-24-neumuenster/GX014346", :start, :end},
          {"2022-07-24-neumuenster/GX014347", :start, :end},
          {"2022-07-24-neumuenster/GX014348", :start, :end},
          {"2022-07-24-neumuenster/GX014349", :start, :end},
          {"2022-07-24-neumuenster/GX014350", :start, :end},
          {"2022-07-24-neumuenster/GX014351", :start, "00:00:14.181"},
          {"2022-04-23-velo3-velo12altona/GX013514", "00:00:03.704", :end},
          {"2022-04-23-velo3-velo12altona/GX013515", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013516", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013517", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013518", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013519", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013520", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013521", :start, "00:00:15.616"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/418922/veloroute-3/"},
      {"Komoot Routenplaner: nach Niendorf", "https://www.komoot.de/tour/204275386"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/194840"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="9" style="background-image: url(/images/route3.svg)">
          <.icon>3</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.990953,53.548317,9.998129,53.552594" lon={9.993833} lat={53.550924} dir="forward" ref="3">Rathaus</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.984306,53.553785,9.9935,53.559082" lon={9.989699} lat={53.55492} dir="forward" ref="3">Gänsemarkt</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR10</.icon>
          <.icon>FR9</.icon>
        </td>
        <td><.v bounds="9.983987,53.558014,9.994103,53.56547" lon={9.99033} lat={53.559795} dir="forward" ref="3">Bahnhof Dammtor</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.977633,53.562873,9.991701,53.572189" lon={9.986438} lat={53.56676} dir="forward" ref="3">Rotherbaum</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR10</.icon>
          <.icon>13</.icon>
        </td>
        <td><.v bounds="9.948743,53.576206,9.975451,53.594578" lon={9.95665} lat={53.583018} dir="forward" ref="3">Hoheluft</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.941223,53.593841,9.972655,53.611805" lon={9.957517} lat={53.600192} dir="forward" ref="3">Lokstedt</.v></td>
      </tr>
      <tr>
        <td><.icon>FR11</.icon></td>
        <td><.v bounds="9.937511,53.614054,9.962625,53.626908" lon={9.950974} lat={53.617107} dir="forward" ref="3">Niendorf Markt</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>14</.icon>
        </td>
        <td><.v bounds="9.943576,53.62753,9.959497,53.644837" lon={9.952295} lat={53.635892} dir="forward" ref="3">Niendorf Nord</.v></td>
      </tr>
    </table>

    <p>Vom Rathaus aus schlängelt sich die Alltagsroute 3 (auch: Veloroute 3) meist über Nebenstraßen nach <.v bounds="9.943576,53.62753,9.959497,53.644837" lon={9.952295} lat={53.635892} dir="forward" ref="3">Niendorf</.v>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich. Sie sind meist asphaltiert, teils auch gepflastert.</p>

    <h4>Meinung</h4>
    <p>Die Umbauten haben die Situation verbessert, dennoch bleibt die Veloroute ein Kniefall vorm Autoverkehr. Nur auf den wenigsten Abschnitten stehen eigene Wege für den Radverkehr zur Verfügung – häufig setzt man auf Alibi-Lösungen mit <.ref>Schutzstreifen</.ref>, etwa in der <.v bounds="9.954151,53.582244,9.961593,53.591627" lon={9.956983} lat={53.587444} dir="forward" ref="3">Stresemannallee</.v> oder der <.v bounds="9.946787,53.631541,9.956402,53.64021" lon={9.952253} lat={53.636735} dir="forward" ref="3">Paul-Sorge-Straße</.v>.</p>

    <p>Positiv sind die hingegen die <.v bounds="9.978006,53.561869,9.993006,53.573155" lon={9.986577} lat={53.567697} dir="forward" ref="3">Fahrradstraßen in Rotherbaum</.v>. Auch die Grüne Welle in der <.v bounds="9.968698,53.570018,9.979453,53.576889" lon={9.977128} lat={53.571688} dir="forward" ref="3">Bogenstraße</.v> ist eine sinnvolle Ergänzung.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
