defmodule Data.Article.Static.BrNordN7 do
  use Article.Static

  def id(), do: "br-nord-n7"
  def display_id(), do: "N7"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Nord – N7 – City-Nord"

  def color(), do: "#b482ff"
  def color_faded(), do: "#dac2ff"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „N7 – City-Nord“ im Bezirk Hamburg-Nord führt vom Grandweg (Veloroute 3) zum Langenfort (Veloroute 5)."

  def tags(), do: [id(), display_id(), "br-nord"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "n7",
        direction: :forward,
        from: "Grandweg",
        to: "Langenfort",
        parent_ref: __MODULE__,
        text: "vom Grandweg zum Langenfort",
        videos: [
          {"2023-10-18-brnord/GX016367", "00:00:24.353", :end},
          {"2023-10-18-brnord/GX016368", :start, :end},
          {"2023-10-18-brnord/GX016369", :start, :end},
          {"2023-10-18-brnord/GX016370", :start, "00:00:08.408"},
          {"2023-10-17-brnord/GX016312", "00:00:11.078", :end},
          {"2023-10-17-brnord/GX016313", :start, "00:00:27.427"},
          {"2023-10-17-brnord/GX016313", "00:00:27.361", :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "n7",
        direction: :backward,
        from: "Langenfort",
        to: "Grandweg",
        parent_ref: __MODULE__,
        text: "vom Langenfort zum Grandweg",
        videos: [
          {"2023-10-17-brnord/GX016314", "00:00:21.054", :end},
          {"2023-10-17-brnord/GX016315", :start, :end},
          {"2023-10-17-brnord/GX016316", :start, :end},
          {"2023-10-17-brnord/GX016317", :start, :end},
          {"2023-10-17-brnord/GX016318", :start, :end},
          {"2023-10-17-brnord/GX016319", :start, :end},
          {"2023-10-17-brnord/GX016320", :start, :end},
          {"2023-10-17-brnord/GX016321", :start, :end},
          {"2023-10-18-brnord/GX016367", :start, "00:00:21.017"}
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
    <h3>Bezirksroute HH-Nord – City-Nord <.icon>N7</.icon></h3>
    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „N7 – City-Nord“ künftig verlaufen könnte.</p>

    <p>Die Route knickt im <.v bounds="9.957186,53.589594,9.978431,53.597399" lon={9.961403} lat={53.592559} dir="forward" ref="br-nord-n7">Behrkampsweg</.v> von dort <.a name="3">Radroute 3</.a> nach Osten ab. Nahe des <.v bounds="9.97988,53.589542,9.996609,53.598114" lon={9.987429} lat={53.594482} dir="forward" ref="br-nord-n7">Eppendorfer Marktplatz</.v> macht sie einen Schlenker über die <.v bounds="9.981651,53.592606,10.011017,53.602731" lon={9.990716} lat={53.598479} dir="forward" ref="br-nord-n7">Meenkwiese</.v>. Von der führt sie <.v bounds="9.99155,53.593524,10.045536,53.605728" lon={10.01766} lat={53.600198} dir="forward" ref="br-nord-n7" highlight="Jahnring">nördlich des Stadtparks</.v> bis zur <.a name="5">Radroute 5</.a> an der <.v bounds="10.038354,53.59737,10.045286,53.60094" lon={10.041504} lat={53.598576} dir="forward" ref="br-nord-n7">Fuhlsbüttler Straße</.v>.</p>

    <h4>Speziell für diese Route</h4>
    <p>Im Westen werden meist Fahrradstraßen vorgeschlagen. Zusätzlich soll am <.v bounds="9.985602,53.593236,9.992631,53.596901" lon={9.987641} lat={53.594438} dir="forward" ref="br-nord-n7">Lokstedter Weg</.v> die Querung verbessert werden und Höhe des <.v bounds="9.982945,53.594932,9.996036,53.601892" lon={9.989253} lat={53.597594} dir="forward" ref="br-nord-n7">Salomon-Heine-Weg</.v> die Durchfahrt für private KFZ gesperrt werden.</p>

    <p>Auf dem <.v bounds="10.005087,53.596049,10.045167,53.602488" lon={10.019202} lat={53.600238} dir="forward" ref="br-nord-n7" highlight="Jahnring,Jahnbrücke,Lauensteinstraße">Ring 2</.v> werden <.ref>Protected-Bike-Lanes</.ref> oder ggf. ein Zweirichtungsradweg auf der Stadtparkseite vorgeschlagen. <.v bounds="10.038122,53.597445,10.04388,53.600467" lon={10.040366} lat={53.599099} dir="forward" ref="br-nord-n7">Neben der Autobrücke</.v> sind wieder Fahrradstraßen vorgesehen, wobei diese fahrradfreundlich an die Radroute 5 angeschlossen werden sollen.</p>

    <%= Data.Article.Shared.bezirksroute(:nord) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
