defmodule Data.Article.Static.BrWandsbekW3 do
  use Article.Static

  def id(), do: "br-wandsbek-w3"
  def display_id(), do: "W3"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Wandsbek – W3 – Barmbek ↔ Höltigbaum"

  def color(), do: "#ffe717"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „W3 – Barmbek ↔ Höltigbaum“ in Wandsbek verbindet die beiden genannten Stadtteile mit einem Bogen über Berne."

  def tags(), do: [id(), display_id(), "br-wandsbek"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "w3",
        direction: :forward,
        from: "Barmbek",
        to: "Höltigbaum",
        parent_ref: __MODULE__,
        text: "Bezirksroute Wandsbek „W3“ → Höltigbaum",
        videos: [
          {"2023-04-02-br-wandsbek/GX015397", "00:00:14.081", :end},
          {"2023-04-02-br-wandsbek/GX015398", :start, :end},
          {"2023-04-02-br-wandsbek/GX015399", :start, :end},
          {"2023-04-02-br-wandsbek/GX015401", :start, :end},
          {"2023-04-02-br-wandsbek/GX015402", :start, "00:00:20.153"},
          {"2023-04-02-br-wandsbek/GX015420.MP4_time_lapse.mkv", "00:01:11.605", :end},
          {"2023-04-02-br-wandsbek/GX025420.MP4_time_lapse.mkv", :seamless, :end},
          {"2023-04-02-br-wandsbek/GX015421.MP4_time_lapse.mkv", :start, :end},
          {"2023-04-02-br-wandsbek/GX015422.MP4_time_lapse.mkv", :start, :end},
          {"2023-04-02-br-wandsbek/GX015423.MP4_time_lapse.mkv", :start, "00:00:46.547"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "w3",
        direction: :backward,
        from: "Höltigbaum",
        to: "Barmbek",
        parent_ref: __MODULE__,
        text: "Bezirksroute Wandsbek „W3“ → Barmbek",
        videos: [
          {"2023-04-02-br-wandsbek/GX015424", "00:00:10.511", :end},
          {"2023-04-02-br-wandsbek/GX015425", :start, "00:00:03.070"},
          {"2023-04-02-br-wandsbek/GX015429", "00:01:35.262", :end},
          {"2023-04-02-br-wandsbek/GX015430", :start, :end},
          {"2023-04-02-br-wandsbek/GX015431", :start, :end},
          {"2023-04-02-br-wandsbek/GX015433", :start, :end},
          {"2023-04-02-br-wandsbek/GX015435", :start, :end},
          {"2023-04-02-br-wandsbek/GX015436", :start, "00:00:14.948"}
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
    <h3>Bezirksroute Wandsbek – Barmbek ↔ Höltigbaum <.icon>W3</.icon></h3>

    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „W3 – Barmbek ↔ Höltigbaum“ künftig verlaufen könnte. Noch bis zum 30.04.2023 läuft ein Beteiligungsverfahren wo Rückmeldungen zum Routenverlauf gegeben werden können. Auch andere Anmerkungen zum Thema Fahrradverkehr sind möglich.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
