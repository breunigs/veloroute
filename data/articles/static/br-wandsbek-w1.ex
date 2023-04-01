defmodule Data.Article.Static.BrWandsbekW1 do
  use Article.Static

  def id(), do: "br-wandsbek-w1"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Wandsbek – W1 – Eilbek ↔ Wulfsdorf (↔ Ahrensburg)"

  def color(), do: "#FF7575"

  def summary(),
    do:
      "Die Vorschlag zur Bezirksroute „W1 – Eilbek ↔ Wulfsdorf (↔ Ahrensburg) in Wandsbek verläuft nach Nord-Osten."

  def tags(), do: [id(), "br-wandsbek"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "w5",
        direction: :forward,
        from: "Lübecker Straße",
        to: "Wulfsdorf",
        parent_ref: __MODULE__,
        text: "Bezirksroute Wandsbek „W1“ → Wulfsdorf",
        videos: [
          {"2023-03-28-w1-w5-w8sud/GX015291", "00:00:11.745", "00:00:22.990"},
          {"2023-03-28-w1-w5-w8sud/GX015292", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015293", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015294", :start, "00:00:15.916"},
          {"2023-03-28-w1-w5-w8sud/GX015294", "00:00:49.249", :end},
          {"2023-03-28-w1-w5-w8sud/GX015295", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015296", :start, :end},
          {"2022-05-14-velo6-u-bundesstr/GX013883", "00:00:00.534", "00:00:03.537"},
          {"2023-03-28-w1-w5-w8sud/GX015300", "00:00:01.969", :end},
          {"2023-03-28-w1-w5-w8sud/GX015301", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015302", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015303", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015304", :start, "00:00:49.016"},
          {"2023-03-28-w1-w5-w8sud/GX015305", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015306", :start, "00:03:26.039"},
          {"2021-09-26-velo6-rsw-ahrensburg/GX012960", "00:02:48.769", "00:02:55.976"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "w5",
        direction: :backward,
        from: "Wulfsdorf",
        to: "Lübecker Straße",
        parent_ref: __MODULE__,
        text: "Bezirksroute Wandsbek „W1“ → Eilbek",
        videos: [
          {"2021-09-26-velo6-rsw-ahrensburg/GX012967", "00:02:47.701", "00:02:53.073"},
          {"2023-03-28-w1-w5-w8sud/GX015306", "00:03:32.546", :end},
          {"2023-03-28-w1-w5-w8sud/GX015307", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015308", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015309", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015310", :start, "00:00:34.835"},
          {"2022-05-14-velo6-u-bundesstr/GX013873", "00:00:37.471", :end},
          {"2022-05-14-velo6-u-bundesstr/GX013874", :start, "00:00:04.204"},
          {"2023-03-28-w1-w5-w8sud/GX015354", "00:00:03.170", :end},
          {"2023-03-28-w1-w5-w8sud/GX015355", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015356", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015358", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015359", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015360", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015361", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015362", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015363", :start, "00:00:35.869"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Beteiligungsverfahren", "2023", "https://radverkehr-wandsbek.beteiligung.hamburg"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „W1 – Eilbek ↔ Wulfsdorf (↔ Ahrensburg)“ künftig verlaufen könnte. Noch bis zum 30.04.2023 läuft ein Beteiligungsverfahren wo Rückmeldungen zum Routenverlauf gegeben werden können. Auch andere Anmerkungen zum Thema Fahrradverkehr sind möglich.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
