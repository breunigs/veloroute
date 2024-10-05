defmodule Data.Article.Static.BrNordN8 do
  use Article.Static

  def id(), do: "br-nord-n8"
  def display_id(), do: "N8"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Nord – N8 – Ost-West"

  def color(), do: "#b482ff"
  def color_faded(), do: "#dac2ff"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „N8 – Ost-West“ im Bezirk Hamburg-Nord führt von der Kollaustraße (Veloroute 3) nach Wellingsbüttel."

  def tags(), do: [id(), display_id(), "br-nord"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "n8",
        direction: :forward,
        from: "Kollaustraße",
        to: "Wellingsbüttel",
        parent_ref: __MODULE__,
        text: "von der Kollaustraße nach Wellingsbüttel",
        videos: [
          {"2023-10-22-br-nord-reg/GX016466", "00:00:33.901", "00:01:26.820"},
          {"2023-10-23-brnrod/GX016492", "00:01:29.222", :end},
          {"2023-10-23-brnrod/GX016493", :start, :end},
          {"2023-10-23-brnrod/GX016494", :start, :end},
          {"2023-10-23-brnrod/GX016495", :start, :end},
          {"2023-10-23-brnrod/GX016496", :start, :end},
          {"2023-10-23-brnrod/GX016497", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "n8",
        direction: :backward,
        from: "Wellingsbüttel",
        to: "Kollaustraße",
        parent_ref: __MODULE__,
        text: "von Wellingsbüttel zur Kollaustraße",
        videos: [
          {"2023-10-23-brnrod/GX016498", :start, :end},
          {"2023-10-23-brnrod/GX016499", :start, :end},
          {"2023-10-23-brnrod/GX016500", :start, :end},
          {"2023-10-23-brnrod/GX016501", :start, "00:00:03.837"},
          {"2023-10-23-brnrod/GX016538", "00:00:04.671", "00:00:13.981"},
          {"2023-10-23-brnrod/GX016538", "00:00:20.087", "00:00:44.811"},
          {"2023-10-23-brnrod/GX016538", "00:01:17.811", :end},
          {"2023-10-23-brnrod/GX016539", :start, :end},
          {"2023-10-23-brnrod/GX016540", :start, :end},
          {"2023-10-23-brnrod/GX016541", :start, :end},
          {"2023-10-23-brnrod/GX016542", :start, :end}
        ]
      }
    ]

  def links(assigns) do
    [
      {"Entwurf Radverkehrskonzept", "Oktober 2023",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1013264"}
    ] ++ Data.Article.Shared.bezirksroute_links(:nord, assigns)
  end

  def text(assigns) do
    ~H"""
    <h3>Bezirksroute HH-Nord – Ost-West <.icon>N8</.icon></h3>
    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „N8 – Ost-West“ künftig verlaufen könnte.</p>

    <p>Die Route zweigt an der <.v bounds="9.952887,53.608311,9.988815,53.618968" lon={9.956666} lat={53.611864} dir="forward" ref="br-nord-n8">Papenreye</.v> von der <.a name="3">Radroute 3</.a> nach Osten ab. Von dort führt sie über den <.v bounds="9.978639,53.611405,10.018373,53.627361" lon={10.002457} lat={53.622231} dir="forward" ref="br-nord-n8">Weg beim Jäger</.v> entlang des Flughafens und dann über <.v bounds="10.007985,53.618747,10.038997,53.629337" lon={10.021008} lat={53.623672} dir="forward" ref="br-nord-n8" highlight="Röntgenstraße,Am Hasenberge">einige Nebenstraßen</.v> zum <.v bounds="10.020471,53.618478,10.044666,53.632015" lon={10.031517} lat={53.623049} dir="forward" ref="br-nord-n8">Friedhof Ohlsdorf</.v>. An diesem führt sie auf der <.v bounds="10.023999,53.621544,10.071195,53.646105" lon={10.049176} lat={53.632087} dir="forward" ref="br-nord-n8">Stübeheide</.v> nördlich vorbei und schließt im Osten an die <.a name="br-wandsbek-w6">Bezirksroute Wandsbek W6</.a> an.</p>

    <h4>Speziell für diese Route</h4>
    <p>In der <.v bounds="9.952887,53.608311,9.988815,53.618968" lon={9.956666} lat={53.611864} dir="forward" ref="br-nord-n8">Papenreye</.v> wird ein Vollumbau vorgeschlagen, um ordentliche, vom KFZ-Verkehr getrennte Radwege anbieten zu können. Im <.v bounds="9.971345,53.61028,9.988285,53.616242" lon={9.978135} lat={53.613162} dir="forward" ref="br-nord-n8">Spreenende</.v> setzt man auf <.ref>Radfahrstreifen</.ref>.</p>

    <p>Im <.v bounds="9.978639,53.611405,10.018373,53.627361" lon={10.002457} lat={53.622231} dir="forward" ref="br-nord-n8">Weg beim Jäger</.v> soll der vorhandene, nördliche Zweirichtungsradweg ausgebaut werden. Zusätzlich soll man auch weiterhin auf der „richtigen“ Straßenseite fahren können, wobei der südliche Radweg dann näher an den KFZ verläuft (z.B. <.ref>Schutzstreifen</.ref>).</p>

    <p>An der Kreuzung mit der <.v bounds="10.007231,53.621601,10.015925,53.625905" lon={10.010655} lat={53.623674} dir="forward" ref="br-nord-n8">Alsterkrugchaussee</.v> sollen die Querungsmöglichkeiten und Wechselmöglichkeiten zur <.a name="br-nord-n1">Bezirksroute Nord N1</.a> verbessert werden.</p>

    <p>Die Nebenstraßen <.v bounds="10.009147,53.620268,10.068472,53.639071" lon={10.01552} lat={53.623488} dir="forward" ref="br-nord-n8">Röntgenstraße</.v>, <.v bounds="10.009147,53.620268,10.068472,53.639071" lon={10.023152} lat={53.622974} dir="forward" ref="br-nord-n8">Am Hasenberge</.v>, <.v bounds="10.009147,53.620268,10.068472,53.639071" lon={10.031562} lat={53.623119} dir="forward" ref="br-nord-n8">Im Grünen Grunde</.v> und <.v bounds="10.009147,53.620268,10.068472,53.639071" lon={10.049431} lat={53.632026} dir="forward" ref="br-nord-n8">Stübeheide</.v> sollen Fahrradstraßen werden.</p>

    <p>Für das kurze Stück in der <.v bounds="10.031846,53.625144,10.031846,53.625144" lon={10.031846} lat={53.625144} dir="backward" ref="br-nord-n8">Fuhlsbüttler Straße</.v> setzt man auf die Planungen der <.a name="rsw-bad-bramstedt">Radroute Plus Bad Bramstedt</.a>. Für die <.a name="2020-10-24-wellingsbuetteler-landstrasse">Wellingsbütteler Straße siehe eigener Artikel</.a>.</p>

    <%= Data.Article.Shared.bezirksroute(:nord) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
