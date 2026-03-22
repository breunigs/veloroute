defmodule Data.Article.Static.BrMitte04 do
  use Article.Static

  def id(), do: "br-mitte-04"
  def display_id(), do: "M4"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Mitte – M4 – Alster-Elbe Route"

  def color(), do: "#b482ff"
  def color_faded(), do: "#dac2ff"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute M1 – Alster-Elbe Route im Bezirk Hamburg-Mitte führt von der Außenalster bis zu den Elbbrücken."

  def tags(), do: [id(), display_id(), "br-mitte"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "m2",
        direction: :forward,
        from: "An der Alster",
        to: "Elbbrücken",
        parent_ref: __MODULE__,
        text: "Richtung Elbe",
        historic: %{"105878d619470ceaa8c60732e1b31c3c" => ~d[2026-03]},
        videos: [
          {"2026-03-21-mitte/GX018848", :start, :end},
          {"2026-03-21-mitte/GX018849", :start, "00:00:25.135"},
          {"2026-03-21-mitte/GX018850", :start, "00:00:18.723"},
          {"2026-03-21-mitte/GX018850", "00:00:40.879", :end},
          {"2026-03-21-mitte/GX018851", :start, "00:00:15.713"},
          {"2026-03-21-mitte/GX018852", :start, :end},
          {"2026-03-21-mitte/GX018853", :start, :end},
          {"2026-03-21-mitte/GX018854", :start, :end},
          {"2026-03-21-mitte/GX018855", :start, :end},
          {"2026-03-21-mitte/GX018856", :start, :end},
          {"2026-03-21-mitte/GX018857", :start, "00:00:05.167"}
        ],
        end_action: :reverse
      },
      %Video.Track{
        renderer: 6,
        group: "m2",
        direction: :backward,
        from: "Elbbrücken",
        to: "An der Alster",
        parent_ref: __MODULE__,
        text: "Richtung Alster",
        historic: %{"8379873ab71588d21327294fa9bae598" => ~d[2026-03]},
        videos: [
          {"2026-03-21-mitte/GX018857", "00:00:05.167", :end},
          {"2026-03-21-mitte/GX018858", :start, :end},
          {"2026-03-21-mitte/GX018859", :start, :end},
          {"2026-03-21-mitte/GX018860", :start, :end},
          {"2026-03-21-mitte/GX018861", :start, "00:00:09.149"},
          {"2026-03-21-mitte/GX018862", :start, "00:00:35.989"},
          {"2026-03-21-mitte/GX018863", "00:00:00.133", :end},
          {"2026-03-21-mitte/GX018864", :start, "00:00:10.821"},
          {"2026-03-21-mitte/GX018865", :start, "00:00:02.627"}
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
    <h3>Bezirksroute HH-Mitte – M4 – Alster-Elbe Route <.icon>M4</.icon></h3>
    <p>Die Bezirksroute mit dem offiziellen Namen „BR04 – Alster-Elbe Route“ verbindet die beiden genannten Flüsse und stellt eine Verbindung zwischen St. Georg und Hammerbrook her. Die Route verläuft dabei parallel zur <.a ref={Radroute9}>Radroute 9</.a> bzw. <.a ref={Radroute12}>Radroute 12</.a>, allerdings leicht Richtung Südwesten versetzt.</p>

    <%= Data.Article.Shared.bezirksroute(:mitte) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
