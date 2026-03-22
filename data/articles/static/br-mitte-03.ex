defmodule Data.Article.Static.BrMitte03 do
  use Article.Static

  def id(), do: "br-mitte-03"
  def display_id(), do: "M3"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Mitte – M3 – Innenstadtring"

  def color(), do: "#b482ff"
  def color_faded(), do: "#dac2ff"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute M1 – Innenstadtring im Bezirk Hamburg-Mitte führt ringförmig um Altstadt und Neustadt und stellt Verbindungen unter den Routen her."

  def tags(), do: [id(), display_id(), "br-mitte"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "m2",
        direction: :forward,
        from: "Messehallen",
        via: ["Lombardsbrücke Süd", "Kehrwiedersteg Nord"],
        to: "Messehallen",
        parent_ref: __MODULE__,
        text: "Innenstadtring im Uhrzeigersinn",
        historic: %{"d4aff5f358c0130013298e3b7a6faf82" => ~d[2026-03]},
        videos: [
          {"2026-03-21-mitte/GX018841", "00:00:01.000", :end},
          {"2026-03-21-mitte/GX018842", :start, :end},
          {"2026-03-21-mitte/GX018843", :start, :end},
          {"2026-03-21-mitte/GX018844", :start, "00:00:10.048"},
          {"2026-03-21-mitte/GX018845", :start, "00:00:18.185"},
          {"2025-02-09-innenstadt/GX017973", "00:00:00.334", "00:00:23.190"},
          {"2025-12-30-hohenfelde/GX018743", "00:00:00.300", "00:00:14.081"},
          {"2025-03-01-west/GX018371", "00:00:03.704", :end},
          {"2025-03-01-west/GX018372", :start, :end},
          {"2025-03-01-west/GX018373", :start, "00:00:43.735"},
          {"2025-03-01-west/GX018374", :start, "00:00:33.102"},
          {"2024-03-16-fr8-gr1uhr/GX016885", "00:00:06.740", :end},
          {"2026-03-21-mitte/GX018840", :start, :end},
          {"2026-03-21-mitte/GX018841", :start, "00:00:01.000"}
        ],
        end_action: :loop
      },
      %Video.Track{
        renderer: 6,
        group: "m2",
        direction: :backward,
        from: "Messehallen",
        via: ["Kehrwiedersteg Nord", "Lombardsbrücke Süd"],
        to: "Messehallen",
        parent_ref: __MODULE__,
        text: "Innenstadtring entgegen Uhrzeigersinn",
        historic: %{"0067b23ee4baa9f897e54d35470e3b19" => ~d[2026-03]},
        videos: [
          {"2026-03-21-mitte/GX018868", "00:00:01.000", "00:00:32.968"},
          {"2026-03-21-mitte/GX018869", "00:00:00.234", :end},
          {"2026-03-21-mitte/GX018870", :start, "00:00:03.648"},
          {"2026-03-21-mitte/GX018871", :start, "00:00:01.702"},
          {"2025-02-16-mitte/GX018059", "00:00:01.468", "00:00:18.455"},
          {"2025-02-16-mitte/GX018060", :start, "00:00:02.201"},
          {"2025-02-16-mitte/GX018061", :start, "00:00:00.767"},
          {"2025-03-01-west/GX018362", "00:00:01.001", :end},
          {"2025-03-01-west/GX018363", :start, :end},
          {"2025-03-01-west/GX018364", :start, :end},
          {"2025-03-01-west/GX018365", :start, "00:00:09.202"},
          {"2025-03-01-west/GX018366", :start, :end},
          {"2025-03-01-west/GX018367", :start, :end},
          {"2025-03-01-west/GX018368", :start, "00:00:02.903"},
          {"2025-12-30-hohenfelde/GX018744", "00:00:13.247", "00:00:39.328"},
          {"2026-03-15-mitte/GX018803", "00:00:55.154", "00:01:18.702"},
          {"2026-03-15-mitte/GX018804", "00:00:01.134", "00:00:14.948"},
          {"2026-03-15-mitte/GX018805", :start, "00:00:01.435"},
          {"2026-03-21-mitte/GX018867", "00:00:01.068", :end},
          {"2026-03-21-mitte/GX018868", :start, "00:00:01.000"}
        ],
        end_action: :loop
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
    <h3>Bezirksroute HH-Mitte – M3 – Innenstadtring <.icon>M4</.icon></h3>
    <p>Die Bezirksroute mit dem offiziellen Namen „BR03 – Innenstadtring“ führt einmal im Kreis um Neustadt und Altstadt. Sie ist fast identisch mit der <.a ref={Freizeitroute0}>Freizeitroute 1. Grüner Ring</.a>. Ausnahme: sie führt über Holsenglacis/Glacischaussee statt über den Holstenwall.</p>

    <%= Data.Article.Shared.bezirksroute(:mitte) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
