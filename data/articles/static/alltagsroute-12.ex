defmodule Data.Article.Static.Alltagsroute12 do
  use Article.Static

  def id(), do: "12"
  def route_group(), do: :alltag
  def title(), do: "Alltagsroute 12"

  def color(), do: "#ed6706"

  def summary(),
    do: "Alltagsroute 12 führt vom Rathaus nach Altona"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "12",
        direction: :forward,
        from: "Innenstadt",
        to: "Altona",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Altona",
        historic: %{
          "359b4f5e3ed270488c9f4bb3c41879cb" => ~d[2023-05],
          "46744d4e32ca048d128cb0dcf1df673c" => ~d[2022-04],
          "aaa2dfe3fe041ee5983284e7cd349011" => ~d[2021-06]
        },
        videos: [
          {"2023-05-21-vr12-vr9/GX015821", "00:00:25.020", :end},
          {"2023-05-21-vr12-vr9/GX015822", :start, :end},
          {"2023-05-21-vr12-vr9/GX015823", :start, :end},
          {"2023-05-21-vr12-vr9/GX015824", :start, :end},
          {"2023-05-21-vr12-vr9/GX015825", :start, :end},
          {"2023-05-21-vr12-vr9/GX015826", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "12",
        direction: :backward,
        from: "Altona",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "von Altona in die Innenstadt",
        historic: %{
          "ec081a60074bd5839aec7b13ce45ab3a" => ~d[2023-05],
          "4954c372030bde7d562eedc2d21bfd5f" => ~d[2022-04],
          "a5aa0cbc5c7e75039561772114010442" => ~d[2021-06]
        },
        videos: [
          {"2023-05-21-vr12-vr9/GX015789", :start, :end},
          {"2023-05-21-vr12-vr9/GX015790", :start, :end},
          {"2023-05-21-vr12-vr9/GX015791", :start, :end},
          {"2023-05-21-vr12-vr9/GX015792", :start, :end},
          {"2023-05-21-vr12-vr9/GX015793", :start, "00:00:05.772"},
          {"2023-05-21-vr12-vr9/GX015795", "00:00:13.146", :end},
          {"2023-05-21-vr12-vr9/GX015796", :start, :end},
          {"2023-05-21-vr12-vr9/GX015797", :start, :end},
          {"2023-05-21-vr12-vr9/GX015798", :start, :end},
          {"2023-05-21-vr12-vr9/GX015800", :start, :end},
          {"2023-05-21-vr12-vr9/GX015801", :start, :end},
          {"2023-05-21-vr12-vr9/GX015802", :start, :end},
          {"2023-05-21-vr12-vr9/GX015803", :start, "00:00:11.676"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/426798/veloroute-12/"},
      {"Komoot Routenplaner: nach Altona", "https://www.komoot.de/tour/225148542"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/2238410"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="7" style="background-image: url(/images/route12.svg)">
          <.icon>12</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.985511,53.546587,10.000435,53.554119" lon={9.994228} lat={53.5505} dir="forward" ref="12" highlight="Rathausmarkt">Rathaus</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>1</.icon>
          <.icon>11</.icon>
          <.icon>2</.icon>
        </td>
        <td><.v bounds="9.979819,53.544806,9.994743,53.552337" lon={9.987516} lat={53.549008} dir="forward" ref="12">Rödingsmarkt</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>11</.icon>
        </td>
        <td><.v bounds="9.964349,53.543146,9.979272,53.550677" lon={9.972639} lat={53.545563} dir="forward" ref="12">Landungsbrücken</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>11</.icon>
        </td>
        <td><.v bounds="9.958412,53.54159,9.973336,53.549121" lon={9.969531} lat={53.546082} dir="forward" ref="12">Alter Elbtunnel</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.946468,53.542192,9.961392,53.549723" lon={9.954723} lat={53.545729} dir="forward" ref="12">Fischmarkt</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>13</.icon>
        </td>
        <td><.v bounds="9.935817,53.545325,9.950741,53.552856" lon={9.936366} lat={53.549683} dir="forward" ref="12">Altona</.v></td>
      </tr>
    </table>

    <p>Die Alltagsroute 12 (auch: Veloroute 12 oder Radroute 12) führt vom Rathaus entlang der Elbe nach Altona</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich. Meist sind sie asphaltiert, es gibt aber auch kurze Abschnitte mit Kopfsteinpflaster.</p>

    <h4>Meinung</h4>
    <p>Die kurze Route ist in nur wenigen Abschnitten wirklich fahrradfreundlich. Sofern das Ziel nicht in unmittelbarer Nähe der Route befindet, kann man sie getrost ignorieren.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
