defmodule Data.Article.Static.BrNordN4 do
  use Article.Static

  def id(), do: "br-nord-n4"
  def display_id(), do: "N4"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Nord – N4 – Barmbek-Süd"

  def color(), do: "#bf95ff"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „N4 – Barmbek-Süd“ im Bezirk Hamburg-Nord führt von der Schönen Aussicht (Alster) zum Eulenkamp (Veloroute 6)"

  def tags(), do: [id(), display_id(), "br-nord"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "n4",
        direction: :forward,
        from: "Schöne Aussicht",
        to: "Eulenkamp",
        parent_ref: __MODULE__,
        text: "von der Schönen Aussicht zum Eulenkamp",
        videos: [
          {"2023-10-23-brnrod/GX016521", "00:00:16.250", :end},
          {"2023-10-23-brnrod/GX016522", :start, :end},
          {"2023-10-23-brnrod/GX016523", :start, :end},
          {"2023-10-23-brnrod/GX016524", :start, :end},
          {"2023-10-23-brnrod/GX016525", :start, :end},
          {"2023-10-23-brnrod/GX016526", :start, :end},
          {"2023-10-23-brnrod/GX016527", :start, "00:00:29.129"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "n4",
        direction: :backward,
        from: "Eulenkamp",
        to: "Schöne Aussicht",
        parent_ref: __MODULE__,
        text: "vom Eulenkamp zur Schönen Aussicht",
        videos: [
          {"2023-10-23-brnrod/GX016514", :start, :end},
          {"2023-10-23-brnrod/GX016515", :start, :end},
          {"2023-10-23-brnrod/GX016516", :start, :end},
          {"2023-10-23-brnrod/GX016517", :start, :end},
          {"2023-10-23-brnrod/GX016518", :start, :end},
          {"2023-10-23-brnrod/GX016519", :start, :end},
          {"2023-10-23-brnrod/GX016520", :start, :end},
          {"2023-10-23-brnrod/GX016521", :start, "00:00:15.415"}
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
    <h3>Bezirksroute HH-Nord – Barmbek-Süd <.icon>N4</.icon></h3>
    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „N4 – Barmbek-Süd“ künftig verlaufen könnte.</p>

    <p>Die Route beginnt an der Alster in der <.v bounds="10.004719,53.57132,10.02621,53.580897" lon={10.008506} lat={53.574176} dir="forward" ref="br-nord-n4">Karlstraße</.v>. Von dort führt sie nach Osten über die <.v bounds="10.024569,53.5723,10.057776,53.585185" lon={10.040541} lat={53.579915} dir="forward" ref="br-nord-n4">Dehnhaide</.v> zur <.v bounds="10.055478,53.57709,10.075949,53.585224" lon={10.064085} lat={53.581645} dir="forward" ref="br-nord-n4">Straßburger Straße</.v>. Sie endet an der <.a name="6">Radroute 6</.a>.</p>

    <h4>Speziell zu dieser Route</h4>
    <p>Im Westen soll sie zu Fahrradstraßen umgebaut werden. Die Kreuzung mit dem <.v bounds="10.011632,53.572569,10.024012,53.578254" lon={10.015243} lat={53.57477} dir="backward" ref="br-nord-n4">Hofweg</.v> soll sicherer querbar werden. Ab Höhe <.v bounds="10.0236,53.574926,10.04173,53.582405" lon={10.028109} lat={53.577797} dir="forward" ref="br-nord-n4">Bartholomäusstraße</.v> setzt man auf getrennte Führungen – meist <.ref>Protected-Bike-Lanes</.ref>. Auf <.v bounds="10.047549,53.576034,10.060554,53.58198" lon={10.050922} lat={53.578719} dir="forward" ref="br-nord-n4">Höhe des Krankenhauses</.v> sollen die <.ref>Hochbordradwege</.ref> ausgebaut werden und in der <.v bounds="10.056654,53.578302,10.073318,53.585261" lon={10.064} lat={53.581654} dir="forward" ref="br-nord-n4">Straßburger Straße</.v> sollen die <.ref>Radfahrstreifen</.ref> im Wesentlichen so bleiben.</p>

    <%= Data.Article.Shared.bezirksroute(:nord) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
