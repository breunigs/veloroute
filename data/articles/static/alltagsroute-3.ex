defmodule Data.Article.Static.Alltagsroute3 do
  use Article.Static

  def id(), do: "3"
  def route_group(), do: :alltag
  def name(), do: "alltagsroute-3"
  def title(), do: "Alltagsroute 3"

  def color(), do: "#e8430b"

  def summary("de"),
    do: "Alltagsroute 3 führt vom Rathaus nach Niendorf"

  def summary("en"),
    do: "Commuter route 3 connects Hamburg's town hall to Niendorf"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "3",
        direction: :forward,
        from: "Innenstadt",
        to: "Niendorf",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Niendorf",
        historic: %{
          "d9e9efbdc9a228d8d37b402645fa66ed" => ~d[2024-04],
          "9059bbed2bac01ed48572b54a6aed52e" => ~d[2023-05],
          "96167454c3dc962cf41581d4e02ba00c" => ~d[2022-04],
          "308a0cda991f96cb4c45a0ca555cd04a" => ~d[2021-06]
        },
        videos: [
          {"2024-04-30-fr3/GX017292", "00:00:31.098", :end, vf: "curves=lighter"},
          {"2024-04-30-fr3/GX017293", :start, :end},
          {"2024-04-30-fr3/GX017294", :start, :end},
          {"2024-04-30-fr3/GX017295", :start, "00:00:02.236"},
          {"2024-04-30-fr3/GX017295", "00:00:04.404", :end},
          {"2024-04-30-fr3/GX017296", :start, :end},
          {"2024-04-30-fr3/GX017297", :start, :end},
          {"2024-04-30-fr3/GX017298", :start, :end},
          {"2024-04-30-fr3/GX017299", :start, :end},
          {"2024-04-30-fr3/GX017300", :start, :end},
          {"2024-04-30-fr3/GX017301", :start, :end},
          {"2024-04-30-fr3/GX017302", :start, :end},
          {"2024-04-30-fr3/GX017303", :start, :end},
          {"2024-04-30-fr3/GX017304", :start, :end},
          {"2024-04-30-fr3/GX017305", :start, "00:00:02.669"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "3",
        direction: :backward,
        from: "Niendorf",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "von Niendorf in die Innenstadt",
        historic: %{
          "f81c8ec0d6b476bb5c08222c973b0173" => ~d[2024-04],
          "2d42b9a61a359d8111b6fd3dbc68c0b4" => ~d[2023-05],
          "c18583754e3dfe53c4a742df0ca6fbc5" => ~d[2022-07],
          "efbc892523d5e09a52eda8587b66d22a" => ~d[2021-06]
        },
        videos: [
          {"2024-04-30-fr3/GX017305", "00:00:02.669", :end},
          {"2024-04-30-fr3/GX017306", :start, :end},
          {"2024-04-30-fr3/GX017307", :start, :end},
          {"2024-04-30-fr3/GX017308", :start, :end},
          {"2024-04-30-fr3/GX017309", :start, :end},
          {"2024-04-30-fr3/GX017310", :start, :end},
          {"2024-04-30-fr3/GX017311", :start, "00:01:00.627"},
          {"2024-04-30-fr3/GX017311", "00:01:06.233", :end},
          {"2024-04-30-fr3/GX017312", :start, :end},
          {"2024-04-30-fr3/GX017313", :start, :end},
          {"2024-04-30-fr3/GX017314", :start, :end},
          {"2024-04-30-fr3/GX017315", :start, :end},
          {"2024-04-30-fr3/GX017316", :start, :end},
          {"2024-04-30-fr3/GX017317", :start, "00:00:30.024"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/418922/veloroute-3/"},
      {"Komoot Routenplaner: nach Niendorf", "https://www.komoot.com/de-de/tour/204275386"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/194840"}
    ]
  end

  defp route(assigns) do
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
      <td><.v bounds="9.990953,53.548317,9.998129,53.552594" lon={9.993833} lat={53.550924} dir="forward" ref="3" highlight="Rathausmarkt">Rathaus</.v></td>
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
    """
  end

  def text(%{lang: "en"} = assigns) do
    ~H"""
    <.route/>

    <p lang="en">Starting at <.v bounds="9.990953,53.548317,9.998129,53.552594" lon={9.993833} lat={53.550924} dir="forward" ref="3" highlight="Rathausmarkt">Hamburg's town hall</.v>, commuter route 3 (also called <span translate="no" lang="de">Veloroute 3</span> or <span translate="no" lang="de">Radroute 3</span>) weaves itself through side streets towards <.v bounds="9.943576,53.62753,9.959497,53.644837" lon={9.952295} lat={53.635892} dir="forward" ref="3" translate="no" lang="de">Niendorf</.v>.</p>

    <h4 lang="en">Following the route</h4>
    <p lang="en">There is no signage for this route. You'll need a satnav or learn the route by heart.</p>

    <h4 lang="en">Comfort / Quality</h4>
    <p lang="en">All paths are suitable for all weather conditions. You'll ride mostly on asphalt, although there are some paved sections.</p>

    <h4 lang="en">Opinion</h4>
    <p>While the cycling quality has improved with each reconstruction, the route remains optimized for cars. Only a few sections offer exclusive bicycle paths –  often only <.ref lang="en">Schutzstreifen</.ref> are available, for example in <.v bounds="9.954151,53.582244,9.961593,53.591627" lon={9.956983} lat={53.587444} dir="forward" ref="3">Stresemannallee</.v> or <.v bounds="9.946787,53.631541,9.956402,53.64021" lon={9.952253} lat={53.636735} dir="forward" ref="3">Paul-Sorge-Straße</.v>.</p>

    <p lang="en">It's not all bad, though. The <.v bounds="9.978006,53.561869,9.993006,53.573155" lon={9.986577} lat={53.567697} dir="forward" ref="3">cycling streets in <span translate="no" lang="de">Rotherbaum</span></.v> are well made. Additionally, the traffic lights in <.v bounds="9.968698,53.570018,9.979453,53.576889" lon={9.977128} lat={53.571688} dir="forward" ref="3">Bogenstraße</.v> have been optimized for cyclists at around 18 km/h.</p>

    <h3 lang="en">External links</h3>
    <.structured_links ref={@ref} gpx={true} lang="en"/>
    """
  end

  def text(assigns) do
    ~H"""
    <.route/>

    <p>Vom <.v bounds="9.990953,53.548317,9.998129,53.552594" lon={9.993833} lat={53.550924} dir="forward" ref="3" highlight="Rathausmarkt">Rathaus</.v> aus schlängelt sich die Alltagsroute 3 (auch: Veloroute 3 oder Radroute 3) meist über Nebenstraßen nach <.v bounds="9.943576,53.62753,9.959497,53.644837" lon={9.952295} lat={53.635892} dir="forward" ref="3">Niendorf</.v>.</p>

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
