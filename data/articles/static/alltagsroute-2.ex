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
        renderer: 3,
        group: "2",
        direction: :forward,
        from: "Innenstadt",
        to: "Eidelstedt",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Eidelstedt",
        videos: [
          {"2022-04-22-velo2/GX013448", :start, :end},
          {"2022-04-22-velo2/GX013449", :start, :end},
          {"2022-04-22-velo2/GX013450", :start, "00:00:05.172"},
          {"2022-04-22-velo2/GX013451", :start, :end},
          {"2022-04-22-velo2/GX013452", :start, :end},
          {"2022-04-22-velo2/GX013453", :start, :end},
          {"2022-04-22-velo2/GX013454", :start, :end},
          {"2022-04-22-velo2/GX013455", :start, :end},
          {"2022-04-22-velo2/GX013456", :start, :end},
          {"2022-04-22-velo2/GX013457", :start, :end},
          {"2022-04-22-velo2/GX013458", :start, :end},
          {"2022-04-22-velo2/GX013459", :start, :end},
          {"2022-04-22-velo2/GX013460", :start, :end},
          {"2022-04-22-velo2/GX013461", :start, :end},
          {"2022-04-22-velo2/GX013462", :start, :end},
          {"2022-04-22-velo2/GX013463", :start, :end},
          {"2022-04-22-velo2/GX013464", :start, "00:00:02.236"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "2",
        direction: :backward,
        from: "Eidelstedt",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "von Eidelstedt in die Innenstadt",
        videos: [
          {"2022-04-22-velo2/GX013464", "00:00:12.813", :end},
          {"2022-04-22-velo2/GX013465", :start, :end},
          {"2022-04-22-velo2/GX013466", :start, :end},
          {"2022-04-22-velo2/GX013467", :start, :end},
          {"2022-04-22-velo2/GX013468", :start, :end},
          {"2022-04-22-velo2/GX013469", :start, :end},
          {"2022-04-22-velo2/GX013470", "00:00:01.101", :end},
          {"2022-04-22-velo2/GX013471", :start, :end},
          {"2022-04-22-velo2/GX013472", :start, :end},
          {"2022-04-22-velo2/GX013473", :start, :end},
          {"2022-04-22-velo2/GX013444", :start, :end},
          {"2022-04-22-velo2/GX013445", :start, "00:00:16.316"},
          {"2022-04-22-velo2/GX013446", "00:00:00.901", :end},
          {"2022-04-22-velo2/GX013447", :start, "00:00:12.412"},
          {"2022-03-26-veloroute-4/GX013342", "00:00:30.764", "00:01:00.694"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/418914/veloroute-2/"},
      {"Komoot Routenplaner: nach Eidelstedt", "https://www.komoot.de/tour/204274161"},
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
        <td><.m bounds="9.990953,53.548317,9.998129,53.552594" lon={9.993833} lat={53.550924} dir="forward" ref="2">Rathaus</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>1</.icon>
          <.icon>11</.icon>
          <.icon>12</.icon>
        </td>
        <td><.m bounds="9.983395,53.547382,9.990571,53.551659" lon={9.987737} lat={53.548638} dir="forward" ref="2">Rödingsmarkt</.m></td>
      </tr>
      <tr>
        <td><.icon>FR9</.icon></td>
        <td><.m bounds="9.95608,53.554674,9.975319,53.565951" lon={9.966796} lat={53.562393} dir="forward" ref="2">Schanzenviertel</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>13</.icon>
        </td>
        <td><.m bounds="9.933678,53.562581,9.973695,53.5803" lon={9.960707} lat={53.57117} dir="forward" ref="2">Eimsbüttel</.m></td>
      </tr>
      <tr>
        <td><.a name="rsw-elmshorn">RSW Elmshorn</.a></td>
        <td><.m bounds="9.919166,53.573,9.959761,53.593032" lon={9.9383} lat={53.583977} dir="forward" ref="2">Langenfelde</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.914985,53.584883,9.949393,53.601333" lon={9.932624} lat={53.595197} dir="forward" ref="2">Stellingen</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>FR11</.icon>
          <.icon>14</.icon>
        </td>
        <td><.m bounds="9.914985,53.584883,9.949393,53.601333" lon={9.932624} lat={53.595197} dir="forward" ref="2">Eidelstedt</.m></td>
      </tr>
      <tr>
        <td></td>
        <td class="dir"><.m bounds="9.827003,53.605329,9.903607,53.640796">(Halstenbek)</.m></td>
      </tr>
    </table>

    <p>Vom Rathaus aus führt die Alltagsroute 2 (auch: Veloroute 2) in einem Bogen durch die Neustadt. In der <.m bounds="9.959199,53.553031,9.979629,53.562268" lon={9.968639} lat={53.557447} dir="forward" ref="2">Feldstraße</.m> knickt die Route Richtung Norden ab und durchquert das Schanzenviertel. Nach der <.m bounds="9.959199,53.566871,9.969102,53.572313" lon={9.963436} lat={53.569592} dir="forward" ref="2">Christuskirche</.m> führt die Route über verschiedene Nebenstraßen, die grob parallel zur <.m bounds="9.942344,53.566354,9.968208,53.574782">Fruchtallee</.m> bzw. <.m bounds="9.908829,53.570999,9.945344,53.602926">Kieler Straße</.m> verlaufen.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich. Sie sind meist asphaltiert, es gibt aber auch Abschnitte mit Kopfsteinpflaster, welches verhältnismäßig eben ist.</p>

    <h4>Meinung</h4>
    <p>Die Route ist durchwachsen. Als Erwachsener kommt man trotz vieler Ampeln gut durch und wird in der Regel keine Probleme haben. Allerdings sind die wenigsten Abschnitte kindgerecht, wie z.B. die bereits umgebaute <.m bounds="9.960613,53.56667,9.967385,53.570781" lon={9.965245} lat={53.566681} dir="forward" ref="2">Weidenallee</.m>.</p>

    <p>Häufigstes Problem auf der Strecke sind zu dicht vorbeifahrende oder entgegenkommende Autos, die den Fahrkomfort senken. Das ist teilweise dem Fehlverhalten der Beteiligten zuzuschreiben. Oft fehlte auch der politische Mut den KFZ-Verkehr auf andere Straßen zu verlagern.</p>

    <h4>Externe Links</h4>
    <.structured_links gpx={true}/>
    """
  end
end
