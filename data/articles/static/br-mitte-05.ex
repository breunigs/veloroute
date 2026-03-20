defmodule Data.Article.Static.BrMitte05 do
  use Article.Static

  def id(), do: "br-mitte-05"
  def display_id(), do: "M5"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Mitte – M5 – St. Georg Route"

  def color(), do: "#b482ff"
  def color_faded(), do: "#dac2ff"

  def summary(),
    do:
      "Die Bezirksroute M9 – St. Georg Route führt vom Hauptbahnhof, über Koppel zur Hohenfelder Bucht."

  def tags(), do: [id(), display_id(), "br-mitte"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "m2",
        direction: :forward,
        from: "Georgsplatz",
        to: "Barcastraße",
        parent_ref: __MODULE__,
        text: "Richtung Hohenfelder Bucht",
        historic: %{"06500c092a010ea9350620692faccccc" => ~d[2026-03]},
        videos: [
          {"2026-03-15-mitte/GX018779", :start, :end},
          {"2026-03-15-mitte/GX018780", "00:00:01.368", :end}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "m2",
        direction: :backward,
        from: "Barcastraße",
        to: "Georgsplatz",
        parent_ref: __MODULE__,
        text: "Richtung Hauptbahnhof",
        historic: %{"c28e8b9f7011bb119f77ece3b7737d81" => ~d[2026-03]},
        videos: [
          {"2026-03-15-mitte/GX018803", :start, "00:00:50.073"}
        ],
        end_action: :reverse
      }
    ]

  def links(_assigns) do
    [
      # {"Ride With GPS Routenplaner", "https://ridewithgps.com/routes/52643567"},
      {"Entwurf Radroutenkonzept", ~d[2025-09],
       "https://sitzungsdienst-hamburg-mitte.hamburg.de/bi/to010.asp?SILFDNR=1003205"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Bezirksroute HH-Mitte – M5 – St. Georg <.icon>M5</.icon></h3>
    <p>Die Bezirksroute mit dem offiziellen Namen „BR5 – St. Georg Route“ verbindet den <.v bounds="9.998743,53.54964,10.011769,53.558278" lon={10.003797} lat={53.553954} dir="forward" ref={@ref}>Hauptbahnhof</.v> mit der <.v bounds="10.010281,53.557244,10.021833,53.5644" lon={10.015462} lat={53.561192} dir="forward" ref={@ref}>Hohenfelder Bucht</.v>. Sie führt dabei über die <.v bounds="10.007885,53.556459,10.015581,53.561143" lon={10.010976} lat={53.558389} dir="forward" ref={@ref}>Koppel</.v>, eine Nebenstraße der bekannteren <.m bounds="10.005004,53.554113,10.01904,53.563181" highlight="Lange Reihe">Langen Reihe</.m>.</p>

    <%= Data.Article.Shared.bezirksroute(:mitte) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
