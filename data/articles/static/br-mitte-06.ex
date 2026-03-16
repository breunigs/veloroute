defmodule Data.Article.Static.BrMitte06 do
  use Article.Static

  def id(), do: "br-mitte-06"
  def display_id(), do: "M6"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Mitte – M6 – Hamm-Rothenburgsort Route"

  def color(), do: "#b482ff"
  def color_faded(), do: "#dac2ff"

  def summary(),
    do:
      "Die Bezirksroute M9 – Hamm-Rothenburgsort Route verbindet die beiden genannten Stadtteile via Hammer Steindamm, Diagonalstraße, Ausschläger Billdeich und Nebenstraßen in Rothenburgsort."

  def tags(), do: [id(), display_id(), "br-mitte"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "m2",
        direction: :forward,
        from: "Alexandra-Stieg",
        to: "Bahnhof Hasselbrook",
        parent_ref: __MODULE__,
        text: "Richtung Hasselbrook",
        historic: %{"d6134a1a0789ec349411219bc4a0193c" => ~d[2026-03]},
        videos: [
          {"2026-03-15-mitte/GX018795", "00:01:42.393", :end},
          {"2026-03-15-mitte/GX018796", :start, "00:00:14.982"},
          {"2026-03-15-mitte/GX018796", "00:00:22.422", :end},
          {"2026-03-15-mitte/GX018797", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "m2",
        direction: :backward,
        from: "Bahnhof Hasselbrook",
        to: "Alexandra-Stieg",
        parent_ref: __MODULE__,
        text: "Richtung Elbe",
        historic: %{"b4f6ddce58198a43eda0f0c6dca9e5e7" => ~d[2026-03]},
        videos: [
          {"2026-03-15-mitte/GX018784", "00:00:48.033", "00:01:07.254"},
          {"2026-03-15-mitte/GX018785", "00:00:00.133", :end},
          {"2026-03-15-mitte/GX018786", :start, :end},
          {"2026-03-15-mitte/GX018787", :start, "00:01:28.187"}
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
    <h3>Bezirksroute HH-Mitte – M5 – Hamm-Rothenburgsort <.icon>M6</.icon></h3>
    <p>Die Bezirksroute mit dem offiziellen Namen „BR6 Hamm-Rothenburgsort Route“ verbindet die beiden Stadteile in Nord-Süd-Richtung. Sie ist in großen Teilen deckungsgleich mit <.a ref={Radroute22}>Radroute 22</.a>. In Hamm führt sie jedoch weiter bis zur  <.a ref={Radroute7}>Radroute 7</.a> – offiziell endet sie am Bahnhof Hasselbrook, weil dort die Grenze zum Bezirk Wandsbek ist. In Rothenburgsort knickt sie nach Südwesten in Richtung Elbbrücken ab und schließt dort an <.a ref={Radroute2}>Radroute 2</.a> an.</p>

    <%= Data.Article.Shared.bezirksroute(:mitte) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
