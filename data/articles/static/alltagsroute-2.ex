defmodule Data.Article.Static.Alltagsroute2 do
  use Article.Static

  def id(), do: "2"
  def route_group(), do: :alltag
  def title(), do: "Alltagsroute 2"

  def color(), do: "#b2211d"

  def summary(),
    do: "Alltagsroute 2 führt vom Rathaus nach Eidelstedt"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "2",
        direction: :forward,
        from: "Innenstadt",
        to: "Eidelstedt",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Eidelstedt",
        historic: %{
          "187b020a4d6df00848ee785ffebbd4c9" => ~d[2024-04],
          "ad83462646710e75b1d597806cf22223" => ~d[2023-05],
          "a62c9bb78695d8eda8d3bff8ac2d17be" => ~d[2022-04],
          "f329670c1f6a784ec835ef92cca96272" => ~d[2021-06]
        },
        videos: [
          {"2024-04-07-fr2/GX017109", "00:00:33.267", :end},
          {"2024-04-07-fr2/GX017110", :start, :end},
          {"2024-04-07-fr2/GX017111", :start, "00:00:21.588"},
          {"2024-04-21-vr2-rand/GX017217", "00:00:28.729", :end},
          {"2024-04-21-vr2-rand/GX017218", :start, :end},
          {"2024-04-21-vr2-rand/GX017219", :start, :end},
          {"2024-04-21-vr2-rand/GX017220", :start, :end},
          {"2024-04-21-vr2-rand/GX017221", "00:00:00.200", :end},
          {"2024-04-21-vr2-rand/GX017222", :start, :end},
          {"2024-04-21-vr2-rand/GX017223", :start, :end},
          {"2024-04-21-vr2-rand/GX017224", :start, :end},
          {"2024-04-21-vr2-rand/GX017225", :start, :end},
          {"2024-04-21-vr2-rand/GX017226", :start, "00:00:04.337"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "2",
        direction: :backward,
        from: "Eidelstedt",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "von Eidelstedt in die Innenstadt",
        historic: %{
          "817f77cc3dd91ce9ef5003ba3d0a9628" => ~d[2024-04],
          "6400d51dcd95cea2dd55bbb1713ed9ec" => ~d[2023-05],
          "b9fec80b3268dc0c19e6b281cec518a8" => ~d[2022-04],
          "93e9ec24a1550b4a5c0a92d8582e3432" => ~d[2021-06]
        },
        videos: [
          {"2024-04-21-vr2-rand/GX017227", :start, :end},
          {"2024-04-21-vr2-rand/GX017228", :start, :end},
          {"2024-04-21-vr2-rand/GX017229", :start, :end},
          {"2024-04-21-vr2-rand/GX017230", :start, :end},
          {"2024-04-21-vr2-rand/GX017231", :start, "00:00:02.236"},
          {"2024-04-21-vr2-rand/GX017231", "00:00:08.976", :end},
          {"2024-04-21-vr2-rand/GX017232", :start, :end},
          {"2024-04-21-vr2-rand/GX017233", :start, :end},
          {"2024-04-21-vr2-rand/GX017234", :start, :end},
          {"2024-04-21-vr2-rand/GX017235", :start, :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/418914/veloroute-2/"},
      {"Komoot Routenplaner: nach Eidelstedt", "https://www.komoot.com/de-de/tour/204274161"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/194841"}
    ]
  end

  def text(assigns) do
    ~H"""
     <table class="routing">
      <tr>
        <td></td>
        <td rowspan="9" style="background-image: url(/images/route2.svg)">
          <.icon>2</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.990953,53.548317,9.998129,53.552594" lon={9.993833} lat={53.550924} dir="forward" ref="2" highlight="Rathausmarkt">Rathaus</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>1</.icon>
          <.icon>11</.icon>
          <.icon>12</.icon>
        </td>
        <td><.v bounds="9.983395,53.547382,9.990571,53.551659" lon={9.987737} lat={53.548638} dir="forward" ref="2">Rödingsmarkt</.v></td>
      </tr>
      <tr>
        <td><.icon>FR9</.icon></td>
        <td><.v bounds="9.95608,53.554674,9.975319,53.565951" lon={9.966796} lat={53.562393} dir="forward" ref="2">Schanzenviertel</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>13</.icon>
        </td>
        <td><.v bounds="9.933678,53.562581,9.973695,53.5803" lon={9.960707} lat={53.57117} dir="forward" ref="2">Eimsbüttel</.v></td>
      </tr>
      <tr>
        <td>
          <.icon bounds="9.861396,53.57754,9.93999,53.615691" lon={9.938191} lat={53.58115} dir="forward" name="rsw-elmshorn">RSW</.icon>
        </td>
        <td><.v bounds="9.919166,53.573,9.959761,53.593032" lon={9.9383} lat={53.583977} dir="forward" ref="2">Langenfelde</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.914985,53.584883,9.949393,53.601333" lon={9.932624} lat={53.595197} dir="forward" ref="2">Stellingen</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR11</.icon>
          <.icon>14</.icon>
        </td>
        <td><.v bounds="9.914985,53.584883,9.949393,53.601333" lon={9.932624} lat={53.595197} dir="forward" ref="2">Eidelstedt</.v></td>
      </tr>
      <tr>
        <td></td>
        <td class="dir"><.m bounds="9.827003,53.605329,9.903607,53.640796">(Halstenbek)</.m></td>
      </tr>
    </table>

    <p>Vom Rathaus aus führt die Alltagsroute 2 (auch: Veloroute 2 oder Radroute 2) in einem Bogen durch die Neustadt. In der <.v bounds="9.959199,53.553031,9.979629,53.562268" lon={9.968639} lat={53.557447} dir="forward" ref="2">Feldstraße</.v> knickt die Route Richtung Norden ab und durchquert das Schanzenviertel. Nach der <.v bounds="9.959199,53.566871,9.969102,53.572313" lon={9.963436} lat={53.569592} dir="forward" ref="2">Christuskirche</.v> führt die Route über verschiedene Nebenstraßen, die grob parallel zur <.m bounds="9.942344,53.566354,9.968208,53.574782">Fruchtallee</.m> bzw. <.m bounds="9.908829,53.570999,9.945344,53.602926">Kieler Straße</.m> verlaufen.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich. Sie sind meist asphaltiert, es gibt aber auch Abschnitte mit Kopfsteinpflaster, welches verhältnismäßig eben ist.</p>

    <h4>Meinung</h4>
    <p>Die Route ist durchwachsen. Als Erwachsener kommt man trotz vieler Ampeln gut durch und wird in der Regel keine Probleme haben. Allerdings sind die wenigsten Abschnitte kindgerecht, wie z.B. die bereits umgebaute <.v bounds="9.960613,53.56667,9.967385,53.570781" lon={9.965245} lat={53.566681} dir="forward" ref="2">Weidenallee</.v>.</p>

    <p>Häufigstes Problem auf der Strecke sind zu dicht vorbeifahrende oder entgegenkommende Autos, die den Fahrkomfort senken. Das ist teilweise dem Fehlverhalten der Beteiligten zuzuschreiben. Oft fehlte auch der politische Mut den KFZ-Verkehr auf andere Straßen zu verlagern.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
