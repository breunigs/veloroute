defmodule Data.Article.Static.BrMitte08 do
  use Article.Static

  def id(), do: "br-mitte-08"
  def display_id(), do: "M8"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Mitte – M8 – Horner Route"

  def color(), do: "#b482ff"
  def color_faded(), do: "#dac2ff"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute M8 – Horner Route im Bezirk Hamburg-Mitte verbindet den Stadteil untereinander."

  def tags(), do: [id(), display_id(), "br-mitte"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "m2",
        direction: :forward,
        from: "Horner Landstraße",
        to: "Riedel-Vogt-Weg",
        parent_ref: __MODULE__,
        text: "Richtung Wandsbek",
        historic: %{"41d7fa29014c06310833756cb595fce3" => ~d[2026-03]},
        videos: [
          {"2026-03-29-mitte-ost/GX018915", :start, "00:00:18.961"},
          {"2026-03-29-mitte-ost/GX018916", :start, "00:00:02.002"},
          {"2026-03-29-mitte-ost/GX018916", "00:00:05.072", :end},
          {"2026-03-29-mitte-ost/GX018917", :start, :end},
          {"2026-03-29-mitte-ost/GX018918", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "m2",
        direction: :backward,
        from: "Riedel-Vogt-Weg",
        to: "Horner Landstraße",
        parent_ref: __MODULE__,
        text: "Richtung Hamm",
        historic: %{"a9fd16346cdfdb4e4d7d47e259f918fe" => ~d[2026-03]},
        videos: [
          {"2026-03-29-mitte-ost/GX018912", "00:00:02.367", :end},
          {"2026-03-29-mitte-ost/GX018913", :start, :end}
        ]
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
    <h3>Bezirksroute HH-Mitte – M8 – Horner Route <.icon>M8</.icon></h3>
    <p>Die Bezirksroute mit dem offiziellen Namen „BR01 – Horner Route“ dient dem Radverkehr innerhalb Horns. Anknüpfung ans stadtweite Netz findet sie an der Horner Rennbahn an die <.a ref={Radroute1}>Radroute 1</.a> und <.a ref={Radroute8}>Radroute 8</.a>.</p>

    <%= Data.Article.Shared.bezirksroute(:mitte) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
