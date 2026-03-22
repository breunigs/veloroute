defmodule Data.Article.Static.BrMitte01 do
  use Article.Static

  def id(), do: "br-mitte-01"
  def display_id(), do: "M1"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Mitte – M1 – Ost-West Route"

  def color(), do: "#b482ff"
  def color_faded(), do: "#dac2ff"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute M1 – Ost-West Route im Bezirk Hamburg-Mitte macht ihrem Namen alle Ehre und verbindet Altona mit Oststeinbek."

  def tags(), do: [id(), display_id(), "br-mitte"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "m2",
        direction: :forward,
        from: "Reeperbahn",
        to: "Oststeinbek",
        parent_ref: __MODULE__,
        text: "Richtung Oststeinbek",
        historic: %{"77b4cf25ad2f70585fb2c0625bb5772f" => ~d[2026-03]},
        videos: [
          {"2026-03-21-mitte/GX018810", :start, :end},
          {"2026-03-21-mitte/GX018811", :start, "00:00:39.702"},
          {"2026-03-21-mitte/GX018812", :start, :end},
          {"2026-03-21-mitte/GX018813", :start, "00:00:26.814"},
          {"2026-03-21-mitte/GX018814", "00:00:03.815", "00:00:06.322"},
          {"2026-03-21-mitte/GX018815", :start, "00:00:50.741"},
          {"2026-03-21-mitte/GX018816", :start, :end},
          {"2026-03-21-mitte/GX018817", :start, :end},
          {"2026-03-21-mitte/GX018818", :start, :end},
          {"2026-03-21-mitte/GX018819", :start, :end},
          {"2026-03-21-mitte/GX018820", :start, "00:01:19.346"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "m2",
        direction: :backward,
        from: "Oststeinbek",
        to: "Reeperbahn",
        parent_ref: __MODULE__,
        text: "Richtung Altona",
        historic: %{"099835258fca88f5d7fd53e38269c5a6" => ~d[2026-03]},
        videos: [
          {"2026-03-21-mitte/GX018820", "00:02:26.348", :end},
          {"2026-03-21-mitte/GX018821", :start, "00:00:10.020"},
          {"2026-03-21-mitte/GX018822", :start, "00:01:38.741"},
          {"2026-03-21-mitte/GX018823", :start, :end},
          {"2026-03-21-mitte/GX018824", :start, :end},
          {"2026-03-21-mitte/GX018825", "00:00:00.100", "00:00:38.368"},
          {"2026-03-21-mitte/GX018826", "00:00:00.033", :end},
          {"2026-03-21-mitte/GX018827", :start, "00:00:06.440"},
          {"2026-03-21-mitte/GX018827", "00:00:19.353", :end},
          {"2026-03-21-mitte/GX018828", :start, :end},
          {"2026-03-21-mitte/GX018829", :start, :end},
          {"2026-03-21-mitte/GX018830", :start, :end},
          {"2026-03-21-mitte/GX018831", "00:00:00.067", :end},
          {"2026-03-21-mitte/GX018832", :start, "00:00:15.474"},
          {"2026-03-21-mitte/GX018833", :start, :end},
          {"2026-03-21-mitte/GX018834", :start, "00:00:11.812"},
          {"2026-03-21-mitte/GX018834", "00:00:27.060", :end},
          {"2026-03-21-mitte/GX018835", :start, :end},
          {"2026-03-21-mitte/GX018836", :start, :end}
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
    <h3>Bezirksroute HH-Mitte – M1 – Ost-West Route <.icon>M1</.icon></h3>
    <p>Die Bezirksroute mit dem offiziellen Namen „BR01 – Ost-West Route“ verbindet Altona im Westen mit Oststeinbek im Osten. Sie führt durch Hammerbrook, Hamm-Süd, Horn und Billstedt. Sie verläuft im Wesentlichen parallel zur B4 / Eiffestraße / B5, weicht aber auf weniger autobelastete Straßen aus.</p>

    <%= Data.Article.Shared.bezirksroute(:mitte) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
