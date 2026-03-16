defmodule Data.Article.Static.BrMitte09 do
  use Article.Static

  def id(), do: "br-mitte-09"
  def display_id(), do: "M9"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Mitte – M9 – Wilhelmsburg-Nord Route"

  def color(), do: "#b482ff"
  def color_faded(), do: "#dac2ff"

  def summary(),
    do:
      "Die geplante Bezirksroute M9 – Wilhelmsburg-Nord Route beginnt Bei der Windmühle, führt über die Thielenstraße und soll einmal im Neubaugebiet ans Radnetz anschließen."

  def tags(), do: [id(), display_id(), "br-mitte"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "m2",
        direction: :backward,
        from: "Rathauswettern",
        to: "Kirchdorfer Straße",
        parent_ref: __MODULE__,
        text: "Richtung Kirchdorf",
        historic: %{"f88782ece5fd0037e0479ed09af27659" => ~d[2026-03]},
        videos: [
          {"2026-03-15-mitte/GX018787", "00:04:39.487", "00:04:53.964"},
          {"2026-03-15-mitte/GX018792", "00:00:05.140", :end},
          {"2026-03-15-mitte/GX018793", :start, "00:00:45.287"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "m2",
        direction: :forward,
        from: "Kirchdorfer Straße",
        to: "Rathauswettern",
        parent_ref: __MODULE__,
        text: "Richtung Inselpark",
        historic: %{"0c2a8698de4e500582068cd4fffc9708" => ~d[2026-03]},
        videos: [
          {"2026-03-15-mitte/GX018789", "00:01:24.213", :end},
          {"2026-03-15-mitte/GX018790", "00:00:03.604", "00:00:18.081"},
          {"2026-03-15-mitte/GX018791", :start, "00:00:16.067"},
          {"2026-03-15-mitte/GX018787", "00:04:28.481", "00:04:39.487"}
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
    <h3>Bezirksroute HH-Mitte – M9 – Wilhelmsburg-Süd Route <.icon>M9</.icon></h3>
    <p>Die Bezirksroute mit dem offiziellen Namen „BR9 – Wilhelmsburg-Nord Route“ beginnt an der Kirchdorfer Straße bzw. der <.a ref={Radroute23}>Radroute 23</.a>. Dann folgt sie den Straßen <.v bounds="10.019782,53.497406,10.027172,53.500291" lon={10.02415} lat={53.498607} dir="backward" ref={@ref}>Bei der Windmühle</.v> und <.v bounds="10.00192,53.497766,10.015446,53.50426" lon={10.013238} lat={53.501682} dir="backward" ref={@ref}>Thielenstraße</.v>. Wenn das Neubaugebiet am Inselpark einmal fertig ist, soll sie dort an die <.a ref={Radroute12}>Radroute 12</.a> anschließen.</p>

    <%= Data.Article.Shared.bezirksroute(:mitte) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
