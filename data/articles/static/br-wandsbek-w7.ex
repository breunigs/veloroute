defmodule Data.Article.Static.BrWandsbekW7 do
  use Article.Static

  def id(), do: "br-wandsbek-w7"
  def display_id(), do: "W7"

  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Wandsbek – W7 – Farmsen ↔ Ohlstedt"

  # def color(), do: "#f175d0"
  def color(), do: "#caa8ff"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „W7 – Farmsen ↔ Ohlstedt in Wandsbek verläuft grob in Nord-Süd Richtung, mit einem Bogen über Volksdorf"

  def tags(), do: [id(), display_id(), "br-wandsbek"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "w7",
        direction: :forward,
        from: "Farmsen",
        to: "Ohlstedt",
        parent_ref: __MODULE__,
        text: "Bezirksroute Wandsbek „W7“ → Ohlstedt",
        videos: [
          {"2023-04-02-br-wandsbek/GX015427", "00:00:08.709", :end},
          {"2023-04-02-br-wandsbek/GX015428", :start, :end},
          {"2023-04-02-br-wandsbek/GX015429", :start, "00:01:29.523"},
          {"2023-04-10-br-wandsbek/GX015574", "00:01:21.515", :end},
          {"2023-04-10-br-wandsbek/GX015575", :start, :end},
          {"2023-04-10-br-wandsbek/GX015576", :start, :end},
          {"2023-04-10-br-wandsbek/GX015577", :start, :end},
          {"2023-04-10-br-wandsbek/GX015578", :start, :end},
          {"2023-04-10-br-wandsbek/GX015579", :start, "00:01:48.041"},
          {"2022-05-14-velo6-u-bundesstr/GX013870", "00:01:50.544", "00:01:53.780"},
          {"2023-04-10-br-wandsbek/GX015569", "00:01:31.091", :end},
          {"2023-04-10-br-wandsbek/GX015570", :start, "00:01:13.058"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "w7",
        direction: :backward,
        from: "Ohlstedt",
        to: "Farmsen",
        parent_ref: __MODULE__,
        text: "Bezirksroute Wandsbek „W7“ → Farmsen",
        videos: [
          {"2023-04-10-br-wandsbek/GX015570", "00:01:24.401", :end},
          {"2023-04-10-br-wandsbek/GX015571", :start, "00:02:03.624"},
          {"2023-04-10-br-wandsbek/GX015572", "00:00:14.982", :end},
          {"2023-04-10-br-wandsbek/GX015573", :start, :end},
          {"2023-04-10-br-wandsbek/GX015574", :start, "00:01:05.198"},
          {"2023-04-02-br-wandsbek/GX015425", "00:00:03.937", :end},
          {"2023-04-02-br-wandsbek/GX015426", :start, :end},
          {"2023-04-02-br-wandsbek/GX015427", :start, "00:00:04.071"}
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
    <h3>Bezirksroute Wandsbek – Farmsen ↔ Ohlstedt <.icon>W7</.icon></h3>

    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „W7 – Farmsen ↔ Ohlstedt“ künftig verlaufen könnte. Noch bis zum 30.04.2023 läuft ein Beteiligungsverfahren wo Rückmeldungen zum Routenverlauf gegeben werden können. Auch andere Anmerkungen zum Thema Fahrradverkehr sind möglich.</p>

    <%= Data.Article.Shared.bezirksroute(:wandsbek) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
