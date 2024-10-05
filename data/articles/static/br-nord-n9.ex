defmodule Data.Article.Static.BrNordN9 do
  use Article.Static

  def id(), do: "br-nord-n9"
  def display_id(), do: "N9"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Nord – N9 – Langenhorner"

  def color(), do: "#b482ff"
  def color_faded(), do: "#dac2ff"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „N9 – Langenhorner“ im Bezirk Hamburg-Nord führt vom Krohnstieg (Veloroute 14) nach Glashütte."

  def tags(), do: [id(), display_id(), "br-nord"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "n9",
        direction: :forward,
        from: "Krohnstieg",
        to: "Glashütte",
        parent_ref: __MODULE__,
        text: "vom Krohnstieg nach Glashütte",
        videos: [
          {"2023-10-25-brnord/GX016590", "00:02:42.763", "00:03:24.471"},
          {"2023-10-25-brnord/GX016584", "00:01:56.350", :end},
          {"2023-10-25-brnord/GX016585", :start, :end},
          {"2023-10-25-brnord/GX016586", :start, "00:00:09.710"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "n9",
        direction: :backward,
        from: "Glashütte",
        to: "Krohnstieg",
        parent_ref: __MODULE__,
        text: "von Glashütte zum Krohnstieg",
        videos: [
          {"2023-10-25-brnord/GX016588", "00:00:04.337", "00:00:40.173"},
          {"2023-10-25-brnord/GX016589", "00:00:12.346", :end},
          {"2023-10-25-brnord/GX016590", :start, "00:02:42.797"}
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
    <h3>Bezirksroute HH-Nord – Langenhorner <.icon>N9</.icon></h3>
    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „N9 – Langenhorner“ künftig verlaufen könnte.</p>

    <p>Die Route beginnt im Süden am <.v bounds="9.982583,53.643249,10.009713,53.663186" lon={9.992297} lat={53.649024} dir="forward" ref="br-nord-n9">Krohnstieg</.v> und führt über <.v bounds="9.989058,53.64866,10.038462,53.663663" lon={9.994171} lat={53.65253} dir="forward" ref="br-nord-n9">Ermlandweg</.v>, <.v bounds="9.989058,53.64866,10.038462,53.663663" lon={9.996863} lat={53.654463} dir="forward" ref="br-nord-n9">Grellkamp</.v>, <.v bounds="9.989058,53.64866,10.038462,53.663663" lon={10.000009} lat={53.655597} dir="forward" ref="br-nord-n9">Heerwisch</.v>, <.v bounds="9.989058,53.64866,10.038462,53.663663" lon={10.010524} lat={53.659424} dir="forward" ref="br-nord-n9">Foorthkamp</.v> und <.v bounds="9.989058,53.64866,10.038462,53.663663" lon={10.022365} lat={53.660945} dir="forward" ref="br-nord-n9">Immenhöven</.v> nach Osten.</p>

    <p>In der <.v bounds="10.018947,53.657425,10.039927,53.682463" lon={10.027218} lat={53.662924} dir="forward" ref="br-nord-n9">Fritz-Schumacher-Allee</.v> knickt sie nach Norden ab und führt über den <.v bounds="10.018947,53.657425,10.039927,53.682463" lon={10.033111} lat={53.673545} dir="forward" ref="br-nord-n9">Anita-Sellenschloh-Ring</.v> zurück auf die vorher gequerte <.v bounds="10.022893,53.674787,10.039692,53.689656" lon={10.030893} lat={53.678067} dir="forward" ref="br-nord-n9">Tangstedter Landstraße</.v>. In <.v bounds="10.028672,53.68336,10.043337,53.692219" lon={10.036086} lat={53.687459} dir="forward" ref="br-nord-n9">Glashütte</.v> besteht Anschluss an das <.a name="norderstedt-veloroute-3">Radnetz Norderstedts</.a>.</p>

    <h4>Speziell für diese Route</h4>
    <p>Auf den meisten Abschnitten sind Fahrradstraßen vorgesehen. Für den <.v bounds="10.002652,53.655088,10.020495,53.663356" lon={10.01132} lat={53.659673} dir="forward" ref="br-nord-n9">Foorthkamp</.v> werden <.ref>Kopenhagener Radwege</.ref> vorgeschlagen; auch im bereits umgebauten Abschnitt. Auf der <.v bounds="10.024241,53.674421,10.032981,53.689692" lon={10.030884} lat={53.678718} dir="forward" ref="br-nord-n9">Tangstedter Landstraße</.v> soll der Radverkehr ebenfalls getrennt vom KFZ-Verkehr bleiben.</p>

    <p>Die Kreuzung mit der <.v bounds="10.003125,53.656271,10.007446,53.658528" lon={10.004237} lat={53.657175} dir="forward" ref="br-nord-n9">Langenhorner Chaussee</.v> soll kleiner werden und die Sicherheit für den Radverkehr verbessert werden.</p>

    <p>Die Führung zwischen den <.v bounds="10.025857,53.6689,10.037038,53.672549" lon={10.030864} lat={53.670219} dir="forward" ref="br-nord-n9">Schulen am Heidberg</.v> ist nur unter Vorbehalt. Sollten sich Fuß- und Radverkehr dort zu sehr in die Quere kommen, wird als Alternative vorgeschlagen den Radverkehr schon ab <.v bounds="10.021557,53.666742,10.034625,53.673267" lon={10.030124} lat={53.66866} dir="forward" ref="br-nord-n9">Hohe Liedt</.v> auf der <.v bounds="10.022466,53.667243,10.038051,53.679636" lon={10.03052} lat={53.677777} dir="forward" ref="br-nord-n9">Tangstedter Landstraße</.v> verlaufen zu lassen.</p>

    <%= Data.Article.Shared.bezirksroute(:nord) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
