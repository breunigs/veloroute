defmodule Data.Article.Static.BrNordN5 do
  use Article.Static

  def id(), do: "br-nord-n5"
  def display_id(), do: "N5"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Nord – N5 – Osterbek-Route"

  def color(), do: "#b482ff"
  def color_faded(), do: "#dac2ff"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „N5 – Osterbek-Route“ im Bezirk Hamburg-Nord führt von der Krugkoppelbrücke (Alster) zum Eulenkamp (Veloroute 6)"

  def tags(), do: [id(), display_id(), "br-nord"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "n5",
        direction: :forward,
        from: "Krugkoppelbrücke",
        to: "Eulenkamp",
        parent_ref: __MODULE__,
        text: "von der Krugkoppelbrücke zum Eulenkamp",
        videos: [
          {"2023-10-18-brnord/GX016418", "00:00:40.040", :end},
          {"2023-10-18-brnord/GX016419", :start, :end},
          {"2023-10-18-brnord/GX016420", :start, :end},
          {"2023-10-18-brnord/GX016421", :start, :end},
          {"2023-10-18-brnord/GX016422", :start, :end},
          {"2023-10-18-brnord/GX016423", :start, :end},
          {"2023-10-18-brnord/GX016424", :start, :end},
          {"2023-10-18-brnord/GX016425", :start, :end},
          {"2023-10-18-brnord/GX016426", :start, :end},
          {"2023-10-18-brnord/GX016427", :start, "00:00:20.683"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "n5",
        direction: :backward,
        from: "Eulenkamp",
        to: "Krugkoppelbrücke",
        parent_ref: __MODULE__,
        text: "vom Eulenkamp zur Krugkoppelbrücke",
        videos: [
          {"2023-10-18-brnord/GX016427", "00:00:41.700", :end},
          {"2023-10-18-brnord/GX016428", :start, :end},
          {"2023-10-18-brnord/GX016429", :start, "00:00:20.120"},
          {"2023-10-18-brnord/GX016411", "00:00:24.658", :end},
          {"2023-10-18-brnord/GX016412", :start, :end},
          {"2023-10-18-brnord/GX016413", :start, :end},
          {"2023-10-18-brnord/GX016414", :start, :end},
          {"2023-10-18-brnord/GX016415", :start, :end},
          {"2023-10-18-brnord/GX016416", :start, :end},
          {"2023-10-18-brnord/GX016417", :start, :end},
          {"2023-10-18-brnord/GX016418", :start, "00:00:35.362"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Entwurf Radverkehrskonzept", "Oktober 2023",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1013264"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Bezirksroute HH-Nord – Osterbek-Route <.icon>N5</.icon></h3>
    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „N5 – Osterbek-Route“ künftig verlaufen könnte.</p>

    <p>Die Route beginnt an der <.v bounds="9.99655,53.576848,10.017361,53.584896" lon={9.999134} lat={53.579769} dir="forward" ref="br-nord-n5">Krugkoppelbrücke</.v>. Sie führt dann <em>teilweise</em> durch die <.v bounds="10.005577,53.578081,10.023036,53.585277" lon={10.015884} lat={53.582327} dir="forward" ref="br-nord-n5">Gertigstraße</.v> um den <.v bounds="10.005577,53.578081,10.023036,53.585277" lon={10.011414} lat={53.581546} dir="forward" ref="br-nord-n1">Mühlenkamp</.v> umgehen. Das ist im Video von 2023 falsch dargestellt.</p>

    <p>Im Anschluss folgt sie der <.v bounds="10.016052,53.580047,10.053062,53.587827" lon={10.037178} lat={53.584715} dir="forward" ref="br-nord-n5" highlight="Osterbekstraße">Osterbek</.v> und ist deckungsgleich mit der <.a name="FR2">Osterbek Freizeitroute</.a>. Am <.v bounds="10.038403,53.579986,10.076375,53.591169" lon={10.04294} lat={53.584319} dir="forward" ref="br-nord-n5">Flachsland</.v> bleibt diese Route südlich des Kanals und führt via <.v bounds="10.038403,53.579986,10.076375,53.591169" lon={10.066465} lat={53.586963} dir="forward" ref="br-nord-n5">Alter Teichweg</.v> zur <.a name="6">Radroute 6</.a>.</p>

    <h4>Speziell für diese Route</h4>
    <p>Bereits umgebaute Abschnitte (<.v bounds="9.997733,53.576844,10.01019,53.583333" lon={10.000179} lat={53.580633} dir="forward" ref="br-nord-n5">Fernsicht</.v>, <.v bounds="10.005577,53.578081,10.023036,53.585277" lon={10.015884} lat={53.582327} dir="forward" ref="br-nord-n5">Gertigstraße</.v>, und <.v bounds="10.038403,53.579986,10.076375,53.591169" lon={10.066465} lat={53.586963} dir="forward" ref="br-nord-n5">Alter Teichweg</.v>) sollen so bleiben. Für die anderen Streckenabschnitte wird der Umbau zu Fahrradstraßen empfohlen.</p>

    <p>An den Kreuzungen <.v bounds="10.017754,53.580711,10.021596,53.583522" lon={10.019228} lat={53.582433} dir="forward" ref="br-nord-n5">Barmbeker Straße / Bachstraße</.v> und <.v bounds="10.04557,53.582078,10.048409,53.584131" lon={10.046366} lat={53.582947} dir="forward" ref="br-nord-n5">Bramfelder Straße / Pfenningsbusch</.v> wird ein vollständiger Umbau vorgeschlagen.</p>

    <%= Data.Article.Shared.bezirksroute(:nord) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
