defmodule Data.Article.Static.BrWandsbekW4 do
  use Article.Static

  def id(), do: "br-wandsbek-w4"
  def display_id(), do: "W4"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Wandsbek – W4 – Fuhlsbüttel ↔ Duvenstedt"

  def color(), do: "#d07575"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „W4 – Fuhlsbüttel ↔ Duvenstedt“ schlängelt sich durch die Dörfer."

  def tags(), do: [id(), display_id(), "br-wandsbek"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "W4",
        direction: :forward,
        from: "Fuhlsbüttel",
        to: "Duvenstedt",
        parent_ref: __MODULE__,
        text: "Bezirksroute Wandsbek „W4“ → Duvenstedt",
        videos: [
          {"2022-09-11-landstr-volksd-duvens/GX014748", "00:00:15.679", "00:02:47.200"},
          {"2023-04-06-br-wandsbek/GX015491", "00:00:24.558", :end},
          {"2023-04-06-br-wandsbek/GX015492", :start, :end},
          {"2023-04-06-br-wandsbek/GX015493", :start, :end},
          {"2023-04-06-br-wandsbek/GX015494", :start, :end},
          {"2023-04-06-br-wandsbek/GX015495", :start, :end},
          {"2023-04-06-br-wandsbek/GX015496", :start, "00:00:18.485"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "W4",
        direction: :backward,
        from: "Duvenstedt",
        to: "Fuhlsbüttel",
        parent_ref: __MODULE__,
        text: "Bezirksroute Wandsbek „W4“ → Fuhlsbüttel",
        videos: [
          {"2023-04-06-br-wandsbek/GX015496", "00:00:33.967", :end},
          {"2023-04-06-br-wandsbek/GX015497", :start, "00:01:16.510"},
          {"2023-04-06-br-wandsbek/GX015497", "00:01:27.621", :end},
          {"2023-04-06-br-wandsbek/GX015498", :start, :end},
          {"2023-04-06-br-wandsbek/GX015499", :start, :end},
          {"2023-04-06-br-wandsbek/GX015500", :start, :end},
          {"2023-04-06-br-wandsbek/GX015501", :start, :end},
          {"2023-04-06-br-wandsbek/GX015502", :start, :end},
          {"2022-09-11-landstr-volksd-duvens/GX014768", :start, :end}
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
    <h3>Bezirksroute Wandsbek – Fuhlsbüttel ↔ Duvenstedt <.icon>W4</.icon></h3>

    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „W4 – Fuhlsbüttel ↔ Duvenstedt“ künftig verlaufen könnte. Noch bis zum 30.04.2023 läuft ein Beteiligungsverfahren wo Rückmeldungen zum Routenverlauf gegeben werden können. Auch andere Anmerkungen zum Thema Fahrradverkehr sind möglich.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
