defmodule Data.Article.Static.BrWandsbekW6 do
  use Article.Static

  def id(), do: "br-wandsbek-w6"
  def display_id(), do: "W6"

  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Wandsbek – W6 – Wellingsbüttel ↔ Volksdorf"

  # def color(), do: "#bc75d0"
  def color(), do: "#caa8ff"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „W6 – Wellingsbüttel ↔ Volksdorf in Wandsbek verläuft in Ost-West Richtung über Sasel."

  def tags(), do: [id(), display_id(), "br-wandsbek"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "w6",
        direction: :forward,
        from: "Wellingsbüttel",
        to: "Volksdorf",
        parent_ref: __MODULE__,
        text: "Bezirksroute Wandsbek „W6“ → Volksdorf",
        videos: [
          {"2023-04-10-br-wandsbek/GX015566", "00:00:19.286", :end},
          {"2023-04-10-br-wandsbek/GX015567", :start, :end},
          {"2023-04-10-br-wandsbek/GX015568", :start, :end},
          {"2023-04-10-br-wandsbek/GX015569", :start, "00:01:30.624"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "w6",
        direction: :backward,
        from: "Volksdorf",
        to: "Wellingsbüttel",
        parent_ref: __MODULE__,
        text: "Bezirksroute Wandsbek „W6“ → Wellingsbüttel",
        videos: [
          {"2023-04-10-br-wandsbek/GX015579", "00:01:50.944", :end},
          {"2023-04-10-br-wandsbek/GX015580", :start, :end},
          {"2023-04-10-br-wandsbek/GX015581", :start, "00:01:40.747"}
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
    <h3>Bezirksroute Wandsbek – Wellingsbüttel ↔ Volksdorf <.icon>W6</.icon></h3>

    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „W6 – Wellingsbüttel ↔ Volksdorf“ künftig verlaufen könnte. Noch bis zum 30.04.2023 läuft ein Beteiligungsverfahren wo Rückmeldungen zum Routenverlauf gegeben werden können. Auch andere Anmerkungen zum Thema Fahrradverkehr sind möglich.</p>

    <%= Data.Article.Shared.bezirksroute(:wandsbek) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
