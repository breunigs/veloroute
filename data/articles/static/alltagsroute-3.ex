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
          {"2023-05-20-vr2-vr3/GX015733", "00:00:13.144", :end},
          {"2023-05-20-vr2-vr3/GX015734", :start, :end},
          {"2023-05-20-vr2-vr3/GX015735", :start, :end},
          {"2023-05-20-vr2-vr3/GX015736", :start, :end},
          {"2023-05-20-vr2-vr3/GX015738", :start, :end},
          {"2023-05-20-vr2-vr3/GX015739", :start, :end},
          {"2023-05-20-vr2-vr3/GX015740", :start, :end},
          {"2023-05-20-vr2-vr3/GX015742", :start, :end},
          {"2023-05-20-vr2-vr3/GX015743", :start, :end},
          {"2023-05-20-vr2-vr3/GX015744", :start, :end},
          {"2023-05-20-vr2-vr3/GX015745", :start, :end},
          {"2023-05-20-vr2-vr3/GX015746", :start, :end},
          {"2023-05-20-vr2-vr3/GX015747", :start, :end},
          {"2023-05-20-vr2-vr3/GX015748", :start, "00:00:43.034"}
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
          {"2023-05-20-vr2-vr3/GX015748", "00:00:43.034", :end},
          {"2023-05-20-vr2-vr3/GX015749", :start, "00:00:48.081"},
          {"2023-05-20-vr2-vr3/GX015751", "00:00:04.505", :end},
          {"2023-05-20-vr2-vr3/GX015752", :start, :end},
          {"2023-05-20-vr2-vr3/GX015753", :start, :end},
          {"2023-05-20-vr2-vr3/GX015754", :start, :end},
          {"2023-05-20-vr2-vr3/GX015755", :start, :end},
          {"2023-05-20-vr2-vr3/GX015756", :start, :end},
          {"2023-05-20-vr2-vr3/GX015757", :start, :end},
          {"2023-05-20-vr2-vr3/GX015758", :start, :end},
          {"2023-05-20-vr2-vr3/GX015759", :start, :end},
          {"2023-05-20-vr2-vr3/GX015760", :start, :end},
          {"2023-05-20-vr2-vr3/GX015761", :start, "00:00:35.028"}
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
