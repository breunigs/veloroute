defmodule Data.Article.Static.Alltagsroute4 do
  use Article.Static

  def id(), do: "4"
  def route_group(), do: :alltag
  def title(), do: "Alltagsroute 4"

  def color(), do: "#008aa7"

  def summary(),
    do: "Alltagsroute 4 führt vom Rathaus zum Ochsenzoll"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "4",
        direction: :forward,
        from: "Innenstadt",
        to: "Ochsenzoll",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt zum Ochsenzoll",
        historic: %{
          "278170ddb5c27153870dd9654679ff85" => ~d[2023-06],
          "dfbd93ce691204a0f6503ff6ccaadd3f" => ~d[2022-03],
          "e4cffabc1e73519e643f87466f40155d" => ~d[2021-06]
        },
        videos: [
          {"2023-06-01-vr4/GX015834", "00:00:12.145", :end},
          {"2023-06-01-vr4/GX015835", :start, :end},
          {"2023-06-01-vr4/GX015836", :start, "00:01:20.280"},
          {"2023-06-01-vr4/GX015836", "00:01:21.915", :end},
          {"2023-06-01-vr4/GX015837", :start, :end},
          {"2023-06-01-vr4/GX015839", :start, :end},
          {"2023-06-01-vr4/GX015840", :start, :end},
          {"2023-06-01-vr4/GX015841", :start, :end},
          {"2023-06-01-vr4/GX015842", :start, :end},
          {"2023-06-01-vr4/GX015843", :start, :end},
          {"2023-06-01-vr4/GX015844", :start, :end},
          {"2023-06-01-vr4/GX015845", :start, :end},
          {"2023-06-01-vr4/GX015846", :start, :end},
          {"2023-06-01-vr4/GX015847", :start, :end},
          {"2023-06-01-vr4/GX015848", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "4",
        direction: :backward,
        from: "Ochsenzoll",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "vom Ochsenzoll in die Innenstadt",
        historic: %{
          "0893cfa96c222f3297c893e26527f5e6" => ~d[2023-06],
          "8f85eaf31ac2405b61747428818668b5" => ~d[2022-03],
          "70233271c23802b342c6a2f59d8b5552" => ~d[2021-06]
        },
        videos: [
          {"2023-06-01-vr4/GX015849", "00:00:00.801", :end},
          {"2023-06-01-vr4/GX015850", :start, :end},
          {"2023-06-01-vr4/GX015851", :start, :end},
          {"2023-06-01-vr4/GX015852", :start, :end},
          {"2023-06-01-vr4/GX015853", :start, :end},
          {"2023-06-01-vr4/GX015855", :start, :end},
          {"2023-06-01-vr4/GX015856", :start, :end},
          {"2023-06-01-vr4/GX015857", :start, :end},
          {"2023-06-01-vr4/GX015858", :start, :end},
          {"2023-06-01-vr4/GX015859", :start, :end},
          {"2023-06-01-vr4/GX015860", :start, :end},
          {"2023-06-01-vr4/GX015862", :start, :end},
          {"2023-06-01-vr4/GX015863", :start, "00:00:15.282"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/418942/veloroute-4/"},
      {"Komoot Routenplaner: zum Ochsenzoll", "https://www.komoot.de/tour/204277309"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/191882"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="12" style="background-image: url(/images/route4.svg)">
          <.icon>4</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.990953,53.548317,9.998129,53.552594" lon={9.993833} lat={53.550924} dir="forward" ref="4" highlight="Rathausmarkt">Rathaus</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.974848,53.554813,10.009154,53.586694" lon={10.000255} lat={53.571326} dir="forward" ref="4">Harvestehude</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>13</.icon>
        </td>
        <td><.v bounds="9.982344,53.578684,10.012225,53.596683" lon={9.997799} lat={53.58716} dir="forward" ref="4">Eppendorf</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR12</.icon>
          <.icon>FR1</.icon>
        </td>
        <td><.v bounds="9.978373,53.581676,10.035228,53.624715" lon={9.995184} lat={53.5967} dir="forward" ref="4">Winterhude</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.98676,53.594237,10.025619,53.615897" lon={9.998388} lat={53.608649} dir="forward" ref="4">Alsterdorf</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>5</.icon>
        </td>
        <td><.v bounds="9.949305,53.606392,10.045684,53.65759" lon={10.014844} lat={53.618825} dir="forward" ref="4">Flughafen</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.992711,53.615578,10.059315,53.652951" lon={10.025592} lat={53.634073} dir="forward" ref="4">Fuhlsbüttel</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>14</.icon>
        </td>
        <td><.v bounds="9.995048,53.639135,10.036705,53.668201" lon={10.019096} lat={53.651482} dir="forward" ref="4">Langenhorn</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.990504,53.655513,10.032161,53.684579" lon={10.01493} lat={53.674482} dir="forward" ref="4">Langenhorn Nord</.v></td>
      </tr>
      <tr>
        <td>
          <.icon bounds="9.952438,53.676444,10.05043,53.792362" lon={10.000503} lat={53.680041} dir="forward" name="rsw-bad-bramstedt">RSW</.icon>
        </td>
        <td><.v bounds="9.977439,53.66203,10.038788,53.691304" lon={10.000972} lat={53.677668} dir="forward" ref="4">Ochsenzoll</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>norderstedt-1</.icon>
          <.icon>norderstedt-2</.icon>
          <.icon>norderstedt-4</.icon>
        </td>
        <td class="dir"><.v bounds="9.926336,53.672871,10.057243,53.770158" lon={10.000606} lat={53.679798} dir="forward" ref="4">(Norderstedt)</.v></td>
      </tr>
    </table>

    <p>Die Alltagsroute 4 (auch: Veloroute 4 oder Radroute 4) folgt zunächst der <.v bounds="9.98242,53.550409,10.024232,53.590927" lon={9.996538} lat={53.559824} dir="forward" ref="4">Alster auf der Westseite</.v>, wechselt an der <.v bounds="9.981299,53.572742,10.0159,53.599558" lon={9.99884} lat={53.57959} dir="forward" ref="4">Krugkoppelbrücke</.v> dann die Seite. Ab <.v bounds="9.975196,53.615062,10.0633,53.69858" lon={10.025965} lat={53.632249} dir="forward" ref="4">Fuhlsbüttel</.v> orientiert sie sich an der U-Bahn Linie 1 und erreicht über Nebenstraßen schließlich den <.v bounds="9.975455,53.65112,10.039861,53.698301" lon={10.001158} lat={53.677428} dir="forward" ref="4">Ochsenzoll</.v>. Der geplante <.a href="/rsw-bad-bramstedt">Radschnellweg nach Bad Bramstedt</.a> verläuft fast parallel, soll aber direkt neben den Gleisen und nahezu kreuzungsfrei verlaufen.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich. Sie sind bis auf wenige Ausnahmen asphaltiert.</p>

    <h4>Meinung</h4>
    <p>Die <.v bounds="9.991681,53.558899,10.00515,53.593009" lon={9.999808} lat={53.57179} dir="forward" ref="4">Fahrradstraßen an der Alster</.v> sind das Aushängeschild der Velorouten Planung in Hamburg. Die <.v bounds="9.989903,53.592799,10.015337,53.614187" lon={9.994343} lat={53.597756} dir="forward" ref="4">Bebelallee</.v> und die noch nicht ausgebaute <.v bounds="9.989903,53.592799,10.015337,53.614187" lon={9.999008} lat={53.608785} dir="forward" ref="4">Rathenaustraße</.v> dagegen eine Zumutung. Die Führung über Nebenstraßen im Norden bietet zwar gute Anbindung, macht längere Distanzen jedoch etwas müßig. Der <.a href="/rsw-bad-bramstedt">geplante Radschnellweg</.a> stellt daher eine gute Ergänzung dar.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
